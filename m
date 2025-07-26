Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E41B127E9
	for <lists+dri-devel@lfdr.de>; Sat, 26 Jul 2025 02:15:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 563FB10E391;
	Sat, 26 Jul 2025 00:15:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YtUz99jy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D33BC10E391
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 00:15:09 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56Q0ALB5012101
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 00:15:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=EtYLr/SHernycwo/uLJDpSmW
 e/0fY0sBOUuxVsASxyo=; b=YtUz99jy4hrPtvY31jcLkeAuD8BdeWHNdkfy6UYV
 2VbnSKPbS8S6BXSvbrAQAKy5QvUUbO/LgJeBEqDWq9NyYHtpzohVGT17gDrFYl04
 1II9/temRvO2Q1rcgeRtwpKpWOnAgndJpLjCLXO66x4hwpbHreCCJMb1KVprJ3l7
 zG9Y85rggGeq8SUG8GZYjNAApYZV75MJdaS3oOk0NIHKIjZMmvLwSsC7454HuQzY
 IsOdPnVtrsEbkrKGFGZlVmgiYuBd5TThQYdcSogkC1pVDcf39gYdQLNoQiUF8JUZ
 2sDXjdq/EgTAQov5j/LtyoeiBlnOJseAWEs31sIrAD7LgA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484m7wg08m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 00:15:09 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-707205f0405so26478106d6.1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 17:15:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753488908; x=1754093708;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EtYLr/SHernycwo/uLJDpSmWe/0fY0sBOUuxVsASxyo=;
 b=GAgbmNxcrHnExk4LfI0WuQFaemelS3kbextZR6qQVUzkJaoutRISuAQBHbdn6Fpnum
 fdp0W59UMrroZuVD/5e5vuCO5nIE/fnY6b0gSxc1aluzT4HDLBXYp+J2Owe6C5X0RYgl
 UZAG2c0qpsmuYVtpcFlzoYlaWhNoshyCohOK9XGayH17b/miH2mNkliab2TcYqt7xOMi
 /c5NrJShpx1LMmL8QlqKkU4Us5ZAN+JNRKwa1vUQbOImsQkKf7n+m2kAdnNNALByJp/t
 AVQqBwT7FmZl/24G5VnTeExnrNs5SExt5dBiR9cOeD7Sg/8wZXN+CCLvB5C4HiQAlrIi
 +jjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXj6IoCUgiqpgb1K2lNJF37mUNczbxFTRQJNEaDtr1PQaWUSe8g03962bFOeq/RumHEKByZLOgzcbQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzwpJo7FlRWD+NMNFIiULU8tBFSOhJFwhs/6h1rVxbErRtSojY2
 R6WvlGwFbX6PznTRnC8/5N6wyN+MfPqF05/3ErZJGDsi3Zq/srkUkVlJKyE8haLFw1cx2NA61a5
 0xZBKEfTzGYx3uQPNQoTmWv26JLMbAOXRBl3rl7+pT5f8J2xRLV8KVe0cbQ5q2ejsoRyH4KQ=
X-Gm-Gg: ASbGncsobqf2BvFZHlfjBeNZhUg1YZHrXKLWxDJ+PNGGcy36IDPdHjObaysQXSXknhR
 QpuV/8m0z3wbkE7Z1aqkElQjAp5RaYeuaRsp6u8cLEGDwhtQ/PLrqMlooX6Kvqavv5y4IdEuGNN
 cjkLp0hHim7JycGFbXcxv/U9ydTLWRbhuPNfp8VXQsbUqh/6dauj66eMG0wZHFLIZLdwznUStB9
 P0teOLeFJbuzBNKuD9wnQrhf+4RVnxlN+Lu2qw3Hk5GzO6xfYbI1elFINoFx5sWPS/iY5g4vACA
 YVuvGwgw7XnDzdpyDTycDWH1CY5h6yQ7Z16gF0M7TlVUBlN2+hpyy7xCKhDmwaO6LdIt4LagMk7
 w6IjRSHt+Bt/CNurL4ApREMMa6cRLmza4RPO/rnb8cL0eP8VP04Kr
X-Received: by 2002:a05:6214:76d:b0:700:fe38:6bd8 with SMTP id
 6a1803df08f44-70720534e2fmr63158536d6.19.1753488907822; 
 Fri, 25 Jul 2025 17:15:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGA7feK2RtwupaGDRpvYsF4Rqy8R6n6ic8d0JslPO41UFKrxITuNTj+z6HJSoPo9gemAdVjoA==
X-Received: by 2002:a05:6214:76d:b0:700:fe38:6bd8 with SMTP id
 6a1803df08f44-70720534e2fmr63157946d6.19.1753488907363; 
 Fri, 25 Jul 2025 17:15:07 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b6316d99asm197710e87.31.2025.07.25.17.15.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jul 2025 17:15:05 -0700 (PDT)
Date: Sat, 26 Jul 2025 03:15:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, jingoohan1@gmail.com, inki.dae@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
 alim.akhtar@samsung.com, hjc@rock-chips.com, heiko@sntech.de,
 andy.yan@rock-chips.com, l.stach@pengutronix.de, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 05/14] drm/exynos: exynos_dp: Remove
 &exynos_dp_device.ptn_bridge
Message-ID: <fkfivnqxpecqpqlk66nadp2lpmr6jxgudraiyu7skebb5qhnpd@i2jga7s4gqeh>
References: <20250724080304.3572457-1-damon.ding@rock-chips.com>
 <20250724080304.3572457-6-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724080304.3572457-6-damon.ding@rock-chips.com>
X-Proofpoint-ORIG-GUID: FxB5Qj8uKmaKk_hV509BIeaU5ekGVeYE
X-Proofpoint-GUID: FxB5Qj8uKmaKk_hV509BIeaU5ekGVeYE
X-Authority-Analysis: v=2.4 cv=F4tXdrhN c=1 sm=1 tr=0 ts=68841e0d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=r8lg0YXQRZsV-nIv6pAA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDIwOCBTYWx0ZWRfX157fV4QTIUhI
 pFB7zs562xjliZTPzpSZLLf8h///lBa+TMztEqqLF5naWPAA+MB3xaiT0GZkTafp6Gkcmk3ua/L
 ZbKbSSkSa51MPu7HaCaBVTES79m10Snps0t6c7JZIuPXriwLbCHFcgKokYcvE/VNeIit0p2GewX
 APBJzpY7Ts8mFAtdpqQogkYnr4PCTQYrnOGZemgQacwHwqG1VaPwprLNCJMax3BnQHxBsm1x9PJ
 A3WjyLXuHYabz6G9XP71b2vyn8wxGvgjQhO66PVyOypzp7eSe3hz455yWIr2i2Xjowz0lsX275Q
 8XRgnbaP16fp6OPj4bzQqOP/sCgsmafIqsGxSa3Q+UJtVSZuQuOBIrlm6Ih1HsCt7jE4DPFHyCq
 Zj08UFylbQHyb8m4nqC06Ugx17/hoVc9V4JBMqKVuktWPKw5HVkPEUDRqOZnaFO197ViJlRf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_07,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=940 suspectscore=0 adultscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507250208
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

On Thu, Jul 24, 2025 at 04:02:55PM +0800, Damon Ding wrote:
> Use &analogix_dp_plat_data.bridge instead of &exynos_dp_device.ptn_bridge
> directly.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ------
> 
> Changes in v3:
> - Fix the typographical error for &dp->plat_data.bridge.
> ---
>  drivers/gpu/drm/exynos/exynos_dp.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
