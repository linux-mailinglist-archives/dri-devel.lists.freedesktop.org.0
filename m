Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1729C247836
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 22:37:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50C4289F55;
	Mon, 17 Aug 2020 20:37:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C855989F4F;
 Mon, 17 Aug 2020 20:37:37 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id d190so14338615wmd.4;
 Mon, 17 Aug 2020 13:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yjjlfA5SIH3iANzOqp3Q42Bk0qS4JZqVM5JMYxnxNMY=;
 b=fkIj8PxW7fObxkulS7LlzxGxhfnICAcPnTX7YG87lfY9u8HusanjsAzSX5RxQM6NJH
 iQ0LYNGP2N3mRzW4cQdhLtjKD84xljtQ4flihEqRKtnFOBHHlu+9ZSRkH7htbx/XEMWS
 Q1AU9ObDjGrHDwLZkui0WeNu4l2g+SyoS94cR9axD9bO/O3McDUsTAeVQxMonJVvUGGz
 l+x+jT5vUw4MWVKfDP+0GeG7+4NKiRUHEUcjFisnZCb8oPDoJVQijiRNcGExbrvM7RpD
 VxgDl6oxkzRPC2xwReF8zVjvGWZ90jFTjHX+Ojm5xaeeBs+vBRffqIYNFpbNPUZUzTrM
 FqTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yjjlfA5SIH3iANzOqp3Q42Bk0qS4JZqVM5JMYxnxNMY=;
 b=Fr5zPqZDkrEBvEIX6W37U0smcf+VjsnzgdFrtwgWKgDMuYfDarKEGdbEs13H8tZJg5
 wibbGvW1pS40xQP++YDbv0BsNLs4Tm9uW45V8BR6HzqYMYhWV/ab9dGapkAMerZZ3A7n
 RR37TUchU3JZx8hK/SN47DghsyW7LH6Hc8Jc+dQWy7nIulT8oPafBaaYr23A3C6kO7Ti
 tvyqH9e6tGIBUi3MiJCwrj8DKU3lkrRLPeKo7gBB9IpvrlwRrp4t+V7TWg/1Ewyy/bfv
 wPX0qY1EBIBtmiDzSjEpXbBraMZhucYi2GaShMVY6C1gCyfgoX8sWvsJRuMJudx/Qg6Q
 N+Xg==
X-Gm-Message-State: AOAM53083B1nSZZikHkHj6ZvBP2A/7v8eHGa4BFECgo+x7ENpKmpsdoo
 pGQnCZN09U6Fttl9nVb32WSjrUshVMVjkjopKtY=
X-Google-Smtp-Source: ABdhPJxMHUN22Y2LCJd5a6GMrlUjwkav8ruqE+rA4jvvpRZ3M53vaGfrjREbtGXwocAFg0Sz1hQxui8NK7jcWESGW90=
X-Received: by 2002:a1c:4c17:: with SMTP id z23mr16891369wmf.49.1597696656253; 
 Mon, 17 Aug 2020 13:37:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200812044223.19279-1-tanmay@codeaurora.org>
 <20200812044223.19279-4-tanmay@codeaurora.org>
 <821b5cf9-5ca0-7026-fd99-9a32285ed030@linaro.org>
 <CAF6AEGtcfXodN1_HSdTcH402FdwTk15Nt6p3F=QYeSRhTc+hqw@mail.gmail.com>
 <1ea81fa2-1dc8-a0b9-aa32-3127e9354be2@marek.ca>
 <CAF6AEGt+NV-T7Qo_-gLM981QBWy3865Vbj518sd-4XQJccX_WA@mail.gmail.com>
 <d67ffcd6-b10c-92a4-55a7-40521b3be68f@linaro.org>
In-Reply-To: <d67ffcd6-b10c-92a4-55a7-40521b3be68f@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 17 Aug 2020 13:37:24 -0700
Message-ID: <CAF6AEGuiiJOp4gD3tL9i-o+UFeu=Au5zpGjQ4-wjNj9Lu4OCNA@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v10 3/5] drm/msm/dp: add support for DP PLL
 driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 khsieh@codeaurora.org, Sean Paul <seanpaul@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Vara Reddy <varar@codeaurora.org>,
 aravindh@codeaurora.org, freedreno <freedreno@lists.freedesktop.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 17, 2020 at 1:32 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 16/08/2020 01:45, Rob Clark wrote:
> > On Sat, Aug 15, 2020 at 2:21 PM Jonathan Marek <jonathan@marek.ca> wrote:
> >>
> >> On 8/15/20 4:20 PM, Rob Clark wrote:
> >>> On Fri, Aug 14, 2020 at 10:05 AM Dmitry Baryshkov
> >>> <dmitry.baryshkov@linaro.org> wrote:
> >>>>
> >>>>
> >>>> On 12/08/2020 07:42, Tanmay Shah wrote:
> >>>>    > From: Chandan Uddaraju <chandanu@codeaurora.org>
> >>>>    >
> >>>>    > Add the needed DP PLL specific files to support
> >>>>    > display port interface on msm targets.
> >>>>
> >>>> [skipped]
> >>>>
> >>>>    > diff --git a/drivers/gpu/drm/msm/dp/dp_pll_private.h
> >>>> b/drivers/gpu/drm/msm/dp/dp_pll_private.h
> >>>>    > new file mode 100644
> >>>>    > index 000000000000..475ba6ed59ab
> >>>>    > --- /dev/null
> >>>>    > +++ b/drivers/gpu/drm/msm/dp/dp_pll_private.h
> >>>>    > @@ -0,0 +1,98 @@
> >>>>    > +/* SPDX-License-Identifier: GPL-2.0-only */
> >>>>    > +/*
> >>>>    > + * Copyright (c) 2016-2020, The Linux Foundation. All rights reserved.
> >>>>    > + */
> >>>>    > +
> >>>>    > +#ifndef __DP_PLL_10NM_H
> >>>>    > +#define __DP_PLL_10NM_H
> >>>>    > +
> >>>>    > +#include "dp_pll.h"
> >>>>    > +#include "dp_reg.h"
> >>>>    > +
> >>>>    > +#define DP_VCO_HSCLK_RATE_1620MHZDIV1000    1620000UL
> >>>>    > +#define DP_VCO_HSCLK_RATE_2700MHZDIV1000    2700000UL
> >>>>    > +#define DP_VCO_HSCLK_RATE_5400MHZDIV1000    5400000UL
> >>>>    > +#define DP_VCO_HSCLK_RATE_8100MHZDIV1000    8100000UL
> >>>>    > +
> >>>>    > +#define NUM_DP_CLOCKS_MAX            6
> >>>>    > +
> >>>>    > +#define DP_PHY_PLL_POLL_SLEEP_US        500
> >>>>    > +#define DP_PHY_PLL_POLL_TIMEOUT_US        10000
> >>>>    > +
> >>>>    > +#define DP_VCO_RATE_8100MHZDIV1000        8100000UL
> >>>>    > +#define DP_VCO_RATE_9720MHZDIV1000        9720000UL
> >>>>    > +#define DP_VCO_RATE_10800MHZDIV1000        10800000UL
> >>>>    > +
> >>>>    > +struct dp_pll_vco_clk {
> >>>>    > +    struct clk_hw hw;
> >>>>    > +    unsigned long    rate;        /* current vco rate */
> >>>>    > +    u64        min_rate;    /* min vco rate */
> >>>>    > +    u64        max_rate;    /* max vco rate */
> >>>>    > +    void        *priv;
> >>>>    > +};
> >>>>    > +
> >>>>    > +struct dp_pll_db {
> >>>>
> >>>> This struct should probably go into dp_pll_10nm.c. dp_pll_7nm.c, for
> >>>> example, will use slightly different structure.
> >>>
> >>> Note that sboyd has a WIP series to move all of the pll code out to a
> >>> phy driver.  If there is work already happening on 7nm support, it
> >>> might be better to go with the separate phy driver approach?  I'm
> >>> still a bit undecided about whether to land the dp code initially with
> >>> the pll stuff in drm, and then continue refactoring to move to
> >>> separate phy driver upstream, or to strip out the pll code from the
> >>> beginning.  If you/someone is working on 7nm support, then feedback
> >>> about which approach is easier is welcome.
> >>>
> >>> https://lore.kernel.org/dri-devel/20200611091919.108018-1-swboyd@chromium.org/
> >>>
> >>
> >> I have a sm8150/sm8250 (7nm) upstream kernel stack with DP enabled, and
> >> I have done something similar, with the PLL driver in the QMP phy,
> >> although not based on sboyd's series (along with some typec changes to
> >> negotiate the DP alt mode and get HPD events, etc.). I don't think
> >> having PLL in drm/msm makes sense, the drm/msm DP driver shouldn't need
> >> to be aware of the DP PLL/PHY driver, it only needs to set the
> >> link/pixel clock rates which are in dispcc (and those then have the PLL
> >> clocks as a parent).
> >
> > yeah, in the dp case, having phy split out makes a ton of sense.. it
> > would maybe be a nice cleanup in other cases (dsi, hdmi) but the
> > combination of usb+dp makes burying this in drm not so great..
> >
> > It would be good if you could work w/ sboyd on this.. based on what
> > I've seen on previous gens, it is probably a different phy driver for
> > 7nm vs 10nm, but I think where we want to end up upstream is with phy
> > split out of drm.
>
> 7nm differs in registers programming, so it would end up with a separate
> set of tables in qmp phy driver. There is also a 14nm version of dp phy,
> but I don't know if it usable in any actual hardware design.
>

I'll defer to Stephen about phy stuff, but was kinda just expecting to
have different phy drivers for different process sizes, rather than
trying to bundle it all in one phy driver.  At least what I've seen
before for dsi/hdmi/etc phy's is that the register programming is
different enough to not really share much.

BR,
-R
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
