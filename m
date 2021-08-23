Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4D73F48DB
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 12:47:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1B1989830;
	Mon, 23 Aug 2021 10:46:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1732B89830
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 10:46:57 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id w4so29173807ljh.13
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 03:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UmkfXGaYCdqSsvCrogHGEUgWw+TJ4SlfmjU5MN/PEBE=;
 b=cjqU7CIQQYnl3N9VSH9OdTpbfhx84HH/grPgOc+tCGAo2Yn2hAV0cMn3z8HTaVOuhA
 8Brg4z73NnaY2Z/CE8IaG11T82l0gL1ZP2mAHcCMwXtNviOz1cwQ7atSvkRP33js82FC
 tL3OJS+qxvVYzF3TYhi7jJG99T8jOBJM8RSwrLmSS6vtDNlXueNOFv50Q4BmfSf/V2kW
 jpK8t4qSsEu0v76ajcR4UzKY9YBd/hRYx4cCU6l6AsBCSBWNe3JTai52Wv7UVRmBdbxJ
 Pg+Ik2kyI7qbtIeypuO3uLwLKp7JZuw0yQNYCSOl6O3FaQojbcATlzG1xxwJABfP9fIQ
 rH8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UmkfXGaYCdqSsvCrogHGEUgWw+TJ4SlfmjU5MN/PEBE=;
 b=QL2r58Xnv8H5kvzfZ+H7zyAsH/zU0xzsThVMFmTYftZucMfl2pHVVc4EYye+Sg4fTc
 5Lr1Qw6DW9Eb30STmrY37TfreNn4+Pj8qojiK0g2xiMqDK0+pSOYjfOWusy1vX6FCxJU
 VdaAD5wV/0P8U5Nb161+koiMZnOsWS1otzVNFbNiBKl0+lXr1q2M04usO6CLks1xAPk0
 8ITLP/C6FyelHA513Zx/NgK48LMDWkGry5qH2/KMF4f2v+8P3suD+LF/+SeKqKK6Xj5l
 YolTjBbqgzPjJWFBZihETgsL2sNTG8WCUS7C1ipxZDzrahq1lWG47cqHx5pkmuAiHofT
 bVPA==
X-Gm-Message-State: AOAM531csaqwsT1W/sf/0NGF1gZe69S8RyxXtyeP2VuRjU16vGyC1ZN9
 A+BBMKyDpH97uWqr01j3/1WQRAEc79WULzLnXfip+A==
X-Google-Smtp-Source: ABdhPJwROTbhLIghdJiFv3Mpx4km5TKucbukHEV5v0NDix1jHpH6ITt9xOVwuMgiEW0EE35GC/hK1ms310RYHiQipIA=
X-Received: by 2002:a2e:a410:: with SMTP id p16mr25247179ljn.364.1629715615237; 
 Mon, 23 Aug 2021 03:46:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210818043131.7klajx6drvvkftoc@vireshk-i7>
 <a2a3c41f-c5e4-ee7e-7d48-03af8bac8863@gmail.com>
 <20210818045307.4brb6cafkh3adjth@vireshk-i7>
 <080469b3-612b-3a34-86e5-7037a64de2fe@gmail.com>
 <20210818055849.ybfajzu75ecpdrbn@vireshk-i7>
 <f1c76f23-086d-ef36-54ea-0511b0ebe0e1@gmail.com>
 <20210818062723.dqamssfkf7lf7cf7@vireshk-i7>
 <CAPDyKFrZqWtZOp4MwDN6fShoLLbw5NM039bpE3-shB+fCEZOog@mail.gmail.com>
 <20210818091417.dvlnsxlgybdsn76x@vireshk-i7>
 <CAPDyKFrVxhrWGr2pKduehshpLFd_db2NTPGuD7fSqvuHeyzT4w@mail.gmail.com>
 <20210818095044.e2ntsm45h5cddk7s@vireshk-i7>
 <CAPDyKFrFF00xGDWPCQnPwF0_QkG4TB2UqggpuBpp8LY_CMKP-A@mail.gmail.com>
 <0354acbe-d856-4040-f453-8e8164102045@gmail.com>
 <CAPDyKFoQdn1rm91iFNJwZwpSYcKJBjDLqtJB4KZAkhgY1Grm-Q@mail.gmail.com>
 <87073fc2-d7b3-98f4-0067-29430ea2adef@gmail.com>
 <CAPDyKFqSsAk8a5CTNpRT2z4Wvf8BehJKDbVhUKfHc2Jzj7aTNA@mail.gmail.com>
 <9129a9f0-8c9b-d8e0-ddf5-c8820871fb7f@gmail.com>
In-Reply-To: <9129a9f0-8c9b-d8e0-ddf5-c8820871fb7f@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 23 Aug 2021 12:46:19 +0200
Message-ID: <CAPDyKFrWeQVNgxzmiLBXJ2gQW=iFf4aG16xvZ+ag1MkhXs9-BQ@mail.gmail.com>
Subject: Re: [PATCH v8 01/34] opp: Add dev_pm_opp_sync() helper
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Viresh Kumar <vireshk@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, Peter Chen <peter.chen@kernel.org>, 
 Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>, 
 Stefan Agner <stefan@agner.ch>, Adrian Hunter <adrian.hunter@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>, 
 Linux PM <linux-pm@vger.kernel.org>, Linux USB List <linux-usb@vger.kernel.org>,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-mmc <linux-mmc@vger.kernel.org>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 DTML <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>
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

[...]

> >>>> We have three components comprising PM on Tegra:
> >>>>
> >>>> 1. Power gate
> >>>> 2. Clock state
> >>>> 3. Voltage state
> >>>>
> >>>> GENPD on/off represents the 'power gate'.
> >>>>
> >>>> Clock and reset are controlled by device drivers using clk and rst APIs.
> >>>>
> >>>> Voltage state is represented by GENPD's performance level.
> >>>>
> >>>> GENPD core assumes that at a first rpm-resume of a consumer device, its
> >>>> genpd_performance=0. Not true for Tegra because h/w of the device is
> >>>> preconfigured to a non-zero perf level initially, h/w may not support
> >>>> zero level at all.
> >>>
> >>> I think you may be misunderstanding genpd's behaviour around this, but
> >>> let me elaborate.
> >>>
> >>> In genpd_runtime_resume(), we try to restore the performance state for
> >>> the device that genpd_runtime_suspend() *may* have dropped earlier.
> >>> That means, if genpd_runtime_resume() is called prior
> >>> genpd_runtime_suspend() for the first time, it means that
> >>> genpd_runtime_resume() will *not* restore a performance state, but
> >>> instead just leave the performance state as is for the device (see
> >>> genpd_restore_performance_state()).
> >>>
> >>> In other words, a consumer driver may use the following sequence to
> >>> set an initial performance state for the device during ->probe():
> >>>
> >>> ...
> >>> rate = clk_get_rate()
> >>> dev_pm_opp_set_rate(rate)
> >>>
> >>> pm_runtime_enable()
> >>> pm_runtime_resume_and_get()
> >>> ...
> >>>
> >>> Note that, it's the consumer driver's responsibility to manage device
> >>> specific resources, in its ->runtime_suspend|resume() callbacks.
> >>> Typically that means dealing with clock gating/ungating, for example.
> >>>
> >>> In the other scenario where a consumer driver prefers to *not* call
> >>> pm_runtime_resume_and_get() in its ->probe(), because it doesn't need
> >>> to power on the device to complete probing, then we don't want to vote
> >>> for an OPP at all - and we also want the performance state for the
> >>> device in genpd to be set to zero. Correct?
> >>
> >> Yes
> >>
> >>> Is this the main problem you are trying to solve, because I think this
> >>> doesn't work out of the box as of today?
> >>
> >> The main problem is that the restored performance state is zero for the
> >> first genpd_runtime_resume(), while it's not zero from the h/w perspective.
> >
> > This should not be a problem, but can be handled by the consumer driver.
> >
> > genpd_runtime_resume() calls genpd_restore_performance_state() to
> > restore a performance state for the device. However, in the scenario
> > you describe, "gpd_data->rpm_pstate" is zero, which makes
> > genpd_restore_performance_state() to just leave the device's
> > performance state as is - it will *not* restore the performance state
> > to zero.
> >
> > To make the consumer driver deal with this, it would need to call
> > dev_pm_opp_set_rate() from within its ->runtime_resume() callback.
> >
> >>
> >>> There is another concern though, but perhaps it's not a problem after
> >>> all. Viresh told us that dev_pm_opp_set_rate() may turn on resources
> >>> like clock/regulators. That could certainly be problematic, in
> >>> particular if the device and its genpd have OPP tables associated with
> >>> it and the consumer driver wants to follow the above sequence in
> >>> probe.
> >>
> >> dev_pm_opp_set_rate() won't enable clocks and regulators, but it may
> >> change the clock rate and voltage. This is also platform/driver specific
> >> because it's up to OPP user how to configure OPP table. On Tegra we only
> >> assign clock to OPP table, regulators are unused.
> >>
> >>> Viresh, can you please chime in here and elaborate on some of the
> >>> magic happening behind dev_pm_opp_set_rate() API - is there a problem
> >>> here or not?
> >>>
> >>>>
> >>>> GENPD core assumes that consumer devices can work at any performance
> >>>> level. Not true for Tegra because voltage needs to be set in accordance
> >>>> to the clock rate before clock is enabled, otherwise h/w won't work
> >>>> properly, perhaps clock may be unstable or h/w won't be latching.
> >>>
> >>> Correct. Genpd relies on the callers to use the OPP framework if there
> >>> are constraints like you describe above.
> >>>
> >>> That said, it's not forbidden for a consumer driver to call
> >>> dev_pm_genpd_set_performance_state() directly, but then it better
> >>> knows exactly what it's doing.
> >>>
> >>>>
> >>>> Performance level should be set to 0 while device is suspended.
> >>>
> >>> Do you mean system suspend or runtime suspend? Or both?
> >>
> >> Runtime suspend.
> >
> > Alright. So that's already taken care of for us in genpd_runtime_suspend().
> >
> > Or perhaps you have discovered some problem with this?
> >
> >>
> >>>> Performance level needs to be bumped on rpm-resume of a device in
> >>>> accordance to h/w state before hardware is enabled.
> >>>
> >>> Assuming there was a performance state set for the device when
> >>> genpd_runtime_suspend() was called, genpd_runtime_resume() will
> >>> restore that state according to the sequence you described.
> >>
> >> What do you think about adding API that will allow drivers to explicitly
> >> set the restored performance state of a power domain?
> >>
> >> Another option could be to change the GENPD core, making it to set the
> >> rpm_pstate when dev_pm_genpd_set_performance_state(dev) is invoked and
> >> device is rpm-suspended, instead of calling the
> >> genpd->set_performance_state callback.
> >>
> >> Then drivers will be able to sync the perf state at a probe time.
> >>
> >> What do you think?
> >
> > I don't think it's needed, see my reply earlier above. However your
> > change touches another problem though, see below.
> >
> >>
> >> diff --git a/drivers/base/power/domain.c b/drivers/base/power/domain.c
> >> index a934c679e6ce..cc15ab9eacc9 100644
> >> --- a/drivers/base/power/domain.c
> >> +++ b/drivers/base/power/domain.c
> >> @@ -435,7 +435,7 @@ static void genpd_restore_performance_state(struct
> >> device *dev,
> >>  int dev_pm_genpd_set_performance_state(struct device *dev, unsigned int
> >> state)
> >>  {
> >>         struct generic_pm_domain *genpd;
> >> -       int ret;
> >> +       int ret = 0;
> >>
> >>         genpd = dev_to_genpd_safe(dev);
> >>         if (!genpd)
> >> @@ -446,7 +446,10 @@ int dev_pm_genpd_set_performance_state(struct
> >> device *dev, unsigned int state)
> >>                 return -EINVAL;
> >>
> >>         genpd_lock(genpd);
> >> -       ret = genpd_set_performance_state(dev, state);
> >> +       if (pm_runtime_suspended(dev))
> >> +               dev_gpd_data(dev)->rpm_pstate = state;
> >> +       else
> >> +               ret = genpd_set_performance_state(dev, state);
> >>         genpd_unlock(genpd);
> >
> > This doesn't work for all cases. For example, when a consumer driver
> > deploys runtime PM support in its ->probe() according to the below
> > sequence:
> >
> > ...
> > dev_pm_opp_set_rate(rate)
> > pm_runtime_get_noresume()
> > pm_runtime_set_active()
> > pm_runtime_enable()
> > ...
> > pm_runtime_put()
> > ...
> >
> > We need to call genpd_set_performance_state() independently of whether
> > the device is runtime suspended or not.
>
> I don't see where is the problem in yours example.
>
> pm_runtime_suspended() = false while RPM is disabled. When device is
> resumed, the rpm_pstate=0, so it won't change the pstate on resume.

Yes, you are certainly correct, my bad! I mixed it up with
pm_runtime_status_suspended(), which only cares about the status.

So, after a second thought, your suggestion sounds very much
reasonable to me! I have also tried to consider all different
scenarios, including the system suspend/resume path, but I think it
should be fine.

I also think that a patch like the above should be considered as a
fix, because it actually fixes a problem, according to what I said in
my earlier reply, below.

Fixes : 5937c3ce2122 ("PM: domains: Drop/restore performance state
votes for devices at runtime PM").

>
> > Although, it actually seems like good idea to update
> > dev_gpd_data(dev)->rpm_pstate = state here, as to make sure
> > genpd_runtime_resume() doesn't restore an old/invalid value that was
> > saved while dropping the performance state vote for the device in
> > genpd_runtime_suspend() earlier.
> >
> > Let me send a patch for this shortly, to close this window of a possible error.
>
> It will also remove the need to resume device just to change the clock
> rate, like I needed to do it in the PWM patch of this series.

Do you want to send the patch formally? Or do you prefer it if I do it?

Kind regards
Uffe
