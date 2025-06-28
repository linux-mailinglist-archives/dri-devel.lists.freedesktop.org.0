Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 734A9AEC93F
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jun 2025 19:09:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F3C210E069;
	Sat, 28 Jun 2025 17:09:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="o9tfWfl9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 272AC10E069
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 17:09:02 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55S6O6Td020578
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 17:09:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=gdjl5vNLCCbwSx5ZLm6cDeOg
 F/cKFeAqNrRnmk0EQTM=; b=o9tfWfl9tiMmry4+V3cOA7ckXvKfAkvG3qMWfWM4
 ssRkqeqv6lEqu0D7ZLk7MMNIACQiY9iifmaz2ZCOkUHrZBsj1b+IYnfi00/4xZ8t
 cCVjSH+k3tJ9i0noUDlM8iLJyyg7abNnBh6Bxc+L1DvhGpr2ci7Y+ugE0bzNpfPI
 X59W3Zrq3ENAbp4bYhLyqeBZPZ7ZZNSg8O5KUxfEC5v2f8ZVgGN3F0ShRs3YQeOE
 tXApBlMrohniMr1m/flVhMucjtXAkcC5TrarSJOy3qVSWR97whKEKnNWlDMK64/Y
 4UeA6ouSwyfujSkrSwD1cY57HY2V15zVjHAJ1duEtG89VA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7d9s0f2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 17:09:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7d44d773e23so223765985a.3
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 10:09:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751130540; x=1751735340;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gdjl5vNLCCbwSx5ZLm6cDeOgF/cKFeAqNrRnmk0EQTM=;
 b=IDJ7u3BKNL9s2BazeSdZQaIqmwszIh29/TzQMfCfPz8WuEZZOusXjrvx6KbwgEFqNE
 9AeLiZm+stDweMDpoH9oxrgYSWnQKXRLPCz0kMd9K4HjLVRUokHjCyavB1CSh9ey754y
 Fb6XUBR+mP6a6N6rvFRf72EctdTgcVSNGXDCuh3IU4Oum+5c2r/wd46mqzL4gwBg+gme
 w8ZPO/b0JJQc8V4wwkB9+Q2qhKXOQ5u9H2oId41ATfTXxtkn/Cq9hfWjsX67jTtOaJLz
 hizqGzuxoDnZPBS8++pdTlsAOL+c9M79DY/tcwSopksyVOJG+liNvfn+VNGnsRmqcv/I
 rlbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZ7GLgAhMxyxGQ3yhngv7Vgt18CkKZZOTnbySZpWTuNMCiq8OXlUWEJVqTUE8Kvk+/ntKpyG5131I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyyglpxgSgWJJJ+zZQpBZ+lu7cMkrOnijdrnvMkxxQhOD0KtCPH
 zLdziGrZrQJK+HD0DL+FO/uZ42yG3nD9n/XOUI4Ny4SS/EErRdwEE5X+I2filvaNzBGQF12z4LV
 XxN/A19E1TCHnv2eeGPjyR/KwdrjFJPbzmVzah82Cn2GZTspHxsCiuAtBhW36mK0+HFtrYR4=
X-Gm-Gg: ASbGncvIoZHebrY5CDhjCDj1FbseMKsujFSJ+coixVC9QMKVDg8XNqLtDmm8Jf8u5df
 6zIv7KngjocgrRbzmx5uCZcglA0uIXzetJbmGeqEInE3oAzkKyXvrMq8Su1zxGkduf+CKQO6oW0
 fHJX6kiFp4K6sdSCFbZrkHD6T7vrPjoyAv2JH7Gj5bPzOk+Ecr2RR3Ai03GjzFnolsPlKcu7XyL
 8VLicTeLr0RCN/YqyIcCcAE7qQKx/ixAiPkfhKB+XWdRNoUrQAKK9yCA/190iqXVOSBa94r+ovT
 6pXaHWGCW0pcdjuNrUC4s8NjtRFnYge71SDLPjDbDA6Z5L3AiQQDgx/qulr1IHuz0xXOfY7CHn+
 nZiKq2xCxv4F+Mk/qw2zZ2QyOfCqnaO5Ei9s=
X-Received: by 2002:a05:620a:7002:b0:7d3:914b:abe8 with SMTP id
 af79cd13be357-7d44396981dmr1335221285a.36.1751130540419; 
 Sat, 28 Jun 2025 10:09:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnD8yJ9nkkhciALYWFjgVZUgGFiR0ax/RX5IipaCBe3GQoqrbfWs1U67wZmEYzLBUk2EFPDw==
X-Received: by 2002:a05:620a:7002:b0:7d3:914b:abe8 with SMTP id
 af79cd13be357-7d44396981dmr1335215985a.36.1751130539978; 
 Sat, 28 Jun 2025 10:08:59 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5550b2d7a54sm868102e87.201.2025.06.28.10.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Jun 2025 10:08:59 -0700 (PDT)
Date: Sat, 28 Jun 2025 20:08:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 kong.kongxinwei@hisilicon.com, liangjian010@huawei.com,
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com,
 shenjian15@huawei.com, shaojijie@huawei.com,
 jani.nikula@linux.intel.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 drm-dp 09/10] drm/hisilicon/hibmc: fix no showing
 problem with loading hibmc manually
Message-ID: <xulg22zaxstsp6jyalonxapqpj3wj4raacnvsv5jpuaebxn4kk@ukmuxgw7ubpe>
References: <20250620093104.2016196-1-shiyongbang@huawei.com>
 <20250620093104.2016196-10-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620093104.2016196-10-shiyongbang@huawei.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDE0MyBTYWx0ZWRfX5F6xyJsPHhcB
 6NWTte6Itkv4no3Bt7EuWU4BCXc2O2yatVcwm3bQovYJSQM1K3CQqHZIYj2IduVt/NryDkWHz7b
 kSio4G7VoUo9/ZzF8aatWm/GxNOkFRNDX9cDrO8cun5u7L8C7VkRz8z3DOBmgtDci3YzNgrQCwt
 I2izLR03bkTTCZ/1wVe537j13mmUnke31rmdspvAu4qlui10tW7KLemaQ0tpg/OOzFpkWU59D00
 m2Kl0h3jhk9XZzf9lX17KAI+gi7LogRAiSFBfzssiMw2sCs4up2RF2MAO31ShY8nAmn/z+1docW
 PSGbicItEhFONKjFR0hEe3EtqWOBmjFBfLRqGh3FvsnvROWxoYTSTBYFLm56NS8KnV7c/NNWCyz
 IOlNw9bDSGX0n6EUS1p7b/UV4Ynh/2rkTPoBdkF8p7AuBL5V9/ygn/N388Pu7rEl6iamWrBG
X-Proofpoint-GUID: nMUYFv4sxDnEb_Tm47pR20VBaUG0Cym2
X-Authority-Analysis: v=2.4 cv=RrbFLDmK c=1 sm=1 tr=0 ts=686021ad cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=i0EeH86SAAAA:8 a=rqlEdgz-OenaAeYW8xcA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: nMUYFv4sxDnEb_Tm47pR20VBaUG0Cym2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 adultscore=0 clxscore=1015 suspectscore=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506280143
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

On Fri, Jun 20, 2025 at 05:31:03PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> When using command rmmod and insmod, there is no showing in second time
> insmoding. Because DP controller won't send HPD signals, if connection
> doesn't change or controller isn't reset. So add reset before unreset
> in hibmc_dp_hw_init().
> 
> Fixes: 3c7623fb5bb6 ("drm/hisilicon/hibmc: Enable this hot plug detect of irq feature")
> Fixes: 94ee73ee3020 ("drm/hisilicon/hibmc: add dp hw moduel in hibmc driver")

So, which one had the issue?

> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
> ChangeLog:
> v1 -> v2:
>   - fix the tag, suggested by Dmitry Baryshkov.
>   - separate the patch, suggested by Dmitry Baryshkov.
> ---
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> index 5b1f943b601c..edb7539d830e 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> @@ -178,6 +178,8 @@ int hibmc_dp_hw_init(struct hibmc_dp *dp)
>  	writel(0, dp_dev->base + HIBMC_DP_INTR_ENABLE);
>  	writel(HIBMC_DP_INT_RST, dp_dev->base + HIBMC_DP_INTR_ORIGINAL_STATUS);
>  	/* rst */
> +	writel(0, dp_dev->base + HIBMC_DP_DPTX_RST_CTRL);
> +	usleep_range(30, 50);
>  	writel(HIBMC_DP_DPTX_RST, dp_dev->base + HIBMC_DP_DPTX_RST_CTRL);
>  	/* clock enable */
>  	writel(HIBMC_DP_CLK_EN, dp_dev->base + HIBMC_DP_DPTX_CLK_CTRL);
> -- 
> 2.33.0
> 

-- 
With best wishes
Dmitry
