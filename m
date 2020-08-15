Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8EF2454C2
	for <lists+dri-devel@lfdr.de>; Sun, 16 Aug 2020 00:45:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 719436E1AA;
	Sat, 15 Aug 2020 22:45:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24EA46E1AA;
 Sat, 15 Aug 2020 22:45:02 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id a14so11397010wra.5;
 Sat, 15 Aug 2020 15:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9v1OHYfpYYA5o/8gW7muupb2BSzWhmjZmmPoVg8UHwc=;
 b=MpU7wlgpTu1VPsWReQOUM/Bp5mLVx+ftP/V75G52LjsbxIo0QsuOu+JU04yHVEg5S/
 nsZ9/+Wnv2a2DwABGH8PnHx4rOhBACh5cu1geL49bsD+gBwXVp/6IcWK38MaAjWEXw41
 ANFCNlEfCzomspwnKHST58MPeRpbLVzFvqI46n8PmPHZNgfqwOcTxworhoGkNcBEjjBz
 wuKqXLFWBijjQirO2k5/IYcc1nnnNvNUIVLuhznkBUfdsCD69KMHrVsYoxcjAO/bAJs8
 vkbN98ksfwqIcEU2E1doYtWGcoupmIAS4kSIHUpAxy/rGDPvMyasCQaqVXseENtyh/D8
 OS1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9v1OHYfpYYA5o/8gW7muupb2BSzWhmjZmmPoVg8UHwc=;
 b=qNVl3XvR2W5fJv9LRLDfrPx6m+CSjiTqBIT9dXTkFbfHKZPbkUOaAVBBIokoWEHuMh
 4shYiG/h8+ucE8pvHQacUav8g0HDiK0dn4EpDpeBh/58QyyunSe+dlEG7kuNLe3WAVR6
 lf8LRxKNf/i/f+Q6JOu3MFaVEHrofDabajz6CoDurVRScpRsCVqQn+NWo0B8OjW7Pr3g
 55OE6p2G5dw9ifC8bvEkw6TSb4Y1B87c2XrAOAWpBdbkzJS6OIab1KPaDQMlfbINx265
 cU+/k5eLneFPyFJbMd9iufAR8HMz7+YUA8L5cPXoOv0uWbphVROqpfeIRNMrvA5X72KB
 ZaNA==
X-Gm-Message-State: AOAM532sp6uOngV1A+ydoPoMETCgid1+caJ1EX1ZnaLpZoUS5GAPrPNF
 E9aDKtjSKx8NqQ0MGql0vUdPERS6aUX7IGpAxsw=
X-Google-Smtp-Source: ABdhPJzr5FnMJX5imMejIe/UKLhmWfwhLVclXOj7FCJyMJx6rMCaQPKMBXCSD8ToEEmwQazfqzKj0xkGimx92he2ANI=
X-Received: by 2002:adf:f485:: with SMTP id l5mr7848208wro.147.1597531500581; 
 Sat, 15 Aug 2020 15:45:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200812044223.19279-1-tanmay@codeaurora.org>
 <20200812044223.19279-4-tanmay@codeaurora.org>
 <821b5cf9-5ca0-7026-fd99-9a32285ed030@linaro.org>
 <CAF6AEGtcfXodN1_HSdTcH402FdwTk15Nt6p3F=QYeSRhTc+hqw@mail.gmail.com>
 <1ea81fa2-1dc8-a0b9-aa32-3127e9354be2@marek.ca>
In-Reply-To: <1ea81fa2-1dc8-a0b9-aa32-3127e9354be2@marek.ca>
From: Rob Clark <robdclark@gmail.com>
Date: Sat, 15 Aug 2020 15:45:48 -0700
Message-ID: <CAF6AEGt+NV-T7Qo_-gLM981QBWy3865Vbj518sd-4XQJccX_WA@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v10 3/5] drm/msm/dp: add support for DP PLL
 driver
To: Jonathan Marek <jonathan@marek.ca>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Tanmay Shah <tanmay@codeaurora.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 khsieh@codeaurora.org, Sean Paul <seanpaul@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vara Reddy <varar@codeaurora.org>, aravindh@codeaurora.org,
 freedreno <freedreno@lists.freedesktop.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Aug 15, 2020 at 2:21 PM Jonathan Marek <jonathan@marek.ca> wrote:
>
> On 8/15/20 4:20 PM, Rob Clark wrote:
> > On Fri, Aug 14, 2020 at 10:05 AM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> >>
> >>
> >> On 12/08/2020 07:42, Tanmay Shah wrote:
> >>   > From: Chandan Uddaraju <chandanu@codeaurora.org>
> >>   >
> >>   > Add the needed DP PLL specific files to support
> >>   > display port interface on msm targets.
> >>
> >> [skipped]
> >>
> >>   > diff --git a/drivers/gpu/drm/msm/dp/dp_pll_private.h
> >> b/drivers/gpu/drm/msm/dp/dp_pll_private.h
> >>   > new file mode 100644
> >>   > index 000000000000..475ba6ed59ab
> >>   > --- /dev/null
> >>   > +++ b/drivers/gpu/drm/msm/dp/dp_pll_private.h
> >>   > @@ -0,0 +1,98 @@
> >>   > +/* SPDX-License-Identifier: GPL-2.0-only */
> >>   > +/*
> >>   > + * Copyright (c) 2016-2020, The Linux Foundation. All rights reserved.
> >>   > + */
> >>   > +
> >>   > +#ifndef __DP_PLL_10NM_H
> >>   > +#define __DP_PLL_10NM_H
> >>   > +
> >>   > +#include "dp_pll.h"
> >>   > +#include "dp_reg.h"
> >>   > +
> >>   > +#define DP_VCO_HSCLK_RATE_1620MHZDIV1000    1620000UL
> >>   > +#define DP_VCO_HSCLK_RATE_2700MHZDIV1000    2700000UL
> >>   > +#define DP_VCO_HSCLK_RATE_5400MHZDIV1000    5400000UL
> >>   > +#define DP_VCO_HSCLK_RATE_8100MHZDIV1000    8100000UL
> >>   > +
> >>   > +#define NUM_DP_CLOCKS_MAX            6
> >>   > +
> >>   > +#define DP_PHY_PLL_POLL_SLEEP_US        500
> >>   > +#define DP_PHY_PLL_POLL_TIMEOUT_US        10000
> >>   > +
> >>   > +#define DP_VCO_RATE_8100MHZDIV1000        8100000UL
> >>   > +#define DP_VCO_RATE_9720MHZDIV1000        9720000UL
> >>   > +#define DP_VCO_RATE_10800MHZDIV1000        10800000UL
> >>   > +
> >>   > +struct dp_pll_vco_clk {
> >>   > +    struct clk_hw hw;
> >>   > +    unsigned long    rate;        /* current vco rate */
> >>   > +    u64        min_rate;    /* min vco rate */
> >>   > +    u64        max_rate;    /* max vco rate */
> >>   > +    void        *priv;
> >>   > +};
> >>   > +
> >>   > +struct dp_pll_db {
> >>
> >> This struct should probably go into dp_pll_10nm.c. dp_pll_7nm.c, for
> >> example, will use slightly different structure.
> >
> > Note that sboyd has a WIP series to move all of the pll code out to a
> > phy driver.  If there is work already happening on 7nm support, it
> > might be better to go with the separate phy driver approach?  I'm
> > still a bit undecided about whether to land the dp code initially with
> > the pll stuff in drm, and then continue refactoring to move to
> > separate phy driver upstream, or to strip out the pll code from the
> > beginning.  If you/someone is working on 7nm support, then feedback
> > about which approach is easier is welcome.
> >
> > https://lore.kernel.org/dri-devel/20200611091919.108018-1-swboyd@chromium.org/
> >
>
> I have a sm8150/sm8250 (7nm) upstream kernel stack with DP enabled, and
> I have done something similar, with the PLL driver in the QMP phy,
> although not based on sboyd's series (along with some typec changes to
> negotiate the DP alt mode and get HPD events, etc.). I don't think
> having PLL in drm/msm makes sense, the drm/msm DP driver shouldn't need
> to be aware of the DP PLL/PHY driver, it only needs to set the
> link/pixel clock rates which are in dispcc (and those then have the PLL
> clocks as a parent).

yeah, in the dp case, having phy split out makes a ton of sense.. it
would maybe be a nice cleanup in other cases (dsi, hdmi) but the
combination of usb+dp makes burying this in drm not so great..

It would be good if you could work w/ sboyd on this.. based on what
I've seen on previous gens, it is probably a different phy driver for
7nm vs 10nm, but I think where we want to end up upstream is with phy
split out of drm.

> FYI, since it sounds you are considering landing this: it is completely
> broken, for example:
> - ioremap()'s to #define'd addresses in the PLL driver
> - main DP driver reading/writing to registers in the PHY region, but
> getting the base address from devicetree was removed since earlier
> revisions, so it just fails completely. Look at usb3_dp_com (for
> example), which in dp_catalog_ctrl_usb_reset() would be used to
> overwrite registers already being driven by the qmp phy driver - but now
> the usb3_dp_com.base is never initialized.

Yeah, the idea to land dp isn't that it is perfect (or even not
broken), so much as having something upstream gives a common base for
others to work against.. maybe we should make the dp parts 'depends on
STAGING'?

I could keep a separate msm-next-dp branch that I rebase, to give a
common point for folks working dp support for various different gens
to coordinate work on.. that kinda sounds like a bunch of extra work
for me, so might as well land what we have somehow and work together
from there ;-)

But it does sound like you are making the case for including the patch
to drop the pll stuff and use phy framework as part of what initially
goes upstream.

BR,
-R

>
> -Jonathan
>
> > BR,
> > -R
> > _______________________________________________
> > Freedreno mailing list
> > Freedreno@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/freedreno
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
