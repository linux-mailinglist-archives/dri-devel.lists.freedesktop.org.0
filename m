Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC2EA2F3A3
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 17:33:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A698910E36C;
	Mon, 10 Feb 2025 16:33:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Kd+u8eyQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68F4610E36C
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 16:33:32 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-543d8badc30so4973182e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 08:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739205210; x=1739810010; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pe/8G8o+M5FZSgjrZo2plu0mkbz1sg3BqYR0IsKFs8E=;
 b=Kd+u8eyQTfLfGRaKXv/ZXuwNJR7eyl9kQY9VUY1bfFzo37R5P+DDiebZOZtf0cehRc
 dpK9ayP95QLUsnjQQgi+rhtmKf2IZqOCuEqxeITFMBm1FOofNz1OvIOB3sSj24XJLy15
 GYe0B3eKy6uGACHWJJPjsIE45+GFMkFST+t9FLE0bIVEHezzCPLEpeKb16ZoIZPLTxDr
 oZWTktui/Cly7LGeDcdPGE/MdnctX8JivisjUMAszoQ/TcvxzFRdrQMCXYD0fhZBrV31
 dzSS5/aQBR2Ct4KL3RTkCRpM9dXLTeaznVzKESIn076YNH06BGxkBx4QAwqd2llaDU/g
 rfeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739205210; x=1739810010;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pe/8G8o+M5FZSgjrZo2plu0mkbz1sg3BqYR0IsKFs8E=;
 b=d3z/9GoHwFkFh4mW04G+NnFtl+4sALGZ8PUnSFcYHrlnpdx+uekTERyPKQt7qE/eDr
 BOnvt2wbWu7woWDDBs34ZhuZxTMmksq7oHYwJeNsC7GIWPyKjR/XikUNkA7HY7z32ta5
 O+f8IBjfEzWSMJphqCCZujEtMFKzjTZ5IO1+3/bCX3sliol/NbfdNgFilDdirBw9S+PJ
 C1SPe99PEkN5FppQdYlfql29iu/VlGQY/VICE80RSts+h4PLIe1dhky5SKHCicX9/kqG
 lQIq/dSB4G/bqj3ijbuSCdLFXLW8EwxBYEid0xH3odt21jajW6pH8gUr+Ld2K3Gu8P5X
 75dQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzUklS0AeBnBexDfp9uq/cuEnMMsiANcXjBS38KBPug2FyK20vKkWbVOZBfEagUcUGZjg/AIFs7Qs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxqxlWVA5WgVYxBzcz5eIa9fgvq8ApQnNirUpdVmoSlgPW3O1Cj
 X7nLKO/F2K/rZcNs78ids6i4rcObLb+mLoCTTwYt3LM2vyfLHz+4D2I6qRFbWA4+NuMkvn4XUQg
 zttM=
X-Gm-Gg: ASbGncshx7c0xYw2JXPZdHZqA60Jye0jpuJHKdZzXJm5wdeU4PSYMpYuF6HSiRjs5ui
 yiUsiwmjCoNyNRGHIU9L+64WBv+tTRVZ19NXUlWi6fNPev5tvD2V5PxvkWhisaQuhF6AoWdIJpk
 AiybGRhB5gQZVL7+qPpRm4VACK51mw/Sm4dJQupw1A/p/aQLizWFV6RMlpGaFR3vGWY4IJ/QQwc
 8/IrfwV7fNmTXQJYQymoEFkyTwkDrJX/8GK+6cEMpwX8jHc3fdSZyAzumHauUGDYheLrqUCz82a
 x7ofnzcgBRSMtTNJtyCn8m+xrviygJVngHERTgPnZjO28wC/FEzB6gaxUnn3cH51ngg03Xs=
X-Google-Smtp-Source: AGHT+IF05hjnakzwKRMNzAORQhT+bWDxrwRXpn3TfkAben5IGr+ferileSAupXWycBYUMqKX0KPRqA==
X-Received: by 2002:a05:6512:2254:b0:545:5de:f46e with SMTP id
 2adb3069b0e04-54505def563mr2412041e87.39.1739205210432; 
 Mon, 10 Feb 2025 08:33:30 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5450654e778sm696499e87.60.2025.02.10.08.33.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2025 08:33:30 -0800 (PST)
Date: Mon, 10 Feb 2025 18:33:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 daniel@ffwll.ch, kong.kongxinwei@hisilicon.com, liangjian010@huawei.com, 
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com, 
 shenjian15@huawei.com, shaojijie@huawei.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 drm-dp 1/7] drm/hisilicon/hibmc: Add dp phy cfg to
 adjust serdes rate, voltage and pre-emphasis
Message-ID: <63t7lgayor3rpsdbeluwjt6ccohmsz4facj6illae6wn5nhbu4@kek3iggrioq4>
References: <20250210144959.100551-1-shiyongbang@huawei.com>
 <20250210144959.100551-2-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210144959.100551-2-shiyongbang@huawei.com>
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

On Mon, Feb 10, 2025 at 10:49:53PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> This serdes is inited and configured for dp, and integrating them into dp
> init and dp link training process.
> For rate changing, we can change from 1.62-8.2Gpbs by cfg reg.
> For voltage and pre-emphasis levels changing, we can cfg different
> serdes ffe value.
> 
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
> ChangeLog:
> v1 -> v2:
>   - splittting the patch and add more detailed the changes in the commit message, suggested by Dmitry Baryshkov.
>   - changing all names of dp phy to dp serdes.

Nit: subject still mentions phy.

Nit #2: The s/phy/serdes/ doesn't change the fact that you are still
doing PHY-like programming. As such, please mention in the commit
message that using PHY subsystem is impossible for you.

> ---
>  drivers/gpu/drm/hisilicon/hibmc/Makefile      |  2 +-
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h  |  1 +
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    |  4 +
>  .../gpu/drm/hisilicon/hibmc/dp/dp_serdes.c    | 74 +++++++++++++++++++
>  .../gpu/drm/hisilicon/hibmc/dp/dp_serdes.h    | 36 +++++++++
>  5 files changed, 116 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c
>  create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.h
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/Makefile b/drivers/gpu/drm/hisilicon/hibmc/Makefile
> index 95a4ed599d98..43de077d6769 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/Makefile
> +++ b/drivers/gpu/drm/hisilicon/hibmc/Makefile
> @@ -1,5 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  hibmc-drm-y := hibmc_drm_drv.o hibmc_drm_de.o hibmc_drm_vdac.o hibmc_drm_i2c.o \
> -	       dp/dp_aux.o dp/dp_link.o dp/dp_hw.o hibmc_drm_dp.o
> +	       dp/dp_aux.o dp/dp_link.o dp/dp_hw.o dp/dp_serdes.o hibmc_drm_dp.o
>  
>  obj-$(CONFIG_DRM_HISI_HIBMC) += hibmc-drm.o
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
> index 2c52a4476c4d..e7746bc4b592 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
> @@ -38,6 +38,7 @@ struct hibmc_dp_dev {
>  	struct mutex lock; /* protects concurrent RW in hibmc_dp_reg_write_field() */
>  	struct hibmc_dp_link link;
>  	u8 dpcd[DP_RECEIVER_CAP_SIZE];
> +	void __iomem *serdes_base;
>  };
>  
>  #define dp_field_modify(reg_value, mask, val)				\
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> index a8d543881c09..39fd3687efca 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> @@ -7,6 +7,7 @@
>  #include "dp_comm.h"
>  #include "dp_reg.h"
>  #include "dp_hw.h"
> +#include "dp_serdes.h"
>  
>  static void hibmc_dp_set_tu(struct hibmc_dp_dev *dp, struct drm_display_mode *mode)
>  {
> @@ -165,6 +166,9 @@ int hibmc_dp_hw_init(struct hibmc_dp *dp)
>  
>  	hibmc_dp_aux_init(dp_dev);
>  
> +	if (hibmc_dp_serdes_init(dp_dev))
> +		return -EAGAIN;

Can you simply propagate the return value here?

> +
>  	dp_dev->link.cap.lanes = 0x2;
>  	dp_dev->link.cap.link_rate = DP_LINK_BW_2_7;
>  
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c
> new file mode 100644
> index 000000000000..66586db2268a
> --- /dev/null
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c
> @@ -0,0 +1,74 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// Copyright (c) 2024 Hisilicon Limited.
> +
> +#include <linux/delay.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_print.h>
> +#include "dp_comm.h"
> +#include "dp_config.h"
> +#include "dp_reg.h"
> +#include "dp_serdes.h"
> +
> +int hibmc_dp_serdes_set_tx_cfg(struct hibmc_dp_dev *dp, u8 train_set[HIBMC_DP_LANE_NUM_MAX])
> +{
> +	u32 serdes_tx_cfg[4][4] = { {DP_SERDES_VOL0_PRE0, DP_SERDES_VOL0_PRE1,

static const

> +				     DP_SERDES_VOL0_PRE2, DP_SERDES_VOL0_PRE3},
> +				    {DP_SERDES_VOL1_PRE0, DP_SERDES_VOL1_PRE1,
> +				     DP_SERDES_VOL1_PRE2}, {DP_SERDES_VOL2_PRE0,
> +				     DP_SERDES_VOL2_PRE1}, {DP_SERDES_VOL3_PRE0}};
> +	int cfg[2];
> +	int i;
> +
> +	for (i = 0; i < HIBMC_DP_LANE_NUM_MAX; i++) {
> +		cfg[i] = serdes_tx_cfg[(train_set[i] & 0x3)]
> +			 [(train_set[i] << DP_TRAIN_PRE_EMPHASIS_SHIFT & 0x3)];
> +		if (!cfg[i]) {
> +			cfg[i] = DP_SERDES_VOL3_PRE0;
> +			drm_warn(dp->dev, "dp serdes cfg beyonds the allowable range\n");

Is it something that you should be mitigating? Can you return -EINVAL
instead?

> +		}
> +
> +		/* lane1 offset is 4 */
> +		writel(FIELD_PREP(HIBMC_DP_PMA_TXDEEMPH, cfg[i]),
> +		       dp->serdes_base + HIBMC_DP_PMA_LANE0_OFFSET + i * 4);
> +	}
> +
> +	usleep_range(300, 500);
> +
> +	if (readl(dp->serdes_base + HIBMC_DP_LANE_STATUS_OFFSET) != DP_SERDES_DONE) {
> +		drm_err(dp->dev, "dp serdes cfg failed\n");

drm_dbg?

> +		return -EAGAIN;
> +	}
> +
> +	return 0;
> +}
> +
> +int hibmc_dp_serdes_rate_switch(u8 rate, struct hibmc_dp_dev *dp)
> +{
> +	writel(rate, dp->serdes_base + HIBMC_DP_LANE0_RATE_OFFSET);
> +	writel(rate, dp->serdes_base + HIBMC_DP_LANE1_RATE_OFFSET);
> +
> +	usleep_range(300, 500);
> +
> +	if (readl(dp->serdes_base + HIBMC_DP_LANE_STATUS_OFFSET) != DP_SERDES_DONE) {
> +		drm_err(dp->dev, "dp serdes rate switching failed\n");
> +		return -EAGAIN;
> +	}
> +
> +	if (rate < DP_SERDES_BW_8_1)
> +		drm_warn(dp->dev, "reducing serdes rate to :%d\n",
> +			 rate ? rate * HIBMC_DP_LINK_RATE_CAL * 10 : 162);

drm_dbg

> +
> +	return 0;
> +}
> +
> +int hibmc_dp_serdes_init(struct hibmc_dp_dev *dp)
> +{
> +	dp->serdes_base = dp->base + HIBMC_DP_HOST_OFFSET;
> +
> +	writel(FIELD_PREP(HIBMC_DP_PMA_TXDEEMPH, DP_SERDES_VOL0_PRE0),
> +	       dp->serdes_base + HIBMC_DP_PMA_LANE0_OFFSET);
> +	writel(FIELD_PREP(HIBMC_DP_PMA_TXDEEMPH, DP_SERDES_VOL0_PRE0),
> +	       dp->serdes_base + HIBMC_DP_PMA_LANE1_OFFSET);
> +
> +	return hibmc_dp_serdes_rate_switch(DP_SERDES_BW_8_1, dp);
> +}
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.h
> new file mode 100644
> index 000000000000..57f7f054f2b7
> --- /dev/null
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.h
> @@ -0,0 +1,36 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/* Copyright (c) 2025 Hisilicon Limited. */
> +
> +#ifndef DP_SERDES_H
> +#define DP_SERDES_H
> +
> +#define HIBMC_DP_HOST_OFFSET		0x10000
> +#define HIBMC_DP_LANE0_RATE_OFFSET	0x4
> +#define HIBMC_DP_LANE1_RATE_OFFSET	0xc
> +#define HIBMC_DP_LANE_STATUS_OFFSET	0x10
> +#define HIBMC_DP_PMA_LANE0_OFFSET	0x18
> +#define HIBMC_DP_PMA_LANE1_OFFSET	0x1c
> +#define HIBMC_DP_PMA_TXDEEMPH		GENMASK(18, 1)
> +
> +#define DP_SERDES_VOL0_PRE0		0x280
> +#define DP_SERDES_VOL0_PRE1		0x2300
> +#define DP_SERDES_VOL0_PRE2		0x53c0
> +#define DP_SERDES_VOL0_PRE3		0x8400
> +#define DP_SERDES_VOL1_PRE0		0x380
> +#define DP_SERDES_VOL1_PRE1		0x3440
> +#define DP_SERDES_VOL1_PRE2		0x6480
> +#define DP_SERDES_VOL2_PRE0		0x500
> +#define DP_SERDES_VOL2_PRE1		0x4500
> +#define DP_SERDES_VOL3_PRE0		0x600

These need some explanation.

> +#define DP_SERDES_BW_8_1		0x3
> +#define DP_SERDES_BW_5_4		0x2
> +#define DP_SERDES_BW_2_7		0x1
> +#define DP_SERDES_BW_1_62		0x0
> +
> +#define DP_SERDES_DONE			0x3
> +
> +int hibmc_dp_serdes_init(struct hibmc_dp_dev *dp);
> +int hibmc_dp_serdes_rate_switch(u8 rate, struct hibmc_dp_dev *dp);
> +int hibmc_dp_serdes_set_tx_cfg(struct hibmc_dp_dev *dp, u8 train_set[HIBMC_DP_LANE_NUM_MAX]);
> +
> +#endif
> -- 
> 2.33.0
> 

-- 
With best wishes
Dmitry
