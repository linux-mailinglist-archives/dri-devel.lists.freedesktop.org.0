Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A6F9BCAF9
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 11:50:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC0A710E2D5;
	Tue,  5 Nov 2024 10:50:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FdHe775n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB7110E2D5
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 10:50:26 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-e2e444e355fso4815429276.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Nov 2024 02:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730803825; x=1731408625; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tcLHhgY/7JDthrxKCQ/K4USCyZ0HCKKxDBN31BvrBJA=;
 b=FdHe775nkxfcaPUH51j9wYUXcJPAvf3tQSXfal6ihGVRmoSobgr1bGYZH+l5qOY56m
 HvvsXfnTpCqQ3UQ9rZqWKlOSEhRsIBrVPIWVtfmbSk0BeagGi+HIGYLAJPdY2eQDSnB7
 4wH5wAFmio94ca1js9nba6v3qtQJeFS2xGbmChJnof4rtSJrx2T/pLvLDrttvtYkdVUB
 nW6Bq32jrPOgu7gXFVyO67slUkzb4HgZOpGTRcWL15f17HZccvFTFPLFY9HmMCCA/BXC
 axnVDv9acV1W2yMtrKF72DxxAuChHR2lzMGaTPwe2YJpD2BR+HPSvid+GiX8/c/tpJ4+
 3R+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730803825; x=1731408625;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tcLHhgY/7JDthrxKCQ/K4USCyZ0HCKKxDBN31BvrBJA=;
 b=wwb5fXcicTwi2Ttpwu5zjierOV2GEx/DKDB6tFY4KSA+fk+B25Cw+jAMWKH9aKp9JF
 a+r98ubfPL5/xw6tuwPKIgi0VZ6XvM6s3qxJV7OetOygZWXlsOBJX1ze2mdYloRD3wVu
 Kia3YoyqILQKW6it0yuSIy2DG9UNi40FdtzkKiwu4/O/mH1Jw2T01cSqKWk5XDT+9ptm
 l5WwHXkR2o1+eHsFLE+73T9o1qKmybKhbjC9sIeZGoMtck2NXApJx6UJ1NtpABsiBccu
 8SuBfZYrK5o/FL6Top+GkEwvsd5jQNPvXLaqKOFc18IBsbR0LJQJAEnFmNvDW8+woRBa
 H58g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrsjYqasElW2uBvUFKJNssozMT++7vlIfem+FTZooaNjv6VolYT6D7ompDvhNkGBtVHWRJPQlN7Hc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFTvZGzNq9m9aD7fB2yDvDkldj4Gt4vIpPKZrGQ3LpeEKvZSNy
 vp36AW02s9IqzDukgK+zrGCqludAt7pPOM538/Kz0i0oifPRLA5qE0JkbwO7EdOu/JZedp/6o0D
 orJChiWTU/a+9X8lfIhSsXSdwYOgU6TynkrnVCg==
X-Google-Smtp-Source: AGHT+IGvKG/7lB41w2cTCGY4XF224YUlYXy4b7EKwqjtZf9lwXlgT73R+wocm5vnvPHixEYI8CaW/u9+yC/WMUo4CTM=
X-Received: by 2002:a25:2e44:0:b0:e30:c87a:f391 with SMTP id
 3f1490d57ef6-e3301836a58mr12105098276.27.1730803825206; Tue, 05 Nov 2024
 02:50:25 -0800 (PST)
MIME-Version: 1.0
References: <20241101105028.2177274-1-shiyongbang@huawei.com>
 <20241101105028.2177274-4-shiyongbang@huawei.com>
 <3ke3n6mkxdcllgjohhudv6xi6csnqzpahaocpofmn26l6jdu6c@xpy2z7yeiijq>
 <35cf8895-fbc5-4ab4-bd52-d322990cefde@huawei.com>
In-Reply-To: <35cf8895-fbc5-4ab4-bd52-d322990cefde@huawei.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 5 Nov 2024 10:50:14 +0000
Message-ID: <CAA8EJpoU9Pq4ZpvXj1hzpAgm+Vb002Q=AdTKo2ix4dcAaHNe4Q@mail.gmail.com>
Subject: Re: [PATCH V3 drm-dp 3/4] drm/hisilicon/hibmc: add dp hw moduel in
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

On Tue, 5 Nov 2024 at 06:06, Yongbang Shi <shiyongbang@huawei.com> wrote:
>
> > On Fri, Nov 01, 2024 at 06:50:27PM +0800, Yongbang Shi wrote:
> >> From: baihan li <libaihan@huawei.com>
> >>
> >> Build a dp level that hibmc driver can enable dp by
> >> calling their functions.
> >>
> >> Signed-off-by: baihan li <libaihan@huawei.com>
> >> Signed-off-by: yongbang shi <shiyongbang@huawei.com>
> >> ---
> >> ChangeLog:
> >> v2 -> v3:
> >>    - fix build errors reported by kernel test robot <lkp@intel.com>
> >>      Closes: https://lore.kernel.org/oe-kbuild-all/202410250931.UDQ9s66H-lkp@intel.com/
> >> v1 -> v2:
> >>    - changed some defines and functions to former patch, suggested by Dmitry Baryshkov.
> >>    - sorting the headers including in dp_hw.h and hibmc_drm_drv.c files, suggested by Dmitry Baryshkov.
> >>    - deleting struct dp_mode and dp_mode_cfg function, suggested by Dmitry Baryshkov.
> >>    - fix build errors reported by kernel test robot <lkp@intel.com>
> >>      Closes: https://lore.kernel.org/oe-kbuild-all/202410040328.VeVxM9yB-lkp@intel.com/
> >>    v1:https://lore.kernel.org/all/20240930100610.782363-1-shiyongbang@huawei.com/
> >> ---
> >>   drivers/gpu/drm/hisilicon/hibmc/Makefile    |   2 +-
> >>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c  | 237 ++++++++++++++++++++
> >>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h  |  31 +++
> >>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h |  41 ++++
> >>   4 files changed, 310 insertions(+), 1 deletion(-)
> >>   create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> >>   create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h
> >>
> >> diff --git a/drivers/gpu/drm/hisilicon/hibmc/Makefile b/drivers/gpu/drm/hisilicon/hibmc/Makefile
> >> index 94d77da88bbf..214228052ccf 100644
> >> --- a/drivers/gpu/drm/hisilicon/hibmc/Makefile
> >> +++ b/drivers/gpu/drm/hisilicon/hibmc/Makefile
> >> @@ -1,5 +1,5 @@
> >>   # SPDX-License-Identifier: GPL-2.0-only
> >>   hibmc-drm-y := hibmc_drm_drv.o hibmc_drm_de.o hibmc_drm_vdac.o hibmc_drm_i2c.o \
> >> -           dp/dp_aux.o dp/dp_link.o
> >> +           dp/dp_aux.o dp/dp_link.o dp/dp_hw.o
> >>
> >>   obj-$(CONFIG_DRM_HISI_HIBMC) += hibmc-drm.o
> >> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> >> new file mode 100644
> >> index 000000000000..214897798bdb
> >> --- /dev/null
> >> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
> >> @@ -0,0 +1,237 @@
> >> +// SPDX-License-Identifier: GPL-2.0-or-later
> >> +// Copyright (c) 2024 Hisilicon Limited.
> >> +
> >> +#include <linux/io.h>
> >> +#include <linux/delay.h>
> >> +#include "dp_config.h"
> >> +#include "dp_comm.h"
> >> +#include "dp_reg.h"
> >> +#include "dp_hw.h"
> >> +#include "dp_link.h"
> >> +#include "dp_aux.h"
> >> +
> >> +static int hibmc_dp_link_init(struct dp_dev *dp)
> >> +{
> >> +    dp->link.cap.lanes = 2;
> >> +    dp->link.train_set = devm_kzalloc(dp->dev->dev,
> >> +                                      dp->link.cap.lanes * sizeof(u8), GFP_KERNEL);
> > Can you replace it just with an array, removing a need for an additional
> > allocation?
> >
> >> +    if (!dp->link.train_set)
> >> +            return -ENOMEM;
> >> +
> >> +    dp->link.cap.link_rate = 1;
> > Ok, this is why I don't link using indices for link rates. Which rate is
> > this? Unlike cap.lanes this is pure magic number. I think it should be
> > handled other way around: store actual link rate and convert to the
> > register value when required.
> >
> >> +
> >> +    return 0;
> >> +}
> >> +
> >> +static void hibmc_dp_set_tu(struct dp_dev *dp, struct drm_display_mode *mode)
> >> +{
> >> +    u32 tu_symbol_frac_size;
> >> +    u32 tu_symbol_size;
> >> +    u32 rate_ks;
> >> +    u8 lane_num;
> >> +    u32 value;
> >> +    u32 bpp;
> >> +
> >> +    lane_num = dp->link.cap.lanes;
> >> +    if (lane_num == 0) {
> >> +            drm_err(dp->dev, "set tu failed, lane num cannot be 0!\n");
> >> +            return;
> >> +    }
> >> +
> >> +    bpp = DP_BPP;
> > Where is this defined? Is it hibmc-specific or a generic value?
> >
> >> +    rate_ks = hibmc_dp_get_link_rate(dp->link.cap.link_rate) * DP_LINK_RATE_CAL;
> > same question
>
> Hi Dmitry,
> Thanks for your detailed suggestions and questions. These two are defined in dp_config.h.

Please move defines to the corresponding patch, when the values are
being used. Also if these defines are HIBMC-specific, please use the
corresponding prefix (when one sees DP_foo they expect a constant
defined in the standard, not a driver-specific value).



-- 
With best wishes
Dmitry
