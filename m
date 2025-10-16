Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF7ABE5554
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 22:12:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BE5910E348;
	Thu, 16 Oct 2025 20:12:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="V9b7Ms4e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E249110E348
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 20:12:37 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GE2wMa003404
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 20:12:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=rejfN56i3rrzjApXLDYPUwGP
 UcfTw/rwEpayOvgqk+o=; b=V9b7Ms4elLH2vsKIynD39CNPVY23imAm6pnZxSZ6
 w6B68lYA7KolqhutrlwAGdYLIk6anj1Y0JV7icdl9ocbg6p04vCiFm5jTWH3NqQ4
 WO3R9KdxTuNKRYQf9LRZV7ZnI4ODCYM6Cl2G8AdGhprqywBib3t9U+Ufdj/esjgQ
 Sb7lt1TYqN3nRzblFQyi75BhxuviyHDs/IbQRarSRR+VgyNPzaed/L+UgtfIgLLH
 BnYYGJXancgmkSmf3ewOyO+Bs43KVbaY+jm6ump1+sxDZBBZLf/mhASB4pkvw3JJ
 JlUOQ1MkjNfL467rCoyvH0TTOuLNPiL3QadJwWZ+VPzPPw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49sua8rasj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 20:12:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-89087f3817cso50511585a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 13:12:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760645556; x=1761250356;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rejfN56i3rrzjApXLDYPUwGPUcfTw/rwEpayOvgqk+o=;
 b=caTWgZvJqS/ndyXhvoymL2UHY72PrUymRJ6nx7zEmZTFtbgWyxIPG/R4aEKZVK66Le
 SD74jNca6vhPRqTexsUJKHoz4yPTschpq2QDHdMg6OzhkItPc9VPdGjyWSkt3L8gGQj9
 chPQjJtL7AKtBA3DR30SuK4bFVhc+cOZIFvfeGhhAMDOO/ymRi9Ha6rGJ56aTtTTjXrB
 NiwJjfowh7rqgCchzkWn4CK0PptPt/kTHbf3h44R4MMqfSea3ZfzGRUwsU+9WIzL23B+
 vVPTde2HU9Q761rYWeNk1PCcLnJSJA1zQ6UgSegViQS1unmO1+ThVitFooGeJ4/RxsCz
 CUNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBxM25QpYiCkM8WGnINATuraIGmzyQHYwH4dVBBkyOrd/BOcy7kKq1yp+WROSAhAWRWRqseHwuNWA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBgrywtKDQzdcgTJr0p25dy8gi/Hmrorajx95KtrpCQtTC7GHi
 P2zl2/ms/r4VIC3Wws5RqBgeH2Lpo0T758g1WONvWCG/M+sG1bd9o7eP8vji5HNVn5zdDwDXje/
 zrnGWnge6wAomhonEc/t1afqXdCbaB1yojXcuRBgN+PL7BPMBNwB4xf0uVVGv+r8UUtuCNPo=
X-Gm-Gg: ASbGncs09PPUI2gIT3loIKPCDbEdayujFse3k1MF9pYnSTiT5pkgK3AcRhuLJOJjRah
 VVDOtzbHfbi2PHx2NM85sbGRJQ4ZUIiOxO+SSyLhFn67neMAi8IJJ0hBPYNhuOtbCWU4O+sm9gT
 Ayjdqur0n/kKdHizeq/ct9DWpGrWlmBfMZuZ/hwpgwSKB/UiCAskzNnQURJql/NY1lNCHWm+XDJ
 NZhyeR7wrQcsyinYKq+ATY68J+Q9UNf2T9wS8a13+MX5SZrNpq63O37OTwGKOXTfauzHahAh8y3
 XlDq9FwgbRUIcYx0HAfcKNG5ZDHYq/9KoXQjIioPNHFu0RKO5A/AmFHIOFjILmpXkTaBuIAUojG
 eEXjt+54aTfqDyTWvthQaNKir52TWccJM+zLG44tCdR9gZ1KIJ2mZKjM7NR7rCdl6g5+AHcIk1l
 An1Ns9a/Ee4HI=
X-Received: by 2002:a05:622a:312:b0:4e7:22c3:2f2a with SMTP id
 d75a77b69052e-4e89d3f374cmr20498641cf.76.1760645555953; 
 Thu, 16 Oct 2025 13:12:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEO5U0g7kRZ1LMCajGgW2ZKcTweTmabQ+ZEUOuyqtJjtkCMrjBTPjj6nQiRD8cUh2pksrXuYQ==
X-Received: by 2002:a05:622a:312:b0:4e7:22c3:2f2a with SMTP id
 d75a77b69052e-4e89d3f374cmr20498221cf.76.1760645555357; 
 Thu, 16 Oct 2025 13:12:35 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-590881e4e21sm7292388e87.2.2025.10.16.13.12.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Oct 2025 13:12:34 -0700 (PDT)
Date: Thu, 16 Oct 2025 23:12:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Casey Connolly <casey.connolly@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 4/8] drm/panel: Add Samsung S6E3FC2X01 DDIC with
 AMS641RW panel
Message-ID: <didkbltadu4ql6xcqtjrtf2iguody5bgy6mqlwtbyfgbambaii@mzofzymnfbju>
References: <20251016-s6e3fc2x01-v3-0-ce0f3566b903@ixit.cz>
 <20251016-s6e3fc2x01-v3-4-ce0f3566b903@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016-s6e3fc2x01-v3-4-ce0f3566b903@ixit.cz>
X-Proofpoint-GUID: HvBPSowKm5ErL7ygjMNtBJtaBAP_2Ztj
X-Authority-Analysis: v=2.4 cv=e5MLiKp/ c=1 sm=1 tr=0 ts=68f151b4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=WFa1dZBpAAAA:8 a=bBqXziUQAAAA:8
 a=JZHlp33AlScNdFJXQgwA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=MZguhEFr_PtxzKXayD1K:22 a=BjKv_IHbNJvPKzgot4uq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE0MDEzNCBTYWx0ZWRfX+YWVeUaJQjfU
 bpjfwaloBf0A8h/NoPXut4Zc7cxpMktH6qrC/SJFXSTVo0rR7V5BHG16liJwIo9SE8J9qfR1WJm
 vfI9B6XEQJPWizVYCTZktGAxozMzxAGDoPLdGE8DqwgL1hjKG3apeABEiJdKps0A402L1yCZx0F
 gTr0tbj33oSGxwx+9MdpWX3QJ5+Bfah2P5SO5VnY6lYNYbcZDwqicuMDgkrWfKy4gCRk0HE7DyC
 FvH9OBK5w7fNdmwddoNJyulR5YLqZS1ET1AZnZTWlnrVbSBN1AWH3KnGq4wSRw6g6NqRZoQzYuh
 2COOwX0EEZsSaPwClFeeJvWN6ZS4Pr57PwY/hTR8fR2jRY++MQMiTARoPuNzUIgKW0QK4nU885m
 7fEsyNEcPCvIXvFdnmUFyFHhz13jpQ==
X-Proofpoint-ORIG-GUID: HvBPSowKm5ErL7ygjMNtBJtaBAP_2Ztj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510140134
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

On Thu, Oct 16, 2025 at 06:16:59PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Add panel driver used in the OnePlus 6T.
> 
> No datasheet, based mostly on EDK2 init sequence and the downstream driver.
> 
> Note: This driver doesn't use previously mentioned "samsung,s6e3fc2x01"
> by OnePlus 6T device-tree.
> The reason is because DDIC itself without knowing the panel type used
> with it will not give the driver enough information about the panel used,
> as the panel cannot be autodetected.
> While would be more practical to support the original compatible,
> I would like to avoid it, to prevent confusing devs upstreaming DDICs.
> 
> Based on work of:
>   Casey Connolly <casey@connolly.tech>
>   Joel Selvaraj <foss@joelselvaraj.com>
>   Nia Espera <a5b6@riseup.net>
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  MAINTAINERS                                      |   1 +
>  drivers/gpu/drm/panel/Kconfig                    |  13 +
>  drivers/gpu/drm/panel/Makefile                   |   1 +
>  drivers/gpu/drm/panel/panel-samsung-s6e3fc2x01.c | 399 +++++++++++++++++++++++
>  4 files changed, 414 insertions(+)
> 
> +
> +static const struct drm_display_mode ams641rw_mode = {
> +	.clock = (1080 + 72 + 16 + 36) * (2340 + 32 + 4 + 18) * 60 / 1000,
> +	.hdisplay = 1080,
> +	.hsync_start = 1080 + 72,
> +	.hsync_end = 1080 + 72 + 16,
> +	.htotal = 1080 + 72 + 16 + 36,
> +	.vdisplay = 2340,
> +	.vsync_start = 2340 + 32,
> +	.vsync_end = 2340 + 32 + 4,
> +	.vtotal = 2340 + 32 + 4 + 18,
> +	.width_mm = 68,
> +	.height_mm = 145,
> +};
> +
> +static int s6e3fc2x01_get_modes(struct drm_panel *panel,
> +					struct drm_connector *connector)
> +{
> +	struct drm_display_mode *mode;
> +
> +	mode = drm_mode_duplicate(connector->dev, &ams641rw_mode);
> +	if (!mode)
> +		return -ENOMEM;
> +
> +	drm_mode_set_name(mode);
> +
> +	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> +	connector->display_info.width_mm = mode->width_mm;
> +	connector->display_info.height_mm = mode->height_mm;
> +	drm_mode_probed_add(connector, mode);

drm_connector_helper_get_modes_fixed()

> +
> +	return 1;
> +}
> +
> +
> +static const struct of_device_id s6e3fc2x01_of_match[] = {
> +	/* samsung,s6e3fc2x01 will default to the AMS641RW mode (legacy) */
> +	{ .compatible = "samsung,s6e3fc2x01", .data = &ams641rw_mode },

Is there a need to probide this kind of legacy?

> +	{ .compatible = "samsung,s6e3fc2x01-ams641rw", .data = &ams641rw_mode },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, s6e3fc2x01_of_match);
> +

-- 
With best wishes
Dmitry
