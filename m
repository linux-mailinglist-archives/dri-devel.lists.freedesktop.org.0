Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 984FEA60879
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 06:49:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EFB110E2D3;
	Fri, 14 Mar 2025 05:49:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="C27++6qS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86C4A10E1F8
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 05:49:08 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DMR1sE009124
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 05:49:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ng9Qb4B1fV7wMUS/Fegxw9lJ
 lSAvas1NhJi1CeK+QPE=; b=C27++6qSV3Dha1tfeSHu5s/C5uPdzytXL5yWhT5e
 xqg3fwYkm5k/aUqcdvI9SDlWLHaDG+URLfZh3MSD/bV6cCrecmjhVQFvk3JxXZ35
 MQpnh1PkotoBSGK2g8ffKqXwCXTxBRSc7GgrJjqY0zSBI1o6dkWRUJ3yxUYYLD7R
 QH4PMgvlIJ5ul52YZV4+u+VGCNhrnZEw1Egj+6R63O8S8PUOX6ZiHYiv5RBoqA3O
 kWfxpBsojfeN0tKTBGk9FXZ5FDOTFk0dNsOnUHUep1H/5lSpZySpckTszE/D1wiD
 8ShP2KHeK9zEFHg/2v3NPr7TFxKvkH0bQhVhuGChUSzuTA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2rg4ws-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 05:49:06 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-47682f9e7b9so29687181cf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 22:49:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741931346; x=1742536146;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ng9Qb4B1fV7wMUS/Fegxw9lJlSAvas1NhJi1CeK+QPE=;
 b=qVhqkO2tgAw/vkPa1tUX5dgdxwl9ed7vd4ZbyZiKKsnnkE+TZp4wbTIyg1nYyKM8zJ
 /baha3pnW7LvF3Ro7GyaMcCmHgXVgoZZXV+KgJfZpEiKR2/noXYMKQ4fo3Lv612Rlho8
 f4cI0rRtKeFB4H35G16t633bzwPjXvj7CiySdHcLMPyiAW82Ef/AYuiJ2jh3KQeKI1WK
 vZNw2M6UdMcbxXAZKeCLzRsnX4Oc/rQEGWE2Y/SDpqXPnIW7O+/6zHrwhMrBWAAewniW
 LHJ0kZx3YGY3LssAcx1kaO9DKTGnaApvG++joqOFfaaI3dvLNG3ivfEcdEQkmLq/4rRE
 w1uA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0yQPeDPGaLn5v8pyavNR5zKdHYO++uTk6DZj3iCNPKcY5PArwe0z0Wqn8YCezD4XD2yhIBm58bUc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJdDLNUxaGpc9YO6KinDE+JL3KXEFtgdq84jN5eEz5QaNNnOEl
 +ADRuNdok1PgutGz3koUwz005mgS2qLw5wrG1CwfJ2AbkIlTFAIY3DtQeXxTSi7ofmfnQ5+qsxv
 1N6yWj82hhR+l8Hvhv++S6CujpxnKm2mPGxP52TQ3Bm8th2r9ktp4Wz1SqGWF5hAe7cs=
X-Gm-Gg: ASbGncvr4f/fZIeUvJo7kP8dKpWCClrcMJh8/RVvlJSMORS8QDyRZIIPOd3O8rakmEi
 e0B8yhj3Lq7OW1jrQUDyXX1A0PRxq0qcK4IjOn6w67OhNWuoq6/8QmSaNplQCJnYbS7GApitgh0
 cjNOgB7Fpd4yeqoRExFnI01oktyPkD5Xu66Rh/mk58GO+Gjsx/XpCDB+u56QUky2sWYEuFFZNX5
 oCywbtmBdFadn8S7Wj8kjAIvde89FC1y6pugFlNp60fpsXlcL1SFoojnji8wJs9VJFgRuwiYxQl
 kT/mUzPlV8d4C+t4YOwVmBJ0kRLfnB0tvrRF4StQ+MBJo6DIBRkzMS6V6xF1BsriZte61d2r0H9
 Uv44=
X-Received: by 2002:a05:622a:47cb:b0:474:fc9b:d2a7 with SMTP id
 d75a77b69052e-476c8133b81mr17260391cf.6.1741931346220; 
 Thu, 13 Mar 2025 22:49:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqaDuA1FBvmdKts7klvyEIGEfWbLEm5EW/85XxwOOo/ydodyCNvd070ViOrwQltMOmPf/xaQ==
X-Received: by 2002:a05:622a:47cb:b0:474:fc9b:d2a7 with SMTP id
 d75a77b69052e-476c8133b81mr17260301cf.6.1741931345923; 
 Thu, 13 Mar 2025 22:49:05 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba864e9csm419973e87.121.2025.03.13.22.49.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 22:49:05 -0700 (PDT)
Date: Fri, 14 Mar 2025 07:49:02 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andy Yan <andyshrk@163.com>
Cc: lumag@kernel.org, mripard@kernel.org, neil.armstrong@linaro.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org,
 jani.nikula@intel.com, lyude@redhat.com, jonathanh@nvidia.com,
 thierry.reding@gmail.com, victor.liu@nxp.com, rfoss@kernel.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH 1/5] drm/dp: Pull drm_dp_link_power_up/down from Tegra to
 common drm_dp_helper
Message-ID: <wtvvf4imkjcj45ti3qlhoz4ss6hksq5fh4lnpbi4srpdj4neg4@b722uwg2owva>
References: <20250314033856.538352-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314033856.538352-1-andyshrk@163.com>
X-Authority-Analysis: v=2.4 cv=D6NHKuRj c=1 sm=1 tr=0 ts=67d3c353 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=e5mUnYsNAAAA:8 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8
 a=KVUS2d8O-r6a4myYyqgA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=Vxmtnl_E_bksehYqCbjh:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: R796O2pe6kApGV85YNTwp7ECQUISVQ_R
X-Proofpoint-ORIG-GUID: R796O2pe6kApGV85YNTwp7ECQUISVQ_R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_02,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 malwarescore=0 mlxlogscore=835 clxscore=1011 impostorscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140044
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

On Fri, Mar 14, 2025 at 11:38:40AM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> The helper functions drm_dp_link_power_up/down were moved to Tegra
> DRM at 2019[0].

Just mention commit here like "in the commit 9a42c7c647a9 ("drm/tegra:
Move drm_dp_link helpers to Tegra DRM")"

> 
> Now since more and more users are duplicating the same code in their
> own drivers, it's time to make them as DRM DP common helpers again.
> 
> [0]https://patchwork.freedesktop.org/patch/336850/?series=68031&rev=3

I'd say, drop it, please.

With the commit message fixed:


Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---
> 
>  drivers/gpu/drm/display/drm_dp_helper.c | 69 +++++++++++++++++++++++++
>  drivers/gpu/drm/tegra/dp.c              | 67 ------------------------
>  drivers/gpu/drm/tegra/dp.h              |  2 -
>  drivers/gpu/drm/tegra/sor.c             |  4 +-
>  include/drm/display/drm_dp_helper.h     |  2 +
>  5 files changed, 73 insertions(+), 71 deletions(-)
> 
-- 
With best wishes
Dmitry
