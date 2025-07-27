Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FB1B130D7
	for <lists+dri-devel@lfdr.de>; Sun, 27 Jul 2025 19:07:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A39C10E3D3;
	Sun, 27 Jul 2025 17:07:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GjWlHz6V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DADE410E3D8
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jul 2025 17:07:46 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56R7YJjm031067
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jul 2025 17:07:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ixTGCGDVVyYZCVMPENu9+cSJ
 CMoukZrCFUWQs6e8nEs=; b=GjWlHz6VsRKE///7RZP+5J6nheAUZYr6XJ1Pn8y1
 9PG8KwFozIyqCuM0kPniLOFb4DCi1tJP4COnQrtVj9R6dr67Ztcq0s+9PYkW5pDA
 D/aLW4F3wevb9eSFNy9tvV3KB+YZuUNkRfCqUKfaw5vjYKFoh1nas4aPogtn3L5L
 Z6ev0yhdRShYYdS86oXSMRGepuBXhBvFrDeMLrr+2Xdx4Bc3AmvCvdMzUXt7HjxD
 iGjajE0qEdOACM8yy2YkzM8HtLLhRmk8dkCf+mAdMYgOevhNemt2k7TsJpeBrNn8
 /nRDW8qbacMN0rvUJMEeBuzs/lVthIi3mFB1XWdo3RciEw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484mcr2m9p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jul 2025 17:07:41 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6fb5f71b363so80923896d6.2
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jul 2025 10:07:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753636060; x=1754240860;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ixTGCGDVVyYZCVMPENu9+cSJCMoukZrCFUWQs6e8nEs=;
 b=kCfOaz2+z82uBYl4I6dkoxb4KTS6VWEUsYx0IrN1T5QnS0AZ+IUeriV83Ucw8sZzzM
 tSqLSlKJnN9JyMVp/IpcI7gHgYUeQtl0WLHUSI613hDcqMa4vYkv9qKjVTvc8eim/KGI
 On/gtzd/A9K3whuccdH54BsmJf/C/WMS2mDt428MPIUCeo4mFpUBZaJEsQFZBw1cmfiA
 La5tK3XuQy2yA2yR+cDEcnKo40plXHYSoX9X0GylPapACxlJh5wyOTyCSZCKC8wqL/QG
 FLHUFsrAUTsKpAdOkEq5e5tReQIqMNRj8TjWVnsobyUDNfmBI0OAJhG74w/6AcBSx9pk
 FJyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpqgu+UHcx2xZ8gOwp23IpujGDVEHRm0T5EVAJsbLvMmqzwfRyOOh1rvbQ4+kPmC3epi+bdCu+11I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwiFA7NK0Z6YXeP00O9opw/ugEGNnm8ZfsH6YsGl2L+j8JEYm06
 7knowW585F6Wj2LpoqXB9VD8MrIiNjr5VwtaCLvMHmaTxidvBLr31fdJTt0QIbvwH/a2yputee1
 mBYP2SWug2Bgoyzbi7IYhb9izIq1/bot1G+hgftSm8ReKpl/4Lb8I8BcmEL0XTL9X+p5acLs=
X-Gm-Gg: ASbGncvc/7fJVnsbZy+dvxQu8QkdefUetKx4/0IUw4D+YXW/d4tVsM+ZzS+KQfMJQfV
 hb8vbVV46nm9T6KDOwYFAlKxe1eeTe24I8wezPdz7s10agXL5y582mpGURqSJlD6TDwdeNGUy38
 YQa+sYBKeq+9aJuE3YrpoxOTLMQyLXsx9mSNCCgh2e1aE0Ac/Wupopct8Aei6ws4PXJ3J9XCBFM
 reW7+hLChwkLSlQdmoGOEStU+Noch3XDa+2UQDLp34VARZ23eCcLsgvTLTb1ZkWHqUEB2SsgiKp
 w0LJQDOu+fej0x7C+WMOtfaEkm4gTLcaaqKz9t/V3L5HYnVReVqVYXbNEkg3dlepDnFS7HYw+q4
 GfUeG5BVefZ4mQEIJNQ18KdbAacy2yNWkDoe78A8QSkkaPEazereC
X-Received: by 2002:a05:6214:2589:b0:707:4537:694d with SMTP id
 6a1803df08f44-70745378ec4mr29537506d6.40.1753636060373; 
 Sun, 27 Jul 2025 10:07:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEXLKqoDY1SG91obuUTr/s+jXCYfFkccduE+r6jszKozvG4bsVHcYbTsAuHs4gKScMQt334Q==
X-Received: by 2002:a05:6214:2589:b0:707:4537:694d with SMTP id
 6a1803df08f44-70745378ec4mr29537026d6.40.1753636059860; 
 Sun, 27 Jul 2025 10:07:39 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b633760e6sm878179e87.160.2025.07.27.10.07.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 10:07:38 -0700 (PDT)
Date: Sun, 27 Jul 2025 20:07:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Henrik Grimler <henrik@grimler.se>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, replicant@osuosl.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] drm/bridge: sii9234: use extcon cable detection
 logic to detect MHL
Message-ID: <ldhyfuczwtwydwnvno4xn6ppjtt7mtcj35fp52xrqaajtfbtpb@2pgkytczb5k5>
References: <20250724-exynos4-sii9234-driver-v2-0-faee244f1d40@grimler.se>
 <20250724-exynos4-sii9234-driver-v2-3-faee244f1d40@grimler.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724-exynos4-sii9234-driver-v2-3-faee244f1d40@grimler.se>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI3MDE1MiBTYWx0ZWRfX5IMxYMYFBb7q
 WHrzqK4LHqeH79o/F6R4gMSzukXKdZ0ysdATUzGBj2Ds99PFfd+nGK8AD1t9yLp7Msw/H84GvX8
 aPM44/13QLh1rTMH6IQ1WgZ+VQXBk3au60S2fb4atYe1eVn/DhszHcC0ld5cxGyWUdfmuqjhQ02
 WxovnlD/S0OwAJ3GkpzbFHNbiiCLKJ9iS5C7oLvu1f8VPTmI7mGGFNFFSHwdodBWWetaw0u3SwR
 IlVmdwe81STIkFVHsNaGQE3iM2rMx+KFQ8ZBmG4/sljy3dEsnRcYSA4i0xc1kuDOhufiWPqRBOU
 xS8m5XqbEspoT/uYQtPFCB5AI2MHKKV2duHpenXnv8jrhIWQP13RBSsZo8Ic6iHV5heoD9yN/+D
 BFs6BaP/o52RpsjKh/BnLuofQDf5tZ+ZN6+/ii/KSmV75wKCZA5fEHdZNrjHEcDOehJhxFB4
X-Authority-Analysis: v=2.4 cv=Hth2G1TS c=1 sm=1 tr=0 ts=68865cdd cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=QyXUC8HyAAAA:8 a=he5a5jZawRGK-0tMrGoA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: clusum6Y5xhJHoX8SI-bT9821eoPn9BH
X-Proofpoint-ORIG-GUID: clusum6Y5xhJHoX8SI-bT9821eoPn9BH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-27_05,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxlogscore=959 clxscore=1015
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507270152
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

On Thu, Jul 24, 2025 at 08:50:53PM +0200, Henrik Grimler wrote:
> To use MHL we currently need the MHL chip to be permanently on, which
> consumes unnecessary power. Let's use extcon attached to MUIC to enable
> the MHL chip only if it detects an MHL cable.

Does HPD GPIO reflect the correct state of the cable? What is the order
of events in such a case? Should the sii9234 signal to Exynos HDMI that
the link is established?

> 
> Signed-off-by: Henrik Grimler <henrik@grimler.se>
> ---
> v2: add dependency on extcon. Issue reported by kernel test robot
>     <lkp@intel.com>
> ---
>  drivers/gpu/drm/bridge/Kconfig   |  1 +
>  drivers/gpu/drm/bridge/sii9234.c | 89 ++++++++++++++++++++++++++++++++++++++--
>  2 files changed, 87 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index b9e0ca85226a603a24f90c6879d1499f824060cb..f18a083f6e1c6fe40bde5e65a1548acc61a162ae 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -303,6 +303,7 @@ config DRM_SII902X
>  config DRM_SII9234
>  	tristate "Silicon Image SII9234 HDMI/MHL bridge"
>  	depends on OF
> +	select EXTCON

Either this or 'depends on EXTCON || !EXTCON'

>  	help
>  	  Say Y here if you want support for the MHL interface.
>  	  It is an I2C driver, that detects connection of MHL bridge

-- 
With best wishes
Dmitry
