Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E72EC193A78
	for <lists+dri-devel@lfdr.de>; Thu, 26 Mar 2020 09:08:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF3386E888;
	Thu, 26 Mar 2020 08:08:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03FF16E1E0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 20:04:06 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1585166650; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=3D6rKVomxFnkyZEpJNCASMp1XYz2rOhrRpdYgZA8Qqg=;
 b=TS4B7mDvYjrmYK7Yn1WfWjaKbmuzj7bONKMoIC/0gp/Nzq/TaRNghG3tu6swVqplY9MKC5+P
 Pin5wL5tt6ZwzEF1UbaUH70si/4PSmG+4dzBVRWgl4md4XtgPv5HNTkC8gEbOuAiJVjsqy8n
 jfRvB9QnUeUUw/6TuABZqQu9Mec=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e7bb92b.7f3a67c4e730-smtp-out-n03;
 Wed, 25 Mar 2020 20:03:55 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8D3E1C433F2; Wed, 25 Mar 2020 20:03:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: kalyan_t)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B0F70C433D2;
 Wed, 25 Mar 2020 20:03:53 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 26 Mar 2020 01:33:53 +0530
From: kalyan_t@codeaurora.org
To: Doug Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: ensure device suspend happens during PM sleep
In-Reply-To: <CAD=FV=VxeCUEEFi9T0Jand3EWkaQTLnQkT3v5yjyjLi4yDeQ-w@mail.gmail.com>
References: <1584944027-1730-1-git-send-email-kalyan_t@codeaurora.org>
 <CAD=FV=VX+Lj=NeZnYxDv9gLYUiwUO6brwvDSL8dbs1MTF4ieuA@mail.gmail.com>
 <CAF6AEGs5saoU3FeO++S+YD=Js499HB2CjK8neYCXAZmCjgy2nQ@mail.gmail.com>
 <CAD=FV=VxeCUEEFi9T0Jand3EWkaQTLnQkT3v5yjyjLi4yDeQ-w@mail.gmail.com>
Message-ID: <114130f68c494f83303c51157e2c5bfa@codeaurora.org>
X-Sender: kalyan_t@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Approved-At: Thu, 26 Mar 2020 08:08:32 +0000
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, mkrishn@codeaurora.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, travitej@codeaurora.org,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-03-25 21:20, Doug Anderson wrote:
> Hi,
> 
> On Wed, Mar 25, 2020 at 8:40 AM Rob Clark <robdclark@gmail.com> wrote:
>> 
>> On Tue, Mar 24, 2020 at 7:35 AM Doug Anderson <dianders@chromium.org> 
>> wrote:
>> >
>> > Hi,
>> >
>> > On Sun, Mar 22, 2020 at 11:14 PM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
>> > >
>> > > "The PM core always increments the runtime usage counter
>> > > before calling the ->suspend() callback and decrements it
>> > > after calling the ->resume() callback"
>> > >
>> > > DPU and DSI are managed as runtime devices. When
>> > > suspend is triggered, PM core adds a refcount on all the
>> > > devices and calls device suspend, since usage count is
>> > > already incremented, runtime suspend was not getting called
>> > > and it kept the clocks on which resulted in target not
>> > > entering into XO shutdown.
>> > >
>> > > Add changes to manage runtime devices during pm sleep.
>> > >
>> > > Changes in v1:
>> > >  - Remove unnecessary checks in the function
>> > >      _dpu_kms_disable_dpu (Rob Clark).
>> >
>> > I'm wondering what happened with my feedback on v1, AKA:
>> >
>> > https://lore.kernel.org/r/CAD=FV=VxzEV40g+ieuEN+7o=34+wM8MHO8o7T5zA1Yosx7SVWg@mail.gmail.com
>> >
>> > Maybe you didn't see it?  ...or if you or Rob think I'm way off base
>> > (always possible) then please tell me so.
>> >
-- I didn't notice your comments earlier. Apologies !!

>> 
>> At least w/ the current patch, disable_dpu should not be called for
>> screen-off (although I'd hope if all the screens are off the device
>> would suspend).
> 
> OK, that's good.

-- Rob has answered it, with current change disable_dpu will only be 
called during pm_suspend.
> 
>> But I won't claim to be a pm expert.. so not really
>> sure if this is the best approach or not.  I don't think our
>> arrangement of sub-devices under a parent is completely abnormal, so
>> it does feel like there should be a simpler solution..
> 
> I think the other arguments about asymmetry are still valid and I've
> fixed bugs around this type of thing in the past.  For instance, see
> commit f7ccbed656f7 ("drm/rockchip: Suspend DP late").
> 

* What happens if suspend is aborted partway through (by getting a
wakeup even as you're suspending, for instance)?  In such a case some
of the normal suspend calls will be called but "suspend_late" won't be
called.  Does that mess up your counting?

-- I understand this concern, i'll explore a bit more on how to handle 
"failed to suspend","early awake"
cases (to restore the usage_count) since suspend_late wont be called.

*From your description, it sure seems like this part of the
runtime_pm.rst doc is relevant to you:

Did I misunderstand and this isn't what you want?  Looking a bit
further, maybe the right thing is to use the "SMART_SUSPEND" flag?

-- if you notice in the device_prepare 
(https://elixir.bootlin.com/linux/latest/source/drivers/base/power/main.c#L1913)
there is a pm_runtime_get_noresume at L1931, which will increment the 
usagecount before triggering client prepare call, hence implementing 
prepare wont fetch us much.

This appears to be more for the cases when device is runtime suspended 
and suspend followed later
"one example usecase that i can think of, is screen timeout after that 
suspend is triggered"

currently the problem i am looking at is that
	PM Core does +1 in device prepare
		DPU driver does -1 in suspend
		DPU driver does +1 in suspend late  ( look for right place )
	PM core does -1 in device complete

i'll get back after exploring a bit.

> 
> -Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
