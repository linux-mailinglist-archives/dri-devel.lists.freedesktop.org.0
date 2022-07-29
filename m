Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E45055850F4
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 15:35:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C70110F4E4;
	Fri, 29 Jul 2022 13:35:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC53110E529;
 Fri, 29 Jul 2022 13:35:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4C44BB826FA;
 Fri, 29 Jul 2022 13:35:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF0D9C433D6;
 Fri, 29 Jul 2022 13:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659101718;
 bh=g7Gd/PoHfjOyzH34IAYZoXpagm7Fnjjg/cxFUIUV/tg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dsQCVsvr8fYQW+jJdJNEjOp0TTXdK0E8ygyu3TR1eYM8ZEYFY49k9mrMZSJ3vb+WQ
 LU0TAWEFXuqIFki2vXl5NhBA8XBxmu3JPXhRu+pbNGH1SeNWW7RYZ8zoa9oN43iHvH
 rl2WJvA/pW2fZn5qOiKPN8ZmciHh5pERiVlPqVSgXdOd9Vudo0gRSPggdzTp/IvH2J
 2tdjRUVPbnybzkJfdoSjMYxOaghQau7ro1DnCEFJ5I7k1/dMep6m8AbQP5MyrHbQjF
 I67tPRgugyWyl+W4V19+qY/haX6PQ2huMS5qNmySA8toWXfSlHbnSz11Bi49hDSPQv
 +ZhFY3PWvEG+g==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1oHQ9N-0002Vi-9d; Fri, 29 Jul 2022 15:35:34 +0200
Date: Fri, 29 Jul 2022 15:35:33 +0200
From: Johan Hovold <johan@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v16 0/3] eDP/DP Phy vdda realted function
Message-ID: <YuPiJWQ1/wQbkvD8@hovoldconsulting.com>
References: <1657038556-2231-1-git-send-email-quic_khsieh@quicinc.com>
 <YtkrDcjTGhpaU1e0@hovoldconsulting.com>
 <CAA8EJprQnnWjDZJy9+zUBsVQCi3jtc0Ngtzzk9MXpwOvuAS68g@mail.gmail.com>
 <CAD=FV=W0m-x9JC=5hQ3urSNmUp8sY-u8YkNd66yrKfRNAH4rcg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=W0m-x9JC=5hQ3urSNmUp8sY-u8YkNd66yrKfRNAH4rcg@mail.gmail.com>
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Andy Gross <agross@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, Mark Brown <broonie@kernel.org>,
 Sean Paul <sean@poorly.run>, Vinod Koul <vkoul@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sorry about the late follow-up on this. Has been one of those
constant-preemption weeks.

And thanks Doug and Mark for the insightful comments in this and the
dt-load RFC thread.

On Thu, Jul 21, 2022 at 07:49:55AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Thu, Jul 21, 2022 at 6:25 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > > This series breaks USB and PCIe for some SC8280XP and SA540P machines
> > > where the DP PHY regulators are shared with other PHYs whose drivers do
> > > not request a load.
> >
> > I'm trying to understand, why does this series cause the regression.
> > Previously it would be the DP controller voting on the regulators
> > load, now it has been moved to the DP/eDP PHYs.
> 
> I think in the past not many device trees actually hooked up the
> regulators to the DP/eDP but did hook up the regulators to the PHYs?
> That means they didn't used to get a regulator_set_load() on them and
> now they do?

This was the case for us, but this could probably also partly be blamed
on the DP stuff being work-in-progress and the regulators were only ever
specified in the PHY nodes.

> It should also be noted that we're now setting the load for a bunch of
> USB PHYs that we didn't used to set a load on...

That was my concern. But after skimming the mainline dts it seems that
no users of these drivers are currently allowing the regulator mode to
be changed for those particular regulators.

Well, except for the sc8280xp (derivate) machines in -next that I'm
working on and that regressed of course.

I guess we just need to drop all those regulator-allow-set-load
properties for now even if using DT for power-management configuration
this way does seem to run against the whole DT-as-hardware-description
idea (e.g. we may want to add them back when/if active- and idle loads
are specified by the corresponding Linux drivers).

> > > It seems quite likely that changes like this one affects other systems
> > > too, and the effects may be hard to debug. So a more general solution
> > > than playing whack-a-mole using DT would be good to have.
> >
> > I think enabling a regulator which supports set_load() and without
> > load being set should cause a warning, at least with
> > CONFIG_REGULATOR_DEBUG. WDYT?
> 
> I'm not a total fan. I'd love to see evidence to the contrary, but I'm
> a believer that the amount of extra cruft involved with all these
> regulator_set_load() calls is overkill for most cases. All the extra
> code / per-SoC tables added to drivers isn't ideal.
> 
> Every single LDO on Qualcomm's PMICs seems to be able to be set in
> "high power mode" and "low power mode", but I think the majority of
> clients only really care about two things: on and in high power mode
> vs. off. I think the amount of stuff peripherals can do in low power
> mode is super limited, so you have to be _really_ sure that the
> peripheral won't draw too much current without you having a chance to
> reconfigure the regulator.
> 
> Of course, if the load could be easily specified in the device tree
> and we could get rid of all the cruft in the drivers then maybe that
> would be OK.

It seems a decision was made against this (which I tend to agree with),
and that instead it is now easier for drivers to specify loads using
your updated bulk-regulator implementation.

But that doesn't address the problem that was trying to highlight here,
and that you had noticed years ago, namely that using set_load only
works reliably if *all* consumers use it.

Otherwise we may end up with a couple of drivers adding some 10 mA each to
the load, while other driver do not specify a load so that while the
actual load is really above the 30 mA HPM threshold, we still end up in
LPM.

Shouldn't an enabled regulator from a consumer that didn't specify a
load somehow result in HPM always being selected (e.g. count as INT_MAX
load as Doug suggested some years ago)?

Note that LPM may be ok until that last consumer that didn't specify a
load pushes it over the HPM threshold (so specifying a regulator base
load in DT would also prevent ever selecting LPM).

This case of mixing consumers that specify and don't specify loads might
at least warrant a warning otherwise to avoid ending up in a
hard-to-debug situation with failing USB and PCIe due to a seemingly
unrelated DP PHY update.

At some point in the discussion I thought Mark suggested removing
set_load from drivers that don't actually manage active and idle loads.
That would also work, at least until the day one of the drivers adds
support for idle loads.

Johan
