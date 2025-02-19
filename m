Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C78A3BE65
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 13:45:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B460310E2B4;
	Wed, 19 Feb 2025 12:45:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="D1mLWWp4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5D2B10E2B4
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 12:45:17 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-545316f80beso3700632e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 04:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739969116; x=1740573916; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Z217kFaLT0sl618WVzPwLldmHYW2Ds2srfCVEmUlDAg=;
 b=D1mLWWp4guALzYTDGH/6tndf3pxrn++qyIDbMJ96AVuVU2Nrm9sW+3za71jiWRhTmu
 ooBiM8/P3k1wAC7Lla8wgIXuMt9/SU1rCNDzwZyVlNMprop9CzytrFn4VT3u1+PV0b8A
 lYxaF7E+6zOD1fQM3N9jcaPqP//k5VfL127pIX3lBmWnS7MFK2iRPzteoICORiZVrW6C
 a1JnP2BxO32u7zYB8t9K6/6fqcpTy37YO2YfJyAsAUN5vkmxSAiHRNEM0y5P2wCoW2rm
 4qaUDr8+ibNPh+x5bmvyvH0sVOdVNVAEfGCfstPP2dP1ltCKc+QGzo1DfsAFHPCcVELQ
 8j3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739969116; x=1740573916;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z217kFaLT0sl618WVzPwLldmHYW2Ds2srfCVEmUlDAg=;
 b=jlrp97CygYI5iBzxFbnvXPXVkdspS9Pls0G1N3feS5/eRr/V5YJVe55MBePrnZvUoG
 JKjSmBwaZQbHGa9qyKrnG9l7pkcGwwCBu0GNUKivPQxV/HK6VTC5bHiRk0jHljBoJMoz
 AkdJfyFYngcO6e8HTKPmW0LJOhtuxg7s9s3+e0PfNWUt6f3TqOZ37n303WFnzm0SKJT9
 2CmKV8MJ558C8tYyDEuwg5vrUTGPHDr3INJ4xg+ZhWLFwEOg/ucA58IY55hKePtmpywp
 GRDzR/dGOvmYdesvk5vh3aDN98KlBwRTrrg/oDBQtQaTUkl65cmWuzIdjAngk/GGrFcG
 PISg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEx4YZV4zSJiRT3t5TrfDQjxmEVBXDeRYcpmqkXuyI4/2soTsgJ5DiEEJEvGQYlFN70zNYEC7MmS0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyxQefX8BNGpm2GeoyYzSNUINI6nPeFOPEvtSb1syUm0lwcnj6U
 /c58Al0EpKLcxCRfLXSmzmjiBJrQpPQPKtK+CQqGlO94c3bU+OXjE1g69YjTugg=
X-Gm-Gg: ASbGncs8601SxQa/kUN44/P0X6mq2/82XTkiRcIR2+vHQ47IDeyQYeqnF1HpCmTO6eR
 uztYBDoxMdGg6qtKD3UDZYh95mIr1Yud4QYqE5PMnERaS5GPtzg7tSYvgVcfO32zU4AwgsC/L74
 dG3xz9qLgLkz49ED6XyMwh+MOQlfZeVe2OpBiWlTuUnO1c88H67LElDW6igdBl9pFjO5HBO1H/5
 nmy23UTEUPu/cenMOtHNTpTXSW5Bw8ejMkw/temdiiFEvdy/tifOqna+h80dzrSiKFuQXurn5w+
 c7w9rlgye4kE1VBPO0WWp2F0drU+mEopwuyQWqRv/itEEJmm1q8tcW6s3K4Ka/5C4RMU1DI=
X-Google-Smtp-Source: AGHT+IESOn67cir2vYMtY8x3Vv1zDfzqjjVGfcBVqbC1O5W1dGf9M/iO0Mu0IV2x6MnhWhIgNvOc3w==
X-Received: by 2002:a05:6512:280b:b0:545:9e4:ca91 with SMTP id
 2adb3069b0e04-5452fe6af9emr5782243e87.39.1739969115934; 
 Wed, 19 Feb 2025 04:45:15 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54531b8ac1dsm1426567e87.75.2025.02.19.04.45.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 04:45:15 -0800 (PST)
Date: Wed, 19 Feb 2025 14:45:12 +0200
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
Message-ID: <4tt5hs7fztjwoa3nf2f4yvdyaj3izvmqsi6kdh3rsldarn5wj6@qczfv6uzfxbw>
References: <20250210144959.100551-1-shiyongbang@huawei.com>
 <20250210144959.100551-3-shiyongbang@huawei.com>
 <cqlf4jj5mtxig4pw7nn5wi34miisuh7veuv5i4lz2wrxafbdb7@h7glfdpl6tyf>
 <110f8ad3-341c-457d-883e-d417a6a7f9dc@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <110f8ad3-341c-457d-883e-d417a6a7f9dc@huawei.com>
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

On Wed, Feb 19, 2025 at 03:39:10PM +0800, Yongbang Shi wrote:
> > On Mon, Feb 10, 2025 at 10:49:54PM +0800, Yongbang Shi wrote:
> > > From: Baihan Li <libaihan@huawei.com>
> > > 
> > > Add dp serdes cfg in link training process, and related adapting
> > > and modificating. We change some init values about training,
> > Imperative language, please. Use 'change', not 'we change'.
> > 
> > > because we want completely to negotiation process, so we start with
> > > the maximum rate and the electrical characteristic level is 0.
> > > 
> > > Signed-off-by: Baihan Li <libaihan@huawei.com>
> > > Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> > > ---
> > > ChangeLog:
> > > v1 -> v2:
> > >    - splittting the patch and add more detailed the changes in the commit message, suggested by Dmitry Baryshkov.
> > > ---
> > >   .../gpu/drm/hisilicon/hibmc/dp/dp_config.h    |  1 +
> > >   drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    |  6 +++-
> > >   drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c  | 33 ++++++++++++++++---
> > >   drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h   |  1 +
> > >   .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  8 ++---
> > >   5 files changed, 38 insertions(+), 11 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h
> > > index 74dd9956144e..c5feef8dc27d 100644
> > > --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h
> > > +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h
> > > @@ -15,5 +15,6 @@
> > >   #define HIBMC_DP_CLK_EN			0x7
> > >   #define HIBMC_DP_SYNC_EN_MASK		0x3
> > >   #define HIBMC_DP_LINK_RATE_CAL		27
> > > +#define HIBMC_DP_SYNC_DELAY(lanes)	((lanes) == 0x2 ? 86 : 46)
> > >   #endif
> > > diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> > > index 39fd3687efca..ee1ff205ff56 100644
> > > --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> > > +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> > > @@ -3,6 +3,7 @@
> > >   #include <linux/io.h>
> > >   #include <linux/delay.h>
> > > +#include <drm/drm_managed.h>
> > >   #include "dp_config.h"
> > >   #include "dp_comm.h"
> > >   #include "dp_reg.h"
> > > @@ -73,6 +74,9 @@ static void hibmc_dp_set_sst(struct hibmc_dp_dev *dp, struct drm_display_mode *m
> > >   				 HIBMC_DP_CFG_STREAM_HTOTAL_SIZE, htotal_size);
> > >   	hibmc_dp_reg_write_field(dp, HIBMC_DP_VIDEO_HORIZONTAL_SIZE,
> > >   				 HIBMC_DP_CFG_STREAM_HBLANK_SIZE, hblank_size);
> > > +	hibmc_dp_reg_write_field(dp, HIBMC_DP_VIDEO_PACKET,
> > > +				 HIBMC_DP_CFG_STREAM_SYNC_CALIBRATION,
> > > +				 HIBMC_DP_SYNC_DELAY(dp->link.cap.lanes));
> > >   }
> > >   static void hibmc_dp_link_cfg(struct hibmc_dp_dev *dp, struct drm_display_mode *mode)
> > > @@ -170,7 +174,7 @@ int hibmc_dp_hw_init(struct hibmc_dp *dp)
> > >   		return -EAGAIN;
> > >   	dp_dev->link.cap.lanes = 0x2;
> > > -	dp_dev->link.cap.link_rate = DP_LINK_BW_2_7;
> > > +	dp_dev->link.cap.link_rate = DP_LINK_BW_8_1;
> > >   	/* hdcp data */
> > >   	writel(HIBMC_DP_HDCP, dp_dev->base + HIBMC_DP_HDCP_CFG);
> > > diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
> > > index f6355c16cc0a..43a4b656493f 100644
> > > --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
> > > +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
> > > @@ -6,6 +6,7 @@
> > >   #include <drm/drm_print.h>
> > >   #include "dp_comm.h"
> > >   #include "dp_reg.h"
> > > +#include "dp_serdes.h"
> > >   #define HIBMC_EQ_MAX_RETRY 5
> > > @@ -108,7 +109,11 @@ static int hibmc_dp_link_training_cr_pre(struct hibmc_dp_dev *dp)
> > >   		return ret;
> > >   	for (i = 0; i < dp->link.cap.lanes; i++)
> > > -		train_set[i] = DP_TRAIN_VOLTAGE_SWING_LEVEL_2;
> > > +		train_set[i] = DP_TRAIN_VOLTAGE_SWING_LEVEL_0;
> > > +
> > > +	ret = hibmc_dp_serdes_set_tx_cfg(dp, dp->link.train_set);
> > > +	if (ret)
> > > +		return ret;
> > >   	ret = drm_dp_dpcd_write(&dp->aux, DP_TRAINING_LANE0_SET, train_set, dp->link.cap.lanes);
> > >   	if (ret != dp->link.cap.lanes) {
> > > @@ -137,21 +142,28 @@ static bool hibmc_dp_link_get_adjust_train(struct hibmc_dp_dev *dp,
> > >   	return false;
> > >   }
> > > -static inline int hibmc_dp_link_reduce_rate(struct hibmc_dp_dev *dp)
> > > +static int hibmc_dp_link_reduce_rate(struct hibmc_dp_dev *dp)
> > >   {
> > > +	u8 rate = 0;
> > > +
> > >   	switch (dp->link.cap.link_rate) {
> > >   	case DP_LINK_BW_2_7:
> > >   		dp->link.cap.link_rate = DP_LINK_BW_1_62;
> > > -		return 0;
> > > +		rate = DP_SERDES_BW_1_62;
> > > +		break;
> > >   	case DP_LINK_BW_5_4:
> > >   		dp->link.cap.link_rate = DP_LINK_BW_2_7;
> > > -		return 0;
> > > +		rate = DP_SERDES_BW_2_7;
> > > +		break;
> > >   	case DP_LINK_BW_8_1:
> > >   		dp->link.cap.link_rate = DP_LINK_BW_5_4;
> > > -		return 0;
> > > +		rate = DP_SERDES_BW_5_4;
> > > +		break;
> > >   	default:
> > >   		return -EINVAL;
> > >   	}
> > > +
> > > +	return hibmc_dp_serdes_rate_switch(rate, dp);
> > This looks like:
> > 
> > if (dp->link.cap.link_rate == DP_LINK_BW_1_62)
> >      return -EINVAL;
> > 
> > dp->link.cap.link_rate++;
> > return hibmc_dp_serdes_rate_switch(rate, dp);
> 
> We need map DP_LINK_BW_2_7 to DP_SERDES_BW's value firstly, which is for our SERDES' register cfg.
> This value is not like 0x6, 0xa, etc.

Ack

> 
> 
> > >   }
> > >   static inline int hibmc_dp_link_reduce_lane(struct hibmc_dp_dev *dp)
> > > @@ -159,6 +171,7 @@ static inline int hibmc_dp_link_reduce_lane(struct hibmc_dp_dev *dp)
> > >   	switch (dp->link.cap.lanes) {
> > >   	case 0x2:
> > >   		dp->link.cap.lanes--;
> > > +		drm_warn(dp->dev, "dp link training reduce to 1 lane\n");
> > drm_dbg
> > 
> > >   		break;
> > >   	case 0x1:
> > >   		drm_err(dp->dev, "dp link training reduce lane failed, already reach minimum\n");
> > > @@ -206,6 +219,11 @@ static int hibmc_dp_link_training_cr(struct hibmc_dp_dev *dp)
> > >   		}
> > >   		level_changed = hibmc_dp_link_get_adjust_train(dp, lane_status);
> > > +
> > > +		ret = hibmc_dp_serdes_set_tx_cfg(dp, dp->link.train_set);
> > > +		if (ret)
> > > +			return ret;
> > > +
> > >   		ret = drm_dp_dpcd_write(&dp->aux, DP_TRAINING_LANE0_SET, dp->link.train_set,
> > >   					dp->link.cap.lanes);
> > >   		if (ret != dp->link.cap.lanes) {
> > > @@ -255,6 +273,11 @@ static int hibmc_dp_link_training_channel_eq(struct hibmc_dp_dev *dp)
> > >   		}
> > >   		hibmc_dp_link_get_adjust_train(dp, lane_status);
> > > +
> > > +		ret = hibmc_dp_serdes_set_tx_cfg(dp, dp->link.train_set);
> > > +		if (ret)
> > > +			return ret;
> > > +
> > >   		ret = drm_dp_dpcd_write(&dp->aux, DP_TRAINING_LANE0_SET,
> > >   					dp->link.train_set, dp->link.cap.lanes);
> > >   		if (ret != dp->link.cap.lanes) {
> > > diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
> > > index 4a515c726d52..f2fa9807d8ab 100644
> > > --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
> > > +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
> > > @@ -72,5 +72,6 @@
> > >   #define HIBMC_DP_CFG_STREAM_TU_SYMBOL_FRAC_SIZE	GENMASK(9, 6)
> > >   #define HIBMC_DP_CFG_STREAM_HTOTAL_SIZE		GENMASK(31, 16)
> > >   #define HIBMC_DP_CFG_STREAM_HBLANK_SIZE		GENMASK(15, 0)
> > > +#define HIBMC_DP_CFG_STREAM_SYNC_CALIBRATION	GENMASK(31, 20)
> > Please consider restructuring the header so that it becomes more
> > obvious, which register are these masks for.
> > 
> > >   #endif
> > > diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> > > index e6de6d5edf6b..bade693d9730 100644
> > > --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> > > +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> > > @@ -28,9 +28,7 @@
> > >   #include "hibmc_drm_drv.h"
> > >   #include "hibmc_drm_regs.h"
> > > -#define HIBMC_DP_HOST_SERDES_CTRL		0x1f001c
> > > -#define HIBMC_DP_HOST_SERDES_CTRL_VAL		0x8a00
> > > -#define HIBMC_DP_HOST_SERDES_CTRL_MASK		0x7ffff
> > > +#define HIBMC_DP_HOST_SERDES_CTRL	0x1f001c
> > Unnecessary whitespace change.
> > 
> > Why HIBMC_DP_HOST_SERDES_CTRL is not in the dp_reg.h?
> > 
> > >   DEFINE_DRM_GEM_FOPS(hibmc_fops);
> > > @@ -122,8 +120,8 @@ static int hibmc_kms_init(struct hibmc_drm_private *priv)
> > >   	}
> > >   	/* if DP existed, init DP */
> > > -	if ((readl(priv->mmio + HIBMC_DP_HOST_SERDES_CTRL) &
> > > -	     HIBMC_DP_HOST_SERDES_CTRL_MASK) == HIBMC_DP_HOST_SERDES_CTRL_VAL) {
> > > +	ret = readl(priv->mmio + HIBMC_DP_HOST_SERDES_CTRL);
> > > +	if (ret) {
> > >   		ret = hibmc_dp_init(priv);
> > >   		if (ret)
> > >   			drm_err(dev, "failed to init dp: %d\n", ret);
> > > -- 
> > > 2.33.0
> > > 

-- 
With best wishes
Dmitry
