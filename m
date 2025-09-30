Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42053BAE7F5
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 22:10:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B14A010E2D6;
	Tue, 30 Sep 2025 20:10:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ffJrJ0PS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AC0210E2D6
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 20:10:16 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UCo3Z1017702
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 20:10:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=HUh15XTlHhQ6Q1q/DhGrQFrr
 yiPIaucH02PqHMC1azU=; b=ffJrJ0PSTxvIAskznd1HN89PYvrtK1jPtX4SKcyO
 n9M360aQdp97l/HD2LB0hM7I3AIBClvyVjFNX4Pe/4gDkw4p9PlD04eunPSwsfaU
 bBZ2YMmmJnJdJ/GcYahlQn8cIUTUvbx1ueAUfOYhx8IYeK88/xQZh9o48wuAIdXR
 ijxVM3znvZbccrA6V9xUPuFJsIrCrN59afxk7F0fEZttLODdeHJQTFWQBJf6Bxa5
 gtEUZJv9MH7ZwXBQq/ay7K9XBo1P0u8OSz4pSDBjqaBB/TGe9u3vSOB94F4KoOj+
 jyc8+qidoq5LZ/0oKAzmhM9or2F0L1OrF6O3XA/5b+R9VA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e93hj1wc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 20:10:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4dd6887656cso118275521cf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 13:10:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759263014; x=1759867814;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HUh15XTlHhQ6Q1q/DhGrQFrryiPIaucH02PqHMC1azU=;
 b=sU2rhHhcyJwBW6gV6koIZ46tkZnJ7OG3suS6WqkslwVmls/eqqkD2HOfTlCzmJkpP3
 VLfcxbEz+4gDALMMrRI1LDNxyOHL1L5OzbaVENCZt1nD8b1wPG3twZNKO45gVWeC+WIk
 WrLbBHAjghORu/ZV4CfK45DV/lVD3KTBt4AWXQFLpk2GIkQvChZq+orkxA3WYMBvsJZT
 w2Q4Aght2Qjo9ul86O8R3a5Yh/7xNgZOOtygLUJBCh6x3/4cF4Lg6co1tfZZG/4gB0CQ
 YCDm95DgMWsDQHDB9t1BgswW8gzYgOhzRwin1vOSVWEIFiI+rRUs7Frrqye4eBxWCX8H
 WOYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8QzmBlG0K21y/xqVY633mSMAbGC2w3QcOvU0S/txd5f85VEcGrvNR2mhtZWRKbYZVEbJ0iyi3kf4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyIcCHRhKI1BXgtPtX1UyJhZiNiNFqYAHCiewOyVTB3CmcSU/vI
 ZoOWua3h1UUnQ9r9Oslsr7DYwbOmfh9thZMeHUxJ6KzJNb4fs1BpcpLMcbgDs7pqXqHG0K42Jmz
 JRbMT221ncUXszZXpX6SUdn6PqCf+X8yzBgbfIWYI7sYd0R8Gx71xx6o1jeE+3INhgxWbPsw=
X-Gm-Gg: ASbGncuCEwpdGKgBxyWkB+5RahUelvQSzDQ5YRWHQLd3fHUuOftfXJf2RaTcqfHtuWz
 ueT3WtQvggki20BofKFhEAQKdVAvtcf/0ndszhl0tAFr+qjgpGHM8NPtFs7FYWfcKSdzJoCt2ip
 aYYtEVbCs/xS3jKGPSItEhiOFEwiDT+xzfcuz4eXKwvdYHHYnq1iHCCvMCugMlA2nL+L63aEcL1
 YdzZEbLOUFq9QUyPYeiPX6C8EUE49PDyrhFZVhMO5xn71QrXfXZs1+xhVaD9nmSD8eG89er4Q9E
 Lh+jYFVUTwFj5Th0xgNVxan/aXEN4T340o0S+ExcQV914En5aPf5nastlA8M9iDg2vCR/yyxDL+
 KGkw6mJCUaORehJJRnQkv5/p2lCK9pITWiei8Fg453sn90xKcSi/KE7I+ZQ==
X-Received: by 2002:a05:622a:3c6:b0:4b2:f4e5:8eb1 with SMTP id
 d75a77b69052e-4e41eb14998mr12847871cf.55.1759263014280; 
 Tue, 30 Sep 2025 13:10:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkOHi3Cw4K9bHAEsEdXynVuyKt+2OCerw8APvAAWKM2bNTs+Ga5p28b3x5snKdH664Kuc9Vw==
X-Received: by 2002:a05:622a:3c6:b0:4b2:f4e5:8eb1 with SMTP id
 d75a77b69052e-4e41eb14998mr12847201cf.55.1759263013780; 
 Tue, 30 Sep 2025 13:10:13 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-586b0c1f9d4sm2610582e87.49.2025.09.30.13.10.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 13:10:12 -0700 (PDT)
Date: Tue, 30 Sep 2025 23:10:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, inki.dae@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
 alim.akhtar@samsung.com, jingoohan1@gmail.com, p.zabel@pengutronix.de,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 dianders@chromium.org, m.szyprowski@samsung.com,
 luca.ceresoli@bootlin.com, jani.nikula@intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v6 04/18] drm/bridge: Move legacy bridge driver out of
 imx directory for multi-platform use
Message-ID: <x2fpm4rb7ermb2tyjefdwwbvwvzt6uosd45ad7ku3tp3yqkmqc@bayzgz3jsqkp>
References: <20250930090920.131094-1-damon.ding@rock-chips.com>
 <20250930090920.131094-5-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930090920.131094-5-damon.ding@rock-chips.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MSBTYWx0ZWRfX+0KYmlSH55ba
 4OSEDhRSrY61YVkPX2z04/aVLqBpPicUICQlVjJN7MJkqyKMhno39cOLmNgQZaHsyPEm9V5BGgf
 gnVIxRcEMp36GahDQkSDNKqVMTwy2EUIAz+1OPmhM1d/G93Uk/2Dv1OUu8tlsVc4wAl2m5UJ0Ep
 kaS1t98lcuOHoQLIqCJGhZgK+LbHFjrpLYH9R0FIoB6+mpd3TJRWtsJO7J2vr9dDdcbrrIJKcsk
 l+hiedr+EkiW+0/tCfXLdr3eTF8TFTZdCH0yLTXnShtxJdY29v3mJn6tvsIcjuof16YZL2eaDM7
 fNTcEUQ6J81ugQ5vJbnLrmcA6ilZjp7zUwzrzY8fazy8i7Vtkg1eUb3XTZfEtKuJ8m6o3+mClwL
 rU1vQiQd7rEZxtTIdbLB8wt6iJMErw==
X-Proofpoint-GUID: ja-WsgiQ10TBSh9n50EkYNNfOPLNrNI2
X-Proofpoint-ORIG-GUID: ja-WsgiQ10TBSh9n50EkYNNfOPLNrNI2
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=68dc3927 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=_9FxbLpkiinsEApfcMMA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270041
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

On Tue, Sep 30, 2025 at 05:09:06PM +0800, Damon Ding wrote:
> As suggested by Dmitry, the DRM legacy bridge driver can be pulled
> out of imx/ subdir for multi-platform use. The driver is also renamed
> to make it more generic and suitable for platforms other than i.MX.
> 
> Additionally, a new API drm_bridge_is_legacy() is added to identify
> the legacy bridge, allowing specialized handling for such cases.

Why do you need special handling for it?

> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/bridge/Kconfig                | 10 ++
>  drivers/gpu/drm/bridge/Makefile               |  1 +
>  drivers/gpu/drm/bridge/imx/Kconfig            | 10 --
>  drivers/gpu/drm/bridge/imx/Makefile           |  1 -
>  .../gpu/drm/bridge/imx/imx-legacy-bridge.c    | 91 -----------------
>  drivers/gpu/drm/bridge/legacy-bridge.c        | 99 +++++++++++++++++++
>  drivers/gpu/drm/imx/ipuv3/Kconfig             |  4 +-
>  drivers/gpu/drm/imx/ipuv3/imx-ldb.c           |  6 +-
>  drivers/gpu/drm/imx/ipuv3/parallel-display.c  |  4 +-
>  include/drm/bridge/imx.h                      | 17 ----
>  include/drm/bridge/legacy-bridge.h            | 18 ++++
>  11 files changed, 135 insertions(+), 126 deletions(-)
>  delete mode 100644 drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c
>  create mode 100644 drivers/gpu/drm/bridge/legacy-bridge.c
>  delete mode 100644 include/drm/bridge/imx.h
>  create mode 100644 include/drm/bridge/legacy-bridge.h

I'm slightly concerned with the name of 'legacy drm bridge', It was fine
for 'i.MX legacy', but now it might be a bit of overkill. Maybe
something like drm_display_mode or drm_of_display_mode bridge?

-- 
With best wishes
Dmitry
