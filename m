Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA02FA8093D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 14:52:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4601910E688;
	Tue,  8 Apr 2025 12:52:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NOf/OpSu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5393410E688
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 12:52:24 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538Axo5Y029735
 for <dri-devel@lists.freedesktop.org>; Tue, 8 Apr 2025 12:52:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=/RhAbopXZzYSZ2snzri292Eq
 ZjBPlNjasAOXmgSUoLA=; b=NOf/OpSuJoghY6yFXkAGgD5610T6SpL5s8ltbk41
 OuSmvFXSw3uTTMf09VegztcuVUoftQXVbJi1Ck1vLytFw+htGZBd7kfAKf06PmU3
 ERV+pYu1K86IFUMeQf0mfXA9kCmQxoZTHvKYBIXPPVJarV961Tm1Kk1N62PZTDiF
 O0XiiFf75vbyzt6qPrlSorn61yuwTzAyZLY6YtPl0bFJ5mQLTYQNQ9Zp8Lt+M0SC
 PwYA2G6yN8sIbnSXyX3kuhAJf6waltYpUa9bSCVDxqER/HreAF3Tu4sWaKeCXx8c
 kNe59U4RYQtxxlLowGXbzyvQnxrY3+v4cSk9yChpcHUmZQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcrft68-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 12:52:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c5cd0f8961so1168005485a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 05:52:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744116742; x=1744721542;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/RhAbopXZzYSZ2snzri292EqZjBPlNjasAOXmgSUoLA=;
 b=i1FUDxJs/pwMAxgV0WrZE4v8qvHoExB7IAew5AbvII/n8WBeam6vPie9XL5CqnKIeU
 IT3wPc/Rqsk6fp+fNFbY4vEmm+iSKynL1SGT7kdVsdf+3zgjey0FBqmXF7HcztLuY8GJ
 EbZ3XKSEknN2G/NGu7rGtg7vuoUvo0kq/N0HhuVzsXDd4/LUOYLbm1bYTqvOht1dEuet
 DJBr/xOyx0MxWSWoDuTqLgJd+6PNpRktx1UxyIVrbnuT2U2EGGKkYFJzqU9KLrJewELV
 4XBfT39sVmXh19qVVxbdEjilwL07gOo9FbeXlwZvV40azWbidYRZ+3Lf6dGYgrTD4Ar4
 73Aw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfZ8Yx7KOyGVWq0AYtpVbiFXA9Gt+grtyTy0PpRNa7K5R4Cn8m0bpZ7HWwwpGnZUgSIJn2/ftLfJA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9RERQ8C9LZvjoE39cyh3jkRdnfAjE98E9glJ746oRX0TKc7UR
 wWUtjv6A/C9hOxx8NxWaA9yXshT+EGnmCuyPtXRGUKySid51Y+GKanJvqwUOJ6wnXH32SVDvuqW
 P63lFIrN2c7005PunA9C7ekOi79tyUz9cwn6izp0N0bDeN0D5dTNVR7DiIapz2WLaINE=
X-Gm-Gg: ASbGnctsx6JpdNupq9ZIEGWZh89rbXSo6QSmPwf81m+NrjgGLiCyReZ8fSLK5qQwaRC
 wCEFin7/P0us7TgnhLoI4J1IJ2nWxNqo57pg4PXMt8OXPzPlLwldAGRKiWJ5wv8Qe04IkJRR5RH
 1WVTVVHT2TeWqQra0D9YmMpBHcWRfeq7nKP5bYlmYHzMxD9ZMg9kAuXqxaC2cYhprCr3PfQ9+EI
 Cm1330rVLu2k+NrXR4vFftzjUnKo/UEAV4+4ZkNNkuCN4PXohzmi2vtOrPrSRfy495ojxAApy4G
 4g1MGC5AhUQLdq5DWV0MAQLOaM5e8GZWn1oYOMqeqp/jQcAHxmR9VDVK6LMBfP3UIForNBl9zif
 UfOE=
X-Received: by 2002:a05:620a:424c:b0:7c5:4eee:5405 with SMTP id
 af79cd13be357-7c775ade724mr2198473185a.35.1744116742503; 
 Tue, 08 Apr 2025 05:52:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFDiuOVK4fqofPRbu3JaWKpIlUn1TV35mTKoHmAkptZzlJT6SxBzt4YQZhIm9U/ibG6EVK9g==
X-Received: by 2002:a05:620a:424c:b0:7c5:4eee:5405 with SMTP id
 af79cd13be357-7c775ade724mr2198469585a.35.1744116742092; 
 Tue, 08 Apr 2025 05:52:22 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30f031ed8absm20036791fa.111.2025.04.08.05.52.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 05:52:21 -0700 (PDT)
Date: Tue, 8 Apr 2025 15:52:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Pu, Hui" <Hui.Pu@gehealthcare.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] drm/panel: simple: Tianma TM070JDHG34-00: add
 delays
Message-ID: <563qsg52t5rio45xyofhihdxhsnu3j5togxoq65n6v65yevpcy@rv2eabnsuete>
References: <20250407-tianma-p0700wxf1mbaa-v2-0-ede8c5a3f538@bootlin.com>
 <20250407-tianma-p0700wxf1mbaa-v2-2-ede8c5a3f538@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-tianma-p0700wxf1mbaa-v2-2-ede8c5a3f538@bootlin.com>
X-Proofpoint-ORIG-GUID: yPU0bdSf9w1R1sPZS_cnKZCp10LvoEb9
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=67f51c07 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=P-IC7800AAAA:8 a=pk7s4CxdNanXLCiXgvgA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: yPU0bdSf9w1R1sPZS_cnKZCp10LvoEb9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_04,2025-04-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080090
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

On Mon, Apr 07, 2025 at 06:34:00PM +0200, Luca Ceresoli wrote:
> Add power on/off delays for the Tianma TM070JDHG34-00.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 6 ++++++
>  1 file changed, 6 insertions(+)

Fixes: bf6daaa281f7 ("drm/panel: simple: Add Tianma TM070JDHG34-00 panel support")

> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index df718c4a86cb7dc0cd126e807d33306e5a21d8a0..3496ed3e62056938ccc0ed2389ea46eed8d17ea2 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -4452,6 +4452,12 @@ static const struct panel_desc tianma_tm070jdhg34_00 = {
>  		.width = 150, /* 149.76 */
>  		.height = 94, /* 93.60 */
>  	},
> +	.delay = {
> +		.prepare = 18,		/* Tr + Tp1 */

I think this should be 15, Tr is handled by the regulator, so no need to
handled it in the panel driver.

> +		.enable = 150,		/* Tp2 */
> +		.disable = 150,		/* Tp4 */
> +		.unprepare = 120,	/* Tp3 */
> +	},
>  	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
>  	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>  };
> 
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry
