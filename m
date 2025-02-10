Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19ECFA2FE28
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 00:05:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E08FE10E3F7;
	Mon, 10 Feb 2025 23:05:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="d8ZRhlMM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8F8410E408
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 23:05:42 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-545097ff67cso1910041e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 15:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739228741; x=1739833541; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=fcigvOsom8rW0TkFj/qoAV54vRWRNJIlkjwbdGodttY=;
 b=d8ZRhlMMAgyUk2+0sGjxN3pid/5tLy1kKBfNwFGwsSiz/qX0PukJm7EsFKoQq9GhvF
 B4B8hhOnsoYPusqELsk6L42mdbq3LDVSkPzZw1KEWJ7EL/NY9hixYsJiLIiZQQYopkNA
 5Bd3HqKKGEGJfFrM0XV9FKmtGpcoBnV7LuaKjV78H4YSfO1Vd5mcwEpRKFP+MPQstjpY
 fONnzSZ4iRhK6q3VnpJF6mTlUo3jM1lcKGiJMgMlUe/jouG4NnQhbQn/K1KYzdgffMbW
 WT0beKqxzi7mWPb4pM+dOJagrWc7YOknFyWO3EEuWktRrHJYFbgi661lYY3OUPGky7O7
 agLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739228741; x=1739833541;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fcigvOsom8rW0TkFj/qoAV54vRWRNJIlkjwbdGodttY=;
 b=ZRqO+9IMqU6aqQz9zg5bEkjqaKkzuBdq7iStOxcZSo6670N5mhdvtMkBLadBSXc2wK
 1K0ykUXEo2229kvZK3UbHqltb5K4dMYfub+37sGIKuGfjUyAa8lioSx02xADlj8Bmga8
 0C9XtilxqR/4LoFigG1thJxjijs/1+/wN3RsHKC9JlWOda8u+4qNqLVAzOuXR7kFPKau
 dJQtrNDJHldKmuh+V81zTphkhwqJP0BrnVz4EH6rKQosDSHYeu+fkeP2blhqIGKp5yxd
 RbORU3hYva9DRjDpf6FInpaP2gq2MAbQPFt85MTuDJJrU0ecGNciZYHaYk47SLQ0XH7r
 WqZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoNEKtyekBomf6347h6w4GCWlEopm0ue1aO7FhifPJpCobYWS22/qbwpA2pweq339cXrldw+6oAp4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNH7zNOTgU9Qm5Cdx5VyJ7nnnUAfc+YCIyEqB/u536uGEBS0rc
 Iv68s9BJDjP8/MQKnDKp7kTci5fyWY8sTZAp+9zgy7XGjReHgCrLXy2tIdVSrFs=
X-Gm-Gg: ASbGnctg32wztd/hz/yYT5mXc1ub8DFbKMRbWiJwpn/rJ391b+x028rMg4NT3a3wwyV
 a0dnbHs91+M6vfAI/GoZP2ghWyxkvto2OLjvnEpvGm35tPNm4UHgkxDwNlY1KIaEiOwTXO3e38B
 E4W1bpw6Z8qvNHlSIk0mE4O9uG1VyFE9yj7qMJxnugLShyqoFooHlMaIu0FjpdjmYfFoFmLSfWx
 WLAEIQHxpcm1rOV0FuVkqu/9EW2p9zF+zHZiZvXD+dIBrGTdYGzpLWc4xlaQ0AT5D9v7aaaspnS
 NoR6AGNrZKdAcafJuzpk3gpKN8Dt/ENQ0cV0Ye+scL4F51Fn6gH1HoL9HkLt7TUykDKqtGM=
X-Google-Smtp-Source: AGHT+IHRg+0Zf5ZCqEHB/UKL+jMQrzL4szRlq+eqUZM1LIEU2ZEwlyiJWsv4K7Wf57PiyQ+cyZgSZg==
X-Received: by 2002:a05:6512:4029:b0:545:aaf:13f5 with SMTP id
 2adb3069b0e04-5451186f38dmr443679e87.37.1739228740990; 
 Mon, 10 Feb 2025 15:05:40 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5450d947959sm349039e87.6.2025.02.10.15.05.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2025 15:05:39 -0800 (PST)
Date: Tue, 11 Feb 2025 01:05:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 daniel@ffwll.ch, kong.kongxinwei@hisilicon.com, liangjian010@huawei.com, 
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com, 
 shenjian15@huawei.com, shaojijie@huawei.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 drm-dp 2/7] drm/hisilicon/hibmc: Add dp serdes cfg in
 dp process
Message-ID: <cqlf4jj5mtxig4pw7nn5wi34miisuh7veuv5i4lz2wrxafbdb7@h7glfdpl6tyf>
References: <20250210144959.100551-1-shiyongbang@huawei.com>
 <20250210144959.100551-3-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210144959.100551-3-shiyongbang@huawei.com>
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

On Mon, Feb 10, 2025 at 10:49:54PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> Add dp serdes cfg in link training process, and related adapting
> and modificating. We change some init values about training,

Imperative language, please. Use 'change', not 'we change'.

> because we want completely to negotiation process, so we start with
> the maximum rate and the electrical characteristic level is 0.
> 
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
> ChangeLog:
> v1 -> v2:
>   - splittting the patch and add more detailed the changes in the commit message, suggested by Dmitry Baryshkov.
> ---
>  .../gpu/drm/hisilicon/hibmc/dp/dp_config.h    |  1 +
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    |  6 +++-
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c  | 33 ++++++++++++++++---
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h   |  1 +
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  8 ++---
>  5 files changed, 38 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h
> index 74dd9956144e..c5feef8dc27d 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h
> @@ -15,5 +15,6 @@
>  #define HIBMC_DP_CLK_EN			0x7
>  #define HIBMC_DP_SYNC_EN_MASK		0x3
>  #define HIBMC_DP_LINK_RATE_CAL		27
> +#define HIBMC_DP_SYNC_DELAY(lanes)	((lanes) == 0x2 ? 86 : 46)
>  
>  #endif
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> index 39fd3687efca..ee1ff205ff56 100644
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
> @@ -73,6 +74,9 @@ static void hibmc_dp_set_sst(struct hibmc_dp_dev *dp, struct drm_display_mode *m
>  				 HIBMC_DP_CFG_STREAM_HTOTAL_SIZE, htotal_size);
>  	hibmc_dp_reg_write_field(dp, HIBMC_DP_VIDEO_HORIZONTAL_SIZE,
>  				 HIBMC_DP_CFG_STREAM_HBLANK_SIZE, hblank_size);
> +	hibmc_dp_reg_write_field(dp, HIBMC_DP_VIDEO_PACKET,
> +				 HIBMC_DP_CFG_STREAM_SYNC_CALIBRATION,
> +				 HIBMC_DP_SYNC_DELAY(dp->link.cap.lanes));
>  }
>  
>  static void hibmc_dp_link_cfg(struct hibmc_dp_dev *dp, struct drm_display_mode *mode)
> @@ -170,7 +174,7 @@ int hibmc_dp_hw_init(struct hibmc_dp *dp)
>  		return -EAGAIN;
>  
>  	dp_dev->link.cap.lanes = 0x2;
> -	dp_dev->link.cap.link_rate = DP_LINK_BW_2_7;
> +	dp_dev->link.cap.link_rate = DP_LINK_BW_8_1;
>  
>  	/* hdcp data */
>  	writel(HIBMC_DP_HDCP, dp_dev->base + HIBMC_DP_HDCP_CFG);
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
> index f6355c16cc0a..43a4b656493f 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
> @@ -6,6 +6,7 @@
>  #include <drm/drm_print.h>
>  #include "dp_comm.h"
>  #include "dp_reg.h"
> +#include "dp_serdes.h"
>  
>  #define HIBMC_EQ_MAX_RETRY 5
>  
> @@ -108,7 +109,11 @@ static int hibmc_dp_link_training_cr_pre(struct hibmc_dp_dev *dp)
>  		return ret;
>  
>  	for (i = 0; i < dp->link.cap.lanes; i++)
> -		train_set[i] = DP_TRAIN_VOLTAGE_SWING_LEVEL_2;
> +		train_set[i] = DP_TRAIN_VOLTAGE_SWING_LEVEL_0;
> +
> +	ret = hibmc_dp_serdes_set_tx_cfg(dp, dp->link.train_set);
> +	if (ret)
> +		return ret;
>  
>  	ret = drm_dp_dpcd_write(&dp->aux, DP_TRAINING_LANE0_SET, train_set, dp->link.cap.lanes);
>  	if (ret != dp->link.cap.lanes) {
> @@ -137,21 +142,28 @@ static bool hibmc_dp_link_get_adjust_train(struct hibmc_dp_dev *dp,
>  	return false;
>  }
>  
> -static inline int hibmc_dp_link_reduce_rate(struct hibmc_dp_dev *dp)
> +static int hibmc_dp_link_reduce_rate(struct hibmc_dp_dev *dp)
>  {
> +	u8 rate = 0;
> +
>  	switch (dp->link.cap.link_rate) {
>  	case DP_LINK_BW_2_7:
>  		dp->link.cap.link_rate = DP_LINK_BW_1_62;
> -		return 0;
> +		rate = DP_SERDES_BW_1_62;
> +		break;
>  	case DP_LINK_BW_5_4:
>  		dp->link.cap.link_rate = DP_LINK_BW_2_7;
> -		return 0;
> +		rate = DP_SERDES_BW_2_7;
> +		break;
>  	case DP_LINK_BW_8_1:
>  		dp->link.cap.link_rate = DP_LINK_BW_5_4;
> -		return 0;
> +		rate = DP_SERDES_BW_5_4;
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> +
> +	return hibmc_dp_serdes_rate_switch(rate, dp);

This looks like:

if (dp->link.cap.link_rate == DP_LINK_BW_1_62)
    return -EINVAL;

dp->link.cap.link_rate++;
return hibmc_dp_serdes_rate_switch(rate, dp);

>  }
>  
>  static inline int hibmc_dp_link_reduce_lane(struct hibmc_dp_dev *dp)
> @@ -159,6 +171,7 @@ static inline int hibmc_dp_link_reduce_lane(struct hibmc_dp_dev *dp)
>  	switch (dp->link.cap.lanes) {
>  	case 0x2:
>  		dp->link.cap.lanes--;
> +		drm_warn(dp->dev, "dp link training reduce to 1 lane\n");

drm_dbg

>  		break;
>  	case 0x1:
>  		drm_err(dp->dev, "dp link training reduce lane failed, already reach minimum\n");
> @@ -206,6 +219,11 @@ static int hibmc_dp_link_training_cr(struct hibmc_dp_dev *dp)
>  		}
>  
>  		level_changed = hibmc_dp_link_get_adjust_train(dp, lane_status);
> +
> +		ret = hibmc_dp_serdes_set_tx_cfg(dp, dp->link.train_set);
> +		if (ret)
> +			return ret;
> +
>  		ret = drm_dp_dpcd_write(&dp->aux, DP_TRAINING_LANE0_SET, dp->link.train_set,
>  					dp->link.cap.lanes);
>  		if (ret != dp->link.cap.lanes) {
> @@ -255,6 +273,11 @@ static int hibmc_dp_link_training_channel_eq(struct hibmc_dp_dev *dp)
>  		}
>  
>  		hibmc_dp_link_get_adjust_train(dp, lane_status);
> +
> +		ret = hibmc_dp_serdes_set_tx_cfg(dp, dp->link.train_set);
> +		if (ret)
> +			return ret;
> +
>  		ret = drm_dp_dpcd_write(&dp->aux, DP_TRAINING_LANE0_SET,
>  					dp->link.train_set, dp->link.cap.lanes);
>  		if (ret != dp->link.cap.lanes) {
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
> index 4a515c726d52..f2fa9807d8ab 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
> @@ -72,5 +72,6 @@
>  #define HIBMC_DP_CFG_STREAM_TU_SYMBOL_FRAC_SIZE	GENMASK(9, 6)
>  #define HIBMC_DP_CFG_STREAM_HTOTAL_SIZE		GENMASK(31, 16)
>  #define HIBMC_DP_CFG_STREAM_HBLANK_SIZE		GENMASK(15, 0)
> +#define HIBMC_DP_CFG_STREAM_SYNC_CALIBRATION	GENMASK(31, 20)

Please consider restructuring the header so that it becomes more
obvious, which register are these masks for.

>  
>  #endif
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> index e6de6d5edf6b..bade693d9730 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> @@ -28,9 +28,7 @@
>  #include "hibmc_drm_drv.h"
>  #include "hibmc_drm_regs.h"
>  
> -#define HIBMC_DP_HOST_SERDES_CTRL		0x1f001c
> -#define HIBMC_DP_HOST_SERDES_CTRL_VAL		0x8a00
> -#define HIBMC_DP_HOST_SERDES_CTRL_MASK		0x7ffff
> +#define HIBMC_DP_HOST_SERDES_CTRL	0x1f001c

Unnecessary whitespace change.

Why HIBMC_DP_HOST_SERDES_CTRL is not in the dp_reg.h?

>  
>  DEFINE_DRM_GEM_FOPS(hibmc_fops);
>  
> @@ -122,8 +120,8 @@ static int hibmc_kms_init(struct hibmc_drm_private *priv)
>  	}
>  
>  	/* if DP existed, init DP */
> -	if ((readl(priv->mmio + HIBMC_DP_HOST_SERDES_CTRL) &
> -	     HIBMC_DP_HOST_SERDES_CTRL_MASK) == HIBMC_DP_HOST_SERDES_CTRL_VAL) {
> +	ret = readl(priv->mmio + HIBMC_DP_HOST_SERDES_CTRL);
> +	if (ret) {
>  		ret = hibmc_dp_init(priv);
>  		if (ret)
>  			drm_err(dev, "failed to init dp: %d\n", ret);
> -- 
> 2.33.0
> 

-- 
With best wishes
Dmitry
