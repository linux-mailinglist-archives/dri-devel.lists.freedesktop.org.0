Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B98919F8BE5
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 06:37:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF4B610E0D9;
	Fri, 20 Dec 2024 05:37:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xCblxrbF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 867CD10E0D9
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 05:37:23 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-e5390ed85a1so141162276.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 21:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734673042; x=1735277842; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eLpODaYRyFEauMGVSyk9T1QhhMdmd8z0vW52xuJIe/8=;
 b=xCblxrbF2CTvOG9usDr/IDX6VsOrJlLAuVJSHA/JTJ9fvkgCNFzrGzjMDxhdvxqHhJ
 l8jzg2eeVlrjSAF8Wj3f9+ygKDv89WpTSjcym0JFrJprmK11cLAAZbbRCafwT8IgBSq+
 elo/z4TnepwBhvqOJH/4i424yq1XZnRrT0tPBiuiqgFemdbSpZVqEVrEnCEoE6ekGIOD
 VzafOj4hUETl49w4WV9BWRozQ5bSqW2wJP59ZpHiaBd4QsY2UY2XA4MhRZ/iqljhVTg9
 vQ2tTbMIzZSZHmwrDBKMh0atJptUmJMiaoYA5C4JUGl3SvZEjCxr/IxDP2WxEOUrDed8
 jYAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734673042; x=1735277842;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eLpODaYRyFEauMGVSyk9T1QhhMdmd8z0vW52xuJIe/8=;
 b=GHBmwS0qdtpY6ZQGQCabOUwF/tQNE8tv7GUBRVLV8bZhmgXTkAiINf31J4zGUvnnvt
 QN/2tiFJj3jEX/upjAvgDSFFl+gzOze3X4nOwgGnUTrdKxWJRnDOwysDioupa+BlquK0
 q1fmOvctUGYNXYsSrjFzvl4tCjtMX9eVlzSGbaaJF4odAeQzyXd77wrEH95mJrlI27uB
 nlktbDkDLlXimAFvRmy3xio8BIm5/Vue7h1RkO1DT7HgoSMF8ynumCVgw4LxTVWMRe1W
 8rVURmun3MQiXtQHG0BNXGPMO2p4yQgobm0+nKR7DaUIRaNGBKaQKK3YHNcT4iIpxofp
 mzyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMl9bd2DqSYxg+MiZL6orp9L9KEktCwsiE0ycUnf5BNRksS45DflAs4VyceM9U0bP7jH/XfR1t07E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDEMsVtSzswXCsNidpfdgvIBkm60l1K6ZT7V/vzki8PZxvKraL
 IzMYu4Y2gfKoVnTyE+fqgWukhx+550sNqQYonZSiGL+z/ykY8vHuMx6mDDt2HiGSYJ3D9hQfpK3
 /Y+s77h9Wp7J3T2/yQpNjz/NUVEuVD8f+0dFSMA==
X-Gm-Gg: ASbGncvuDzIbuW0d5eQEqzRU+OLKWboGLgnjuEmFhx4KPsv+82Xg6t3Nr99EPGC2qkq
 nQ7qm8KOf0WCvslsgFqKRl5DEMdJrAO+Auqm+4afqtVOEiczgb/q7
X-Google-Smtp-Source: AGHT+IFGtCjCZ+VojYNyMK2Y/K7VXCStGJjA+69HR5EsAR1bloqgbrLQAQ6WEmjrZhxmttZwb8bmMWY+OJBKwRQPbj4=
X-Received: by 2002:a05:690c:f84:b0:6ef:9017:3cc8 with SMTP id
 00721157ae682-6f3f8219d5bmr11574697b3.31.1734673042550; Thu, 19 Dec 2024
 21:37:22 -0800 (PST)
MIME-Version: 1.0
References: <20241219080604.1423600-1-damon.ding@rock-chips.com>
 <20241219080604.1423600-8-damon.ding@rock-chips.com>
 <a6vvydjbx3hbckoy74iiyzguyyacwvdh6iirqydjfvhwgocw3a@knecggjcbcid>
 <654c30ec-7d7e-4956-9a48-15bfcea34acc@rock-chips.com>
In-Reply-To: <654c30ec-7d7e-4956-9a48-15bfcea34acc@rock-chips.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 20 Dec 2024 07:37:11 +0200
Message-ID: <CAA8EJpqk-iim668ZTzQaROJmkTr2COBwA5G9Eg73uLE28XHYpg@mail.gmail.com>
Subject: Re: [PATCH v3 07/15] drm/bridge: analogix_dp: Add support for phy
 configuration.
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 rfoss@kernel.org, vkoul@kernel.org, sebastian.reichel@collabora.com, 
 cristian.ciocaltea@collabora.com, l.stach@pengutronix.de, 
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 20 Dec 2024 at 05:37, Damon Ding <damon.ding@rock-chips.com> wrote:
>
> Hi Dmitry,
>
> On 2024/12/20 8:13, Dmitry Baryshkov wrote:
> > On Thu, Dec 19, 2024 at 04:05:56PM +0800, Damon Ding wrote:
> >> Add support to configurate link rate, lane count, voltage swing and
> >> pre-emphasis with phy_configure(). It is helpful in application scenarios
> >> where analogix controller is mixed with the phy of other vendors.
> >>
> >> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> >>
> >> ---
> >>
> >> Changes in v2:
> >> - remove needless assignments for phy_configure()
> >> - remove unnecessary changes for phy_power_on()/phy_power_off()
> >> ---
> >>   .../drm/bridge/analogix/analogix_dp_core.c    |  1 +
> >>   .../gpu/drm/bridge/analogix/analogix_dp_reg.c | 56 +++++++++++++++++++
> >>   2 files changed, 57 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> >> index 6f10d88a34c5..9429c50cc1bc 100644
> >> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> >> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> >> @@ -1696,6 +1696,7 @@ int analogix_dp_resume(struct analogix_dp_device *dp)
> >>      if (dp->plat_data->power_on)
> >>              dp->plat_data->power_on(dp->plat_data);
> >>
> >> +    phy_set_mode(dp->phy, PHY_MODE_DP);
> >>      phy_power_on(dp->phy);
> >>
> >>      analogix_dp_init_dp(dp);
> >> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> >> index 3afc73c858c4..613ce504bea6 100644
> >> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> >> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> >> @@ -11,6 +11,7 @@
> >>   #include <linux/gpio/consumer.h>
> >>   #include <linux/io.h>
> >>   #include <linux/iopoll.h>
> >> +#include <linux/phy/phy.h>
> >>
> >>   #include <drm/bridge/analogix_dp.h>
> >>
> >> @@ -513,10 +514,25 @@ void analogix_dp_enable_sw_function(struct analogix_dp_device *dp)
> >>   void analogix_dp_set_link_bandwidth(struct analogix_dp_device *dp, u32 bwtype)
> >>   {
> >>      u32 reg;
> >> +    int ret;
> >>
> >>      reg = bwtype;
> >>      if ((bwtype == DP_LINK_BW_2_7) || (bwtype == DP_LINK_BW_1_62))
> >>              writel(reg, dp->reg_base + ANALOGIX_DP_LINK_BW_SET);
> >> +
> >> +    if (dp->phy) {
> >> +            union phy_configure_opts phy_cfg = {0};
> >> +
> >> +            phy_cfg.dp.lanes = dp->link_train.lane_count;
> >
> > Should not be necessary, you are only setting the .set_rate.
>
> Indeed, this can be dropped.
>
> >
> >> +            phy_cfg.dp.link_rate =
> >> +                    drm_dp_bw_code_to_link_rate(dp->link_train.link_rate) / 100;
> >> +            phy_cfg.dp.set_rate = true;
> >> +            ret = phy_configure(dp->phy, &phy_cfg);
> >> +            if (ret && ret != -EOPNOTSUPP) {
> >> +                    dev_err(dp->dev, "%s: phy_configure() failed: %d\n", __func__, ret);
> >> +                    return;
> >> +            }
> >> +    }
> >>   }
> >>
> >>   void analogix_dp_get_link_bandwidth(struct analogix_dp_device *dp, u32 *bwtype)
> >> @@ -530,9 +546,22 @@ void analogix_dp_get_link_bandwidth(struct analogix_dp_device *dp, u32 *bwtype)
> >>   void analogix_dp_set_lane_count(struct analogix_dp_device *dp, u32 count)
> >>   {
> >>      u32 reg;
> >> +    int ret;
> >>
> >>      reg = count;
> >>      writel(reg, dp->reg_base + ANALOGIX_DP_LANE_COUNT_SET);
> >> +
> >> +    if (dp->phy) {
> >> +            union phy_configure_opts phy_cfg = {0};
> >> +
> >> +            phy_cfg.dp.lanes = dp->link_train.lane_count;
> >> +            phy_cfg.dp.set_lanes = true;
> >> +            ret = phy_configure(dp->phy, &phy_cfg);
> >> +            if (ret && ret != -EOPNOTSUPP) {
> >> +                    dev_err(dp->dev, "%s: phy_configure() failed: %d\n", __func__, ret);
> >> +                    return;
> >> +            }
> >> +    }
> >>   }
> >>
> >>   void analogix_dp_get_lane_count(struct analogix_dp_device *dp, u32 *count)
> >> @@ -546,10 +575,37 @@ void analogix_dp_get_lane_count(struct analogix_dp_device *dp, u32 *count)
> >>   void analogix_dp_set_lane_link_training(struct analogix_dp_device *dp)
> >>   {
> >>      u8 lane;
> >> +    int ret;
> >>
> >>      for (lane = 0; lane < dp->link_train.lane_count; lane++)
> >>              writel(dp->link_train.training_lane[lane],
> >>                     dp->reg_base + ANALOGIX_DP_LN0_LINK_TRAINING_CTL + 4 * lane);
> >> +
> >> +    if (dp->phy) {
> >> +            union phy_configure_opts phy_cfg = {0};
> >> +
> >> +            for (lane = 0; lane < dp->link_train.lane_count; lane++) {
> >> +                    u8 training_lane = dp->link_train.training_lane[lane];
> >> +                    u8 vs, pe;
> >> +
> >> +                    vs = (training_lane & DP_TRAIN_VOLTAGE_SWING_MASK) >>
> >> +                         DP_TRAIN_VOLTAGE_SWING_SHIFT;
> >> +                    pe = (training_lane & DP_TRAIN_PRE_EMPHASIS_MASK) >>
> >> +                         DP_TRAIN_PRE_EMPHASIS_SHIFT;
> >> +                    phy_cfg.dp.voltage[lane] = vs;
> >> +                    phy_cfg.dp.pre[lane] = pe;
> >> +            }
> >> +
> >> +            phy_cfg.dp.lanes = dp->link_train.lane_count;
> >> +            phy_cfg.dp.link_rate =
> >> +                    drm_dp_bw_code_to_link_rate(dp->link_train.link_rate) / 100;
> >
> > This two should not be necessary, please drop them.
>
> These two are necessary for rk_hdptx_phy_set_voltage(), so they cannot
> be dropped.

Please review the documentation for struct phy_configure_opts_dp and
fix your PHY driver to skip the values for which the .set_foo isn't
set. Then you might have to change this part.
You are setting just .set_voltages. It means that the rate and .lanes
shouldn't be changed and can be used as they were set by the previous
calls to phy_configure().

>
> >
> >> +            phy_cfg.dp.set_voltages = true;
> >> +            ret = phy_configure(dp->phy, &phy_cfg);
> >> +            if (ret && ret != -EOPNOTSUPP) {
> >> +                    dev_err(dp->dev, "%s: phy_configure() failed: %d\n", __func__, ret);
> >> +                    return;
> >> +            }
> >> +    }
> >>   }
> >>
> >>   u32 analogix_dp_get_lane_link_training(struct analogix_dp_device *dp, u8 lane)
> >> --
> >> 2.34.1
> >>
> >
>
> Best regards,
> Damon
>


-- 
With best wishes
Dmitry
