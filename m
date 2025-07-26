Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 571A4B127E0
	for <lists+dri-devel@lfdr.de>; Sat, 26 Jul 2025 02:14:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C413610E0E6;
	Sat, 26 Jul 2025 00:14:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="c/Pg0FhZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75BF210E0E6
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 00:14:27 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56PEIIKQ016392
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 00:14:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=fVtEWHvXvUc+qGfFc/Ohqisr
 YtRe8clpA4PwpwpT79k=; b=c/Pg0FhZcPNLb4l+6MQw3GZodRoQJwCs+p0WPYs3
 E4EDW7a2S8tEI6QbhZK2/bP1jkrWrqQVZlxftkJ4GMKATN5tvnYAwM6GoWuhNcnz
 Pe2cjgsabm/NCyhtILNPbSqnlsBkRvUD172jyVcdFOyQw91a5gDmbjYlRbeDzQiK
 ZjunzAkUPbf3NVUlvbRY99+pn5IhRbCaAw6whsDUMAfsiM7nIT5hQ6VgC49Lw2fv
 vP7Tn7l5As55LNfW7T60MNTesDn7ByXWuSvES6zKUW+z4o+7mlEn9H+uQwEc52sG
 POS7p3tykbzveuFwypm8whHqLvxkRMAQIypWApAT34JXUg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484bjq1g6q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 00:14:26 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-706edda34f6so42817996d6.2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 17:14:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753488865; x=1754093665;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fVtEWHvXvUc+qGfFc/OhqisrYtRe8clpA4PwpwpT79k=;
 b=iBr1I/6TEcZasKBwetg551WjyywqBhZ9vfmf/iYfnU0+VASgSAtXz7RFsLvEKvnD7p
 wJ4ek5RClGLHDA61JtlwPKK1mB1VIRJXhiZWbQpRgusl1Mty7jGsaQdwuqv0HRXmq2zX
 N3Rd5RrxkvYF56MkL8hy3WFJKRTTyClRHgRUOPr35pyBfSzZEwRb+17e27vZbi8wAUrz
 Z1aw3Anqybr0M35+IM3fEdZWkqT3tMAX77h8zCSfV7OG+cIuqULaqafuFH82r8tU+rk6
 4l4gatzvX7osfCMkXtSs766bdIYHelIhpLf3YEd4aJ8YBxi5z45LtMVOy+yrUnuyXHcR
 Q4+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwZJ4hBX1JSHEYWuU1JhKi54YmaxIocXwHyZzRVS7tIr5H24WnPsKjI8VkXkeOW17IOaxuwDGb2Pk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxP4gg9McjZwQEZB6HbMJ7LJEaZhb7F4R9V+YHhcvrChcx29Hcd
 ABW7GjsorQOXGS7FtvRS1GgKm7sQj1QSmGeyntNIfSzxyd/z4yZsWnTVd41pFJbBVD9y85AI2YD
 Naoe+Cc3KEo1h/E/nfqsY5G9z8sgMehSeJ63UkXYP4w7DTO/7h/yxOqfLWQGndBqSF3ksHwY=
X-Gm-Gg: ASbGncvxPF1SRA4t+3uQ7op+bHbNfELIy8SlP/6fRy8daIbYQY1/G1mrHK1xca9VlAM
 Qc0ews42sRgRyJAKx73+0azQyx3AUfAirjCmvbDyjz8PMLdkrHcuOe5jRegTSTeS1e5InS6wSdQ
 QULK1gh/XAOP72g5Ho0WYkHOpOpaNaEwUZscn8Mry4egysOD0ybdsll1o3zohjn3WLHrKKcBJ7e
 gpafFgeBYKLOdCbUPihvImHiQkyFK2A80/VbvRh4Lc5a7RRh+UJzPFlOBmHfod069iVY8ylAydR
 DRKlDLv/9RPjP/mK0PZNLuDei14tgzZQTc/AzQGizftkv5GG55/rVjlD+1i5FGbFOvnvijTfc3V
 OK3ZlJFX1jn8P+9AlQxfVoHj0Yr4RJBJItb0RzArzQvm/d4RysOyO
X-Received: by 2002:a05:6214:519a:b0:702:afa1:b2d2 with SMTP id
 6a1803df08f44-70720519109mr48479056d6.4.1753488864848; 
 Fri, 25 Jul 2025 17:14:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8LMLBA6RRSlqAfWuEkNfbGOnD0mlhKsga/BysfgtQevo2p5uY8FU1lkB1NoIIU1STSJSTJw==
X-Received: by 2002:a05:6214:519a:b0:702:afa1:b2d2 with SMTP id
 6a1803df08f44-70720519109mr48478786d6.4.1753488864339; 
 Fri, 25 Jul 2025 17:14:24 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b63391f37sm190687e87.170.2025.07.25.17.14.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jul 2025 17:14:23 -0700 (PDT)
Date: Sat, 26 Jul 2025 03:14:21 +0300
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
Subject: Re: [PATCH v3 07/14] drm/bridge: analogix_dp: Remove redundant
 &analogix_dp_plat_data.skip_connector
Message-ID: <b7szam2wjxhbwnz2bpnejyppek5ag6vxibw7wmlwzdajc46dnv@xh5lc5bymg3d>
References: <20250724080304.3572457-1-damon.ding@rock-chips.com>
 <20250724080304.3572457-8-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724080304.3572457-8-damon.ding@rock-chips.com>
X-Proofpoint-ORIG-GUID: HllkBZEmE31ZhJ3OgsRAsbqweeCiufIK
X-Proofpoint-GUID: HllkBZEmE31ZhJ3OgsRAsbqweeCiufIK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDIwOCBTYWx0ZWRfX+AwHlfWIPH4F
 Znti7HaMKitGuXqsuVrxwNcQg0qXqJfa+d/lVGqGm40TYGBP3JirgLEIf+7n8W+UZoHb7pTKXMB
 eQEQyHk0BY1bcB0aWFfH5osXntekhuHkjyjWBltMKGSgEhCXX7lAmxMatiBKeDlEFj8bWgxHtvt
 M2nWWvu+aFJEy4/nrlNba++9MUFsJrtZgmn+1JkH4Z6AFvtBkUb8ITb1LwwihESR+PHnSA6rM3N
 e49IHebW+GBbrpmC2uCnfxRfP5RTAIEovTnLIzfpbeO36ZwV/Kbk2PCwagCL7k7g7EbchQzpywJ
 WeqIGSkuXh4U5HZlFtugFKEp5rD1icySPN/n37Lc8Qnu+rNIMZ790Yat1jxHdl+iQ8+/eN7UWAp
 NWYNLWyNOAx5qUCfWrlQ5gBkM+Qi3Fc5XSRHeB89iikhh5gh4qn8r0/M+lfMFyD7hJdo3d5H
X-Authority-Analysis: v=2.4 cv=KLlaDEFo c=1 sm=1 tr=0 ts=68841de2 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=r8lg0YXQRZsV-nIv6pAA:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_07,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0 mlxscore=0
 phishscore=0 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
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

On Thu, Jul 24, 2025 at 04:02:57PM +0800, Damon Ding wrote:
> The &analogix_dp_plat_data.skip_connector related check can be replaced
> by &analogix_dp_plat_data.bridge.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ------
> 
> Changes in v3:
> - Squash the Exynos side commit and the Analogix side commit together.
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 2 +-
>  drivers/gpu/drm/exynos/exynos_dp.c                 | 1 -
>  include/drm/bridge/analogix_dp.h                   | 1 -
>  3 files changed, 1 insertion(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
