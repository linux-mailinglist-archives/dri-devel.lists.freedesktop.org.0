Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5281BC68D8
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 22:18:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A800E10E8D5;
	Wed,  8 Oct 2025 20:18:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EEafHjNq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D832D10E8D5
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 20:18:11 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5OXN019623
 for <dri-devel@lists.freedesktop.org>; Wed, 8 Oct 2025 20:18:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=kNooSgQObBXHDW2EZd4lPNQf
 XkC1kUoaAl1kKd85Nyg=; b=EEafHjNql4kicFMEu1N4GmRpeEnZWAOvK1cv4hst
 W8sT2ELEpo++OmEEPV/jMOCexj6+RT+uSOWFjKYQ2SZdEdkd/WEEmxlpcSdk4iP+
 ASpBwRKpl/8IGMuL3qaxVijU1Q170qAk/2Ywq5qnFc0AoGbxq+/B9pqH446OP5KR
 0Q1xyRxsil8ASV24lpPLV6ioRoj9yQFeEnIy2Kzz85j4mkC3KQv5xaAXPlLNhURz
 uCQATreTatxIB7q6GSio1iJVTd+Vg7ZMyWXN2k0uUxiwNBNPbhOWM8tTYPTAnpZf
 kyHk+ANWLcqApzl0o9zrh7ytDf6Yv41VaT1dI63dg1amxA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv9a8fjm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 20:18:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4deb67c61caso8967001cf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 13:18:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759954690; x=1760559490;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kNooSgQObBXHDW2EZd4lPNQfXkC1kUoaAl1kKd85Nyg=;
 b=g01P/0cBZQCyjFnRB8TTlIVK2yP17zkWZAf77OYG2k1Ep7tSSfq6f+r47p6sq5LygA
 00OdvMAv92w4IvWtTfb/ne1wiQ2jgMA8wFOPHeD/p8jeE1VfnMYNPf5fLMTHUGw/nTIM
 Q795LSGY50SRowKvPKP7YWd5lIViZb5tMPDQ0abtT53YD7XBc1/lF3lcMOg4kwimrZhz
 wzm/Mu8bIF/sqtBeTNf9S9ZyVPqG6B1XVD+XysDDwQdwXu6jtUSZupKIKSD/Pec4GGqq
 6vaXit3wLaB+dzcKQXl4TZuFXcRecH4uGYzZZKal2eS3SROcUIMAk15x8GELMGyk8psN
 6lGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEO/PRSGkzTre6uKhIrKWicgOOC4FeENlYhZtKxkjMmThT0VKqUiTfVztLjScv3Tsl4FMc6Lc/AsM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw4ZjsdPDXNIxuRVLshuaTLn330XtFuqnWAn7kt+bge+Uul1kIs
 F5ol2TxPzBxJzlFhYGJ8GvivNabiWopeCQM00M0r4hlqtkYmT9ob+UbAyFmrVx7wkacPPKBBiGi
 05PZsKKxktvGWcs5h07y0sKJPX+iS9c4H9RYmablgQUNY74KjsgkQa8l14hzkA09BzVzBsl4=
X-Gm-Gg: ASbGncvVQD3OAFS/JueCVaFx4yfn9u1+hFUm0mul+dldVIKXkGSnJeeEn6Hx0uriRdA
 LYZRTwaU3BVFgYwnBuWVYnLSn5vf6Llo9ZPQuLDpNi5kBkrIWWX3D+kXOhvZo3yNATbNKOQ6KCj
 pgpm6wy31UD6BpfHtvDm53R0r2Fspb/HpZoZhdjdtd5tJdSa3DTXVphGLKbzVSK7z5TBSEGhwCZ
 s3piI/D3E2j3dsBzpFWvUj6toicjYxwxuxiqW5vV9ERyU132JZT0LrmlERkLHqN56b/77n6pjZw
 YmRngkuqjZMuraRY+QTs25QE9Ebpw2EYY6vQozhAl3NWYvAbWbbCDXH7aBxc4ttFVPGh8Cwa1CT
 S2Oj40QFKC3CNnbwxcML9VfIkfNNpNZJPt7aVhXxTn0CbzdNvUbg3ZQdSOg==
X-Received: by 2002:ac8:6f13:0:b0:4e6:d87a:280 with SMTP id
 d75a77b69052e-4e6ead55458mr70978501cf.55.1759954689772; 
 Wed, 08 Oct 2025 13:18:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYxqvReUu2GqoRvVHckRUinvJTU/UNQ6t7PoprPmB+pZQtpos6Wn/tSoiodgEp8Lq4K561kw==
X-Received: by 2002:ac8:6f13:0:b0:4e6:d87a:280 with SMTP id
 d75a77b69052e-4e6ead55458mr70978041cf.55.1759954689320; 
 Wed, 08 Oct 2025 13:18:09 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-375f3b8213csm22079521fa.48.2025.10.08.13.18.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 13:18:08 -0700 (PDT)
Date: Wed, 8 Oct 2025 23:18:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 airlied@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, jani.nikula@intel.com,
 simona@ffwll.ch, linux-kernel@vger.kernel.org,
 tomi.valkeinen@ideasonboard.com, praneeth@ti.com, vigneshr@ti.com,
 aradhya.bhatia@linux.dev, s-jain1@ti.com, s-wang12@ti.com,
 r-donadkar@ti.com, h-shenoy@ti.com
Subject: Re: [PATCH v3] drm/bridge: sii902x: Fix HDMI detection with
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
Message-ID: <4rbyxn2jr4nsogt4wfdin3jpzumjqj4mcplq7on6yyqvq4wu34@qng22gczlfyn>
References: <20251007112309.1103811-1-devarsht@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251007112309.1103811-1-devarsht@ti.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMiBTYWx0ZWRfX6DqmSk76M6dn
 IMuqdWTI1DYgDSurMpu3DVLcIM53uzAE6Ya2i5EJLHQw0CIrF9uYa+V8Yi/p9IbAw2EuwjIdonU
 aCPCnlKQTKqnbVslELGEj/fmrBSzGZGLv8Mk9h07Bjc8wjZ08VCaEIm/KqeuNpAULTsP3cVvu6y
 hMfJeuadZ5oRjbDkugyOTgb9CavSi4YRIUBt7V9XacM9pWAx4ghGJxz4+Da9wdcXG65QtQD1YwE
 ohVJoOpWUNjjOGcyrWFNGiAxs31AFNTuLsdjSCscGX1mIfR76WjlP0R0wKk3/TxpXNvKVBSxFlr
 rh8+/GkibMaZRTnTBe1leJ5fFDYwkt6rYsR7JaDWR2ygMRVbXvJk7LZeKpyIpJFKqaQnGuehn51
 ELHWTOR0F9KpsUttxhrI4csUog6JqA==
X-Proofpoint-GUID: w0i4ljQlZK6Qh29emhVIKWTvxe7dk2zc
X-Proofpoint-ORIG-GUID: w0i4ljQlZK6Qh29emhVIKWTvxe7dk2zc
X-Authority-Analysis: v=2.4 cv=JPk2csKb c=1 sm=1 tr=0 ts=68e6c702 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=WDkIgKykSkWkz4MvAP8A:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080122
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

On Tue, Oct 07, 2025 at 04:53:09PM +0530, Devarsh Thakkar wrote:
> The SII902x HDMI bridge driver wasn't working properly with drivers that
> use the newer bridge connector architecture with the
> DRM_BRIDGE_ATTACH_NO_CONNECTOR flag, like TIDSS.  This caused HDMI audio to
> fail since the driver wasn't properly setting the sink_is_hdmi flag when
> the bridge was attached without a connector since .get_modes() is never
> called in this case. Fix it by setting sink_is_hdmi flag when reading
> the EDID block itself.
> 
> Fixes: 3de47e1309c2 ("drm/bridge: sii902x: use display info is_hdmi")
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> ---
> V3: Use drm_edid_connector_update without edid NULL check
> V2: Use drm_edid_connector_update to detect HDMI
> 
> Link to V2:
> https://lore.kernel.org/all/20251006150714.3144368-1-devarsht@ti.com/
> Link to V1:
> https://lore.kernel.org/all/20251003143642.4072918-1-devarsht@ti.com/
> 
>  drivers/gpu/drm/bridge/sii902x.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
> index d537b1d036fb..bb613d4c281f 100644
> --- a/drivers/gpu/drm/bridge/sii902x.c
> +++ b/drivers/gpu/drm/bridge/sii902x.c
> @@ -296,6 +296,8 @@ static const struct drm_edid *sii902x_edid_read(struct sii902x *sii902x,
>  	mutex_lock(&sii902x->mutex);
>  
>  	drm_edid = drm_edid_read_ddc(connector, sii902x->i2cmux->adapter[0]);
> +	drm_edid_connector_update(connector, drm_edid);
> +	sii902x->sink_is_hdmi = connector->display_info.is_hdmi;
>  
>  	mutex_unlock(&sii902x->mutex);
>  
> @@ -309,14 +311,11 @@ static int sii902x_get_modes(struct drm_connector *connector)
>  	int num = 0;
>  
>  	drm_edid = sii902x_edid_read(sii902x, connector);
> -	drm_edid_connector_update(connector, drm_edid);
>  	if (drm_edid) {
>  		num = drm_edid_connector_add_modes(connector);
>  		drm_edid_free(drm_edid);
>  	}

The EDID read / free can also be dropped, they don't serve any purpose
now.

>  
> -	sii902x->sink_is_hdmi = connector->display_info.is_hdmi;
> -
>  	return num;
>  }
>  
> -- 
> 2.39.1
> 

-- 
With best wishes
Dmitry
