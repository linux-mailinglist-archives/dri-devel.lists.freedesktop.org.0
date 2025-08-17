Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9697AB2933D
	for <lists+dri-devel@lfdr.de>; Sun, 17 Aug 2025 15:18:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0384610E138;
	Sun, 17 Aug 2025 13:18:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dAQpf3JN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A643710E138
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Aug 2025 13:18:12 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57H8x8vZ008932
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Aug 2025 13:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=oAGXV53yq54GmVDSezzSfGAI
 LBzENgFTlXwMi7xO3HA=; b=dAQpf3JNk0gzP+d4ayqlqi6GntmH9EceCuJ3Difb
 SC0YrK12HHMwsTwWH78I0I4Y1+QhQXgwM+5HFyTM0xlfD6gSb14aXKZOiog1a4nK
 xktpR4q4zEIUNFloKw2UwLau1Kob2tyEuxnY0nFwU72cfEg4k8uFRpFnzRyCkHvH
 z66pkrv6VLpFjQhMcqxgFLNXvkT7DeKQEoF1BZTMcipi+WAisPAOsdGChsN+u9dD
 5kSd2P04zdiMAAHGaKEyw2eTRGoq8Zl+p2VPF+sU9wzyJ7U6TnD7Z36WbOcqjYlu
 +iO7Na2r07c6ziyfDF1MqbHq27lxsWPgmsPVRfckQrR1qQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jk5ma14a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Aug 2025 13:18:12 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-70ba7aa11c2so46711816d6.1
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Aug 2025 06:18:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755436690; x=1756041490;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oAGXV53yq54GmVDSezzSfGAILBzENgFTlXwMi7xO3HA=;
 b=C/NajET7LoJJ5TTf/d7A7xFTJLkzwZFMaPCno/F8eO7txCnuWu4yjy2eCrDudN+2Pi
 +ewkzt7V6ZfvfHCrw7wEO3P/V/K/YKYCSX7CukgBHpE8WMokSmG/wy3Lb7b/0yjhLUX8
 BnoRYSgHteeQ8ROGK8ek5twe32hP2zdVCKNnUshhQ9t4AeLOsSZND/QE/mrc7TD5A+DF
 SkFQNMQ3n8POvYkZm7DZb8nti7oDb2G1wLvJgbrLP46AV/NqTfc1MM0O0dUmW/3Pap9l
 GhyAS+kQLlD6E0JmpTPhZHPyFxQAy+tx81WXqOLft8zma0HVCyhMkajoBk0XMM9UzV6H
 xj6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUquwC0C2P8Ur1gb1amwslQYBVkSswbOr41phv93X4wG6jE2PWxGyCirrqnjvelOPhK/Crr4PFThVE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1zs3mOSOLLpUMXAO9yUGAtFUPcrNV1OcN0zebJByXf7vsIRr5
 HAFGwQ8u2/28NhiQZ8E8goxI8muSIEXdGuo+S8UiK2HlbQbeqYvGfCh1WENZVa7xK0TZl0tPp0W
 7HzZboZt2RQxo+RgvqTDxfs9nleQZ8pjZ6qhA06iFLdBV+xdxBeucn4ACJ2UeWuXZkLmO1W9774
 vSLMs=
X-Gm-Gg: ASbGncsLzGmrHxsZ9uIQhrBjXMzbV3Wz4EX4SsaiOxbP6HPvz87NUXvy7ltgQx+E1Lp
 uDHSFl7s3ktZLAa5cqrN3KJNTFjI2iJKr8JuOYySqPF+tbM8LSaXsLAAehLn2oyBLlteK265A9b
 gFM1FiAGo9t6qr1Hr5vRjK6moYT2b+3k0WbqaeUZc28PRtpN3n9kIW8CsTyN3wvcxXa2fga+Qft
 CUREXfAj6HfU+bX5f2Hj1SWs8T8mmwjCDycOfTGCcErKggnI+o8AvUGziuFoX8NUIKvfsZtkKCa
 auUmwY+evJ6o6BcLPEAoeRqRdkXNPcKH12mJ2yOdyyfFAOju4n0iCU89N3zzJlq4goQl+weHbhv
 sVh0j3ZevTYMVhzXD3Muh6lpULEXjUTVR4JGhOtGLx23v4cDl3EiE
X-Received: by 2002:a05:6214:c8b:b0:707:5d28:2b80 with SMTP id
 6a1803df08f44-70ba7a5e815mr111698346d6.7.1755436688690; 
 Sun, 17 Aug 2025 06:18:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOSDqT3iD33oZdpkHdLqjraNe1W3lPhWgqyY6IdZPo1p3C3OrKZWTpPFVi/pEP+VGhfTMPtw==
X-Received: by 2002:a05:6214:c8b:b0:707:5d28:2b80 with SMTP id
 6a1803df08f44-70ba7a5e815mr111696356d6.7.1755436686769; 
 Sun, 17 Aug 2025 06:18:06 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef359970sm1269185e87.40.2025.08.17.06.18.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Aug 2025 06:18:05 -0700 (PDT)
Date: Sun, 17 Aug 2025 16:18:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 kong.kongxinwei@hisilicon.com, liangjian010@huawei.com,
 chenjianmin@huawei.com, fengsheng5@huawei.com, libaihan@huawei.com,
 shenjian15@huawei.com, shaojijie@huawei.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 drm-dp 11/11] drm/hisilicon/hibmc: moving HDCP cfg
 after the dp reset operation.
Message-ID: <vsnpvyvebdzvythe3q4xj6ks5ionjtnd5jcsjjfbv3ptgdrw46@3ccvex2wqjho>
References: <20250813094238.3722345-1-shiyongbang@huawei.com>
 <20250813094238.3722345-12-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813094238.3722345-12-shiyongbang@huawei.com>
X-Authority-Analysis: v=2.4 cv=Sdn3duRu c=1 sm=1 tr=0 ts=68a1d694 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=i0EeH86SAAAA:8 a=ETqUBGNnfF6ie6NgWnwA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: laNoT348KpTAjGGuoBbP28Ln2fgAAGpO
X-Proofpoint-GUID: laNoT348KpTAjGGuoBbP28Ln2fgAAGpO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDA0MiBTYWx0ZWRfX9DFGVz3l+6MR
 EpEB2dRmqck2WfiUisFIF96M9FzEtLCULc+LKaOPVrOANMAgTh4D4lxzFSu8fULe4OGgO7cif8U
 2qS0FVoy3yBhVEVl7J3lK4MCmyaaWtD3IkNUnKrTwonX1AxqRfUluPV4ORDBggeMD/+zuDASld6
 YNAkLPvI2QZnsNKYS2IfcEIgGwI6HgKYbtZpfl8VElcXiUxIWdlWq8bSHeM/pEkoyqWivHLDzn4
 hb+4dfuBfRx1TVrGkFETuUsVcMSQ1ibnNeMexM03BWukgY3zHSwZTnE0IKxi/G76pGFUeoQ35SN
 4LHmKc5vLKcgV5LjFeo4VQx6MRmvHT38ljsmAd04n/plkJVpELRpKvlMDTlAvHnUnCzsUzp8wjg
 R9+7s30V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-17_06,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 adultscore=0 malwarescore=0 bulkscore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160042
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

On Wed, Aug 13, 2025 at 05:42:38PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> The DP reset was adding in the former commit, so move HDCP cfg after DP
> controller deresets, so that configuration takes effect.
> 
> Fixes: 3c7623fb5bb6 ("drm/hisilicon/hibmc: Enable this hot plug detect of irq feature")
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>

This should be squashed into reset commit.

> ---
> ChangeLog:
> v3 -> v4:
>   - fix the commit subject, suggested by Dmitry Baryshkov.
> v2 -> v3:
>   - split into 2 commits, suggested by Dmitry Baryshkov.
> ---
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> index 18beef71d85f..73a0c0156092 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> @@ -176,8 +176,6 @@ int hibmc_dp_hw_init(struct hibmc_dp *dp)
>  	dp_dev->link.cap.lanes = 0x2;
>  	dp_dev->link.cap.link_rate = DP_LINK_BW_8_1;
>  
> -	/* hdcp data */
> -	writel(HIBMC_DP_HDCP, dp_dev->base + HIBMC_DP_HDCP_CFG);
>  	/* int init */
>  	writel(0, dp_dev->base + HIBMC_DP_INTR_ENABLE);
>  	writel(HIBMC_DP_INT_RST, dp_dev->base + HIBMC_DP_INTR_ORIGINAL_STATUS);
> @@ -187,6 +185,8 @@ int hibmc_dp_hw_init(struct hibmc_dp *dp)
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
