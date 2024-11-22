Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FE29D583B
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 03:18:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAB3610E0F6;
	Fri, 22 Nov 2024 02:18:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="oSh5bgCn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FE7510E0F6
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 02:18:21 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-53da4fd084dso2823516e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 18:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732241900; x=1732846700; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=A8r4mnejj7RLE9zF6UjcBekU7Owq8HMQeCRrqOVSEg0=;
 b=oSh5bgCnHpm3a48+rZdq9Od9xZtJMzTis8OfQeea8T2s0Wh3qDmmE8g8hZibJFUW0N
 FYjmpwDrwUssCP8EC9oYd7C/NZLCvtRfMZjRjQMWytt9H5U8tRhZOTYtfGSxpO7130dP
 CSWJ0aY8Ptwq2P/e09+jl1QX+eLppnCg17j6xAcD8LLjJkK+fZXM7y4U46xtUlzjcJaH
 AMoWX5AQtVlLFecgCCqJuL5neQ3arv+P7tSW/aCh3PDymAxGbcqAIQPkG4wi2gDoZhHB
 BtDbbmogu9J8EL3Wv0ubX5xA6nh0Rb1O614B/80xKvrn46DbW5wu8OocC4l8knNFS981
 f9Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732241900; x=1732846700;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A8r4mnejj7RLE9zF6UjcBekU7Owq8HMQeCRrqOVSEg0=;
 b=nqOmLqJ4/VFmtmnFhKhtb0dRJ5n8Pa+TK1ZFUKGBgfVyv83MsHUPJF1VgQkZIvj2ob
 g/sl4+/e8hkQdZ1eQr4kSzZfVZInkpugMGDcmTo5ztVEmNFgH5VRGdUeTIJ8OryhYH3W
 syRL9L/KcLiUSAdIw35hJm9csBCP+m8RuC2CBe8cJY6ItAuZ689emoMHn1tHMiIcoM+b
 zBaLYPd+L+hIpbD2C+tUA90IDV+r+tZlfYIshXgbT5e5jkC9sskVLSD5HphbJmDX8gs5
 sjP7IBzLpGbJlqTqGyFwleTvvC81wx/hidR83XEXm9UOyV9sQwjKtYgkHBsUs69DU2Xz
 BY9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIAYXSUGzjZ788sToVSHDMqQg2vOERBTAUr6S82c2NuugtkyWwjpTBcnx1W264j5VvFfNxh7PxkA4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxpThWLcF10cx0nlD8dWueP2uZJ27CAYe1lPCs5k/ui7S8hISDD
 5FPdnCfeUdKoWDfEzhQUt09WawkwNN5KKbz3vxHuPMbnYUfGqxKvzzU5iCi1UCE=
X-Gm-Gg: ASbGncs/k0aLISHpetJ0MEQYlo5fbxovtqQlYh1chtjn+PEjYGJRaTVsOXXK33r/lwK
 wuZd+anArrDOap1EQiTQxqdZUT/UUdN/RvwyqYhDrWNNzJgkDL8K2IctqVgpMK9Z5vwmP2YsXRg
 wfHSJku2MceaQBtwCnNj1XU/Xe8M5KL+bV/zUAw/LFcdDZCnguFPdm8KsFTg7YegTZltjO8K5ZM
 a6f4Wb/cWcSBn/WNpdcenMD2xZYrWWrL7jXt50CyYOmdH5ICR8yaRD1rOLv5eYCxPWjaIeG/z8b
 J/XLetUS2Ro6RifzKY3Hmg7qAAtHuA==
X-Google-Smtp-Source: AGHT+IH2XVG4CrGcKLtMWVmsHezxyuZC2DkpmiAfjI5u+x2GLL/vigGbfq/KQOpmIov6vnUu63SYfg==
X-Received: by 2002:a05:6512:2c0e:b0:53d:a90e:685c with SMTP id
 2adb3069b0e04-53dd2ace6d7mr430691e87.15.1732241899654; 
 Thu, 21 Nov 2024 18:18:19 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd2481d5dsm166986e87.131.2024.11.21.18.18.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 18:18:18 -0800 (PST)
Date: Fri, 22 Nov 2024 04:18:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 daniel@ffwll.ch, kong.kongxinwei@hisilicon.com, liangjian010@huawei.com, 
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com, 
 shenjian15@huawei.com, shaojijie@huawei.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 drm-dp 3/5] drm/hisilicon/hibmc: add dp hw moduel in
 hibmc
Message-ID: <yqloscxeflxj6lvq5pmktpznmp2iv4p4ddavcvlscbtmytqt33@k5n66gh5axxq>
References: <20241118142805.3326443-1-shiyongbang@huawei.com>
 <20241118142805.3326443-4-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118142805.3326443-4-shiyongbang@huawei.com>
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

On Mon, Nov 18, 2024 at 10:28:03PM +0800, Yongbang Shi wrote:
> From: baihan li <libaihan@huawei.com>
> 
> Build a dp level that hibmc driver can enable dp by
> calling their functions.
> 
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
> ChangeLog:
> v3 -> v4:
>   - changed the type of train_set to array, suggested by Dmitry Baryshkov.
>   - using actual link rate instead of magic num, suggested by Dmitry Baryshkov.
>   - deleting hibmc_dp_hw_uninit(), suggested by Dmitry Baryshkov.
> v2 -> v3:
>   - fix build errors reported by kernel test robot <lkp@intel.com>
>     Closes: https://lore.kernel.org/oe-kbuild-all/202410250931.UDQ9s66H-lkp@intel.com/
> v1 -> v2:
>   - changed some defines and functions to former patch, suggested by Dmitry Baryshkov.
>   - sorting the headers including in dp_hw.h and hibmc_drm_drv.c files, suggested by Dmitry Baryshkov.
>   - deleting struct dp_mode and dp_mode_cfg function, suggested by Dmitry Baryshkov.
>   - fix build errors reported by kernel test robot <lkp@intel.com>
>     Closes: https://lore.kernel.org/oe-kbuild-all/202410040328.VeVxM9yB-lkp@intel.com/
>   v1:https://lore.kernel.org/all/20240930100610.782363-1-shiyongbang@huawei.com/
> ---
>  drivers/gpu/drm/hisilicon/hibmc/Makefile      |   2 +-
>  .../gpu/drm/hisilicon/hibmc/dp/dp_config.h    |  19 ++
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    | 217 ++++++++++++++++++
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h    |  28 +++
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h   |  41 ++++
>  5 files changed, 306 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h
>  create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
>  create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/Makefile b/drivers/gpu/drm/hisilicon/hibmc/Makefile
> index 94d77da88bbf..214228052ccf 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/Makefile
> +++ b/drivers/gpu/drm/hisilicon/hibmc/Makefile
> @@ -1,5 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  hibmc-drm-y := hibmc_drm_drv.o hibmc_drm_de.o hibmc_drm_vdac.o hibmc_drm_i2c.o \
> -	       dp/dp_aux.o dp/dp_link.o
> +	       dp/dp_aux.o dp/dp_link.o dp/dp_hw.o
>  
>  obj-$(CONFIG_DRM_HISI_HIBMC) += hibmc-drm.o
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h
> new file mode 100644
> index 000000000000..74dd9956144e
> --- /dev/null
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/* Copyright (c) 2024 Hisilicon Limited. */
> +
> +#ifndef DP_CONFIG_H
> +#define DP_CONFIG_H
> +
> +#define HIBMC_DP_BPP			24
> +#define HIBMC_DP_SYMBOL_PER_FCLK	4
> +#define HIBMC_DP_MSA1			0x20
> +#define HIBMC_DP_MSA2			0x845c00
> +#define HIBMC_DP_OFFSET			0x1e0000
> +#define HIBMC_DP_HDCP			0x2
> +#define HIBMC_DP_INT_RST		0xffff
> +#define HIBMC_DP_DPTX_RST		0x3ff
> +#define HIBMC_DP_CLK_EN			0x7
> +#define HIBMC_DP_SYNC_EN_MASK		0x3
> +#define HIBMC_DP_LINK_RATE_CAL		27
> +
> +#endif
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> new file mode 100644
> index 000000000000..9d7337cd9309
> --- /dev/null
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> @@ -0,0 +1,217 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// Copyright (c) 2024 Hisilicon Limited.
> +
> +#include <linux/io.h>
> +#include <linux/delay.h>
> +#include "dp_config.h"
> +#include "dp_comm.h"
> +#include "dp_reg.h"
> +#include "dp_hw.h"
> +
> +static void hibmc_dp_set_tu(struct hibmc_dp_dev *dp, struct drm_display_mode *mode)
> +{
> +	u32 tu_symbol_frac_size;
> +	u32 tu_symbol_size;
> +	u32 rate_ks;
> +	u8 lane_num;
> +	u32 value;
> +	u32 bpp;
> +
> +	lane_num = dp->link.cap.lanes;
> +	if (lane_num == 0) {
> +		drm_err(dp->dev, "set tu failed, lane num cannot be 0!\n");
> +		return;
> +	}
> +
> +	bpp = HIBMC_DP_BPP;
> +	rate_ks = dp->link.cap.link_rate * HIBMC_DP_LINK_RATE_CAL;
> +	value = (mode->clock * bpp * 5) / (61 * lane_num * rate_ks);
> +
> +	if (value % 10 == 9) { /* 9 carry */
> +		tu_symbol_size = value / 10 + 1;
> +		tu_symbol_frac_size = 0;
> +	} else {
> +		tu_symbol_size = value / 10;
> +		tu_symbol_frac_size = value % 10 + 1;
> +	}
> +
> +	drm_info(dp->dev, "tu value: %u.%u value: %u\n",
> +		 tu_symbol_size, tu_symbol_frac_size, value);

drm_dbg_driver()

> +
> +	hibmc_dp_reg_write_field(dp, HIBMC_DP_VIDEO_PACKET,
> +				 HIBMC_DP_CFG_STREAM_TU_SYMBOL_SIZE, tu_symbol_size);
> +	hibmc_dp_reg_write_field(dp, HIBMC_DP_VIDEO_PACKET,
> +				 HIBMC_DP_CFG_STREAM_TU_SYMBOL_FRAC_SIZE, tu_symbol_frac_size);
> +}
> +
> +static void hibmc_dp_set_sst(struct hibmc_dp_dev *dp, struct drm_display_mode *mode)
> +{
> +	u32 hblank_size;
> +	u32 htotal_size;
> +	u32 htotal_int;
> +	u32 hblank_int;
> +	u32 fclk; /* flink_clock */
> +
> +	fclk = dp->link.cap.link_rate * HIBMC_DP_LINK_RATE_CAL;
> +
> +	htotal_int = mode->htotal * 9947 / 10000;
> +	htotal_size = htotal_int * fclk / (HIBMC_DP_SYMBOL_PER_FCLK * (mode->clock / 1000));
> +
> +	hblank_int = mode->htotal - mode->hdisplay - mode->hdisplay * 53 / 10000;
> +	hblank_size = hblank_int * fclk * 9947 /

Still no idea, what 0.9947 is.

> +		      (mode->clock * 10 * HIBMC_DP_SYMBOL_PER_FCLK);
> +
> +	drm_info(dp->dev, "h_active %u v_active %u htotal_size %u hblank_size %u",
> +		 mode->hdisplay, mode->vdisplay, htotal_size, hblank_size);
> +	drm_info(dp->dev, "flink_clock %u pixel_clock %d", fclk, mode->clock / 1000);

And here. Please review the driver not to output any debug information
by default.

> +
> +	hibmc_dp_reg_write_field(dp, HIBMC_DP_VIDEO_HORIZONTAL_SIZE,
> +				 HIBMC_DP_CFG_STREAM_HTOTAL_SIZE, htotal_size);
> +	hibmc_dp_reg_write_field(dp, HIBMC_DP_VIDEO_HORIZONTAL_SIZE,
> +				 HIBMC_DP_CFG_STREAM_HBLANK_SIZE, hblank_size);
> +}
> +

Other than that LGTM

-- 
With best wishes
Dmitry
