Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B90F9B5A46
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 04:21:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 161E710E73B;
	Wed, 30 Oct 2024 03:21:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bYBRbs57";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EC1710E73B
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 03:20:54 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-6e3a97a6010so70732967b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 20:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730258453; x=1730863253; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GhwxQj1utf80B72sGdNfRKzLMLZGfEcldvV9/fNbZyo=;
 b=bYBRbs57kfS1+JU8uXXoZoDAcwD6g24kTsQSEhctHMM4gUKmXxkeNWg1AGLySngZ6T
 UVJw9+fZrIkLmI5e/VEaQP87NewIp7l3x5Lm68FQXkt1k8S/C1tJh6PPNsAtRPOdDWSN
 jd0Neqn+34XmaZ0jgtBMJS4zorbxUpJaEFlG6udHDfyKptXtjEwUjj5Zpj17anzT9pd7
 4pK3sKtjo6OTLLI2QMcTChMfHUfGMBGU6FdRE6YNPvZkmdQBcIfxGqqa5orF8fgwyms7
 qu0dituvWMhK8wFz5PI5tM/ej2taDfKXpfsZ8f8SqBtzlT/Ah4v/T1BFfreG76HRrXjg
 qPkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730258453; x=1730863253;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GhwxQj1utf80B72sGdNfRKzLMLZGfEcldvV9/fNbZyo=;
 b=Yb0e+CXIgHaQbnvW174PmcBQJzoB+EeX5TRMzx6RRFIYfVCW+jiVTN+xc3IexJdXdL
 7PPCSLnwRN3pxgKCxeAwT5SY1AGJHVUY4BusDNDnUnSlhXtQlAJa/889ZuhFmgDVyaRN
 F1RrEwehxz3kvlSxDMYx1INRoKQbIQ3egUL2Eos9MFj4eXmuL2MnXThfxYxb5gXrHY1e
 327nr5T3W6sS/S49R5v9kk5lUy+FAljk0lKQL313WfB9WESG8qsEfC3GomCzeeTtCZYa
 Z5zjlOanhZVr9KScB14MRzw/cSVylPQ+TaukAltOzLcECoFhfEakzdkCRYxtxLf6w9fe
 eHwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcyJnBNu/Pk3ZzC+FqqVrO2zdFB9Hyjs45pvefI4G6mc7lzq1csgv9R+z1IBL8YWTIMST79oO7zsk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyxMXxapEk61iEsTDK0T5DeJmOJNxhRBh40hkMb3493RzmeLxri
 f1AnAX56U97KbcXpK5yCV/rJkcI7x4JjaoMAvHHyq8mCn/Vbke97ReSFkjz+JHl+1cmm4dJ08nV
 m5SRyb/oukXWE1Ql6BTCLkvTnzSaxM2uGbJqykg==
X-Google-Smtp-Source: AGHT+IFLiGFVvX1f36/HNeQe2CZovY3JMjIFKBP1+C2WNJqZKHiRxAHMieCw1+KIFYDqLZ5ERJmT4auyzpM6VhqfLKk=
X-Received: by 2002:a05:690c:ec5:b0:6ea:3ba2:6b0d with SMTP id
 00721157ae682-6ea3ba26cf1mr20336287b3.9.1730258453475; Tue, 29 Oct 2024
 20:20:53 -0700 (PDT)
MIME-Version: 1.0
References: <20241022124148.1952761-1-shiyongbang@huawei.com>
 <20241022124148.1952761-3-shiyongbang@huawei.com>
 <k5d3ny7dl4tgsy2y2kagz3d3s5rg74qaazck3xxbqpwlrjjd2i@e4dohu4uuwsr>
 <20625fdb-15d3-4b7e-a5e1-e917cf9ce3d5@huawei.com>
In-Reply-To: <20625fdb-15d3-4b7e-a5e1-e917cf9ce3d5@huawei.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 30 Oct 2024 05:14:57 +0200
Message-ID: <CAA8EJpoMHrTw069bkSiNG3q6J2SftGBCbYwgpr4yjeporVK1nw@mail.gmail.com>
Subject: Re: [PATCH V2 drm-dp 2/4] drm/hisilicon/hibmc: add dp link moduel in
 hibmc
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, daniel@ffwll.ch, kong.kongxinwei@hisilicon.com, 
 liangjian010@huawei.com, chenjianmin@huawei.com, lidongming5@huawei.com, 
 libaihan@huawei.com, shenjian15@huawei.com, shaojijie@huawei.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Tue, 29 Oct 2024 at 16:15, Yongbang Shi <shiyongbang@huawei.com> wrote:
>
> > On Tue, Oct 22, 2024 at 08:41:46PM +0800, Yongbang Shi wrote:
> >> From: baihan li <libaihan@huawei.com>
> >>
> >> Add link training process functions in this moduel.
> > We should probably have a bounty for a developer who finally writes a
> > generic DP link training helpers.
> >
> >> Signed-off-by: baihan li <libaihan@huawei.com>
> > Missing SoB
> >
> >> ---
> >> ChangeLog:
> >> v1 -> v2:
> >>    - using drm_dp_* functions implement dp link training process, suggested by Jani Nikula.
> >>    - fix build errors reported by kernel test robot <lkp@intel.com>
> >>      Closes: https://lore.kernel.org/oe-kbuild-all/202410031735.8iRZZR6T-lkp@intel.com/
> >>    v1:https://lore.kernel.org/all/20240930100610.782363-1-shiyongbang@huawei.com/
> >> ---
> >>   drivers/gpu/drm/hisilicon/hibmc/Makefile     |   2 +-
> >>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c | 344 +++++++++++++++++++
> >>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.h |  25 ++
> >>   3 files changed, 370 insertions(+), 1 deletion(-)
> >>   create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
> >>   create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.h
> >>
> >> diff --git a/drivers/gpu/drm/hisilicon/hibmc/Makefile b/drivers/gpu/drm/hisilicon/hibmc/Makefile
> >> index 8770ec6dfffd..94d77da88bbf 100644
> >> --- a/drivers/gpu/drm/hisilicon/hibmc/Makefile
> >> +++ b/drivers/gpu/drm/hisilicon/hibmc/Makefile
> >> @@ -1,5 +1,5 @@
> >>   # SPDX-License-Identifier: GPL-2.0-only
> >>   hibmc-drm-y := hibmc_drm_drv.o hibmc_drm_de.o hibmc_drm_vdac.o hibmc_drm_i2c.o \
> >> -           dp/dp_aux.o
> >> +           dp/dp_aux.o dp/dp_link.o
> >>
> >>   obj-$(CONFIG_DRM_HISI_HIBMC) += hibmc-drm.o
> >> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
> >> new file mode 100644
> >> index 000000000000..b02a536e0689
> >> --- /dev/null
> >> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
> >> @@ -0,0 +1,344 @@
> >> +// SPDX-License-Identifier: GPL-2.0-or-later
> >> +// Copyright (c) 2024 Hisilicon Limited.
> >> +
> >> +#include <linux/delay.h>
> >> +#include <drm/drm_device.h>
> >> +#include <drm/drm_print.h>
> >> +#include "dp_comm.h"
> >> +#include "dp_reg.h"
> >> +#include "dp_link.h"
> >> +#include "dp_aux.h"
> >> +
> >> +const u8 link_rate_map[] = {DP_LINK_BW_1_62, DP_LINK_BW_2_7,
> >> +                        DP_LINK_BW_5_4, DP_LINK_BW_8_1};
> >> +
> >> +static int dp_link_training_configure(struct dp_dev *dp)
> >> +{
> >> +    u8 buf[2];
> >> +    int ret;
> >> +
> >> +    /* DP 2 lane */
> >> +    dp_write_bits(dp->base + DP_PHYIF_CTRL0, DP_CFG_LANE_DATA_EN,
> >> +                  dp->link.cap.lanes == DP_LANE_NUM_2 ? 0x3 : 0x1);
> >> +    dp_write_bits(dp->base + DP_DPTX_GCTL0, DP_CFG_PHY_LANE_NUM,
> >> +                  dp->link.cap.lanes == DP_LANE_NUM_2 ? 0x1 : 0);
> >> +
> >> +    /* enhanced frame */
> >> +    dp_write_bits(dp->base + DP_VIDEO_CTRL, DP_CFG_STREAM_FRAME_MODE, 0x1);
> >> +
> >> +    /* set rate and lane count */
> >> +    buf[0] = dp_get_link_rate(dp->link.cap.link_rate);
> >> +    buf[1] = DP_LANE_COUNT_ENHANCED_FRAME_EN | dp->link.cap.lanes;
> >> +    ret = drm_dp_dpcd_write(&dp->aux, DP_LINK_BW_SET, buf, sizeof(buf));
> >> +    if (ret != sizeof(buf)) {
> >> +            drm_err(dp->dev, "dp aux write link rate and lanes failed, ret: %d\n", ret);
> >> +            return ret;
> >> +    }
> >> +
> >> +    /* set 8b/10b and downspread */
> >> +    buf[0] = 0x10;
> >> +    buf[1] = 0x1;
> >> +    ret = drm_dp_dpcd_write(&dp->aux, DP_DOWNSPREAD_CTRL, buf, sizeof(buf));
> >> +    if (ret != sizeof(buf))
> >> +            drm_err(dp->dev, "dp aux write 8b/10b and downspread failed, ret: %d\n", ret);
> >> +
> >> +    ret = drm_dp_read_dpcd_caps(&dp->aux, dp->dpcd);
> >> +    if (ret)
> >> +            drm_err(dp->dev, "dp aux read dpcd failed, ret: %d\n", ret);
> >> +
> >> +    return ret;
> >> +}
> >> +
> >> +static int dp_link_pattern2dpcd(struct dp_dev *dp, enum dp_pattern_e pattern)
> >> +{
> >> +    switch (pattern) {
> >> +    case DP_PATTERN_NO:
> >> +            return DP_TRAINING_PATTERN_DISABLE;
> >> +    case DP_PATTERN_TPS1:
> >> +            return DP_TRAINING_PATTERN_1;
> >> +    case DP_PATTERN_TPS2:
> >> +            return DP_TRAINING_PATTERN_2;
> >> +    case DP_PATTERN_TPS3:
> >> +            return DP_TRAINING_PATTERN_3;
> >> +    case DP_PATTERN_TPS4:
> >> +            return DP_TRAINING_PATTERN_4;
> >> +    default:
> >> +            drm_err(dp->dev, "dp link unknown pattern %d\n", pattern);
> >> +            return -EINVAL;
> > Why do you need the extra defines / wrappers? Can you use
> > DP_TRAINING_PATTERN_foo directly?
>
> Hi Dmitry,
> Thanks for your all of these good advices and questions. I will resply as soon as possible.
> For this point, I also need this enum dp_pattern_e value to write in my dp reg at TPS stage, so I made this map here.

I'd suggest to do it other way around: use standard defines and when
necessary map them for the register write.

-- 
With best wishes
Dmitry
