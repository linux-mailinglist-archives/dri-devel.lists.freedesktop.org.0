Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCC44CEA98
	for <lists+dri-devel@lfdr.de>; Sun,  6 Mar 2022 11:52:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 086151126FD;
	Sun,  6 Mar 2022 10:52:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lgeamrelo11.lge.com (lgeamrelo13.lge.com [156.147.23.53])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9B7501126FC
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Mar 2022 10:52:09 +0000 (UTC)
Received: from unknown (HELO lgeamrelo02.lge.com) (156.147.1.126)
 by 156.147.23.53 with ESMTP; 6 Mar 2022 19:52:07 +0900
X-Original-SENDERIP: 156.147.1.126
X-Original-MAILFROM: byungchul.park@lge.com
Received: from unknown (HELO localhost.localdomain) (10.177.244.38)
 by 156.147.1.126 with ESMTP; 6 Mar 2022 19:52:07 +0900
X-Original-SENDERIP: 10.177.244.38
X-Original-MAILFROM: byungchul.park@lge.com
From: Byungchul Park <byungchul.park@lge.com>
To: tytso@mit.edu
Subject: Re: Report 2 in ext4 and journal based on v5.17-rc1
Date: Sun,  6 Mar 2022 19:51:42 +0900
Message-Id: <1646563902-6671-1-git-send-email-byungchul.park@lge.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <YiQq6Ou39uzHC0mu@mit.edu>
References: <YiQq6Ou39uzHC0mu@mit.edu>
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
Cc: hamohammed.sa@gmail.com, jack@suse.cz, peterz@infradead.org,
 daniel.vetter@ffwll.ch, amir73il@gmail.com, david@fromorbit.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 bfields@fieldses.org, linux-ide@vger.kernel.org, adilger.kernel@dilger.ca,
 joel@joelfernandes.org, cl@linux.com, will@kernel.org, duyuyang@gmail.com,
 sashal@kernel.org, paolo.valente@linaro.org, damien.lemoal@opensource.wdc.com,
 willy@infradead.org, hch@infradead.org, airlied@linux.ie, mingo@redhat.com,
 djwong@kernel.org, vdavydov.dev@gmail.com, rientjes@google.com,
 dennis@kernel.org, linux-ext4@vger.kernel.org, linux-mm@kvack.org,
 ngupta@vflare.org, johannes.berg@intel.com, jack@suse.com,
 dan.j.williams@intel.com, josef@toxicpanda.com, rostedt@goodmis.org,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, jglisse@redhat.com,
 viro@zeniv.linux.org.uk, tglx@linutronix.de, mhocko@kernel.org, vbabka@suse.cz,
 melissa.srw@gmail.com, sj@kernel.org, rodrigosiqueiramelo@gmail.com,
 kernel-team@lge.com, gregkh@linuxfoundation.org, jlayton@kernel.org,
 linux-kernel@vger.kernel.org, penberg@kernel.org, minchan@kernel.org,
 hannes@cmpxchg.org, tj@kernel.org, akpm@linux-foundation.org,
 torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ted wrote:
> On Sat, Mar 05, 2022 at 11:55:34PM +0900, Byungchul Park wrote:
> > > that is why some of the DEPT reports were completely incomprehensible
> > 
> > It's because you are blinded to blame at it without understanding how
> > Dept works at all. I will fix those that must be fixed. Don't worry.
> 
> Users of DEPT must not have to understand how DEPT works in order to

Users must not have to understand how Dept works for sure, and haters
must not blame things based on what they guess wrong.

> understand and use DEPT reports.  If you think I don't understand how
> DEPT work, I'm going to gently suggest that this means DEPT reports
> are clear enough, and/or DEPT documentation needs to be
> *substantially* improved, or both --- and these needs to happen before
> DEPT is ready to be merged.

Okay.

> > > So if DEPT is issuing lots of reports about apparently circular
> > > dependencies, please try to be open to the thought that the fault is
> > 
> > No one was convinced that Dept doesn't have a fault. I think your
> > worries are too much.
> 
> In that case, may I ask that you add back a RFC to the subject prefix
> (e.g., [PATCH RFC -v5]?)  Or maybe even add the subject prefix NOT YET

I will.

> READY?  I have seen cases when after a patch series get to PATCH -v22,
> and then people assume that it *must* be ready, as opposed what it
> really means, which is "the author is just persistently reposting and
> rebasing the patch series over and over again".  It would be helpful
> if you directly acknowledge, in each patch submission, that it is not
> yet ready for prime time.
> 
> After all, right now, DEPT has generated two reports in ext4, both of
> which were false positives, and both of which have required a lot of
> maintainer times to prove to you that they were in fact false
> positives.  So are we all agreed that DEPT is not ready for prime
> time?

Yes.

> > No one argued that their code must be buggy, either. So I don't think
> > you have to worry about what's never happened.
> 
> Well, you kept on insisting that ext4 must have a circular dependency,
> and that depending on a "rescue wakeup" is bad programming practice,
> but you'll reluctantly agree to make DEPT accept "rescue wakeups" if
> that is the will of the developers.  My concern here is the
> fundmaental concept of "rescue wakeups" is wrong; I don't see how you
> can distinguish between a valid wakeup and one that you and DEPT is
> going to somehow characterize as dodgy.

Your concern on it makes sense. I need to explain how I think about it
more, but not now cuz I guess the other folks alrealy got tired enough.
Let's talk about it later when needed again.

> Consider: a process can first subscribe to multiple wait queues, and
> arrange to be woken up by a timeout, and then call schedule() to go to
> sleep.  So it is not waiting on a single wait channel, but potentially
> *multiple* wakeup sources.  If you are going to prove that kernel is
> not going to make forward progress, you need to prove that *all* ways
> that process might not wake up aren't going to happen for some reason.
> 
> Just because one wakeup source seems to form a circular dependency
> proves nothing, since another wakeup source might be the designed and
> architected way that code makes forward progress.

I also think it's legal if the design is intended. But it's not if not.
This is what I meant. Again, it's not about ext4.

> You seem to be assuminng that one wakeup source is somehow the
> "correct" one, and the other ways that process could be woken up is a
> "rescue wakeup source" and you seem to believe that relying on a
> "rescue wakeup source" is bad.  But in the case of a process which has

It depends on whether or not it's intended IMHO.

> called prepare-to-wait on more than one wait queue, how is DEPT going
> to distinguish between your "morally correct" wkaeup source, and the
> "rescue wakeup source"?

Sure, it should be done manually. I should do it on my own when that
kind of issue arises. Agian, ext4 is not the case cuz, based on what Jan
explained, there's no real circular dependency wrt commit wq, done wq
and so on.

> > No doubt. I already think so. But it doesn't mean that I have to keep
> > quiet without discussing to imporve Dept. I will keep improving Dept in
> > a reasonable way.
> 
> Well, I don't want to be in a position of having to prove that every
> single DEPT report in my code that doesn't make sense to me is
> nonsense, or else DEPT will get merged.
> 
> So maybe we need to reverse the burden of proof.

I will keep in mind.

> Instead of just sending a DEPT report, and then asking the maintainers
> to explain why it is a false positive, how about if *you* use the DEPT
> report to examinie the subsystem code, and then explain plain English,
> how you think this could trigger in real life, or cause a performance
> problem in real life or perhaps provide a script or C reproducer that
> triggers the supposed deadlock?

Makes sense. Let me try.

> Yes, that means you will need to understand the code in question, but
> hopefully the DEPT reports should be clear enough that someone who
> isn't a deep expert in the code should be able to spot the bug.  If
> not, and if only a few deep experts of code in question will be able
> to decipher the DEPT report and figure out a fix, that's really not
> ideal.

Agree. Just FYI, I've never blamed you are not the expert on Dept.

> If DEPT can find a real bug and you can show that Lockdep wouldn't
> have been able to find it, then that would be proof that it is making
> a real contribution.  That's would be real benefit.  At the same time,
> DEPT will hopefully be able to demonstrate a false positive rate which
> is low enough that the benefits clearly outweight the costs.
> 
> At the moment, I believe the scoreboard for DEPT with respect to ext4
> is zero real bugs found, and two false positives, both of which have
> required significant rounds of e-mail before the subsystem maintainers
> were able to prove to you that it was, indeed, DEPT reporting a false
> positive.

Right. But we've barely talked in a productive way. We've talked about
other things way more than proving what you're mentioning.

> Do you now understand why I am so concerned that you aren't putting an
> RFC or NOT YET READY in the subject line?

Yes. I will.

> - Ted
> 
> P.S.  If DEPT had a CONFIG_EXPERIMENTAL, with a disclaimer in the
> KConfig that some of its reports might be false positives, that might
> be another way of easing my fears that this won't get used by
> Syzkaller, and to generate a lot of burdensome triage work on the
> maintainers.

Thank you for straightforward explanation this time,
Byungchul
