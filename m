Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B3C4BC75F
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 11:02:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE7E410F69A;
	Sat, 19 Feb 2022 10:02:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lgeamrelo11.lge.com (lgeamrelo12.lge.com [156.147.23.52])
 by gabe.freedesktop.org (Postfix) with ESMTP id C2A8610E29D
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Feb 2022 09:54:17 +0000 (UTC)
Received: from unknown (HELO lgemrelse7q.lge.com) (156.147.1.151)
 by 156.147.23.52 with ESMTP; 19 Feb 2022 18:54:15 +0900
X-Original-SENDERIP: 156.147.1.151
X-Original-MAILFROM: byungchul.park@lge.com
Received: from unknown (HELO X58A-UD3R) (10.177.244.38)
 by 156.147.1.151 with ESMTP; 19 Feb 2022 18:54:15 +0900
X-Original-SENDERIP: 10.177.244.38
X-Original-MAILFROM: byungchul.park@lge.com
Date: Sat, 19 Feb 2022 18:54:07 +0900
From: Byungchul Park <byungchul.park@lge.com>
To: Theodore Ts'o <tytso@mit.edu>
Subject: Re: [PATCH 00/16] DEPT(Dependency Tracker)
Message-ID: <20220219095407.GA10342@X58A-UD3R>
References: <1645095472-26530-1-git-send-email-byungchul.park@lge.com>
 <Yg5u7dzUxL3Vkncg@mit.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yg5u7dzUxL3Vkncg@mit.edu>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Approved-At: Sat, 19 Feb 2022 10:01:55 +0000
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
 axboe@kernel.dk, melissa.srw@gmail.com, sj@kernel.org,
 rodrigosiqueiramelo@gmail.com, kernel-team@lge.com, gregkh@linuxfoundation.org,
 jlayton@kernel.org, linux-kernel@vger.kernel.org, penberg@kernel.org,
 minchan@kernel.org, hannes@cmpxchg.org, tj@kernel.org,
 akpm@linux-foundation.org, torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 17, 2022 at 10:51:09AM -0500, Theodore Ts'o wrote:
> On Thu, Feb 17, 2022 at 07:57:36PM +0900, Byungchul Park wrote:
> > 
> > I've got several reports from the tool. Some of them look like false
> > alarms and some others look like real deadlock possibility. Because of
> > my unfamiliarity of the domain, it's hard to confirm if it's a real one.
> > Let me add the reports on this email thread.
> 
> The problem is we have so many potentially invalid, or
> so-rare-as-to-be-not-worth-the-time-to-investigate-in-the-
> grand-scheme-of-all-of-the-fires-burning-on-maintainers laps that it's
> really not reasonable to ask maintainers to determine whether

Even though I might have been wrong and might be gonna be wrong, you
look so arrogant. You were hasty to judge and trying to walk over me.

I reported it because I thought it was a real problem but couldn't
confirm it. For the other reports that I thought was not real, I didn't
even mention it. If you are talking about the previous report, then I
felt so sorry as I told you. I skimmed through the part of the waits...

Basically, I respect you and appreciate your feedback. Hope you not get
me wrong.

> Looking at the second ext4 report, it doesn't make any sense.  Context
> A is the kjournald thread.  We don't do a commit until (a) the timeout
> expires, or (b) someone explicitly requests that a commit happen
> waking up j_wait_commit.  I'm guessing that complaint here is that
> DEPT thinks nothing is explicitly requesting a wake up.  But note that
> after 5 seconds (or whatever journal->j_commit_interval) is configured
> to be we *will* always start a commit.  So ergo, there can't be a deadlock.

Yeah, it might not be a *deadlock deadlock* because the wait will be
anyway woken up by one of the wake up points you mentioned. However, the
dependency looks problematic because the three contexts participating in
the dependency chain would be stuck for a while until one eventually
wakes it up. I bet it would not be what you meant.

Again. It's not critical but problematic. Or am I missing something?

> At a higher level of discussion, it's an unfair tax on maintainer's
> times to ask maintainers to help you debug DEPT for you.  Tools like
> Syzkaller and DEPT are useful insofar as they save us time in making
> our subsystems better.  But until you can prove that it's not going to
> be a massive denial of service attack on maintainer's time, at the

Partially I agree. I would understand you even if you don't support Dept
until you think it's valuable enough. However, let me keep asking things
to fs folks, not you, even though I would cc you on it.

> If you know there there "appear to be false positives", you need to
> make sure you've tracked them all down before trying to ask that this
> be merged.

To track them all down, I need to ask LKML because Dept works perfectly
with my system. I don't want it to be merged with a lot of false
positive still in there, either.

> You may also want to add some documentation about why we should trust
> this; in particular for wait channels, when a process calls schedule()
> there may be multiple reasons why the thread will wake up --- in the
> worst case, such as in the select(2) or epoll(2) system call, there
> may be literally thousands of reasons (one for every file desriptor
> the select is waiting on) --- why the process will wake up and thus
> resolve the potential "deadlock" that DEPT is worrying about.  How is
> DEPT going to handle those cases?  If the answer is that things need

Thank you for the information but I don't get it which case you are
concerning. I'd like to ask you a specific senario of that so that we
can discuss it more - maybe I guess I could answer to it tho, but I
won't ask you. Just give me an instance only if you think it's worthy.

You look like a guy who unconditionally blames on new things before
understanding it rather than asking and discussing. Again. I also think
anyone doesn't have to spend his or her time for what he or she think is
not worthy enough.

> I know that you're trying to help us, but this tool needs to be far
> better than Lockdep before we should think about merging it.  Even if
> it finds 5% more potential deadlocks, if it creates 95% more false

It should not get merged for sure if so, but it sounds too sarcastic.
Let's see if it creates 95% false positives for real. If it's true and
I can't control it, I will give up. That's what I should do.

There are a lot of factors to judge how valuable Dept is. Dept would be
useful especially in the middle of development, rather than in the final
state in the tree. It'd be appreciated if you think that sides more, too.

Thanks,
Byungchul
