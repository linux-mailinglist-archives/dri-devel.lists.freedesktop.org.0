Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 260FE4720E6
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 07:04:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 493E410EAD1;
	Mon, 13 Dec 2021 06:04:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [IPv6:2a01:488:42:1000:50ed:8234::])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3820910EAD5
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 06:04:17 +0000 (UTC)
Received: from ip4d173d4a.dynamic.kabel-deutschland.de ([77.23.61.74]
 helo=[192.168.66.200]); authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1mweRa-0005tn-Sf; Mon, 13 Dec 2021 07:04:14 +0100
Message-ID: <8e1abb43-664b-5882-7c02-ef517c14fc94@leemhuis.info>
Date: Mon, 13 Dec 2021 07:04:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [Bug 215315] New: [REGRESSION BISECTED] amdgpu crashes system
 suspend - NUC8i7HVKVA
Content-Language: en-BS
To: bugzilla-daemon@bugzilla.kernel.org, dri-devel@lists.freedesktop.org,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <bug-215315-2300@https.bugzilla.kernel.org/>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <bug-215315-2300@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1639375457;
 90c2d955; 
X-HE-SMSGID: 1mweRa-0005tn-Sf
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

[TLDR: adding this regression to regzbot; most of this mail is compiled
from a few templates paragraphs some of you might have seen already.]

Hi, this is your Linux kernel regression tracker speaking.

Top-posting for once, to make this easy accessible to everyone.

Thanks for the report.

Adding the regression mailing list to the list of recipients, as it
should be in the loop for all regressions, as explained here:
https://www.kernel.org/doc/html/latest/admin-guide/reporting-issues.html

To be sure this issue doesn't fall through the cracks unnoticed, I'm
adding it to regzbot, my Linux kernel regression tracking bot:

#regzbot ^introduced f7d6779df642720e22bffd449e683bb8690bd3bf
#regzbot title drm: amdgpu: NUC8i7HVKVA crashes during system suspend
#regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=215315
#regzbot ignore-activity

Reminder: when fixing the issue, please add a 'Link:' tag with the URL
to the report (the parent of this mail), then regzbot will automatically
mark the regression as resolved once the fix lands in the appropriate
tree. For more details about regzbot see footer.

Sending this to everyone that got the initial report, to make all aware
of the tracking. I also hope that messages like this motivate people to
directly get at least the regression mailing list and ideally even
regzbot involved when dealing with regressions, as messages like this
wouldn't be needed then.

Don't worry, I'll send further messages wrt to this regression just to
the lists (with a tag in the subject so people can filter them away), as
long as they are intended just for regzbot. With a bit of luck no such
messages will be needed anyway.

Ciao, Thorsten (wearing his 'Linux kernel regression tracker' hat).

P.S.: As a Linux kernel regression tracker I'm getting a lot of reports
on my table. I can only look briefly into most of them. Unfortunately
therefore I sometimes will get things wrong or miss something important.
I hope that's not the case here; if you think it is, don't hesitate to
tell me about it in a public reply. That's in everyone's interest, as
what I wrote above might be misleading to everyone reading this; any
suggestion I gave thus might sent someone reading this down the wrong
rabbit hole, which none of us wants.

BTW, I have no personal interest in this issue, which is tracked using
regzbot, my Linux kernel regression tracking bot
(https://linux-regtracking.leemhuis.info/regzbot/). I'm only posting
this mail to get things rolling again and hence don't need to be CC on
all further activities wrt to this regression.


On 13.12.21 00:08, bugzilla-daemon@bugzilla.kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=215315
> 
>             Bug ID: 215315
>            Summary: [REGRESSION BISECTED] amdgpu crashes system suspend -
>                     NUC8i7HVKVA
>            Product: Drivers
>            Version: 2.5
>     Kernel Version: 5.15-rc1, 5.15, 5.16-rc4
>           Hardware: x86-64
>                 OS: Linux
>               Tree: Mainline
>             Status: NEW
>           Severity: normal
>           Priority: P1
>          Component: Video(DRI - non Intel)
>           Assignee: drivers_video-dri@kernel-bugs.osdl.org
>           Reporter: lenb@kernel.org
>         Regression: No
> 
> My Intel NUC8i7HVKVA has an AMD GPU.
> 
> Until 5.15-rc1, this machine was rock solid in suspend stress testing -- never
> crashing after hundreds of hours of back-to-back suspend cycles.
> 
> Until this patch went upstream:
> 
> commit f7d6779df642720e22bffd449e683bb8690bd3bf (refs/bisect/bad)
> Author: Guchun Chen <guchun.chen@amd.com>
> Date:   Fri Aug 27 18:31:41 2021 +0800
> 
>     drm/amdgpu: stop scheduler when calling hw_fini (v2)
> 
>     This gurantees no more work on the ring can be submitted
>     to hardware in suspend/resume case, otherwise a potential
>     race will occur and the ring will get no chance to stay
>     empty before suspend.
> 
>     v2: Call drm_sched_resubmit_job before drm_sched_start to
>     restart jobs from the pending list.
> 
>     Suggested-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>     Suggested-by: Christian König <christian.koenig@amd.com>
>     Signed-off-by: Guchun Chen <guchun.chen@amd.com>
>     Reviewed-by: Christian König <christian.koenig@amd.com>
>     Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>     Cc: stable@vger.kernel.org
> 
> I bisected that the patch before this one was integrated can handle over 1,000
> back-to-back "freeze" system suspend cycles.  Yet, when this patch is present,
> the system may crash before it completes only 100 cycles, and at most lasts a
> few hundred cycles.
> 
> This crash is present in all following upstream rc's, including 5.15-rc4.
> 
> When I revert this patch from 5.15-rc4, stability returns.
> 
> Usually, the crash is manifest by a black screen, and a system that does not
> respond to ping, and will only respond to a long AC power button press to
> remove power; and a subsequent cold reboot.
> 
> I have witnessed the crash occur, and the "ubuntu color themed" screen enters
> some sort of reverse video mode.  In this weird color mode, I've seen a text
> window oscillate between scrolling and un-scrolling for a line -- sort of like
> it is going back in time, but then changes its mind.  There is no response to
> keyboard, mouse, or network input.
> 

