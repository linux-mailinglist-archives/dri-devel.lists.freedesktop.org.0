Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E86872477CF
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 22:00:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13B6B89904;
	Mon, 17 Aug 2020 20:00:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89DC789904
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 20:00:51 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1597694453; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=NdD48skVszuOItAKskoiRELtYxmKvKcR/jrt0QNwEyM=;
 b=R8CRQm4CaK4QqkBjH46zF4M1TW5EJyADc1zO/5+gWZyQxASghg72XHvTDQZASPadsVQOPtUE
 IyWC8fxN0VGa6trguJ3WD3YLFb6OI54qLW7SApsneI2guis//qcYR7vODAr+SPXetBKD7jwb
 o3zQyWPVQO56qsUmeq8nAvXjt2w=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5f3ae1ddd96d28d61ea08082 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 17 Aug 2020 20:00:29
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 91ECBC433C6; Mon, 17 Aug 2020 20:00:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: tanmay)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 02D87C433CA;
 Mon, 17 Aug 2020 20:00:26 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 17 Aug 2020 13:00:26 -0700
From: Tanmay Shah <tanmay@codeaurora.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [Freedreno] [PATCH v10 3/5] drm/msm/dp: add support for DP PLL
 driver
In-Reply-To: <CAF6AEGt+NV-T7Qo_-gLM981QBWy3865Vbj518sd-4XQJccX_WA@mail.gmail.com>
References: <20200812044223.19279-1-tanmay@codeaurora.org>
 <20200812044223.19279-4-tanmay@codeaurora.org>
 <821b5cf9-5ca0-7026-fd99-9a32285ed030@linaro.org>
 <CAF6AEGtcfXodN1_HSdTcH402FdwTk15Nt6p3F=QYeSRhTc+hqw@mail.gmail.com>
 <1ea81fa2-1dc8-a0b9-aa32-3127e9354be2@marek.ca>
 <CAF6AEGt+NV-T7Qo_-gLM981QBWy3865Vbj518sd-4XQJccX_WA@mail.gmail.com>
Message-ID: <544ff63864a06f70f7b4541b913180bf@codeaurora.org>
X-Sender: tanmay@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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
Cc: "open list:OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 dri-devel <dri-devel-bounces@lists.freedesktop.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 khsieh@codeaurora.org, Sean Paul <seanpaul@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vara Reddy <varar@codeaurora.org>, aravindh@codeaurora.org,
 freedreno <freedreno@lists.freedesktop.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-08-15 15:45, Rob Clark wrote:
> On Sat, Aug 15, 2020 at 2:21 PM Jonathan Marek <jonathan@marek.ca> 
> wrote:
>> 
>> On 8/15/20 4:20 PM, Rob Clark wrote:
>> > On Fri, Aug 14, 2020 at 10:05 AM Dmitry Baryshkov
>> > <dmitry.baryshkov@linaro.org> wrote:
>> >>
>> >>
>> >> On 12/08/2020 07:42, Tanmay Shah wrote:
>> >>   > From: Chandan Uddaraju <chandanu@codeaurora.org>
>> >>   >
>> >>   > Add the needed DP PLL specific files to support
>> >>   > display port interface on msm targets.
>> >>
>> >> [skipped]
>> >>
>> >>   > diff --git a/drivers/gpu/drm/msm/dp/dp_pll_private.h
>> >> b/drivers/gpu/drm/msm/dp/dp_pll_private.h
>> >>   > new file mode 100644
>> >>   > index 000000000000..475ba6ed59ab
>> >>   > --- /dev/null
>> >>   > +++ b/drivers/gpu/drm/msm/dp/dp_pll_private.h
>> >>   > @@ -0,0 +1,98 @@
>> >>   > +/* SPDX-License-Identifier: GPL-2.0-only */
>> >>   > +/*
>> >>   > + * Copyright (c) 2016-2020, The Linux Foundation. All rights
> reserved.
>> >>   > + */
>> >>   > +
>> >>   > +#ifndef __DP_PLL_10NM_H
>> >>   > +#define __DP_PLL_10NM_H
>> >>   > +
>> >>   > +#include "dp_pll.h"
>> >>   > +#include "dp_reg.h"
>> >>   > +
>> >>   > +#define DP_VCO_HSCLK_RATE_1620MHZDIV1000    1620000UL
>> >>   > +#define DP_VCO_HSCLK_RATE_2700MHZDIV1000    2700000UL
>> >>   > +#define DP_VCO_HSCLK_RATE_5400MHZDIV1000    5400000UL
>> >>   > +#define DP_VCO_HSCLK_RATE_8100MHZDIV1000    8100000UL
>> >>   > +
>> >>   > +#define NUM_DP_CLOCKS_MAX            6
>> >>   > +
>> >>   > +#define DP_PHY_PLL_POLL_SLEEP_US        500
>> >>   > +#define DP_PHY_PLL_POLL_TIMEOUT_US        10000
>> >>   > +
>> >>   > +#define DP_VCO_RATE_8100MHZDIV1000        8100000UL
>> >>   > +#define DP_VCO_RATE_9720MHZDIV1000        9720000UL
>> >>   > +#define DP_VCO_RATE_10800MHZDIV1000        10800000UL
>> >>   > +
>> >>   > +struct dp_pll_vco_clk {
>> >>   > +    struct clk_hw hw;
>> >>   > +    unsigned long    rate;        /* current vco rate */
>> >>   > +    u64        min_rate;    /* min vco rate */
>> >>   > +    u64        max_rate;    /* max vco rate */
>> >>   > +    void        *priv;
>> >>   > +};
>> >>   > +
>> >>   > +struct dp_pll_db {
>> >>
>> >> This struct should probably go into dp_pll_10nm.c. dp_pll_7nm.c, for
>> >> example, will use slightly different structure.
>> >
>> > Note that sboyd has a WIP series to move all of the pll code out to a
>> > phy driver.  If there is work already happening on 7nm support, it
>> > might be better to go with the separate phy driver approach?  I'm
>> > still a bit undecided about whether to land the dp code initially with
>> > the pll stuff in drm, and then continue refactoring to move to
>> > separate phy driver upstream, or to strip out the pll code from the
>> > beginning.  If you/someone is working on 7nm support, then feedback
>> > about which approach is easier is welcome.
>> >
>> >
> https://lore.kernel.org/dri-devel/20200611091919.108018-1-swboyd@chromium.
> org/
>> >
>> 
>> I have a sm8150/sm8250 (7nm) upstream kernel stack with DP enabled, 
>> and
>> I have done something similar, with the PLL driver in the QMP phy,
>> although not based on sboyd's series (along with some typec changes to
>> negotiate the DP alt mode and get HPD events, etc.). I don't think
>> having PLL in drm/msm makes sense, the drm/msm DP driver shouldn't 
>> need
>> to be aware of the DP PLL/PHY driver, it only needs to set the
>> link/pixel clock rates which are in dispcc (and those then have the 
>> PLL
>> clocks as a parent).
> 
> yeah, in the dp case, having phy split out makes a ton of sense.. it
> would maybe be a nice cleanup in other cases (dsi, hdmi) but the
> combination of usb+dp makes burying this in drm not so great..
> 
> It would be good if you could work w/ sboyd on this.. based on what
> I've seen on previous gens, it is probably a different phy driver for
> 7nm vs 10nm, but I think where we want to end up upstream is with phy
> split out of drm.
> 
>> FYI, since it sounds you are considering landing this: it is 
>> completely
>> broken, for example:
>> - ioremap()'s to #define'd addresses in the PLL driver
>> - main DP driver reading/writing to registers in the PHY region, but
>> getting the base address from devicetree was removed since earlier
>> revisions, so it just fails completely. Look at usb3_dp_com (for
>> example), which in dp_catalog_ctrl_usb_reset() would be used to
>> overwrite registers already being driven by the qmp phy driver - but 
>> now
>> the usb3_dp_com.base is never initialized.
> 
> Yeah, the idea to land dp isn't that it is perfect (or even not
> broken), so much as having something upstream gives a common base for
> others to work against.. maybe we should make the dp parts 'depends on
> STAGING'?
> 
> I could keep a separate msm-next-dp branch that I rebase, to give a
> common point for folks working dp support for various different gens
> to coordinate work on.. that kinda sounds like a bunch of extra work
> for me, so might as well land what we have somehow and work together
> from there ;-)
> 
> But it does sound like you are making the case for including the patch
> to drop the pll stuff and use phy framework as part of what initially
> goes upstream.
> 

I agree with Rob on landing what we have in DP driver. Of course, by 
addressing any outstanding comments. That would help in setting base 
functional code for DisplayPort
Bring-up. Other features such as PHY compliance and DP audio are 
dependent on these changes.

We don't want to keep PLL code in drm/msm directory and so we have 
removed bindings of PLL from DP node. Once base driver is merged, we can 
rebase Stephen's QMP PHY changes and merge them. Stephen's changes are 
removing PLL code from drm/msm directory already.

Other dependent patches for DisplayPort driver on msm are posted here:
https://lore.kernel.org/dri-devel/20200810232315.18707-1-khsieh@codeaurora.org/
https://lore.kernel.org/dri-devel/20200813015439.4174-2-abhinavk@codeaurora.org/


> BR,
> -R
> 
>> 
>> -Jonathan
>> 
>> > BR,
>> > -R
>> > _______________________________________________
>> > Freedreno mailing list
>> > Freedreno@lists.freedesktop.org
>> > https://lists.freedesktop.org/mailman/listinfo/freedreno
>> >
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
