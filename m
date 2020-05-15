Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 027021D5639
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 18:38:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E521B6ECF4;
	Fri, 15 May 2020 16:38:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B146E197
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 16:38:12 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id 1so1604629vsl.9
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 09:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dsWS87oi/iCZiA7NcMAjL2FtmRuX/wXJ/5rlQnp6zmo=;
 b=eJcK1GVzgHPtvBtl7+i8mN1qpqG8SB0hDnStaypr1OR9DbkSvrc8siXYG/buCjwsq8
 jLPh8H/3sIUkFgicYCe+u1bnBMCswUGPYiaXUWGNAy19k9PyqIvLQ8Xi2N9GVMtZUwnu
 qTpfoTHvj8l/TNVlZrH7R6nglxOwowCbETks8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dsWS87oi/iCZiA7NcMAjL2FtmRuX/wXJ/5rlQnp6zmo=;
 b=s60DG6CA9Fb5J9mATQe9/4HCTzvoxTJZAgM8aoHYwxYL9vHGRNErdPD7E8t7dkj/z3
 vy+RCctJ/lpXomJPcJMr64IM8gxnrrtewwtYfVbe9jzSH4DHI49EmzboZeusdTzPYkMr
 Xb+XAUuE4yGoYO6ilfw06lmC9qWN23dnOGeZHWh/LNVAGB3bnP7OEbvBPFr7IX9RnQDU
 nOHSa7iuBd23/MWKM6y8zhTqbmFN39v2TS1SeuQ46bzGfXYoFBzowWuDsf/PkGp4mwpk
 uH+yT6t5dbj7oJxo7oApFvvdMZ4xhZhyW3GHhTHoJ6W7vt7E9CIhq9nMgGVuPgSF2uz8
 3J4A==
X-Gm-Message-State: AOAM530pNvvbCFt7c2pXwoey9x/AL+/3AmX/vVk0kuV79/EUnzdUkwIg
 UQBeqL+Tf+jOOaPTZWyXMlP+606DWRg=
X-Google-Smtp-Source: ABdhPJx2XrURHcOMt7TgxUPvKTXOVHbsyLnB2NEyLvpm5qLyApGqMBv+P5qfN6fcmSPXFZLLtrsD0g==
X-Received: by 2002:a67:481:: with SMTP id 123mr2980202vse.121.1589560690801; 
 Fri, 15 May 2020 09:38:10 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com.
 [209.85.222.49])
 by smtp.gmail.com with ESMTPSA id m82sm721254vka.54.2020.05.15.09.38.08
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2020 09:38:09 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id z16so1008569uae.11
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 09:38:08 -0700 (PDT)
X-Received: by 2002:ab0:69cc:: with SMTP id u12mr216029uaq.22.1589560688373;
 Fri, 15 May 2020 09:38:08 -0700 (PDT)
MIME-Version: 1.0
References: <1588339863-1322-1-git-send-email-kalyan_t@codeaurora.org>
 <CAD=FV=UJGivCyp=t0J++1DbSFDVf+5zSCcXgh83VZtssBmavjg@mail.gmail.com>
 <32c01e9a5277bdbdbab868eb71688184@codeaurora.org>
In-Reply-To: <32c01e9a5277bdbdbab868eb71688184@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 15 May 2020 09:37:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VVi6oUDx_2Yf543ZphS1oQJiQU8St0XNUHs7HyPkoTeg@mail.gmail.com>
Message-ID: <CAD=FV=VVi6oUDx_2Yf543ZphS1oQJiQU8St0XNUHs7HyPkoTeg@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: ensure device suspend happens
 during PM sleep
To: Kalyan Thota <kalyan_t@codeaurora.org>, Sean Paul <seanpaul@chromium.org>
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
 <devicetree@vger.kernel.org>, mkrishn@codeaurora.org, travitej@codeaurora.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, May 15, 2020 at 5:06 AM <kalyan_t@codeaurora.org> wrote:
>
> On 2020-05-14 21:47, Doug Anderson wrote:
> > Hi,
> >
> > On Fri, May 1, 2020 at 6:31 AM Kalyan Thota <kalyan_t@codeaurora.org>
> > wrote:
> >>
> >> "The PM core always increments the runtime usage counter
> >> before calling the ->suspend() callback and decrements it
> >> after calling the ->resume() callback"
> >>
> >> DPU and DSI are managed as runtime devices. When
> >> suspend is triggered, PM core adds a refcount on all the
> >> devices and calls device suspend, since usage count is
> >> already incremented, runtime suspend was not getting called
> >> and it kept the clocks on which resulted in target not
> >> entering into XO shutdown.
> >>
> >> Add changes to force suspend on runtime devices during pm sleep.
> >>
> >> Changes in v1:
> >>  - Remove unnecessary checks in the function
> >>     _dpu_kms_disable_dpu (Rob Clark).
> >>
> >> Changes in v2:
> >>  - Avoid using suspend_late to reset the usagecount
> >>    as suspend_late might not be called during suspend
> >>    call failures (Doug).
> >>
> >> Changes in v3:
> >>  - Use force suspend instead of managing device usage_count
> >>    via runtime put and get API's to trigger callbacks (Doug).
> >>
> >> Changes in v4:
> >>  - Check the return values of pm_runtime_force_suspend and
> >>    pm_runtime_force_resume API's and pass appropriately (Doug).
> >>
> >> Changes in v5:
> >
> > Can you please put the version number properly in your subject?  It's
> > really hard to tell one version of your patch from another.
> >
> >
> >>  - With v4 patch, test cycle has uncovered issues in device resume.
> >>
> >>    On bubs: cmd tx failures were seen as SW is sending panel off
> >>    commands when the dsi resources are turned off.
> >>
> >>    Upon suspend, DRM driver will issue a NULL composition to the
> >>    dpu, followed by turning off all the HW blocks.
> >>
> >>    v5 changes will serialize the NULL commit and resource unwinding
> >>    by handling them under PM prepare and PM complete phases there by
> >>    ensuring that clks are on when panel off commands are being
> >>    processed.
> >
> > I'm still most definitely not an expert in how all the DRM pieces all
> > hook up together, but the solution you have in this patch seems wrong
> > to me.  As far as I can tell the "prepare" state isn't supposed to be
> > actually doing the suspend work and here that's exactly what you're
> > doing.  I think you should find a different solution to ensure
> > ordering is correct.
> >
> > -Doug
> >
>
> Hi,

Quite honestly I'm probably not the right person to be reviewing this
code.  I mostly just noticed one of your early patches and it looked
strange to me.  Hopefully someone with actual experience in how all
the DRM components work together can actually review and see if this
makes sense.  Maybe Sean would know better?

That being said, let me at least look at what you're saying...


> Prepare and Complete are callbacks defined as part of Sleep and Resume
> sequence
>
> Entering PM SUSPEND the phases are : prepare --> suspend -->
> suspend_late --> suspend_noirq.
> While leaving PM SUSPEND the phases are: resume_noirq --> resume_early
> --> resume --> complete.

Sure, it's part of the sequence.  It's also documented in pm.h as:

 * The principal role of this callback is to prevent new children of
 * the device from being registered after it has returned (the driver's
 * subsystem and generally the rest of the kernel is supposed to prevent
 * new calls to the probe method from being made too once @prepare() has
 * succeeded).

It does not feel like that matches your usage of this call.


> The reason to push drm suspend handling to PM prepare phase is that
> parent here will trigger a modeset to turn off the timing and
> subsequently the panel.
> the child devices should not turn of their clocks before parent unwinds
> the composition. Hence they are serialized as per the sequence mentioned
> above.

So the general model in Linux is that children suspend before their
parents, right?  So you're saying that, in this case, the parent needs
to act on the child before the child suspends.  Is that correct?

Rather than hijacking the prepare/complete, I'd be at least slightly
inclined to move the other driver to turn off its clocks in
suspend_late and to turn them back on in resume_early?  That seems to
be what was done in "analogix_dp-rockchip.c" to solve a similar
problem.


> A similar approach is taken by other driver that use drm framework. In
> this driver, the device registers for prepare and complete callbacks to
> handle drm_suspend and drm_resume.
> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/exynos/exynos_drm_drv.c#L163

OK, if there is another driver in DRM then I guess I won't object too
strongly.  Note that when searching for other drivers I noticed this
bit in todo.rst:

* Most drivers (except i915 and nouveau) that use
* drm_atomic_helper_suspend/resume() can probably be converted to use
* drm_mode_config_helper_suspend/resume(). Also there's still open-coded version
* of the atomic suspend/resume code in older atomic modeset drivers.

Does anything get fixed if you do that?  It seems like it'd cleanup
your code a bit so maybe worth doing anyway...

---

I guess the last question I'd want resolved is why you have this asymmetry:

SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, msm_pm_resume)

Why couldn't you use pm_runtime_force_resume()?


-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
