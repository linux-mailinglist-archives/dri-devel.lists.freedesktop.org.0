Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB28A333FF
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 01:32:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EB0410E0A9;
	Thu, 13 Feb 2025 00:32:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YhynjHT3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5122910E9B0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 00:32:26 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-3072f8dc069so3295071fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 16:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739406744; x=1740011544; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1zHhZW0PtiVglVCQQ6HaP/ZxVchC1gguQ+ErerQXn0c=;
 b=YhynjHT3dHOk/13Hja6fMPw4A8/hQZD0ScIcogKaG4kaY8qcZ/7nIJiugwnH0OhFLw
 PlyMdSVkmJhwTjyoPdX0mVmWCY8lJR7pXOkgeJ8xP7Uwz/OyBOJXLjMh4RfZCzwFK4EA
 XjEwUcSwDduTH2k1OOz7fCl82AumcMiOe4OHX42bU5ud6MOGRFJMOWL5BJ/SLdkFBZxw
 trPkFDJxFnx5ks7WuuoqA2+EyPT9FuzGpyl5iFtJrJbhMGeUWtO0lnD3xwmFfbCt1KhR
 NB0HE6Hbr/vCz1ANqqQYKfcoUdOmTtTabYy91mY4nzAWwmAgGtkWYOSrBlC+mueln8z3
 cXqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739406744; x=1740011544;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1zHhZW0PtiVglVCQQ6HaP/ZxVchC1gguQ+ErerQXn0c=;
 b=sSuBdN97yY0wjVDAUE+HuwZK9mmD8Fxkq37LSgdtG4rJLlM6p+J2saczAS92fJWyNW
 28J8/mkHs5vV/zyclLqnS+2VB3A844PSnbwSnkQZcUjB7PIEiv3MTodbH7oVQy5BOvu3
 BlWq0GGea/dFq8oCLO/AekU3uDTTr/oGsJlSdu8PJgnIxUGYsRbJdvTQ7gc4bb+BF4Jr
 dGjUezj2AuGZ0Gy0qZFPrV1yTN6TfEf9rZZyyuEx/K+7vi4KTbCzrDDEgM6XQW3u8MDX
 0YASy73d70PdophC8hjPA9guyqlWPtLAjbzMHeWPKKLyW++/USB8g8rYRYsZHBLS+BMY
 xKmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUR/hOxBApDcEJyZgN6FPT0IQr4b5+O4cpPRiNW5qDWIdxgP81dfjrVG126wrVVjKQwEJdxkJtvXww=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyqv/NdBrMzt6bqVH399/+c3KI3/1tU4/OnqRFwrETAP328PndV
 Ok8Zdpc98732/6l6yCkbDiimppFOIcOi836mXzZMrznaZJ/zN8ElYSVHo4TsXb8=
X-Gm-Gg: ASbGncvHcB7DpsYa5AgCazRM9ByipDlshskbPtXWO/t8gXLiyo+6O3K75/tfw8MIhhr
 FyVFROUqGTZRqrGA/XWjheugIXE3ivCSbbQ9qr1106t8PF01p2E0ICKthRD6kJ7fOpi1MzJw4I+
 y5bpDOH8uNnZNo/8uWusI8X6OjjNvTMtOtEkNRhVurTWi8SCvUxW195dAqnhr4UtxENaClej+21
 fQ6nMQfT9ug1XQZZLZyu4Q0J49uQY4cZYXHYmdCIqAQtmfJoaPQV9mKfoij9wXFWyZMNM+9VdXW
 1/PEJAi1tCdJZwwc1W3Garb1CcAR9MgSR+pAYNoJrc3DP4ICYV0cXbcaGCK8DnePiIQ6DaI=
X-Google-Smtp-Source: AGHT+IEArsUcvVPeYrZBwxnDDl7vuZk0nY8nJEpvr5fdwgUL8uWe2QI+7plrNZeEdVTvnOM7l92iSA==
X-Received: by 2002:a05:651c:19a3:b0:302:2cdf:7fbb with SMTP id
 38308e7fff4ca-3090362f7e6mr18558401fa.6.1739406744269; 
 Wed, 12 Feb 2025 16:32:24 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3091029b34asm369751fa.97.2025.02.12.16.32.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2025 16:32:23 -0800 (PST)
Date: Thu, 13 Feb 2025 02:32:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 daniel@ffwll.ch, kong.kongxinwei@hisilicon.com, liangjian010@huawei.com, 
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com, 
 shenjian15@huawei.com, shaojijie@huawei.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 drm-dp 6/7] drm/hisilicon/hibmc: Add drm debugfs
 functions
Message-ID: <afi5npgvnrp56oufhc7576auya26lbwgu377dprddode2kp3sb@u5ctx4o22w4v>
References: <20250210144959.100551-1-shiyongbang@huawei.com>
 <20250210144959.100551-7-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210144959.100551-7-shiyongbang@huawei.com>
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

On Mon, Feb 10, 2025 at 10:49:58PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> We use the previous two patches as our debug functions and
> generate two files. "hibmc-dp" and "color-bar".
> hibmc-dp: read only, print the dp link status and dpcd version

Please define a generic DP attribute for this, handle it in
drm_dp_helper.c. Other drivers then can reuse this debugfs file.
Also note drm_dp_downstream_debug(), it might also be helpful.
Also see msm_dp_debug_show() for inspiration

> color-bar: read/write
>            write: cfg color bar and enable/disable it by your input
>            read: print your current cfg info of color-bar

This really should go into your color-bar patch.

> 
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
> ChangeLog:
> v1 -> v2:
>   - deleting edid decoder and its debugfs, suggested by Dmitry Baryshkov.
>   - using debugfs_init() callback, suggested by Dmitry Baryshkov.
> ---
>  drivers/gpu/drm/hisilicon/hibmc/Makefile      |   3 +-
>  .../drm/hisilicon/hibmc/hibmc_drm_debugfs.c   | 124 ++++++++++++++++++
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    |   1 +
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h   |   2 +
>  4 files changed, 129 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_debugfs.c
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/Makefile b/drivers/gpu/drm/hisilicon/hibmc/Makefile
> index 43de077d6769..1f65c683282f 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/Makefile
> +++ b/drivers/gpu/drm/hisilicon/hibmc/Makefile
> @@ -1,5 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  hibmc-drm-y := hibmc_drm_drv.o hibmc_drm_de.o hibmc_drm_vdac.o hibmc_drm_i2c.o \
> -	       dp/dp_aux.o dp/dp_link.o dp/dp_hw.o dp/dp_serdes.o hibmc_drm_dp.o
> +	       dp/dp_aux.o dp/dp_link.o dp/dp_hw.o dp/dp_serdes.o hibmc_drm_dp.o \
> +	       hibmc_drm_debugfs.o
>  
>  obj-$(CONFIG_DRM_HISI_HIBMC) += hibmc-drm.o
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_debugfs.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_debugfs.c
> new file mode 100644
> index 000000000000..af2efb70d6ea
> --- /dev/null
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_debugfs.c
> @@ -0,0 +1,124 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// Copyright (c) 2024 Hisilicon Limited.
> +
> +#include <linux/debugfs.h>
> +#include <linux/device.h>
> +#include <linux/seq_file.h>
> +#include <linux/pci.h>
> +
> +#include <drm/drm_drv.h>
> +#include <drm/drm_file.h>
> +#include <drm/drm_debugfs.h>
> +#include <drm/drm_edid.h>
> +
> +#include "hibmc_drm_drv.h"
> +
> +static int hibmc_dp_show(struct seq_file *m, void *arg)
> +{
> +	struct drm_info_node *node = m->private;
> +	struct drm_device *dev = node->minor->dev;
> +	struct hibmc_drm_private *priv = to_hibmc_drm_private(dev);
> +	int idx;
> +
> +	if (!drm_dev_enter(dev, &idx))
> +		return -ENODEV;
> +
> +	seq_printf(m, "enable lanes: %u\n", hibmc_dp_get_lanes(&priv->dp));
> +	seq_printf(m, "link rate: %d\n", hibmc_dp_get_link_rate(&priv->dp) * 27);
> +	seq_printf(m, "dpcd version: 0x%x\n", hibmc_dp_get_dpcd(&priv->dp));
> +
> +	drm_dev_exit(idx);
> +
> +	return 0;
> +}
> +
> +static ssize_t hibmc_control_write(struct file *file, const char __user *user_buf,
> +				   size_t size, loff_t *ppos)
> +{
> +	struct hibmc_drm_private *priv = file_inode(file)->i_private;
> +	struct hibmc_dp_cbar_cfg *cfg = &priv->dp.cfg;
> +	u32 input = 0;
> +	int ret, idx;
> +	u8 val;
> +
> +	ret = kstrtou32_from_user(user_buf, size, 0, &input);
> +	if (ret)
> +		return ret;
> +
> +	val = FIELD_GET(GENMASK(13, 10), input);
> +	if (val > 9)
> +		return -EINVAL;
> +	cfg->pattern = val;
> +	cfg->enable = FIELD_GET(BIT(0), input);
> +	cfg->self_timing = FIELD_GET(BIT(1), input);
> +	cfg->dynamic_rate = FIELD_GET(GENMASK(9, 2), input);

Having a binary file format is really a sad idea. Can it be a text file
instead?

> +
> +	ret = drm_dev_enter(&priv->dev, &idx);
> +	if (!ret)
> +		return -ENODEV;
> +
> +	hibmc_dp_set_cbar(&priv->dp, cfg);
> +
> +	drm_dev_exit(idx);
> +
> +	return size;
> +}
> +

-- 
With best wishes
Dmitry
