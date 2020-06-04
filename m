Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8071EF1EA
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 09:19:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 746916E864;
	Fri,  5 Jun 2020 07:19:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ED916E332
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jun 2020 11:20:05 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1591269608; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=wujjCCv5SBbDohkrY5pxRpykfjsvxoLNEBFwiJIHO5E=;
 b=l/4PuShVgea5y7aMeV8UVs+mh40329xf5SVDUetDSVriGQvZqdyGfeT7zVMgJxq+/PQPKX8H
 YXNlwtvTWMgKvsMaIWDHaDTG/gGFtZsoMm6QsNqW7KCI7Bw5GIdCIaqjyiSolJzrcH48qmtp
 BRQ+xonA0ex6334jEucqJxFagmc=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5ed8d8d73131442d95e6b259 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 04 Jun 2020 11:19:51
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B8155C43391; Thu,  4 Jun 2020 11:19:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: kalyan_t)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 76333C433CA;
 Thu,  4 Jun 2020 11:19:49 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 04 Jun 2020 16:49:49 +0530
From: kalyan_t@codeaurora.org
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: ensure device suspend happens
 during PM sleep
In-Reply-To: <CAD=FV=XphGpmBwZdL0jZ5HEFdxY3L7nH+s9_A0Kjamtg7j3R9w@mail.gmail.com>
References: <1588339863-1322-1-git-send-email-kalyan_t@codeaurora.org>
 <CAD=FV=UJGivCyp=t0J++1DbSFDVf+5zSCcXgh83VZtssBmavjg@mail.gmail.com>
 <32c01e9a5277bdbdbab868eb71688184@codeaurora.org>
 <CAD=FV=VVi6oUDx_2Yf543ZphS1oQJiQU8St0XNUHs7HyPkoTeg@mail.gmail.com>
 <CAD=FV=XphGpmBwZdL0jZ5HEFdxY3L7nH+s9_A0Kjamtg7j3R9w@mail.gmail.com>
Message-ID: <40f3b31549cd5bb80a8454836ffb0ad4@codeaurora.org>
X-Sender: kalyan_t@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Approved-At: Fri, 05 Jun 2020 07:18:56 +0000
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
 mkrishn@codeaurora.org, travitej@codeaurora.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-05-28 03:41, Doug Anderson wrote:
> Hi,
> 
> On Fri, May 15, 2020 at 9:37 AM Doug Anderson <dianders@chromium.org> 
> wrote:
>> 
>> Hi,
>> 
>> On Fri, May 15, 2020 at 5:06 AM <kalyan_t@codeaurora.org> wrote:
>> >
>> > On 2020-05-14 21:47, Doug Anderson wrote:
>> > > Hi,
>> > >
>> > > On Fri, May 1, 2020 at 6:31 AM Kalyan Thota <kalyan_t@codeaurora.org>
>> > > wrote:
>> > >>
>> > >> "The PM core always increments the runtime usage counter
>> > >> before calling the ->suspend() callback and decrements it
>> > >> after calling the ->resume() callback"
>> > >>
>> > >> DPU and DSI are managed as runtime devices. When
>> > >> suspend is triggered, PM core adds a refcount on all the
>> > >> devices and calls device suspend, since usage count is
>> > >> already incremented, runtime suspend was not getting called
>> > >> and it kept the clocks on which resulted in target not
>> > >> entering into XO shutdown.
>> > >>
>> > >> Add changes to force suspend on runtime devices during pm sleep.
>> > >>
>> > >> Changes in v1:
>> > >>  - Remove unnecessary checks in the function
>> > >>     _dpu_kms_disable_dpu (Rob Clark).
>> > >>
>> > >> Changes in v2:
>> > >>  - Avoid using suspend_late to reset the usagecount
>> > >>    as suspend_late might not be called during suspend
>> > >>    call failures (Doug).
>> > >>
>> > >> Changes in v3:
>> > >>  - Use force suspend instead of managing device usage_count
>> > >>    via runtime put and get API's to trigger callbacks (Doug).
>> > >>
>> > >> Changes in v4:
>> > >>  - Check the return values of pm_runtime_force_suspend and
>> > >>    pm_runtime_force_resume API's and pass appropriately (Doug).
>> > >>
>> > >> Changes in v5:
>> > >
>> > > Can you please put the version number properly in your subject?  It's
>> > > really hard to tell one version of your patch from another.
>> > >
>> > >
>> > >>  - With v4 patch, test cycle has uncovered issues in device resume.
>> > >>
>> > >>    On bubs: cmd tx failures were seen as SW is sending panel off
>> > >>    commands when the dsi resources are turned off.
>> > >>
>> > >>    Upon suspend, DRM driver will issue a NULL composition to the
>> > >>    dpu, followed by turning off all the HW blocks.
>> > >>
>> > >>    v5 changes will serialize the NULL commit and resource unwinding
>> > >>    by handling them under PM prepare and PM complete phases there by
>> > >>    ensuring that clks are on when panel off commands are being
>> > >>    processed.
>> > >
>> > > I'm still most definitely not an expert in how all the DRM pieces all
>> > > hook up together, but the solution you have in this patch seems wrong
>> > > to me.  As far as I can tell the "prepare" state isn't supposed to be
>> > > actually doing the suspend work and here that's exactly what you're
>> > > doing.  I think you should find a different solution to ensure
>> > > ordering is correct.
>> > >
>> > > -Doug
>> > >
>> >
>> > Hi,
>> 
>> Quite honestly I'm probably not the right person to be reviewing this
>> code.  I mostly just noticed one of your early patches and it looked
>> strange to me.  Hopefully someone with actual experience in how all
>> the DRM components work together can actually review and see if this
>> makes sense.  Maybe Sean would know better?
>> 
>> That being said, let me at least look at what you're saying...
>> 
>> 
>> > Prepare and Complete are callbacks defined as part of Sleep and Resume
>> > sequence
>> >
>> > Entering PM SUSPEND the phases are : prepare --> suspend -->
>> > suspend_late --> suspend_noirq.
>> > While leaving PM SUSPEND the phases are: resume_noirq --> resume_early
>> > --> resume --> complete.
>> 
>> Sure, it's part of the sequence.  It's also documented in pm.h as:
>> 
>>  * The principal role of this callback is to prevent new children of
>>  * the device from being registered after it has returned (the 
>> driver's
>>  * subsystem and generally the rest of the kernel is supposed to 
>> prevent
>>  * new calls to the probe method from being made too once @prepare() 
>> has
>>  * succeeded).
>> 
>> It does not feel like that matches your usage of this call.
>> 
>> 
>> > The reason to push drm suspend handling to PM prepare phase is that
>> > parent here will trigger a modeset to turn off the timing and
>> > subsequently the panel.
>> > the child devices should not turn of their clocks before parent unwinds
>> > the composition. Hence they are serialized as per the sequence mentioned
>> > above.
>> 
>> So the general model in Linux is that children suspend before their
>> parents, right?  So you're saying that, in this case, the parent needs
>> to act on the child before the child suspends.  Is that correct?
>> 
>> Rather than hijacking the prepare/complete, I'd be at least slightly
>> inclined to move the other driver to turn off its clocks in
>> suspend_late and to turn them back on in resume_early?  That seems to
>> be what was done in "analogix_dp-rockchip.c" to solve a similar
>> problem.
>> 
>> 
>> > A similar approach is taken by other driver that use drm framework. In
>> > this driver, the device registers for prepare and complete callbacks to
>> > handle drm_suspend and drm_resume.
>> > https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/exynos/exynos_drm_drv.c#L163
>> 
>> OK, if there is another driver in DRM then I guess I won't object too
>> strongly.  Note that when searching for other drivers I noticed this
>> bit in todo.rst:
>> 
>> * Most drivers (except i915 and nouveau) that use
>> * drm_atomic_helper_suspend/resume() can probably be converted to use
>> * drm_mode_config_helper_suspend/resume(). Also there's still 
>> open-coded version
>> * of the atomic suspend/resume code in older atomic modeset drivers.
>> 
>> Does anything get fixed if you do that?  It seems like it'd cleanup
>> your code a bit so maybe worth doing anyway...
>> 
>> ---
>> 
>> I guess the last question I'd want resolved is why you have this 
>> asymmetry:
>> 
>> SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, msm_pm_resume)
>> 
>> Why couldn't you use pm_runtime_force_resume()?
> 
> I'm curious if you had answers to any of the questions I posed in my 
> review.
> 
> -Doug


1) i'll update the patch to use "drm_mode_config_helper_suspend/resume". 
This will help in additional cleanup such as enabling FBDEV emulation in 
the build.

2) For the asymmetry part,
  pm_runtime_force_resume() was not waking up the device forcefully if 
the usage count is 1. PM core thinks that if usage count is 1 then 
device can be runtime resumed after suspend/resume sequence is complete. 
This is true for all the child nodes and the parent node. Hence to 
overcome that i used pm_runtime_resume on parent.

I have explored a bit on how to handle this cleanly, found an old thread 
discussing on the similar problem 
(https://lists.gt.net/linux/kernel/1556562  post no#4 Alan Stern ) the 
suggestion was to use runtime API's directly in PM Suspend/Resume.

I have found few example implementations on similar lines.
https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/media/platform/mtk-mdp/mtk_mdp_core.c#L279
https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/media/i2c/ak7375.c#L273
https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gnss/sirf.c#L377

I have changed the implementation on those lines in v6.

Summary of the flow now:

PM Sleep -->  pm_prepare for parent ( Disable all the DRM CRTCs) --> 
Suspend for child1, child2 ( turn off child clocks )--> Suspend for 
parent (turn off parent clocks )

PM Wakeup --> Resume for child1, child2 ( force resume is inactive due 
to usage count 1, but the call is needed to undo the force suspend 
things ) --> Resume for Parent (turn on parent clocks ) --> PM_complete 
for Parent.( By the time we reach here, PM core will remove the usage 
count for all the children and they are ready for runtime resume. Parent 
enables CRTCs which will runtime resume all the child clocks)

Let me know your views on it.

--Kalyan

> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
