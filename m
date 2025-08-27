Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB19B3776A
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 03:50:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7EAE10E30F;
	Wed, 27 Aug 2025 01:50:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RtohOwq/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B67B10E6EB
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 01:50:50 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57R0UEPI031911
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 01:50:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=0laXQCaNkR8BdkTEIAIjvxkP
 U6e+xAcI3sMZOZG++40=; b=RtohOwq/mGWF5aMn8hEPDpMx/rZR9xAALF19Kgyn
 ABnotCfpABau8JwSOXOICFi9m0+JYeo5KRmxM7/PZXvfAVZ+xkORF/VXDwTNR3Ph
 HPx+mTISivbCf4otlZINmlEZaKzFvdI6E4ajQHq9yVGAUfZo4nLChDdFD8U1iaE4
 IS1qmtCDKjKe0bte0kvKERccexJ6lHl808lZOQbURByejcjFT3WTBN/nsM8JSd+g
 k1B3AWzsQK6lbv1D9bzTVgUEmdbFOgAkV//+43Xv1+qkGLvzB6NM7Z7dZU1NecZ0
 guNgLQYiFnm+R6mcteg49ubo9IpFgtLwxmbQpqJPkNbHbw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48se16syuj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 01:50:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b10ab0062aso150796761cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 18:50:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756259448; x=1756864248;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0laXQCaNkR8BdkTEIAIjvxkPU6e+xAcI3sMZOZG++40=;
 b=tcmntHNuSNPeyg4NNcHqJasOKwPV8UnVtlcHm3wfS+wGgXdQ2o7q5SRhYPr4n9vgr4
 RZEcDMFdSL8qgYf4UOcrOzx9cL+gjwYE1hZgZvI/j/b03CXvCL1g/vjPrZZQCcjz89SU
 LslKCyljVD9a8F7sBwzsNT+te/40lpQ+KYZ97eI62JkePZRxgKCvb60QclKmon/ur013
 Tpg0Ab0ndqLbvrXun/SKUDk7y/qTeVp9Vv4ZV3iy22FP6p22zgeLuXsHZhqoZFkjMPR0
 tVZ0KTq8ffC85IhCrGaIqvgtVnj6WZO5Yydkw9od5+x2HnHeNvW3M+/3NukfBJ6MwIPh
 T/2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3WHz0zhZNLeRLaCN5WsfSl3yRCcTtnS8KS84DrkS2X+33WxUAY8Vm3cIoIWOz1rzdm6g5bnjr0+M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyH4zt0PuqhGfLcFNJMGkWZGqglC25d2v9rNg6Lf+zYM99EUhYf
 mPbVA1QS/q9E4FvEyofEUjjE7L1QrWnUndUVPksgwaDSKWR6pCvxFpvZ+V8Hk4X9cSBNLhQlnqg
 WR5IBJq+C+2AV1xEbtE1OFH7mV6j85TSeXEEdPAkMNtQsycwMmhBtPtdHzOS9v8nk/rHByAs=
X-Gm-Gg: ASbGnctb9GZGAe/MQ2OPIrXTKDFIVRwbJ2m8GMUHeJMBpbueHyJ27pmbE1+JLsb/7md
 y/ykx16z1N+KunDz4OUYUxFR5sh5IxzFaHC8/I77HmT6BExGhUiezrndy+kFz7xJWr9aGO7MScr
 aJGMg25rtR9zZmLk7xrxgr2+brL3dcuUAaZ0M7XANIH7Ra78dk/ahy7MeWJa+Srv8jyDcimnxgZ
 rbPTrfhPcpAEOlnAxTf2GXbgFXQCpAKKjcQosWJdsOQvZiaaymmhGOvHJBkjRM5wUQFuXcWscug
 EPG0fAMWlOTl/rTpDP4ppORKGYsC7FsW7I4GYxGT27rh6RJGjI4aTDSkkAm2w9o+4Hm2XSboOpU
 b7poe14vpJ2neu/SwhUYA7z9uMNQ/+M86PiXI/O4DXByOd1OMw5DS
X-Received: by 2002:ac8:5e12:0:b0:4ae:6b72:2ae2 with SMTP id
 d75a77b69052e-4b2aaacef55mr186157201cf.40.1756259448026; 
 Tue, 26 Aug 2025 18:50:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMxKJaOrtRDBj0yHJf7PhiEmF+htiaol/DYqvG4rG8Xn2tdgOPzsKsBrI5J0XgVP0gDX2TkA==
X-Received: by 2002:ac8:5e12:0:b0:4ae:6b72:2ae2 with SMTP id
 d75a77b69052e-4b2aaacef55mr186156351cf.40.1756259447377; 
 Tue, 26 Aug 2025 18:50:47 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f4b46d050sm989200e87.150.2025.08.26.18.50.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 18:50:46 -0700 (PDT)
Date: Wed, 27 Aug 2025 04:50:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Paul Cercueil <paul@crapouillou.net>, Liviu Dudau <liviu.dudau@arm.com>,
 Russell King <linux@armlinux.org.uk>,
 Manikandan Muralidharan <manikandan.m@microchip.com>,
 Dharma Balasubiramani <dharma.b@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Liu Ying <victor.liu@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Edmund Dea <edmund.j.dea@intel.com>, Paul Kocialkowski <paulk@sys-base.io>,
 Sui Jingfeng <suijingfeng@loongson.cn>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Hans de Goede <hansg@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 26/39] drm/msm/mdp5: Switch to
 drm_atomic_get_new_crtc_state()
Message-ID: <dc2sfo6edj4w3qiwldoglaanbi2h7mmev7x4pklwbl7x6x6rah@kjyc52pv2xqy>
References: <20250825-drm-no-more-existing-state-v1-0-f08ccd9f85c9@kernel.org>
 <20250825-drm-no-more-existing-state-v1-26-f08ccd9f85c9@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-drm-no-more-existing-state-v1-26-f08ccd9f85c9@kernel.org>
X-Proofpoint-GUID: EaOVqjEpJFIQkMd2ZkJmBDVBg1DYo84c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDEyMCBTYWx0ZWRfX2LVtp1sHJj0a
 hm2RFnVH1YF28yLGmO8urkvbf9GasvnsFM1jCgTftvAQsVX4cH34MIMj7qVOtlwPL/HwMmOfTo2
 6nJImn5Su/+l5jge3ek5kUowhlyA8Q1SYRUH3cHirSTTrHXpo3XGsXkIUTGR3AE4Ea/MyAimyXa
 6nNG8sd/Zu9DxdCN4l+lSbpOnvCKMvOHgtm/TCigh56uqFQ8JULq5gc3TwgOUru7G1g7+AjHGbm
 wAOBWb8IUiP5avm0ToOQvFa2LYcE9xqNzp6YxsFDOqxTB1r2aPCldQrSIWUND7ssPeD3zpyskuA
 lnu0oHhwqFlU57fWS68BtfhgEQBfhBGu2C5sLj2Snq88wpIh6exxFlVvtrRgbbBidk+KKYTTQca
 BSqakceJ
X-Proofpoint-ORIG-GUID: EaOVqjEpJFIQkMd2ZkJmBDVBg1DYo84c
X-Authority-Analysis: v=2.4 cv=CNYqXQrD c=1 sm=1 tr=0 ts=68ae6479 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=viL_tbrIvFpnGUkEXy0A:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508260120
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

On Mon, Aug 25, 2025 at 03:43:31PM +0200, Maxime Ripard wrote:
> The msm atomic_check implementation uses the deprecated
> drm_atomic_get_existing_crtc_state() helper.
> 
> This hook is called as part of the global atomic_check, thus before the
> states are swapped. The existing state thus points to the new state, and
> we can use drm_atomic_get_new_crtc_state() instead.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

To merge through drm-misc-next:

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
