Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3523CB12B53
	for <lists+dri-devel@lfdr.de>; Sat, 26 Jul 2025 18:05:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9032E10E286;
	Sat, 26 Jul 2025 16:05:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JjhTd7U4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D93CD10E286
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 16:05:27 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56QB0sX6018523
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 16:05:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=OXCJSxoReTk8aiWjW4riny+3
 jOKSrw2PoehE9U+YV9g=; b=JjhTd7U4iMj86s7iNMFA2H2Wh5rj2XM+odGNkPu7
 E5MQ83XolqzPGDoctc9mKOdxZKwglV0KoVv55grDJnEJUksHTKbX+hB6weEzdBhU
 AkyZWWHxPKDtD148HbsJfhkmJCXwZiWwCQXRxzIYpbMwMiP8MSubaljJ+ChDMVVc
 /+iiG7BQ3O9qNrRqVPFP0bnTS+YKUmVnISjtOYzn4zVjkFlcxf8Syfj6Idi6L0Kf
 G3caJ2o4d4Om8EnlGT6UKzen2WuxKio50K/q4dpumjiPecM/6C4SLA1L7/RcXiaP
 t/6ZaJaBAkGpLK1bhgMfIlD7736GezM3cWLTwtZP/6XTPw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484p1a8wj9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 16:05:26 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-7073cd24febso361086d6.0
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 09:05:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753545926; x=1754150726;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OXCJSxoReTk8aiWjW4riny+3jOKSrw2PoehE9U+YV9g=;
 b=bpgn4Z1XA19wdQAov2YI1yeVl8TsNQwdNSQzT+9QgwTuKp6KzyvnYryCBLV6E6Y4db
 b2HZIb5gYdRyytttuK+bf28V+q3+ZChcz1l5PBPIBYk3KLWEH0HCiNAT/mLQAWv3UG13
 ZfUymaRDTxsYCuOfxVdvydgyheHatFDvCaDYC/7yFg0fE9/GC3EhbFYP7GD+4U+OrQxq
 P6SsR+gPaRdRpibGnulx+lbaDFi2EwEu4lxFs9vVi9D/LUhB7mrRSmJnvF2muWgY5AH+
 yPk1EjJBgZ5ISS+nE+s51XwmBHHBQKID+V6+hbuTEYZWpUlRzPlhxfPi1Sh4jjSfbbJr
 pJkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKIVCGDJ4GsjCFeUUlKwiB6s9LXdDh7RWJW/sG9z223JjkGC4bpFSQMGk36BjtBLpTF7Ja9DAFpSA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFkaLLNeRm0izvYJMLaktbYPPMTI0N7u6QUOI8I9kjdgR9StXh
 CZ/Qpe9D8mKVNfH+9xekby6ArsjWHiHk23emFnOMX+FU9n/t/W2s4CJ2ps9+m7mtMjevsyM8Kvt
 eaPOHz1DMj8NotGr7uwyXxnQfHweEdFQ3Ai+YBq+pYuAIvNhtbQWAHlilDjvi1W5bu+Fo0F8=
X-Gm-Gg: ASbGnctVb67DkVsII9muWnPlyWe7nvTRl8+BWTnnFrA+eGkzcqR7EpCUxWinZfknRXv
 ynzzkkJc2z6se7GFmLr/Y+xXRL2NTqPC3o8PUqbs82VPVIZtPR7ag+iRCmNeZ+1xKKds4jazLf/
 bYrhnkSrs7chi703mf3a4cJZXTCkt+oAfFDKjEzaeA1SyJtBATtl+hBYndNVZFpgdNH27ewxFKi
 nPcUQEeXPajKv4vynDoqlk9LJsKaPOMwCAshlmiZVqY/3Xk3/hhrNYMSRBEdthm2HShnbETFr3P
 nohZp4cT89aSwNyKHPBSfpCLdrQmqoLoM5kxEpfbTGnu3uu8WN+k0N0VfncB1sBP3CF4c8rjl/j
 HFzZBZTXtNtZelTnNvmwNpft4PTHSwVn/iZy40DnAMtG3MuAvPn8V
X-Received: by 2002:a0c:f00c:0:b0:707:2390:2968 with SMTP id
 6a1803df08f44-70723902d7dmr68085576d6.16.1753545925851; 
 Sat, 26 Jul 2025 09:05:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtnleMjXXn50zHpTopz+EP+s9ry6QJ/sF5nQS8I6PAzpXZgZQCwe8doY8ASsjM8BU2ru14mQ==
X-Received: by 2002:a0c:f00c:0:b0:707:2390:2968 with SMTP id
 6a1803df08f44-70723902d7dmr68085106d6.16.1753545925175; 
 Sat, 26 Jul 2025 09:05:25 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-331f407aab0sm4870891fa.19.2025.07.26.09.05.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Jul 2025 09:05:24 -0700 (PDT)
Date: Sat, 26 Jul 2025 19:05:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 kong.kongxinwei@hisilicon.com, liangjian010@huawei.com,
 chenjianmin@huawei.com, fengsheng5@huawei.com, libaihan@huawei.com,
 shenjian15@huawei.com, shaojijie@huawei.com,
 jani.nikula@linux.intel.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 drm-dp 10/11] drm/hisilicon/hibmc: adapting
 modification for the former commit
Message-ID: <oxwapypy7ttxf7geysnatnowlhidioxbhfyvt5ljrhw4tjmbsr@zycqgbwmwqbc>
References: <20250718065125.2892404-1-shiyongbang@huawei.com>
 <20250718065125.2892404-11-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718065125.2892404-11-shiyongbang@huawei.com>
X-Proofpoint-ORIG-GUID: 9tFdsE_nv074rDjx7k5RMDhR4HG1iSJZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI2MDE0MSBTYWx0ZWRfX7Bncf+DhlMNY
 WjycFc/TEoIUg54gHnZBuE3oo5GLPKX/+AbywEgrhHcbs25HJK4xde8F7WCOp5L2fUbNKFqMuHP
 7Ffv8WGGvcW/UqUD13xnsU7faffkzTYqmhJG/NADmiilbOwcDzaLWWrdOn2NiQFPxF31Sy41bgI
 uyNcOfquoC1Xh3B/145zr0zp/P1pcfC76I1XbP8ENqfCT+1BYV009iCMagtDVFluL5zVukbCpHx
 QJW+CovIwTkOG06DF3gxLsUXGNVEisf5qNeB36Xb1lsOMmt+ytLTde0JdOgD+FZXy1KZjIw4rmp
 n8vn2+Obiv69JbP4cfd0RyZKsN2tRo/s3UJR1gXraLhe/Zg+EH1tu7Njn3oMr4cDe6klc1yOH4f
 ta4KLIuhhxiiml5NNELiPKEeqTb/k/t+EniMcnEOoIf8wrtCrFccBeCxGO9mV9PmBSUG4E4V
X-Proofpoint-GUID: 9tFdsE_nv074rDjx7k5RMDhR4HG1iSJZ
X-Authority-Analysis: v=2.4 cv=KtNN2XWN c=1 sm=1 tr=0 ts=6884fcc6 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=i0EeH86SAAAA:8 a=fbmvg8OnJgpNs0uOg7cA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-26_04,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507260141
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

On Fri, Jul 18, 2025 at 02:51:24PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> Add colorbar disable operation before reset chontroller, to make sure
> colorbar status is clear in the DP init, so if rmmod the driver and the
> previous colorbar configuration will not affect the next time insmod the
> driver.

In this one and in the next one please fix commit subjects. Can't parse
them.

> 
> Fixes: 3c7623fb5bb6 ("drm/hisilicon/hibmc: Enable this hot plug detect of irq feature")
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
> ChangeLog:
> v2 -> v3:
>   - fix the issue commit ID, suggested by Dmitry Baryshkov.
>   - split into 2 commits, suggested by Dmitry Baryshkov.
>   - add more comments in commit log, suggested by Dmitry Baryshkov.
> ---
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> index 36daf7542d40..85499f1ace8b 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> @@ -180,6 +180,8 @@ int hibmc_dp_hw_init(struct hibmc_dp *dp)
>  	/* int init */
>  	writel(0, dp_dev->base + HIBMC_DP_INTR_ENABLE);
>  	writel(HIBMC_DP_INT_RST, dp_dev->base + HIBMC_DP_INTR_ORIGINAL_STATUS);
> +	/* clr colorbar */
> +	writel(0, dp_dev->base + HIBMC_DP_COLOR_BAR_CTRL);
>  	/* rst */
>  	writel(0, dp_dev->base + HIBMC_DP_DPTX_RST_CTRL);
>  	usleep_range(30, 50);
> -- 
> 2.33.0
> 

-- 
With best wishes
Dmitry
