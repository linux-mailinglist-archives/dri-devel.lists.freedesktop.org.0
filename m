Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8080E64A451
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 16:39:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F31E610E0E9;
	Mon, 12 Dec 2022 15:39:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A61710E0E9
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 15:39:47 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id 62so8431608pgb.13
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 07:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EJWrQfchThP1LaKGg1UlafmM0Ac0Bh9FhjzWGZsItiE=;
 b=hXm3SRPmg5IxfBnmyCy1vCjDQXQPEhhJ5+wgqp3IjHYxrUuumSgHWEr+vwbb4wPIgB
 G8Qqa1KF8dgch/WK9HwrC5yoqd8O6uLMfqt6wNM+KYPqrMdmTFCsCwqOJMaVDFSsLgpZ
 Qy2H/2UF2w2K9eEGVNoCBDp8OzxIQhJwYhWv6zeA0DVP9jp8tHB7DklkXlFHXjTkkX8G
 ZdmtjRxVsS5KSWjW3Rnzxcw9p4HYI4TpA7aWaRavqt/L1NLB+SmsgZRXMXoD9twsjF01
 RHmm+77taT4NZQWgYTUiLH+OCQJwWnP9SVzzBOubqnyCiuSHr9B8GsfsF0UmcZ9piBsf
 +lJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EJWrQfchThP1LaKGg1UlafmM0Ac0Bh9FhjzWGZsItiE=;
 b=H2vFUeqEtxv9Kwbz4/K/Ymg2MpjGoXzzHIh+nXxUeuaK1Wc10QWtuzUCeKJUjRVpKd
 +5pYzMitgHLM1sPFZe1hONdyUnzIKvTpahspooUwm8/Mi1pEG+EoXCjwjD8nPujWAJ9K
 6bFLiJfUKULryends1e5Vdhjj3cAtZ8A/7AP/VrNPR9yWYUv68U55+gzXJ8eQmh/wHAk
 Q8OFMMk4pk+29eyNc6e2qkNqYWg3UV+Lw9Q8jVYISk8lk23EHAkjDJB/9M5KeCcegJP+
 iOKtGAjcPZ2jmWCsBxk6GspDt41aLj8h/6XMghnBiv/uS8XHvaGFXdszPXpFqfxLuC2C
 7dGg==
X-Gm-Message-State: ANoB5pkn1dLO8NaFd6DYWwJeL614hZJYqHXlk+wALI3QKiQR0WpndsUp
 p75kgEBSGzoMYtVFgHgjCbtkd4taz13uTzVzwSRfbg==
X-Google-Smtp-Source: AA0mqf7BsdQCnUO8dM1h4/7bESRqWg7kackud8y9JmWtcS5n50B8gnvgLApVitrBea/4LNWpywhwfLkRUsFd+lZtOb8=
X-Received: by 2002:a05:6a00:1409:b0:56b:e1d8:e7a1 with SMTP id
 l9-20020a056a00140900b0056be1d8e7a1mr77943516pfu.28.1670859586280; Mon, 12
 Dec 2022 07:39:46 -0800 (PST)
MIME-Version: 1.0
References: <1664960824-20951-1-git-send-email-quic_akhilpo@quicinc.com>
 <20221201225705.46r2m35ketvzipox@builder.lan>
 <CAPDyKFofsqcoFbYt-9BcisbPdreLGqAAMWorqHi0_D1kwCdYhg@mail.gmail.com>
 <20221207165457.kwdwwiycbwjpogxl@builder.lan>
 <CAPDyKFpYgYkDdJ79xxkwr-Mqnj5CoBrV+ZZe6Xz4hGLNR4zUVw@mail.gmail.com>
 <20221208210622.x656vbf7rum5hrl7@builder.lan>
 <CAPDyKFpSXjcJZ=H491s74BChAV89pQ1Wm8PSdU0nVRfroK1=4A@mail.gmail.com>
In-Reply-To: <CAPDyKFpSXjcJZ=H491s74BChAV89pQ1Wm8PSdU0nVRfroK1=4A@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 12 Dec 2022 16:39:09 +0100
Message-ID: <CAPDyKFrTY8exxFCxXG_ptnRvECYggBBrC2q=MewuEkSj+mxwug@mail.gmail.com>
Subject: Re: [PATCH v7 0/6] clk/qcom: Support gdsc collapse polling using
 'reset' interface
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>
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
Cc: David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-clk@vger.kernel.org, Andy Gross <agross@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Stephen Boyd <swboyd@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>,
 Stephen Boyd <sboyd@kernel.org>, Douglas Anderson <dianders@chromium.org>,
 krzysztof.kozlowski@linaro.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 9 Dec 2022 at 18:36, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Thu, 8 Dec 2022 at 22:06, Bjorn Andersson <andersson@kernel.org> wrote:
> >
> > On Thu, Dec 08, 2022 at 02:40:55PM +0100, Ulf Hansson wrote:
> > > On Wed, 7 Dec 2022 at 17:55, Bjorn Andersson <andersson@kernel.org> wrote:
> > > >
> > > > On Wed, Dec 07, 2022 at 05:00:51PM +0100, Ulf Hansson wrote:
> > > > > On Thu, 1 Dec 2022 at 23:57, Bjorn Andersson <andersson@kernel.org> wrote:
> > > > > >
> > > > > > On Wed, Oct 05, 2022 at 02:36:58PM +0530, Akhil P Oommen wrote:
> > > > > > >
> > > > > >
> > > > > > @Ulf, Akhil has a power-domain for a piece of hardware which may be
> > > > > > voted active by multiple different subsystems (co-processors/execution
> > > > > > contexts) in the system.
> > > > > >
> > > > > > As such, during the powering down sequence we don't wait for the
> > > > > > power-domain to turn off. But in the event of an error, the recovery
> > > > > > mechanism relies on waiting for the hardware to settle in a powered off
> > > > > > state.
> > > > > >
> > > > > > The proposal here is to use the reset framework to wait for this state
> > > > > > to be reached, before continuing with the recovery mechanism in the
> > > > > > client driver.
> > > > >
> > > > > I tried to review the series (see my other replies), but I am not sure
> > > > > I fully understand the consumer part.
> > > > >
> > > > > More exactly, when and who is going to pull the reset and at what point?
> > > > >
> > > > > >
> > > > > > Given our other discussions on quirky behavior, do you have any
> > > > > > input/suggestions on this?
> > > > > >
> > > > > > > Some clients like adreno gpu driver would like to ensure that its gdsc
> > > > > > > is collapsed at hardware during a gpu reset sequence. This is because it
> > > > > > > has a votable gdsc which could be ON due to a vote from another subsystem
> > > > > > > like tz, hyp etc or due to an internal hardware signal. To allow
> > > > > > > this, gpucc driver can expose an interface to the client driver using
> > > > > > > reset framework. Using this the client driver can trigger a polling within
> > > > > > > the gdsc driver.
> > > > > >
> > > > > > @Akhil, this description is fairly generic. As we've reached the state
> > > > > > where the hardware has settled and we return to the client, what
> > > > > > prevents it from being powered up again?
> > > > > >
> > > > > > Or is it simply a question of it hitting the powered-off state, not
> > > > > > necessarily staying there?
> > > > >
> > > > > Okay, so it's indeed the GPU driver that is going to assert/de-assert
> > > > > the reset at some point. Right?
> > > > >
> > > > > That seems like a reasonable approach to me, even if it's a bit
> > > > > unclear under what conditions that could happen.
> > > > >
> > > >
> > > > Generally the disable-path of the power-domain does not check that the
> > > > power-domain is actually turned off, because the status might indicate
> > > > that the hardware is voting for the power-domain to be on.
> > >
> > > Is there a good reason why the HW needs to vote too, when the GPU
> > > driver is already in control?
> > >
> > > Or perhaps that depends on the running use case?
> > >
> > > >
> > > > As part of the recovery of the GPU after some fatal fault, the GPU
> > > > driver does something which will cause the hardware votes for the
> > > > power-domain to be let go, and then the driver does pm_runtime_put().
> > >
> > > Okay. That "something", sounds like a device specific setting for the
> > > corresponding gdsc, right?
> > >
> > > So somehow the GPU driver needs to manage that setting, right?
> > >
> > > >
> > > > But in this case the GPU driver wants to ensure that the power-domain is
> > > > actually powered down, before it does pm_runtime_get() again. To ensure
> > > > that the hardware lost its state...
> > >
> > > I see.
> > >
> > > >
> > > > The proposal here is to use a reset to reach into the power-domain
> > > > provider and wait for the hardware to be turned off, before the GPU
> > > > driver attempts turning the power-domain on again.
> > > >
> > > >
> > > > In other words, there is no reset. This is a hack to make a normally
> > > > asynchronous pd.power_off() to be synchronous in this particular case.
> > >
> > > Alright, assuming I understood your clarifications above correctly
> > > (thanks!), I think I have got a much better picture now.
> > >
> > > Rather than abusing the reset interface, I think we should manage this
> > > through the genpd's power on/off notifiers (GENPD_NOTIFY_OFF). The GPU
> > > driver should register its corresponding device for them
> > > (dev_pm_genpd_add_notifier()).
> > >
> > > The trick however, is to make the behaviour of the power-domain for
> > > the gdsc (the genpd->power_off() callback) conditional on whether the
> > > HW is configured to vote or not. If the HW can vote, it should not
> > > poll for the state - and vice versa when the HW can't vote.
> > >
> >
> > Per Akhil's description I misunderstood who the other voters are; but
> > either way it's not the same "HW configured" mechanism as the one we're
> > already discussing.
>
> Okay, so this is another thing then.
>
> >
> >
> > But if we based on similar means could control if the power_off() ops
> > should be blocking, waiting for the status indication to show that the
> > hardware is indeed powered down, I think this would meet the needs.
>
> Right.
>
> >
> > And GENPD_NOTIFY_OFF seems to provide the notification that it was
> > successful (i.e. happened within the timeout etc).
> >
> > > Would this work?
> > >
> >
> > If we can control the behavior of the genpd, I think it would.
>
> Okay, it seems like we need a new dev_pm_genpd_* interface that
> consumers can call to instruct the genpd provider, that its
> ->power_off() callback needs to temporarily switch to become
> synchronous.
>
> I guess this could be useful for other similar cases too, where the
> corresponding PM domain isn't actually being powered off, but rather
> just voted for to become powered off, thus relying on the HW to do the
> aggregation.
>
> In any case, I am still a bit skeptical of the reset approach, as is
> being suggested in the $subject series. Even if it's rather nice and
> clean (but somewhat abusing the interface), it looks like there will
> be synchronization problems between the calls to the
> pm_runtime_put_sync() and reset_control_reset() in the GPU driver. The
> "reset" may actually already have happened when the call to
> reset_control_reset() is done, so we may fail to detect the power
> collapse, right!?
>
> Let me cook a patch for the new genpd interface that I have in mind,
> then we can see how that plays out together with the other parts. I
> will post it on Monday!

Below is the genpd patch that I had in mind.

As I stated above, the GPU driver would need to register for genpd's
power on/off notificers (GENPD_NOTIFY_OFF). Then it should call the
new dev_pm_genpd_synced_poweroff() and finally pm_runtime_put().
Moreover, when the GPU driver receives the GENPD_NOTIFY_OFF
notification, it should probably just kick a completion variable,
allowing the path that calls pm_runtime_put() to wait for the
notification to arrive.

On the genpd provider side, the ->power_off() callback should be
updated to check the new genpd->synced_poweroff variable, to indicate
whether it should poll for power collapse or not.

I think this should work, but if you still prefer to use the "reset"
approach, that's entirely up to you to decide.

Kind regards
Uffe

-----

From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 12 Dec 2022 16:08:05 +0100
Subject: [PATCH] PM: domains: Allow a genpd consumer to require a synced power
 off

TODO: Write commit message

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/base/power/domain.c | 22 ++++++++++++++++++++++
 include/linux/pm_domain.h   |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/base/power/domain.c b/drivers/base/power/domain.c
index b46aa490b4cd..3402b2ea7f61 100644
--- a/drivers/base/power/domain.c
+++ b/drivers/base/power/domain.c
@@ -494,6 +494,27 @@ void dev_pm_genpd_set_next_wakeup(struct device
*dev, ktime_t next)
 }
 EXPORT_SYMBOL_GPL(dev_pm_genpd_set_next_wakeup);

+/**
+ * dev_pm_genpd_synced_poweroff - Next power off should be synchronous
+ *
+ * @dev: Device to handle
+ *
+ * TODO: Add description
+ */
+void dev_pm_genpd_synced_poweroff(struct device *dev)
+{
+       struct generic_pm_domain *genpd;
+
+       genpd = dev_to_genpd_safe(dev);
+       if (!genpd)
+               return;
+
+       genpd_lock(genpd);
+               genpd->synced_poweroff = true;
+       genpd_unlock(genpd);
+}
+EXPORT_SYMBOL_GPL(dev_pm_genpd_synced_poweroff);
+
 static int _genpd_power_on(struct generic_pm_domain *genpd, bool timed)
 {
        unsigned int state_idx = genpd->state_idx;
@@ -588,6 +609,7 @@ static int _genpd_power_off(struct
generic_pm_domain *genpd, bool timed)
 out:
        raw_notifier_call_chain(&genpd->power_notifiers, GENPD_NOTIFY_OFF,
                                NULL);
+       genpd->synced_poweroff = false;
        return 0;
 busy:
        raw_notifier_call_chain(&genpd->power_notifiers, GENPD_NOTIFY_ON, NULL);
diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
index ebc351698090..09c6c67a4896 100644
--- a/include/linux/pm_domain.h
+++ b/include/linux/pm_domain.h
@@ -134,6 +134,7 @@ struct generic_pm_domain {
        unsigned int prepared_count;    /* Suspend counter of prepared
devices */
        unsigned int performance_state; /* Aggregated max performance state */
        cpumask_var_t cpus;             /* A cpumask of the attached CPUs */
+       bool synced_poweroff;           /* A consumer needs a synced poweroff */
        int (*power_off)(struct generic_pm_domain *domain);
        int (*power_on)(struct generic_pm_domain *domain);
        struct raw_notifier_head power_notifiers; /* Power on/off notifiers */
-- 
2.34.1
