Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 826B2B18357
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 16:09:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF26810E880;
	Fri,  1 Aug 2025 14:09:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JsXNJ5Xw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 029C510E880
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 14:09:11 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5719134o018862
 for <dri-devel@lists.freedesktop.org>; Fri, 1 Aug 2025 14:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=m16qCBAo/FXoS1/viYLiGi2Z
 0bAJV+s6Sk8oejwf8qM=; b=JsXNJ5Xw6B8UnBbppiVSkLhlCULEfpQUUh4Ll6Nl
 rQt7cQXvKED0cI63ko2AnuuHD0pwIVls90jwfdUNmDe4MV6JrI1RbT7Gu0iArGwO
 7ea4Q9zh+7KfDRgTFapjiYUHJzYhwftCkMGLpwa+y5W59dyFOgOsRErMywDJAuls
 A+uYKsrr/nsF+FI8/HcSfw3/WACvTcVREpyxFLedPsfEDAyyavCXPYBo0XMnPYJb
 Y+myiF+MWkR4yWvimo9n6h090mdPoCRAw+/24bcqNRR6MHWso5bDs5a9m4k1p5f5
 HsxNCRabtay9UkCe2h4Knye2khmjRYZFEx2eUAk05+Y4+Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484qdaby51-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 14:09:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7e1fb57a7adso81409585a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 07:09:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754057350; x=1754662150;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m16qCBAo/FXoS1/viYLiGi2Z0bAJV+s6Sk8oejwf8qM=;
 b=b4sRR2Ytwv/yFKfgr6Drlx3Z8L1k+IhoOBwm7GfOvICIpygTgFM+rXnsuWkbvWIPsQ
 l+knj/PSOw9Z1veS3iwjYqaDMiCqM7ROplJHnHDgg+z39apJzgwuTqXYsWAimWnw44Ho
 1AAZUTkZX/jYWlFfFXbNYOpGcb9cRKFYBLVrU5WrdABggLEOHgjpF9dKPjAYlsaFqG54
 Zeyw+Lp3No/eu6g+K4rdwCEf29A4e0HZ9yYdzIbRR03IoOJ1bWoT+xYcQw0vE0bYN7fI
 9W8AYIoK6TAUjp7H1OCRcfSWyfQnsL9Z2x9/Ccgobg5GBQUvIRPiK+QFderMZ6rQpHdP
 kfmA==
X-Gm-Message-State: AOJu0YzsBIM8N77mYm0koolTh6NTfQGNKSrLtDhv6obwaBDXqnClhpvH
 VtaJbKAq4OJxujsQzkoeyEy78Y3q5MgeI5jXw2fFQSXRbA03c0Jga0jK/3pB/CcgwmhVLX6Tn9C
 nA4vosqIQd9ix2beuaEZ81OuGoGNhlhQ0CLO6eYNZG4vBnGiZeTG6aO2JypoMnoNiveNm1HQ=
X-Gm-Gg: ASbGnctFzJfavN9vFg2E+NeYP7BoPwJA0P1x4Dx8VQQd7hPKgt4doTzQT+a/Ks29Ios
 93iaf9USv8LNaXG46gtijF5dTp7KpQQ/i+IGKrtO77mHhou3ANzKcMxcFcjGauNd6tVe6kk1HLn
 ScVo4xngJsJ8R3EQDPToyAQT5Xyg/oXORi3hXYKHI+d0kTz6a7UJCb/Sse0BVYEgvwsAakeMMXc
 ZD60UmT+dFlvOzH+sLrQR5aVWHzjcRWBFyLApbxyPW+RiSGyiWHUOG0JmPjFhYFg8B1RgsMor6I
 1nNoc7E4pmF1zssyCMjvSr96gneg/6QhCF6vDxvrICZp44idHzAWshdEJABnNs/x2DDEowTHcJP
 CXNUWKUycLtDEX8TT+ATdmcKbP6jM6qj6bW4UzGqa0gxB7L+Xc9eC
X-Received: by 2002:a05:620a:3948:b0:7e3:47e6:a842 with SMTP id
 af79cd13be357-7e66eed5876mr1526673385a.0.1754057349787; 
 Fri, 01 Aug 2025 07:09:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLyKnapj4BRMaug8dazoKuVohPZcpun2FRP/WBbB1HS4vmNMdFMYrsIyFlxHbJTYZ+GBH4Ug==
X-Received: by 2002:a05:620a:3948:b0:7e3:47e6:a842 with SMTP id
 af79cd13be357-7e66eed5876mr1526665485a.0.1754057349089; 
 Fri, 01 Aug 2025 07:09:09 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b8898bdaesm610348e87.9.2025.08.01.07.09.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 07:09:08 -0700 (PDT)
Date: Fri, 1 Aug 2025 17:09:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Marius Vlad <marius.vlad@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniel.stone@collabora.com,
 jani.nikula@linux.intel.com, tzimmermann@suse.de,
 simona.vetter@ffwll.ch, derek.foreman@collabora.com
Subject: Re: [PATCH] drm/connector: hdmi: Add a link bpc property
Message-ID: <l6s63vlxu2lrsxcbwrxt5shcn6rnldwjdevggmipstjmluxnyn@7ynu3iygwvxf>
References: <20250801101750.1726-1-marius.vlad@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250801101750.1726-1-marius.vlad@collabora.com>
X-Proofpoint-ORIG-GUID: 4SaI-mps4Ig5qsK--isy4bphKjf0-TQ3
X-Authority-Analysis: v=2.4 cv=Pfv/hjhd c=1 sm=1 tr=0 ts=688cca87 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=QX4gbG5DAAAA:8 a=soa31aExdMOlycdhFCoA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: 4SaI-mps4Ig5qsK--isy4bphKjf0-TQ3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEwNyBTYWx0ZWRfX/Us9MSu4zMW8
 WLGq5L8GmKp7vMfEpFfJWWOrIjiZbx5NB0o9S0NRrp4Z/whei6rRTnmG5wqSlKaE2x9WiWh4ira
 J4DxB7V4cU42+CpLaCZRY+//SHNTkxlxzal5BxsrHgntokVaAOKeGjZWP9eGdSqqHoRGinUwMcy
 haMO19CL8rUAAo/SdDTBSFIDsP77iQdZjZetkg8Qe1VVQNDSOT5fblxoz2MflxpMODSZeBH1pGW
 eccAXNAZGc5H18HHEGaTYpPVSS+N6bxmFJku8rju5keDyQYqqy1tr4peB1vt0j06iAs9lo4X+eF
 IN2hMR0vblOPcJrztfZCVEMeRd5B8FNQElcPkUwwZs1SQKS43diadyifQFGWgZtu3H+0qzlFGVg
 55ykkqlT5Ar9MD/zNz2EjavE1h+sJifMQm9wScpKcVkEEBwzHQEXsuhx4iFMAYeVXhBCnCgZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_04,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 adultscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010107
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 01, 2025 at 01:17:50PM +0300, Marius Vlad wrote:
> From: Derek Foreman <derek.foreman@collabora.com>
> 
> Add a way to know the actual bpc of a running link.
> 
> Drivers might change the current bpc link value due to changes in mode
> line or refresh rates. For example when enabling VRR the underlying
> hardware might not be able sustain the same bandwidth for a particular
> mode line, and it might attempt to lower the bpc. Another example can be
> found when switching the color output format, part of YUV420 fallback.
> 
> This means we might be displaying a stale bpc value although it was
> modified for different reasons -- like a refresh rate or an output
> color format.
> 
> This patch introduces a new property 'link bpc' that user-space can
> use to get the current bpc value of a running link. In the same
> time this would allow user-space set up bpc using 'max_bpc' property.

Could you please point out the userspace implementation which uses this
property?

> 
> Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
> Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> ---
>  drivers/gpu/drm/drm_atomic_uapi.c |  5 +++++
>  drivers/gpu/drm/drm_connector.c   | 26 ++++++++++++++++++++++++++
>  include/drm/drm_connector.h       |  8 ++++++++
>  3 files changed, 39 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index ecc73d52bfae..3a2ffb957ade 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -776,6 +776,9 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
>  						   fence_ptr);
>  	} else if (property == connector->max_bpc_property) {
>  		state->max_requested_bpc = val;
> +	} else if (property == connector->link_bpc_property) {
> +		drm_dbg_kms(dev, "only drivers can set link bpc property. Use max_bpc instead\n");
> +		return -EINVAL;
>  	} else if (property == connector->privacy_screen_sw_state_property) {
>  		state->privacy_screen_sw_state = val;
>  	} else if (property == connector->broadcast_rgb_property) {
> @@ -861,6 +864,8 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
>  		*val = 0;
>  	} else if (property == connector->max_bpc_property) {
>  		*val = state->max_requested_bpc;
> +	} else if (property == connector->link_bpc_property) {
> +		*val = state->hdmi.output_bpc;
>  	} else if (property == connector->privacy_screen_sw_state_property) {
>  		*val = state->privacy_screen_sw_state;
>  	} else if (property == connector->broadcast_rgb_property) {
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 272d6254ea47..7ed27aec0ccc 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -542,6 +542,28 @@ int drmm_connector_init(struct drm_device *dev,
>  }
>  EXPORT_SYMBOL(drmm_connector_init);
>  
> +static int
> +drm_connector_attach_link_bpc_property(struct drm_connector *connector,
> +				       int min, int max)
> +{
> +	struct drm_device *dev = connector->dev;
> +	struct drm_property *prop;
> +
> +	prop = connector->link_bpc_property;
> +	if (prop)
> +		return 0;

Shouldn't it be:

if (connector->link_bpc_property)
	return -EBUSY;

> +
> +	prop = drm_property_create_range(dev, 0, "link bpc", min, max);
> +	if (!prop)
> +		return -ENOMEM;
> +
> +	connector->link_bpc_property = prop;
> +
> +	drm_object_attach_property(&connector->base, prop, max);
> +
> +	return 0;
> +}
> +
>  /**
>   * drmm_connector_hdmi_init - Init a preallocated HDMI connector
>   * @dev: DRM device
> @@ -618,6 +640,10 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
>  	drm_connector_attach_max_bpc_property(connector, 8, max_bpc);
>  	connector->max_bpc = max_bpc;
>  
> +	ret = drm_connector_attach_link_bpc_property(connector, 8, max_bpc);
> +	if (ret)
> +		return ret;

Is there a code which sets this property?

> +
>  	if (max_bpc > 8)
>  		drm_connector_attach_hdr_output_metadata_property(connector);
>  
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 8f34f4b8183d..4a50198aa7c0 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -2079,6 +2079,14 @@ struct drm_connector {
>  	 */
>  	struct drm_property *max_bpc_property;
>  
> +	/**
> +	 * @link_bpc_property: Current connector link bpc set by the driver
> +	 *
> +	 * This property can be used to retrieve the current link bpc from
> +	 * connector_state::hdmi:output_bpc
> +	 */
> +	struct drm_property *link_bpc_property;
> +
>  	/** @privacy_screen: drm_privacy_screen for this connector, or NULL. */
>  	struct drm_privacy_screen *privacy_screen;
>  
> -- 
> 2.47.2
> 

-- 
With best wishes
Dmitry
