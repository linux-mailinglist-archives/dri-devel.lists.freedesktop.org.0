Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F06F0AEC948
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jun 2025 19:09:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 229A810E1B8;
	Sat, 28 Jun 2025 17:09:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="O6bHiIgq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CB2D10E1B8
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 17:09:45 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55SCUNce027985
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 17:09:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=6US+EJaR8yR+YkzfpeYsyra0
 rE84+WUQ0+NCcDsAi9Q=; b=O6bHiIgq2fwr3Elfs+3TwT90SWjnN59HwVAPbFBA
 8z7Nvp58lYcuU+Qb0aenfz/ZGcEhdALZoGif3UbEfG2CNTob8jmLEAEy7tRQa5vn
 lC0DScXfGYuogj9rufVIGjCg90djUN9/l46tynNTvVtKpZyrTECSuDcS0wsowtbk
 FsftsNySl+LGATaYDzLxbKCt6Dy+K6O1gw4qrKD56yFEvABZD9RgfaoQShRW4w08
 xjnKptla2+za7wlX5bZP+YOKstTll/tz0LdHLOnowzKMs3KW7SsOvPPjUv9EnAOC
 nQNnn7SRdljlJ6wnxr/CvGS2rSYVlrfAPVBqF6hVjpAQVw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j95hrvx5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 17:09:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7caee990721so233166385a.1
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 10:09:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751130583; x=1751735383;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6US+EJaR8yR+YkzfpeYsyra0rE84+WUQ0+NCcDsAi9Q=;
 b=L5GsIwBFvzG6n0UI6Jso/b59vTKPOaq1Pt1sxVsGiR+4aaY3Er/7+IxZ4+F8DWT6bD
 el3mD6Mz5Uj7r3VazYj0T8RFXgzhrpwlvOr5wpL5oXNkzvvhJKn7A56LLb3J9TyjRbAR
 Ol4Erys4OAj8cxpbQB98yOgPuB9rTqaY+50eqxkilHoJqUwk8oqh7Z4rheg66lj9FB3r
 GwAbx1O9NBUpg83LbHQJIgMbklXGPMnPSm0JrLi0WSf1rYR74cE9pVekKzXz2sza5PxS
 XTh/XG/tVfO/N4+fLCRRIjRRcY2FYrRZEbotaEGeAaKBI2ZgIoMrdoyEyTr6GctlhCAi
 YJVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMktXbbxYZB7DwJ76bdcY+PVwtoZtYJrFlhDcYo3zy8Oox1uBzwqqRnXyZub+0Qmzo7z7sg5iaZI4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJA7R6jRLb4/X00X5ZVrRvgi7F5K+cEl5dnEMVRBoLEQ7UVIEE
 4qvPq/7u0OdopTS+5Fe3/Uj9a5a4OIDjtYnYlMRDz95HBgqwMfK4H+L9khCohyOrnkD+WL/WvKO
 7Vcp63oAoX9AB/mQ2jtGumV5Jtpbqo9L28JRRxvB9ZdKD3O81GUnpChlKMvVHpWFFHPzVRU0=
X-Gm-Gg: ASbGncs9FsvBih/cYylmPo6CBTkDubSS7JH1N4FtOuwsXp461uoSXege3GS8NHayzD/
 tC1O1Zywt6ai43o6WGoNOTkPuY5Nh5F3xNaudI3klA+s7QkcVpxXCFvBfafEpH0oc5HrmCWg1s/
 LZmgWJ2nrsbciiBhEOoHpun4A0nUKiYJaGcuXj2QPmVhgEtOcP+lCJtX953dxQYTf3nWXyJxPBz
 7IKKy5xvjGp4ydmUxw3xC6TvA0LGHVk0HGntmdg2Vda49NNt0/VjrsZ/WhNR85/ttsykEKvhPQs
 LWR92xLH0/h1/dDsvSuAv3gQfq0O0RYrv7Z0m8rUxs1R1eYMvo2SrRyVK6eMlN8Xe59qvhGQe/N
 zHXt2cbm/syI+cwjBOPs/sxIqKhpdEhbE7og=
X-Received: by 2002:a05:620a:44d0:b0:7d3:8566:e9ad with SMTP id
 af79cd13be357-7d4439695a5mr965191485a.34.1751130583116; 
 Sat, 28 Jun 2025 10:09:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5kViBSwBV8r4Xa07AexwZGpZhjpX9kjjGS7O3ofngQegaDVum9jJcfIqiTO/qeUpNMAsb3g==
X-Received: by 2002:a05:620a:44d0:b0:7d3:8566:e9ad with SMTP id
 af79cd13be357-7d4439695a5mr965186085a.34.1751130582432; 
 Sat, 28 Jun 2025 10:09:42 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5550b2f1c04sm849381e87.249.2025.06.28.10.09.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Jun 2025 10:09:41 -0700 (PDT)
Date: Sat, 28 Jun 2025 20:09:39 +0300
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
Subject: Re: [PATCH v2 drm-dp 10/10] drm/hisilicon/hibmc: adapting
 modification for the former commit
Message-ID: <x2a43gcouchtsuvo4kzh2p4ywmm46pyfsqtt5vczabokcklkcr@rh4ceyhhfeis>
References: <20250620093104.2016196-1-shiyongbang@huawei.com>
 <20250620093104.2016196-11-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620093104.2016196-11-shiyongbang@huawei.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDE0MyBTYWx0ZWRfXwGGt0gstjiRX
 ewCV5It3RaQninM2Wh3nfUV1hIwcIQXI6AU9QJ+oT227oyvCshL2Ej0Ntg9+lueKV43hyQTgdqj
 HtqekTeNX8FvGwauSW2393kprr2OuegNPkEIoDsJnjbjDNJ011MZw5lgZjShzv/fuaHNYiScp7G
 ygaFDE7xOoeAbRm6i8MeKJur9Ckt1xJ09i+6GqlebxB0foVfJ4SrDDw+/3hobjAOXwDGlv+x2Xx
 7AJYpvWFBl4mx1cC5OTEjJrJCLt49iDarvK0jj0MkqKHVdv+eA0xoWTPzdhXvocPyJQs9Gf3Chc
 H3U7Ad0TGY9tuozXgOaLV5sHDSI7fMX7eNf+x+DW3L4cEkanA+besYoAaMcAM4lvSoCLWpu1kse
 o1MfotveFw0z0h5t6mSJAxb3P+0uE1YWknE49UscMFFl/ZGHOSuZbZDNfmnvYB2LfJxci6yz
X-Proofpoint-ORIG-GUID: cf8FTLwige641rwP7_hH0mwoyLg5yC_E
X-Authority-Analysis: v=2.4 cv=EuHSrTcA c=1 sm=1 tr=0 ts=686021d8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=i0EeH86SAAAA:8 a=ETqUBGNnfF6ie6NgWnwA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: cf8FTLwige641rwP7_hH0mwoyLg5yC_E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506280143
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

On Fri, Jun 20, 2025 at 05:31:04PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> Add colorbar disable operation and move hdcp opreation behind the reset
> controller operation.

Two items => two commits
You missed the 'why' part of the commit message.

> 
> Fixes: 3c7623fb5bb6 ("drm/hisilicon/hibmc: Enable this hot plug detect of irq feature")
> Fixes: 94ee73ee3020 ("drm/hisilicon/hibmc: add dp hw moduel in hibmc driver")

Which one is wrong?

> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
> ChangeLog:
> v1 -> v2:
>   - separate the patch, suggested by Dmitry Baryshkov.
> ---
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> index edb7539d830e..bb19636caf77 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> @@ -172,15 +172,17 @@ int hibmc_dp_hw_init(struct hibmc_dp *dp)
>  	dp_dev->link.cap.lanes = 0x2;
>  	dp_dev->link.cap.link_rate = DP_LINK_BW_8_1;
>  
> -	/* hdcp data */
> -	writel(HIBMC_DP_HDCP, dp_dev->base + HIBMC_DP_HDCP_CFG);
>  	/* int init */
>  	writel(0, dp_dev->base + HIBMC_DP_INTR_ENABLE);
>  	writel(HIBMC_DP_INT_RST, dp_dev->base + HIBMC_DP_INTR_ORIGINAL_STATUS);
> +	/* clr colorbar */
> +	writel(0, dp_dev->base + HIBMC_DP_COLOR_BAR_CTRL);
>  	/* rst */
>  	writel(0, dp_dev->base + HIBMC_DP_DPTX_RST_CTRL);
>  	usleep_range(30, 50);
>  	writel(HIBMC_DP_DPTX_RST, dp_dev->base + HIBMC_DP_DPTX_RST_CTRL);
> +	/* hdcp data */
> +	writel(HIBMC_DP_HDCP, dp_dev->base + HIBMC_DP_HDCP_CFG);
>  	/* clock enable */
>  	writel(HIBMC_DP_CLK_EN, dp_dev->base + HIBMC_DP_DPTX_CLK_CTRL);
>  
> -- 
> 2.33.0
> 

-- 
With best wishes
Dmitry
