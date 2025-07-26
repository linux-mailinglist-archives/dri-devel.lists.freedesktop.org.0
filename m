Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9C0B12B0E
	for <lists+dri-devel@lfdr.de>; Sat, 26 Jul 2025 17:04:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A63310E031;
	Sat, 26 Jul 2025 15:04:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kjiwna85";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC0A310E031
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 15:04:02 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56QEM6RD002987
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 15:04:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=KOu2HhfwicxO6ZxeG9X/WFZX
 3rLbNpoLtuIggGSR5aA=; b=Kjiwna85FCEgUu7k9O9X4SQsDuhwUSJF2Aj9HUwC
 MRR6sYLRLgmmKJBBYlW2r6Bo2BDVv5Vt3pbdlCV0cbGA/8bTlrJT7uYXjLcUbUvX
 F+DeBoW9PVNzSiae8JE4Jl0Iif4Mw8x+gZW8HHCbhNw9EylbLiVz/DVOwqBhMkdf
 75UxaFb8UbFGJbU6heHCvnYQ1Ip3sb5m8pRVjOYtcfIETuYWCFPRLUDs5p58+Zeb
 qunW7mZW+7GmPEiMuIjRqhKemnkVQRdivbBhvTTrCw6eqPoL143MQ4GIhB9oNArp
 iB7ns8j+pLrdtsb7mFTulck89JDtSCDJcUpFnymHqw2Ysg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pm28sua-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 15:04:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7e36a64211eso565616985a.0
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jul 2025 08:04:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753542241; x=1754147041;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KOu2HhfwicxO6ZxeG9X/WFZX3rLbNpoLtuIggGSR5aA=;
 b=NU4X6BTh6XHAG70oWcFsoHFL8EP6prnUNfXqHEhXNqR6MyX/TNRqA87WsXO6ocAcG0
 ECiPjcPDlExzltUyrO27eH8+zqkSsOzge/OLYCpaj9LDNocIuaFx9dzqbeueBzuE2R8g
 hCQJ8Ye0rDfDd9w5Ylofk3xsJsaitZCN36xJDdg109nPJFZzQncnUumQJlJ+nG3XsJjx
 JRIQShBJtTo3M4yFPEhJb1K59xQTxpDUMiVmzSxl9Ym/HvopQudegQ12aWNGEPe27MPa
 ilT0HQrOtt+q7BlM+yVHY5sUaMpLcDvrEDw6gSZ0dPAAukln/YxIxkoZo8FDiqc1GaIM
 LqsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+rh+GAJosY5k1cVdlazy01xoMVXJIHvRtuhUMhIe12dcgIeSWRNcZEvSoCsb99k5shVNyeABpDuY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJmo6qsyhbbRKKHkTQMFe5hXGlDINWsRM0W7++UYr7xaMcu+m8
 d+qT4mQ0T5NHii0rVsYvQzX2uVoAIZpUc9T63O3oMZCQUfGQ90vJUxyWbTNg5d+Sx6W4NmotouM
 45QrHSkryoQSQVUGXN1HPRp4Wefz+X4MazY940sua1j7wtZFf86lDFfsgYPRHrHxLDpFDrZc=
X-Gm-Gg: ASbGncsK6olVZZh+UR3L/UYBJZfiZ6GuLihE5avs66XSZobhy5A89MZKL01LB7qT4jH
 OyyKPmbQm3qmu5v7RmnH71zosof5ODiekYM9aebvPin5UsxeOcVrR0D1Hx8f++kjMRqHcKUNiY1
 s8qhsb4RPTTEweeURWmyXH8Eb5r5n1bUINCmpcPCGRdjhp+1p32Z1Pymw6vzkRQDCAOR7Vb4FIW
 0bMbT5A7y6n9h/h0vbwmcq1KkJ9e2gixZKGJpgk9a/QQZuB8XEDeqNyjEmLUwawHsu8euHA/CpG
 7PvnzuwLyckef4tvx03X413pg7l8Xl94CjtKz5rgzlfuyF6fKjdSbptmydBniF7/CpyF2UUZzYk
 BzoqYOUXK4SXzHTy56cC7yKguDH7CmuIEnFXLbRt5M0aQpqu56Hxr
X-Received: by 2002:ae9:ec0d:0:b0:7e6:23cb:7296 with SMTP id
 af79cd13be357-7e63bfa9366mr542098185a.28.1753542240623; 
 Sat, 26 Jul 2025 08:04:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGUQ75TTFS9K8q+wvTov62ezkk3euJnllrq1rTL7FabL3OM09p2joBg1In9i43RdV7z39fKg==
X-Received: by 2002:ae9:ec0d:0:b0:7e6:23cb:7296 with SMTP id
 af79cd13be357-7e63bfa9366mr542091985a.28.1753542239923; 
 Sat, 26 Jul 2025 08:03:59 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b633637c8sm478424e87.113.2025.07.26.08.03.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Jul 2025 08:03:57 -0700 (PDT)
Date: Sat, 26 Jul 2025 18:03:55 +0300
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
Subject: Re: [PATCH v3 drm-dp 02/11] drm/hisilicon/hibmc: fix dp
 probabilistical detect errors after HPD irq
Message-ID: <f7co2accpkvt4b5jy7ar4j6jqiytmysd3ki32hvhg7w2ohqoo6@nwwxeif6f73q>
References: <20250718065125.2892404-1-shiyongbang@huawei.com>
 <20250718065125.2892404-3-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718065125.2892404-3-shiyongbang@huawei.com>
X-Proofpoint-GUID: jw_0LBfUdPLhbh_rRJT66Q64ub6FKG0C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI2MDEyOCBTYWx0ZWRfX1w4vqVgOcZD8
 ua9IgEHcTg7tJYQMyLLxfZiFb5dnkLij8jkmdSARsX62e25rD07pRovtOgBq32n3wlZHfnLtzpW
 kmiuWDBI1W5V4gaE4VWR9yGoywbxtP17IuQ5NONA1n0STSdSyGHj8/Jsp6FaNIo0LfbxWorl39l
 US1G9FkyZMCDvEwjnt8Tk6+7pBpuSrQofV3OjTygpttbnyMPi3KgUDt4OQDC/0FJhulQUzm5JCG
 us0mASC8gCAvrqjRZcoMZM2BJ6YYutEKyzttddcCqw9JWV5z+xKX6Xc4sy161V9nnSki+F9O4Kc
 O2Fw5XCY6PJxCFudhMF7+PYJuUuJHEtmPabqEEKZjXQkI5YasLxW/YuCZErg98N39EuZceYWudU
 CTSZdFqJAY6buNYjCuxVyqHTkB2yVWeue6wH676FFGjzgkrXm9ZvcY4UJ9PpHfZ/kOgrx5Er
X-Authority-Analysis: v=2.4 cv=HfYUTjE8 c=1 sm=1 tr=0 ts=6884ee61 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=i0EeH86SAAAA:8 a=-x_x-SBnuhrWNgYMQ54A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: jw_0LBfUdPLhbh_rRJT66Q64ub6FKG0C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-26_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507260128
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

On Fri, Jul 18, 2025 at 02:51:16PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> The debouncing when HPD pulled out still remains sometimes, 200ms still can
> not ensure helper_detect() is correct. Add hibmc_dp_detect_link() in
> detect_ctx(), which is to try dp link training.

I'm not sure if I follow the commit message. Anyway, link training
should be a part of atomic_(pre)_enable, not a detect_ctx.

> 
> Fixes: 3c7623fb5bb6 ("drm/hisilicon/hibmc: Enable this hot plug detect of irq feature")
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    | 27 +++++++++++++++----
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h    |  2 ++
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    | 10 ++++---
>  3 files changed, 30 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> index 8f0daec7d174..2d2fb6e759c3 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> @@ -3,6 +3,7 @@
>  
>  #include <linux/io.h>
>  #include <linux/delay.h>
> +#include <drm/drm_managed.h>
>  #include "dp_config.h"
>  #include "dp_comm.h"
>  #include "dp_reg.h"
> @@ -162,6 +163,8 @@ int hibmc_dp_hw_init(struct hibmc_dp *dp)
>  
>  	mutex_init(&dp_dev->lock);
>  
> +	drmm_mutex_init(drm_dev, &dp->link_train_mutex);
> +
>  	dp->dp_dev = dp_dev;
>  
>  	dp_dev->dev = drm_dev;
> @@ -238,19 +241,33 @@ void hibmc_dp_display_en(struct hibmc_dp *dp, bool enable)
>  	msleep(50);
>  }
>  
> -int hibmc_dp_mode_set(struct hibmc_dp *dp, struct drm_display_mode *mode)
> +int hibmc_dp_detect_link(struct hibmc_dp *dp)
>  {
>  	struct hibmc_dp_dev *dp_dev = dp->dp_dev;
> -	int ret;
> +	int ret = 0;
> +
> +	mutex_lock(&dp->link_train_mutex);
>  
>  	if (!dp_dev->link.status.channel_equalized) {
>  		ret = hibmc_dp_link_training(dp_dev);
> -		if (ret) {
> +		if (ret)
>  			drm_err(dp->drm_dev, "dp link training failed, ret: %d\n", ret);
> -			return ret;
> -		}
>  	}
>  
> +	mutex_unlock(&dp->link_train_mutex);
> +
> +	return ret;
> +}
> +
> +int hibmc_dp_mode_set(struct hibmc_dp *dp, struct drm_display_mode *mode)
> +{
> +	struct hibmc_dp_dev *dp_dev = dp->dp_dev;
> +	int ret;
> +
> +	ret = hibmc_dp_detect_link(dp);
> +	if (ret)
> +		return ret;
> +
>  	hibmc_dp_display_en(dp, false);
>  	hibmc_dp_link_cfg(dp_dev, mode);
>  
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
> index 665f5b166dfb..9b45e88e47e4 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
> @@ -50,9 +50,11 @@ struct hibmc_dp {
>  	struct drm_dp_aux aux;
>  	struct hibmc_dp_cbar_cfg cfg;
>  	u32 irq_status;
> +	struct mutex link_train_mutex; /* link training mutex */
>  };
>  
>  int hibmc_dp_hw_init(struct hibmc_dp *dp);
> +int hibmc_dp_detect_link(struct hibmc_dp *dp);
>  int hibmc_dp_mode_set(struct hibmc_dp *dp, struct drm_display_mode *mode);
>  void hibmc_dp_display_en(struct hibmc_dp *dp, bool enable);
>  void hibmc_dp_set_cbar(struct hibmc_dp *dp, const struct hibmc_dp_cbar_cfg *cfg);
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> index d06832e62e96..354e18bb2998 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> @@ -34,9 +34,12 @@ static int hibmc_dp_connector_get_modes(struct drm_connector *connector)
>  static int hibmc_dp_detect(struct drm_connector *connector,
>  			   struct drm_modeset_acquire_ctx *ctx, bool force)
>  {
> -	mdelay(200);
> +	struct hibmc_drm_private *priv = to_hibmc_drm_private(connector->dev);
>  
> -	return drm_connector_helper_detect_from_ddc(connector, ctx, force);
> +	if (!hibmc_dp_detect_link(&priv->dp))
> +		return connector_status_connected;
> +
> +	return connector_status_disconnected;
>  }
>  
>  static const struct drm_connector_helper_funcs hibmc_dp_conn_helper_funcs = {
> @@ -128,8 +131,7 @@ irqreturn_t hibmc_dp_hpd_isr(int irq, void *arg)
>  		hibmc_dp_reset_link(&priv->dp);
>  	}
>  
> -	if (dev->registered)
> -		drm_connector_helper_hpd_irq_event(&priv->dp.connector);
> +	drm_connector_helper_hpd_irq_event(&priv->dp.connector);
>  
>  	drm_dev_exit(idx);
>  
> -- 
> 2.33.0
> 

-- 
With best wishes
Dmitry
