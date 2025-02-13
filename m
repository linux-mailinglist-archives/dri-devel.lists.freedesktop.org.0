Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2D0A333E5
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 01:16:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED3910E343;
	Thu, 13 Feb 2025 00:16:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MxwXj2aC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FD0310E337
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 00:16:48 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-54505a75445so255917e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 16:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739405806; x=1740010606; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YNojiPGIwmTnD2aQgl4PtXpSpweN7zZq2UUPGSnBLak=;
 b=MxwXj2aCBgbeT1e2MQkQ/DJUlVnj44nL0WV000N6NgCv/5JhJBDPysFyMQyyzhnUUA
 iJ9jRj16xNXntgBGcoS8jW2KtSj5uRqJzEJ0hKCvmnuc2UVtfKxLCHhaRJ+NIV3kFYCA
 zDjKBnNhBOtjufAq/iTR4q3uNzl6NL7ScTEGjuQ+PUTySfC+/khJ9GHajEOouIAElo0J
 TBpZgnkp4W8UfXfrev79X3wVGl5dVjwY5Ogjxon+KhB31zK7YP6RZL/2PpNbnxCrCnUT
 nxl2WKZ4vg11uzouiSJQAH7lXeetwmJO0VbN2tMz1mVC9sowpIGUtHstAQjOt4kCKS9q
 Fi2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739405806; x=1740010606;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YNojiPGIwmTnD2aQgl4PtXpSpweN7zZq2UUPGSnBLak=;
 b=rRnNuScT1r3AgWHsDtsKNUJsx2Xwpsz0pC80GPn51WM2mKuCNO/rIpUdgQnb8NM0YM
 HUGX8THTT+ewhNQ9L32iRW6UJhh4XI7K2SYsHBplRmLshjEUKQnZWIKS/w6DvpSxv419
 R8tWiHu38p9LBand9RyvuDbhaXwFkorxkTVb9p1rq42Mt6ldwrsWreACJyTpvvK64boX
 eWGbxjMgJpQZF3saeE+Oxca87wOCLeQSX/N9aEoJObcGeMGD5dSbaRKyKWAZ8AADUDif
 pdEK2v3hPPcwpGhk91CHXNHj5MeNrGxfcG23JIvYs0r0snngRpBZvaX6GP/ND32j9nrW
 hgrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCURpIamWiGOfBZwCfTgX0KVuuT2622Q91ga2lRZrKdEqbyEb3IF+v63Wx0/IyfhJRqoUN6aHHiffqw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCFXArqCgCccdMZtCqwXLSKbvVUCQNEM62KtYq4+eL92kVYu78
 QVZ1mfEtKjySq+bKzg3o/ypV+4wMjYZDNzEyHF1ybkQ7aNT2seNPkcCYMXyOVIs=
X-Gm-Gg: ASbGnct9lN5NjINDDtw9ax5pxgs6ljKuaQMDBRj0C+qcrPCSBsWhFRFKlmWZ2iFYxzB
 UyP5tRbucSCPKtGZYVoxF0K+NsH8z6i/lm/Qeo9ozJ9JDBrb2lRZzF0mbsbCBTWHLq4nuPsUmr5
 z71WdeencfU1/OzWcpJ2MaKC8Jwxk9P8BggqMe1rkcByICqkRtJZvg7KaDs469mnzvs9PPoScNV
 VUfEjDUwFsixaPPbvBJZI9Ia80BcduvDWToUhGx37Ua3RgtpIjHM85kF7QiyqG082nz2zxR3nMc
 h/HCguP+MQgbeWyKo8BVCV7RVD/s53Sug95W0KCXvVLez4RcVNsNoTv8k1578f1XLbJ8p2U=
X-Google-Smtp-Source: AGHT+IFm2b5ZFdLpsW1I/jMStjPpwbZ6rfWR3X6ILYKNwXLU3A6PtwOHOnRtb0hSYaN/5Cbm1RucuQ==
X-Received: by 2002:a05:6512:1288:b0:545:1104:617d with SMTP id
 2adb3069b0e04-545180ea318mr1509102e87.11.1739405806487; 
 Wed, 12 Feb 2025 16:16:46 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5451f0832absm16331e87.39.2025.02.12.16.16.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2025 16:16:45 -0800 (PST)
Date: Thu, 13 Feb 2025 02:16:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 daniel@ffwll.ch, kong.kongxinwei@hisilicon.com, liangjian010@huawei.com, 
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com, 
 shenjian15@huawei.com, shaojijie@huawei.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 drm-dp 4/7] drm/hisilicon/hibmc: Add colorbar-cfg: set
 color bar cfg
Message-ID: <msjbkixuc27nxqzqgewvtwaa3yszfp3fwrv4qiot4petpxrtyu@3n6crntdm2ay>
References: <20250210144959.100551-1-shiyongbang@huawei.com>
 <20250210144959.100551-5-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210144959.100551-5-shiyongbang@huawei.com>
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

On Mon, Feb 10, 2025 at 10:49:56PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> This is a DP IP controller's feature. It can be used as a debug method
> which can check DP controller is working good. The colorbar displaying
> doesn't rely on other IPs work in the chip, like: GPU or DDR (vram) and
> so on, because colorbar diplaying data is generated by controller itself
> inside the DP IP.

You are describing it in a pretty strange manner. Does this sound
better?

DP controller can support generating a color bar signal over the
DisplayPort interface. This can be useful to check for possible memory
or GPU problems, as the signal generator resides completely in the DP
block. Add debugfs file that controls colorbar generator.

This also requires having corresponding debugfs entry here.

> 
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
> ChangeLog:
> v1 -> v2:
>   - add colorbar introduction in commit, suggested by Dmitry Baryshkov.
>   - splittting colorbar and debugfs in different patches, suggested by Dmitry Baryshkov.
> ---
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c  | 43 +++++++++++++++++++++
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h  | 29 ++++++++++++++
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h |  2 +
>  3 files changed, 74 insertions(+)
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> index 77f02d5151f7..8adace0befde 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> @@ -226,3 +226,46 @@ int hibmc_dp_mode_set(struct hibmc_dp *dp, struct drm_display_mode *mode)
>  
>  	return 0;
>  }
> +
> +static const struct hibmc_dp_color_raw g_rgb_raw[] = {
> +	{CBAR_COLOR_BAR, 0x000, 0x000, 0x000},
> +	{CBAR_WHITE,     0xfff, 0xfff, 0xfff},
> +	{CBAR_RED,       0xfff, 0x000, 0x000},
> +	{CBAR_ORANGE,    0xfff, 0x800, 0x000},
> +	{CBAR_YELLOW,    0xfff, 0xfff, 0x000},
> +	{CBAR_GREEN,     0x000, 0xfff, 0x000},
> +	{CBAR_CYAN,      0x000, 0x800, 0x800},
> +	{CBAR_BLUE,      0x000, 0x000, 0xfff},
> +	{CBAR_PURPLE,    0x800, 0x000, 0x800},
> +	{CBAR_BLACK,     0x000, 0x000, 0x000},
> +};
> +
> +void hibmc_dp_set_cbar(struct hibmc_dp *dp, const struct hibmc_dp_cbar_cfg *cfg)
> +{
> +	struct hibmc_dp_dev *dp_dev = dp->dp_dev;
> +	struct hibmc_dp_color_raw raw_data;
> +
> +	if (cfg->enable) {
> +		hibmc_dp_reg_write_field(dp_dev, HIBMC_DP_COLOR_BAR_CTRL, BIT(9),
> +					 cfg->self_timing);
> +		hibmc_dp_reg_write_field(dp_dev, HIBMC_DP_COLOR_BAR_CTRL, GENMASK(8, 1),
> +					 cfg->dynamic_rate);
> +		if (cfg->pattern == CBAR_COLOR_BAR) {
> +			hibmc_dp_reg_write_field(dp_dev, HIBMC_DP_COLOR_BAR_CTRL, BIT(10), 0);
> +		} else {
> +			raw_data = g_rgb_raw[cfg->pattern];
> +			drm_dbg_dp(dp->drm_dev, "r:%x g:%x b:%x\n", raw_data.r_value,
> +				   raw_data.g_value, raw_data.b_value);
> +			hibmc_dp_reg_write_field(dp_dev, HIBMC_DP_COLOR_BAR_CTRL, BIT(10), 1);
> +			hibmc_dp_reg_write_field(dp_dev, HIBMC_DP_COLOR_BAR_CTRL, GENMASK(23, 12),
> +						 raw_data.r_value);
> +			hibmc_dp_reg_write_field(dp_dev, HIBMC_DP_COLOR_BAR_CTRL1, GENMASK(23, 12),
> +						 raw_data.g_value);
> +			hibmc_dp_reg_write_field(dp_dev, HIBMC_DP_COLOR_BAR_CTRL1, GENMASK(11, 0),
> +						 raw_data.b_value);
> +		}
> +	}
> +
> +	hibmc_dp_reg_write_field(dp_dev, HIBMC_DP_COLOR_BAR_CTRL, BIT(0), cfg->enable);
> +	writel(HIBMC_DP_SYNC_EN_MASK, dp_dev->base + HIBMC_DP_TIMING_SYNC_CTRL);
> +}
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
> index 53b6d0beecea..621a0a1d7eb7 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
> @@ -14,6 +14,33 @@
>  
>  struct hibmc_dp_dev;
>  
> +enum hibmc_dp_cbar_pattern {
> +	CBAR_COLOR_BAR,
> +	CBAR_WHITE,
> +	CBAR_RED,
> +	CBAR_ORANGE,
> +	CBAR_YELLOW,
> +	CBAR_GREEN,
> +	CBAR_CYAN,
> +	CBAR_BLUE,
> +	CBAR_PURPLE,
> +	CBAR_BLACK,
> +};
> +
> +struct hibmc_dp_color_raw {
> +	enum hibmc_dp_cbar_pattern pattern;
> +	u32 r_value;
> +	u32 g_value;
> +	u32 b_value;
> +};
> +
> +struct hibmc_dp_cbar_cfg {
> +	bool enable;
> +	bool self_timing;
> +	u8 dynamic_rate; /* 0:static, 1-255(frame):dynamic */
> +	enum hibmc_dp_cbar_pattern pattern;
> +};
> +
>  struct hibmc_dp {
>  	struct hibmc_dp_dev *dp_dev;
>  	struct drm_device *drm_dev;
> @@ -21,10 +48,12 @@ struct hibmc_dp {
>  	struct drm_connector connector;
>  	void __iomem *mmio;
>  	struct drm_dp_aux aux;
> +	struct hibmc_dp_cbar_cfg cfg;
>  };
>  
>  int hibmc_dp_hw_init(struct hibmc_dp *dp);
>  int hibmc_dp_mode_set(struct hibmc_dp *dp, struct drm_display_mode *mode);
>  void hibmc_dp_display_en(struct hibmc_dp *dp, bool enable);
> +void hibmc_dp_set_cbar(struct hibmc_dp *dp, const struct hibmc_dp_cbar_cfg *cfg);
>  
>  #endif
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
> index f2fa9807d8ab..c43ad6b30c2c 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
> @@ -23,6 +23,8 @@
>  #define HIBMC_DP_VIDEO_MSA1			0x11c
>  #define HIBMC_DP_VIDEO_MSA2			0x120
>  #define HIBMC_DP_VIDEO_HORIZONTAL_SIZE		0X124
> +#define HIBMC_DP_COLOR_BAR_CTRL			0x260
> +#define HIBMC_DP_COLOR_BAR_CTRL1		0x264
>  #define HIBMC_DP_TIMING_GEN_CONFIG0		0x26c
>  #define HIBMC_DP_TIMING_GEN_CONFIG2		0x274
>  #define HIBMC_DP_TIMING_GEN_CONFIG3		0x278
> -- 
> 2.33.0
> 

-- 
With best wishes
Dmitry
