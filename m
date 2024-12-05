Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E952D9E6141
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 00:25:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3818210E173;
	Thu,  5 Dec 2024 23:25:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wUfIyFId";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EBAE10E173
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 23:25:53 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2ffdf564190so15100161fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2024 15:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733441151; x=1734045951; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9FlG7yhfNag0hwET+zB1Fq/KrhhKmeA4urtrBHSuoPE=;
 b=wUfIyFId5qv1+7DkAC01vdIU+E2NgGv2IS592OgWpxeug4irKwW2l4+qJKtKJ21Emo
 muPQKsCYez2/3xOOda7ciaqhEq23Kfe4ly78zv9caCiOWJRVIeLgi7m159+fTr13A2oz
 Kq0r9UZ9C6HiDq3QDnoAa2Vb6/Nbao0TbRjvuqS0Xw3yiNhpQdP5wRjmFvylP0HP6qyQ
 pSi1RF+vMl2SOpsnMZvNzA5ZJXSup0ywKyGJUvjb7UK4uKbkltLlAc1b1eYOWUwhvI6/
 l2ZxWyBIxJRDO1EfA5MIz/PXzgm9WPeoc8pbuuVMiTZqDykM7y6L8CDKXXFBYpwigS1H
 IOfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733441151; x=1734045951;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9FlG7yhfNag0hwET+zB1Fq/KrhhKmeA4urtrBHSuoPE=;
 b=FtZsyS6Cn2PMRxrZVa1lrHPptoJ8I3x+6uL6DgwZj3Je228CVgh57cAORkFC/PSGb0
 ifBpZ2Us6T7cDap0cowRu0glb4sauVpn2R8YZlLYag/qJaaT7NNu6YfbHwsV50OJLvWG
 FZsYGm7PPoxJCXDSYkSyXFLr+JaragsNhf3LEaYcCvHU8DyrOWWLj8qfeZXEpaYO6bik
 1PMDsaMYth/cyuTMwhjbWugol8I0vc/vk/KgwyqhDL7xsOPXXXxkHAvG8CfouVHvis0p
 y63Vdpb/UFP93DyW3wbWalzEuDpGzsXvVjGkdFoLh7fgcIJst1po60vmLFle7JvJF+eM
 hGFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtTWwkXfDobdA10nubt9Ab0sSpp/c/X2N2cbztCL/+9d25lWAOHEeuIUB72RDrNw2I4YwJbWbV4n4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxsY/DkmDE1U3n/u8fnPJAwvtypncw6lm1tPhltcMO3TPmDZwqM
 HI9w0eLFd+fWy5H8Wa/+VUE0uS7Qg/BuMx5sPXa5KOXGdPVScFfmuDQCjFRgdwoj7Z5n5OlTkcc
 +
X-Gm-Gg: ASbGnctN4S3LiMP1v/tGwnEnQPbog4Dsggu+mTAwR/DrruhGLxabpmW5HkwpERF949D
 QgyCjhcyuqoOxQqcsi/rk02PxApLN0fWi71BXmlvqEgUqk8QofgHJHB6kj3AScXJ8t5o/RkIjZT
 P207E0owGvfLgaV6TWrTFoW/tCdcZ8rACPvsqD5dAe87ldmTFyGri9nJtbuPz6LYZwJ/D0H/Tp0
 ib9AM8ak8ft8N62XXxVTU0aMjNMsdgj4ypdqlo8y1HcbgkIuwsW0aeqBmwlDbJ6DPCYnyugaqtr
 1l2lOZAlRQfz1bX7ttOsZhLrBXMYrA==
X-Google-Smtp-Source: AGHT+IG3QMXw/m+7lHuXqEEDNuL02EQbGHmtd5Y4ORCYfaK/60JwZdmYAuv6er8IN52O8KWaJeqlHQ==
X-Received: by 2002:a05:651c:211a:b0:300:1dbd:b248 with SMTP id
 38308e7fff4ca-3002f688966mr2145701fa.4.1733441151391; 
 Thu, 05 Dec 2024 15:25:51 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30020da2637sm3142481fa.39.2024.12.05.15.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2024 15:25:50 -0800 (PST)
Date: Fri, 6 Dec 2024 01:25:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 daniel@ffwll.ch, kong.kongxinwei@hisilicon.com, liangjian010@huawei.com, 
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com, 
 shenjian15@huawei.com, shaojijie@huawei.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 drm-dp 2/5] drm/hisilicon/hibmc: add dp link moduel in
 hibmc
Message-ID: <yyunb5oxzlmrrcxlsrub4j7iwwpaptbvubbtxr3omjftietc5b@3tfg2ldxeaoa>
References: <20241202131322.1847078-1-shiyongbang@huawei.com>
 <20241202131322.1847078-3-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202131322.1847078-3-shiyongbang@huawei.com>
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

On Mon, Dec 02, 2024 at 09:13:19PM +0800, Yongbang Shi wrote:
> From: baihan li <libaihan@huawei.com>
> 
> Add link training process functions in this moduel.
> 
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
> Changelog:
> v5 -> v6:
>   - using drm_dbg_dp() to print debug info instead of drm_info(), suggested by Dmitry Baryshkov.
> v3 -> v4:
>   - optimizing hibmc_dp_link_get_adjust_train() to delete for loop, suggested by Dmitry Baryshkov.
>   - changing ELNRNG to EIO error code, suggested by Dmitry Baryshkov.
>   - deleting meaningless macro, suggested by Dmitry Baryshkov.
>   - fixing build errors reported by kernel test robot <lkp@intel.com>
>     Closes: https://lore.kernel.org/oe-kbuild-all/202411041559.WIfxRN6n-lkp@intel.com/
> v2 -> v3:
>   - using switchcase in dp_link_reduce_lane, suggested by Dmitry Baryshkov.
>   - deleting dp_link_pattern2dpcd function and using macros directly, suggested by Dmitry Baryshkov.
>   - deleting EFAULT error codes, suggested by Dmitry Baryshkov.
> v1 -> v2:
>   - using drm_dp_* functions implement dp link training process, suggested by Jani Nikula.
>   - fix build errors reported by kernel test robot <lkp@intel.com>
>     Closes: https://lore.kernel.org/oe-kbuild-all/202410031735.8iRZZR6T-lkp@intel.com/
>   v1:https://lore.kernel.org/all/20240930100610.782363-1-shiyongbang@huawei.com/
> ---
>  drivers/gpu/drm/hisilicon/hibmc/Makefile     |   2 +-
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h |  24 ++
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c | 339 +++++++++++++++++++
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h  |   8 +
>  4 files changed, 372 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/Makefile b/drivers/gpu/drm/hisilicon/hibmc/Makefile
> index 8770ec6dfffd..94d77da88bbf 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/Makefile
> +++ b/drivers/gpu/drm/hisilicon/hibmc/Makefile
> @@ -1,5 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  hibmc-drm-y := hibmc_drm_drv.o hibmc_drm_de.o hibmc_drm_vdac.o hibmc_drm_i2c.o \
> -	       dp/dp_aux.o
> +	       dp/dp_aux.o dp/dp_link.o
>  
>  obj-$(CONFIG_DRM_HISI_HIBMC) += hibmc-drm.o
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
> index 7d3cd32393c0..8422999acbf0 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
> @@ -13,11 +13,34 @@
>  #include <linux/io.h>
>  #include <drm/display/drm_dp_helper.h>
>  
> +#define HIBMC_DP_LANE_NUM_MAX 2
> +
> +struct hibmc_link_status {
> +	bool clock_recovered;
> +	bool channel_equalized;
> +};
> +
> +struct hibmc_link_cap {
> +	int rx_dpcd_revision;
> +	u8 link_rate;
> +	u8 lanes;
> +	bool is_tps3;
> +	bool is_tps4;

These two fields are set neither in this patch nor in any of the
following patches.

> +};
> +

[...]

> +static int hibmc_dp_link_training_configure(struct hibmc_dp_dev *dp)
> +{
> +	u8 buf[2];
> +	int ret;
> +
> +	/* DP 2 lane */
> +	hibmc_dp_reg_write_field(dp, HIBMC_DP_PHYIF_CTRL0, HIBMC_DP_CFG_LANE_DATA_EN,
> +				 dp->link.cap.lanes == 0x2 ? 0x3 : 0x1);
> +	hibmc_dp_reg_write_field(dp, HIBMC_DP_DPTX_GCTL0, HIBMC_DP_CFG_PHY_LANE_NUM,
> +				 dp->link.cap.lanes == 0x2 ? 0x1 : 0);
> +
> +	/* enhanced frame */
> +	hibmc_dp_reg_write_field(dp, HIBMC_DP_VIDEO_CTRL, HIBMC_DP_CFG_STREAM_FRAME_MODE, 0x1);
> +
> +	/* set rate and lane count */
> +	buf[0] = dp->link.cap.link_rate;
> +	buf[1] = DP_LANE_COUNT_ENHANCED_FRAME_EN | dp->link.cap.lanes;
> +	ret = drm_dp_dpcd_write(&dp->aux, DP_LINK_BW_SET, buf, sizeof(buf));
> +	if (ret != sizeof(buf)) {
> +		drm_dbg_dp(dp->dev, "dp aux write link rate and lanes failed, ret: %d\n", ret);
> +		return ret >= 0 ? -EIO : ret;
> +	}
> +
> +	/* set 8b/10b and downspread */
> +	buf[0] = 0x10;

DP_SPREAD_AMP_0_5

> +	buf[1] = 0x1;

DP_SET_ANSI_8B10B

> +	ret = drm_dp_dpcd_write(&dp->aux, DP_DOWNSPREAD_CTRL, buf, sizeof(buf));
> +	if (ret != sizeof(buf)) {
> +		drm_dbg_dp(dp->dev, "dp aux write 8b/10b and downspread failed, ret: %d\n", ret);
> +		return ret >= 0 ? -EIO : ret;
> +	}
> +
> +	ret = drm_dp_read_dpcd_caps(&dp->aux, dp->dpcd);
> +	if (ret)
> +		drm_err(dp->dev, "dp aux read dpcd failed, ret: %d\n", ret);
> +
> +	return ret;
> +}
> +

-- 
With best wishes
Dmitry
