Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C68AD120F
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jun 2025 14:54:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AD1910E1EB;
	Sun,  8 Jun 2025 12:54:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="R+JJ+Zso";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A94210E1EB
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jun 2025 12:54:11 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558CsAxO012559;
 Sun, 8 Jun 2025 12:54:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Uk66EcMqOcniRlqMz93nVMxX
 OXKxc66pHl1w0CSMStI=; b=R+JJ+ZsosTZ2afGWcO3uUfrAxLNybX0NwR5X3MaS
 jV08N2aN7kHCKQ31ym94XM+Sf7D+i7/HV5OeyH4daI8A0RPk/kwK4xkIjLA6fBJj
 kxCdHp8HWtod8UcqbCJXCNV6ZiGVMvG2zR431Sm+mmizgm0sDihohxo6tvqpmPbd
 OpZk+LvMW+/xLIIQ5DkVpd9csFcSvYtkGeiE8WogoCMW/f61wYu0OREyPz+9AwCg
 0++21a9u2Jc3fp9fKsmXixMsrm+IFwtOTXbB0cHr8lJD55gFLgn2Oey1AQsBC2br
 3m/bfbNhDjHNDTDdKoUP/WpRFGnLz0hMleWeUsQQP+XGgg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ce9jy9g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jun 2025 12:54:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7caef20a528so890015285a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jun 2025 05:54:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749387250; x=1749992050;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Uk66EcMqOcniRlqMz93nVMxXOXKxc66pHl1w0CSMStI=;
 b=gO0qzTiEt7YcmRL1GO8MSiKpe8awhsNG7jvXLhzEg4SnbrgDwzi4GbSHDnRxQy0mmx
 ZPN3hGwiG2ggC/14lhmYXHw/9z8OFP28yLZj+q8hLpgdAogCB2Su1x+nLMSolQH36RH5
 MgWcQIQmdOYF1rUecMDYjSlMioctUAYfi0+YzS5ffAsMxIViRPk0TpqeuK66oDytjoFV
 U9nkI2aeSkDcKxVQws077BvcTBcnOzPMNOEfusxMnhC6ai+QdbDtl5jQ3Ki1TalmagjJ
 ACtO7SW4I8clvvq4rXVtBELaG1o6+d9lTjyCYh1pFrXuu4o3NlrIEeFa2ieZ5BGcT29d
 hjXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXScVCmlOqQvfdQonofaAfkOUxIAH+WRycVjVwbiK2It2/lqzYuOEjHFoUHwxuB0/LM4DG2NsZ4koU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YypI7ttv6LElo6tUZ0y1UbOpv7VyKLwYmBIbxTZPETjwZ1qIRgm
 GahdEjP/qjWY5u51YKrZAOTF6fI8iYCV7axhy9kH5FkYe0USjyK0n7Yd79YKWHFTiyeAXC922EM
 PfPS27Vf6qNlZWeqfGZXda8TuBuqRZ5kSCbtg9WqkhyhRTNU1wgMQ4kwlVvM8r9zRP73M6hA=
X-Gm-Gg: ASbGnct6QNnoY4b0Gs9IQqvgYlBYEFXZXnS0cmrzE/2zH2MTUWJq29Ush2JPXD2hFTY
 UG3MShQGv2Gm459vNkyMqVuc3L6y/EXbvfUobRKOpLj8E7tJ35Tlk1A3hn83vJHsxfRrTgkrNtB
 qDBiImusFHtq0ho9sykwCScZQxhvJeuKrtdbCgyRjyhnMxKJodSmdMXqFlGNzdXutjmqn5ok4Zi
 2fZJGw/jzo9Z3y4+bGIUBfAeMZhxkAQjNUt15M070MbFNLUUWbppdBfPvSahS7Sk0+IuUeyMrIH
 Ggy1NL5p48d6clHC1ZirZ/VCjlQFZWk+JJ5IA57pQlnrNhGFBjLw5IBLdd17Wb915NTsuT/4eCN
 xWCjfVaaQaw==
X-Received: by 2002:a05:620a:3946:b0:7d3:8ec6:e059 with SMTP id
 af79cd13be357-7d38ec6e14emr416232485a.3.1749387249686; 
 Sun, 08 Jun 2025 05:54:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwyBsU/HMmzxV6s0ub4aI5Io68R14o1IAEtcKgz+pJpWDjuh+2APzvgWqbFMOTBt12Q08VIA==
X-Received: by 2002:a05:620a:3946:b0:7d3:8ec6:e059 with SMTP id
 af79cd13be357-7d38ec6e14emr416230685a.3.1749387249384; 
 Sun, 08 Jun 2025 05:54:09 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553676d049asm753487e87.12.2025.06.08.05.54.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jun 2025 05:54:07 -0700 (PDT)
Date: Sun, 8 Jun 2025 15:54:05 +0300
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
Subject: Re: [PATCH drm-dp 10/10] drm/hisilicon/hibmc: fix no showing problem
 with loading hibmc manually
Message-ID: <czs4ingsrnuaqlbn3f7ko65pzhydcuuiglyh5ksrpfcz5zur74@vzgzyjkcae63>
References: <20250530095432.1206966-1-shiyongbang@huawei.com>
 <20250530095432.1206966-11-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530095432.1206966-11-shiyongbang@huawei.com>
X-Proofpoint-GUID: KMSsidNsrmbrrnerqCZyDTLl11Fleflq
X-Authority-Analysis: v=2.4 cv=drjbC0g4 c=1 sm=1 tr=0 ts=684587f2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=i0EeH86SAAAA:8 a=ETqUBGNnfF6ie6NgWnwA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: KMSsidNsrmbrrnerqCZyDTLl11Fleflq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDEwMiBTYWx0ZWRfXwjW6iSABnyfr
 xBqXVf06eVxGoZ3cq52Ip9qs+Ye6OuYjFGw98c59KgVx6/ZdALdnaSxiEE6eOtZclFH4uHjDHXk
 o/BDS0M091kbh90QMYDa/OdSKogzXlIfuKmXoW/02tSJEvraa9j2ZSqp/GuyheCNo/OCVavV3vR
 17C6ZxwFcrIPiLNc+UlfDErvln35CUmssRAUaggt1lYSXBdMRp7x00wk33/f1LUBgEuTPWayj2C
 Oxt7FbvWWdWzZCKAJGeZbxdQ0zaploxeuJtyAxKlDBGbKPCrsqJzsvQk7h/Y7YC4Up6GklB9rn+
 /N4KpTtXhkOJbIY6AfOb0wO858kPTPisD0qV94Nw6cKc2emmxMiEQ3IMbyjEknX8kkBkVgIP7p4
 QLekXcCH/+VtSmHGXTxgdFy/DA7VeDfCZHqE5cYvLTpNKS4lsmU758wpib3s52n4/sOQeBVU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506080102
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

On Fri, May 30, 2025 at 05:54:32PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> When using command rmmod and insmod, there is no showing in second time
> insmoding. Because DP controller won't send HPD signals, if connection
> doesn't change or controller isn't reset. So add reset before unreset
> in hibmc_dp_hw_init().
> 
> Fixes: 94ee73ee3020 ("drm/hisilicon/hibmc: add dp hw moduel in hibmc driver")

Technically... yes and no. The function was written this way in that
commit, however HPD signals were not handled until the latter commit.

> Signed-off-by: Baihan Li <libaihan@huawei.com>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> index 4f93d60b932b..e1b9589ce639 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> @@ -172,13 +172,15 @@ int hibmc_dp_hw_init(struct hibmc_dp *dp)
>  	dp_dev->link.cap.lanes = 0x2;
>  	dp_dev->link.cap.link_rate = DP_LINK_BW_8_1;
>  
> -	/* hdcp data */
> -	writel(HIBMC_DP_HDCP, dp_dev->base + HIBMC_DP_HDCP_CFG);
>  	/* int init */
>  	writel(0, dp_dev->base + HIBMC_DP_INTR_ENABLE);
>  	writel(HIBMC_DP_INT_RST, dp_dev->base + HIBMC_DP_INTR_ORIGINAL_STATUS);
>  	/* rst */
> +	writel(0, dp_dev->base + HIBMC_DP_DPTX_RST_CTRL);
> +	usleep_range(30, 50);
>  	writel(HIBMC_DP_DPTX_RST, dp_dev->base + HIBMC_DP_DPTX_RST_CTRL);
> +	/* hdcp data */
> +	writel(HIBMC_DP_HDCP, dp_dev->base + HIBMC_DP_HDCP_CFG);

There are two independent changes here. Split them into two commits.

>  	/* clock enable */
>  	writel(HIBMC_DP_CLK_EN, dp_dev->base + HIBMC_DP_DPTX_CLK_CTRL);
>  
> -- 
> 2.33.0
> 

-- 
With best wishes
Dmitry
