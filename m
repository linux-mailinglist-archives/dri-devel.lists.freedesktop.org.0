Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED492478E75
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 15:52:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7513911286F;
	Fri, 17 Dec 2021 14:52:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA79811286E;
 Fri, 17 Dec 2021 14:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639752737; x=1671288737;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=THqJJZ8NhSQo4SXDMk2vLpE8+I3lzrSzq6fTuTEKzUw=;
 b=UoWZDxETpfUsKJCBeBmc9PEdzGx9Mj5jcAra4XC+xXder6ma8ROdQs5Y
 GYvCfaZr4kkzKnZNFLLktQC6S+9SyiN4hAKlWWj2O6D3/rX0j1GVgooZN
 PIykTMXjfCbJohKFMfIysnhg//1ay9QhPCdVdU8jE/Y+VgbUJYj58Ggox
 Y270MzaegUj2j3Ubx6cI7N3iKFO+mz2uHbDr/gdKSthj5yW9yJxSU6TZO
 kl9wISret0FgwXKyeXZShnWuefx1xASNRKpVEG2kpJNccVKvTcSdVfGAk
 0fOvDEJZT47lC0cRWPxxiduedfE3Vok9YSbPNzv9hKQe/aYw0cItFcgo8 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="239576967"
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="239576967"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2021 06:52:10 -0800
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="615578684"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2021 06:52:07 -0800
Date: Fri, 17 Dec 2021 16:52:02 +0200
From: Imre Deak <imre.deak@intel.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: [Bug Report] Desktop monitor sleep regression
Message-ID: <20211217145202.GB1572087@ideak-desk.fi.intel.com>
References: <8a27c986-4767-bd29-2073-6c4ffed49bba@jetfuse.net>
 <962fe0af-a080-fc0d-15f3-203166ff4584@leemhuis.info>
 <dca67eb4-d007-2fa0-e0c2-b21d124967f1@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dca67eb4-d007-2fa0-e0c2-b21d124967f1@leemhuis.info>
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
Cc: linux-fbdev@vger.kernel.org,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx@lists.freedesktop.org, pjones@redhat.com,
 Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org,
 Brandon Nielsen <nielsenb@jetfuse.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 17, 2021 at 03:46:21PM +0100, Thorsten Leemhuis wrote:
> added some CCs Geert added in his reply
> 
> On 07.12.21 08:20, Thorsten Leemhuis wrote:
> > 
> > [TLDR: adding this regression to regzbot; most of this mail is compiled
> > from a few templates paragraphs some of you might have seen already.]
> > 
> > Hi, this is your Linux kernel regression tracker speaking.
> 
> /me again
> 
> What's up here? We are getting close to rc6, but there afaics wasn't any
> reply of substance since the report ten days ago. Hence:
>
> Could anybody please comment on this? Imre Deak, the commit Brandon
> found in the bisection contains a patch of yours, do you maybe have an
> idea what's up here?

Yes,
https://bugzilla.kernel.org/show_bug.cgi?id=215203

based on which the problem is somehere in the AMD driver.

> Ciao, Thorsten
> 
> #regzbot poke
> 
> > Adding the regression mailing list to the list of recipients, as it
> > should be in the loop for all regressions, as explained here:
> > https://www.kernel.org/doc/html/latest/admin-guide/reporting-issues.html
> > 
> > Also adding the authors and reviewers of the culprit and two appropriate
> > mailing lists.
> > 
> > On 07.12.21 01:21, Brandon Nielsen wrote:
> >> Monitors no longer sleep properly on my system (dual monitor connected
> >> via DP->DVI, amdgpu, x86_64). The monitors slept properly on 5.14, but
> >> stopped during the 5.15 series. I have also filed this bug on the kernel
> >> bugzilla[0] and downstream[1].
> >>
> >> I have performed a bisect, first "bad" commit to master is
> >> 55285e21f04517939480966164a33898c34b2af2[1], the same change made it
> >> into the 5.15 branch as e3b39825ed0813f787cb3ebdc5ecaa5131623647.
> > 
> > TWIMC: That was for 5.15.3
> > 
> >> I have
> >> verified the issue exists in latest master
> >> (a51e3ac43ddbad891c2b1a4f3aa52371d6939570).
> >>
> >> Steps to reproduce:
> >>
> >>   1. Boot system (Fedora Workstation 35 in this case)
> >>   2. Log in
> >>   3. Lock screen (after a few seconds, monitors will enter power save
> >> "sleep" state with backlight off)
> >>   4. Wait (usually no more than 30 seconds, sometimes up to a few minutes)
> >>   5. Observe monitor leaving "sleep" state (backlight comes back on),
> >> but nothing is displayed
> >>
> >> [0] - https://bugzilla.kernel.org/show_bug.cgi?id=215203
> >> [1] - https://bugzilla.redhat.com/show_bug.cgi?id=2028613
> > 
> > To be sure this issue doesn't fall through the cracks unnoticed, I'm
> > adding it to regzbot, my Linux kernel regression tracking bot:
> > 
> > #regzbot ^introduced 55285e21f04517939480966164a33898c34b2af2
> > #regzbot title fbdev/efifb: Monitors no longer sleep (amdgpu dual
> > monitor setup)
> > #regzbot ignore-activity
> > 
> > Reminder: when fixing the issue, please add a 'Link:' tag with the URL
> > to the report (the parent of this mail), then regzbot will automatically
> > mark the regression as resolved once the fix lands in the appropriate
> > tree. For more details about regzbot see footer.
> > 
> > Sending this to everyone that got the initial report, to make all aware
> > of the tracking. I also hope that messages like this motivate people to
> > directly get at least the regression mailing list and ideally even
> > regzbot involved when dealing with regressions, as messages like this
> > wouldn't be needed then.
> > 
> > Don't worry, I'll send further messages wrt to this regression just to
> > the lists (with a tag in the subject so people can filter them away), as
> > long as they are intended just for regzbot. With a bit of luck no such
> > messages will be needed anyway.
> > 
> > Ciao, Thorsten, your Linux kernel regression tracker.
> > 
> > P.S.: As a Linux kernel regression tracker I'm getting a lot of reports
> > on my table. I can only look briefly into most of them. Unfortunately
> > therefore I sometimes will get things wrong or miss something important.
> > I hope that's not the case here; if you think it is, don't hesitate to
> > tell me about it in a public reply. That's in everyone's interest, as
> > what I wrote above might be misleading to everyone reading this; any
> > suggestion I gave they thus might sent someone reading this down the
> > wrong rabbit hole, which none of us wants.
> > 
> > BTW, I have no personal interest in this issue, which is tracked using
> > regzbot, my Linux kernel regression tracking bot
> > (https://linux-regtracking.leemhuis.info/regzbot/). I'm only posting
> > this mail to get things rolling again and hence don't need to be CC on
> > all further activities wrt to this regression.
> > 
