Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB2C1D6028
	for <lists+dri-devel@lfdr.de>; Sat, 16 May 2020 11:59:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E22C56E176;
	Sat, 16 May 2020 09:59:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BD316EC76
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 12:06:03 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1589544367; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=SPYp2YDyVuaw6uCp5OOGpG4DBGumTLBzvLR2arIhqlY=;
 b=SzAoVEBEM7Vtq9eQc3RnYyI1+EAzpoV1PO6r3yMpT1ZG9fJ0HTMyGbGava+CxEg7HzdEm21r
 L25WwzLoaeI87npttL0aJgMB6RIcT2HDlpFQV9ATyV+aEt7pH5pYethw+kulxn3G5O5g3dnr
 jRgu4vHhBbDeNqmMFMVy/CgvRlI=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ebe85a1.7f337c0c14c8-smtp-out-n02;
 Fri, 15 May 2020 12:05:53 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 3E0E5C433F2; Fri, 15 May 2020 12:05:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: kalyan_t)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6D22AC433D2;
 Fri, 15 May 2020 12:05:51 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 15 May 2020 17:35:51 +0530
From: kalyan_t@codeaurora.org
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: ensure device suspend happens
 during PM sleep
In-Reply-To: <CAD=FV=UJGivCyp=t0J++1DbSFDVf+5zSCcXgh83VZtssBmavjg@mail.gmail.com>
References: <1588339863-1322-1-git-send-email-kalyan_t@codeaurora.org>
 <CAD=FV=UJGivCyp=t0J++1DbSFDVf+5zSCcXgh83VZtssBmavjg@mail.gmail.com>
Message-ID: <32c01e9a5277bdbdbab868eb71688184@codeaurora.org>
X-Sender: kalyan_t@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Approved-At: Sat, 16 May 2020 09:58:59 +0000
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
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-05-14 21:47, Doug Anderson wrote:
> Hi,
> 
> On Fri, May 1, 2020 at 6:31 AM Kalyan Thota <kalyan_t@codeaurora.org> 
> wrote:
>> 
>> "The PM core always increments the runtime usage counter
>> before calling the ->suspend() callback and decrements it
>> after calling the ->resume() callback"
>> 
>> DPU and DSI are managed as runtime devices. When
>> suspend is triggered, PM core adds a refcount on all the
>> devices and calls device suspend, since usage count is
>> already incremented, runtime suspend was not getting called
>> and it kept the clocks on which resulted in target not
>> entering into XO shutdown.
>> 
>> Add changes to force suspend on runtime devices during pm sleep.
>> 
>> Changes in v1:
>>  - Remove unnecessary checks in the function
>>     _dpu_kms_disable_dpu (Rob Clark).
>> 
>> Changes in v2:
>>  - Avoid using suspend_late to reset the usagecount
>>    as suspend_late might not be called during suspend
>>    call failures (Doug).
>> 
>> Changes in v3:
>>  - Use force suspend instead of managing device usage_count
>>    via runtime put and get API's to trigger callbacks (Doug).
>> 
>> Changes in v4:
>>  - Check the return values of pm_runtime_force_suspend and
>>    pm_runtime_force_resume API's and pass appropriately (Doug).
>> 
>> Changes in v5:
> 
> Can you please put the version number properly in your subject?  It's
> really hard to tell one version of your patch from another.
> 
> 
>>  - With v4 patch, test cycle has uncovered issues in device resume.
>> 
>>    On bubs: cmd tx failures were seen as SW is sending panel off
>>    commands when the dsi resources are turned off.
>> 
>>    Upon suspend, DRM driver will issue a NULL composition to the
>>    dpu, followed by turning off all the HW blocks.
>> 
>>    v5 changes will serialize the NULL commit and resource unwinding
>>    by handling them under PM prepare and PM complete phases there by
>>    ensuring that clks are on when panel off commands are being
>>    processed.
> 
> I'm still most definitely not an expert in how all the DRM pieces all
> hook up together, but the solution you have in this patch seems wrong
> to me.  As far as I can tell the "prepare" state isn't supposed to be
> actually doing the suspend work and here that's exactly what you're
> doing.  I think you should find a different solution to ensure
> ordering is correct.
> 
> -Doug
> 

Hi,

Prepare and Complete are callbacks defined as part of Sleep and Resume 
sequence

Entering PM SUSPEND the phases are : prepare --> suspend --> 
suspend_late --> suspend_noirq.
While leaving PM SUSPEND the phases are: resume_noirq --> resume_early 
--> resume --> complete.

The reason to push drm suspend handling to PM prepare phase is that 
parent here will trigger a modeset to turn off the timing and 
subsequently the panel.
the child devices should not turn of their clocks before parent unwinds 
the composition. Hence they are serialized as per the sequence mentioned 
above.

A similar approach is taken by other driver that use drm framework. In 
this driver, the device registers for prepare and complete callbacks to 
handle drm_suspend and drm_resume.
https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/exynos/exynos_drm_drv.c#L163


Kalyan


_______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
