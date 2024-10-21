Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1239A7300
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 21:11:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54AA510E580;
	Mon, 21 Oct 2024 19:11:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="x45Npq1L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD4B10E580
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 19:11:20 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-6e59a9496f9so54353757b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 12:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729537879; x=1730142679; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/46rT7qZaHMrXH+D9ho6f1HAKACXK0e68cmApVPza48=;
 b=x45Npq1LxcThOVZmmnDekpe83wsTehREztj7zzfPsZMfhMf6VRSxHU5kma5kBmex0E
 aQff07NyGku5fw8p8Gmw+V4b/g7M89VXDrquUxAFP31gOJIZr50fSAH5mC+oQ2kPZQYu
 cXwigdC+C7lfBSh6YwMD82opLkD1n71h+wV23u+KgnQek0P6x+IcIgi9DUa9ptV05dx1
 n9kBotM7ZX0t0wFg8AHiqHotH8TW1F9tAgV5maa5Io7EIuRvnSE6ddVRTvmHEDUbrZSr
 C+BMwhlQvolFbiepGbs8gKpqD0d0rrwE6K7ZcQ7CbPwX/35F5CP49uhrRUP1t7Bw9LsN
 Ongw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729537879; x=1730142679;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/46rT7qZaHMrXH+D9ho6f1HAKACXK0e68cmApVPza48=;
 b=DX97KAzDp9YnWAXaBJbl9B98ZNBSaSDLN8wjRSdpyo4kaZh8hQJHQ7mhj0Dh7dtVaE
 i2atHVPLR7kxJC6CwgVM/thSSH1F5qexJrpuDqAoOEEFuVqZvQBVn9GpB6lbVLyz9YNJ
 /QfSm2hGXxT2bYBObCRNCV779nfJKVVeFK+7iyzjkcQN+RAU+Hy5IsybDVlEKF7KUEMM
 xc5+XQa9K0CSuOIXC0Z/ksXpQUzS5+cKq0C/0Oh+an0V/CuxE5MEYetCpbFypy3swjRb
 PQ2tNxY0z6PdPjXP0HujuTDSqWjnqSfT098chRSSyOi7+87tYMshBsbgZvw9UcocioFS
 BuHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/Q39ySmKQMhQ2A/Jd1X9iGkARmD5UAnL7EFX3OACX/+cGcWpv20lXjOw1csSVRV1eVIOV31Q8k5I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzzGdcIbVcWxxfFCvCPzXaqz6TrD+ZHv6eU7bkPz4aV61rDYWDS
 1MLV4nhOUhrRgXB5GgHpeYu61P1c0cjvhVyJjYIgU3II4PbYH9Sek0YYBTf6WBF4qcHyJ/eCA7k
 kmlEAHyTtrT9ix1u3T82VBHWM6Ot18yZCWNKp0A==
X-Google-Smtp-Source: AGHT+IE50840gfrhIlHnI8IWVXrdwhJPgN1AcLZFAPN7gDJn915Lj1OE3NzM+QPshp0P84IBdPXg1C6/WJ/NnySPopk=
X-Received: by 2002:a05:690c:700a:b0:6dd:cdd7:ce5a with SMTP id
 00721157ae682-6e7d824d029mr800267b3.18.1729537879474; Mon, 21 Oct 2024
 12:11:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240930100610.782363-1-shiyongbang@huawei.com>
 <20240930100610.782363-4-shiyongbang@huawei.com>
 <eslfc3ejjjpbw5wuf4khcoixeaitpb47iwf6kug7cryplcxcui@sieiyekdpczn>
 <c95252f7-12a7-49b8-8bf6-2ff3ada845ff@huawei.com>
In-Reply-To: <c95252f7-12a7-49b8-8bf6-2ff3ada845ff@huawei.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 21 Oct 2024 22:11:09 +0300
Message-ID: <CAA8EJppmrizqHjqYrRBVdjpTYLbPrrX+2wzeFhnVumifN_B0nQ@mail.gmail.com>
Subject: Re: [PATCH drm-dp 3/4] drm/hisilicon/hibmc: add dp kapi moduel in
 hibmc drivers
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

On Mon, 21 Oct 2024 at 15:22, Yongbang Shi <shiyongbang@huawei.com> wrote:
>
> Hi Dmitry,
> There're some format problems with the previous replies. Send it again here.
> Thanks for your advices, I'll resolve the problems you mentioned.
>
> > On Mon, Sep 30, 2024 at 06:06:09PM +0800, shiyongbang wrote:
> >> From: baihan li <libaihan@huawei.com>
> >>
> >> Build a kapi level that hibmc driver can enable dp by
> >> calling these kapi functions.
> >>
> >> Signed-off-by: baihan li <libaihan@huawei.com>
> >> ---
> >>   drivers/gpu/drm/hisilicon/hibmc/Makefile      |  2 +-
> >>   .../gpu/drm/hisilicon/hibmc/dp/dp_config.h    | 20 ++++++++
> >>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_kapi.c  | 12 ++---
> >>   drivers/gpu/drm/hisilicon/hibmc/dp/dp_kapi.h  | 48 +++++++++++++++++++
> >>   4 files changed, 75 insertions(+), 7 deletions(-)
> >>   create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h
> >>   create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_kapi.h
> >>
> >> diff --git a/drivers/gpu/drm/hisilicon/hibmc/Makefile b/drivers/gpu/drm/hisilicon/hibmc/Makefile
> >> index 94d77da88bbf..693036dfab52 100644
> >> --- a/drivers/gpu/drm/hisilicon/hibmc/Makefile
> >> +++ b/drivers/gpu/drm/hisilicon/hibmc/Makefile
> >> @@ -1,5 +1,5 @@
> >>   # SPDX-License-Identifier: GPL-2.0-only
> >>   hibmc-drm-y := hibmc_drm_drv.o hibmc_drm_de.o hibmc_drm_vdac.o hibmc_drm_i2c.o \
> >> -           dp/dp_aux.o dp/dp_link.o
> >> +           dp/dp_aux.o dp/dp_link.o dp/dp_kapi.o
> >>
> >>   obj-$(CONFIG_DRM_HISI_HIBMC) += hibmc-drm.o
> >> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h
> >> new file mode 100644
> >> index 000000000000..a6353a808cc4
> >> --- /dev/null
> >> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h
> >> @@ -0,0 +1,20 @@
> >> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> >> +/* Copyright (c) 2024 Hisilicon Limited. */
> >> +
> >> +#ifndef DP_CONFIG_H
> >> +#define DP_CONFIG_H
> >> +
> >> +#define DP_BPP 24
> >> +#define DP_SYMBOL_PER_FCLK 4
> >> +#define DP_MIN_PULSE_NUM 0x9
> >> +#define DP_MSA1 0x20
> >> +#define DP_MSA2 0x845c00
> >> +#define DP_OFFSET 0x1e0000
> >> +#define DP_HDCP 0x2
> >> +#define DP_INT_RST 0xffff
> >> +#define DP_DPTX_RST 0x3ff
> >> +#define DP_CLK_EN 0x7
> >> +#define DP_SYNC_EN_MASK 0x3
> >> +#define DP_LINK_RATE_CAL 27
> > I think some of these defines were used in previous patches. Please make
> > sure that at each step the code builds without errors.
> >
> >> +
> >> +#endif
> >> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_kapi.c b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_kapi.c
> >> index 4091723473ad..ca7edc69427c 100644
> >> --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_kapi.c
> >> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_kapi.c
> >> @@ -64,12 +64,12 @@ static void hibmc_dp_set_tu(struct hibmc_dp_dev *dp, struct dp_mode *mode)
> >>      rate_ks = dp->link.cap.link_rate * DP_LINK_RATE_CAL;
> >>      value = (pixel_clock * bpp * 5000) / (61 * lane_num * rate_ks);
> >>
> >> -    if (value % 10 == 9) { /* 10: div, 9: carry */
> >> -            tu_symbol_size = value / 10 + 1; /* 10: div */
> >> +    if (value % 10 == 9) { /* 9 carry */
> >> +            tu_symbol_size = value / 10 + 1;
> >>              tu_symbol_frac_size = 0;
> >>      } else {
> >> -            tu_symbol_size = value / 10; /* 10: div */
> >> -            tu_symbol_frac_size = value % 10 + 1; /* 10: div */
> >> +            tu_symbol_size = value / 10;
> >> +            tu_symbol_frac_size = value % 10 + 1;
> >>      }
> >>
> >>      drm_info(dp->dev, "tu value: %u.%u value: %u\n",
> >> @@ -158,7 +158,7 @@ static void hibmc_dp_link_cfg(struct hibmc_dp_dev *dp, struct dp_mode *mode)
> >>      dp_write_bits(dp->base + DP_VIDEO_CTRL,
> >>                    DP_CFG_STREAM_HSYNC_POLARITY, mode->h_pol);
> >>
> >> -    /* MSA mic 0 and 1*/
> >> +    /* MSA mic 0 and 1 */
> >>      writel(DP_MSA1, dp->base + DP_VIDEO_MSA1);
> >>      writel(DP_MSA2, dp->base + DP_VIDEO_MSA2);
> >>
> >> @@ -167,7 +167,7 @@ static void hibmc_dp_link_cfg(struct hibmc_dp_dev *dp, struct dp_mode *mode)
> >>      dp_write_bits(dp->base + DP_VIDEO_CTRL, DP_CFG_STREAM_RGB_ENABLE, 0x1);
> >>      dp_write_bits(dp->base + DP_VIDEO_CTRL, DP_CFG_STREAM_VIDEO_MAPPING, 0);
> >>
> >> -    /*divide 2: up even */
> >> +    /* divide 2: up even */
> >>      if (timing_delay % 2)
> >>              timing_delay++;
> >>
> > This should be squashed into the previous commits.
> >
> >> diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_kapi.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_kapi.h
> >> new file mode 100644
> >> index 000000000000..6b07642d55b8
> >> --- /dev/null
> >> +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_kapi.h
> >> @@ -0,0 +1,48 @@
> >> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> >> +/* Copyright (c) 2024 Hisilicon Limited. */
> >> +
> >> +#ifndef DP_KAPI_H
> >> +#define DP_KAPI_H
> >> +
> >> +#include <linux/types.h>
> >> +#include <drm/drm_device.h>
> >> +#include <drm/drm_encoder.h>
> >> +#include <drm/drm_connector.h>
> >> +#include <drm/drm_print.h>
> >> +#include <linux/delay.h>
> > Sort the headers, please.
> >
> >> +
> >> +struct hibmc_dp_dev;
> >> +
> >> +struct dp_mode {
> >> +    u32 h_total;
> >> +    u32 h_active;
> >> +    u32 h_blank;
> >> +    u32 h_front;
> >> +    u32 h_sync;
> >> +    u32 h_back;
> >> +    bool h_pol;
> >> +    u32 v_total;
> >> +    u32 v_active;
> >> +    u32 v_blank;
> >> +    u32 v_front;
> >> +    u32 v_sync;
> >> +    u32 v_back;
> >> +    bool v_pol;
> >> +    u32 field_rate;
> >> +    u32 pixel_clock; // khz
> > Why do you need a separate struct for this?
>
> I can try to use drm_mode function and refactor this struct, but they're insufficient for our scenarios.
> Here's change template bellow:

But you are generating the data from struct drm_display_mode. Please
use the existing struct instead and generate the blank and porch
timings when you have to program them.
There is really no need to define another struct just to temporarily
hold the same data.

> struct dp_mode {
>          sturct videomode mode;
>          u32 h_total;
>          u32 h_blank;
>          u32 v_total;
>          u32 v_blank;
>          u32 field_rate;
> };
> static void dp_mode_cfg(struct dp_mode *dp_mode, struct drm_display_mode *mode)
> {
>          dp_mode->field_rate = drm_mode_vrefresh(mode);
>          drm_display_mode_to_videomode(mode, &dp_mode->vmode);
>          dp_mode->h_total = mode->htotal;
>          dp_mode->h_blank = mode->htotal - mode->hdisplay;
>          dp_mode->v_total = mode->vtotal;
>          dp_mode->v_blank = mode->vtotal - mode->vdisplay;
> }
>

-- 
With best wishes
Dmitry
