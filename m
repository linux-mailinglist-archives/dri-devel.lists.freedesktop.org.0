Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D4B4C66F8
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 11:14:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C16410E350;
	Mon, 28 Feb 2022 10:14:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A202F10E350
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 10:14:47 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id AE3021F893;
 Mon, 28 Feb 2022 10:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1646043285; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1Nl/HRWLf2uRiBoL+p+hRLq5hSZUbfPxUEdyktKl8oE=;
 b=bIs2oiMNX9dU3t841nKdOjwnKZXfWkCF6TMiGHonEZBXOYRICH8FBhaaWZauVNN9+1vhFI
 aP9IjmpF7fbrTWezhF4ftmZ/QQZeGo6Yw2rBR/e2NxtBqbIJF49HUE44em/Mt5NYmOXxnY
 hxgKXlNy+f8RX0+Ee1j8qyhRedYFe/0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1646043285;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1Nl/HRWLf2uRiBoL+p+hRLq5hSZUbfPxUEdyktKl8oE=;
 b=tnrMdjKE2sjpucF/Z1gEp+TafnNHGKUdz5uZZGS97nGXCUfEwmXufJzUvMqnlfakqt7+tp
 MwAC+HStK/S4jXDw==
Received: from quack3.suse.cz (unknown [10.100.224.230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 6D9E3A3B88;
 Mon, 28 Feb 2022 10:14:44 +0000 (UTC)
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 21A2BA060A; Mon, 28 Feb 2022 11:14:44 +0100 (CET)
Date: Mon, 28 Feb 2022 11:14:44 +0100
From: Jan Kara <jack@suse.cz>
To: Byungchul Park <byungchul.park@lge.com>
Subject: Re: Report 2 in ext4 and journal based on v5.17-rc1
Message-ID: <20220228101444.6frl63dn5vmgycbp@quack3.lan>
References: <1645095472-26530-1-git-send-email-byungchul.park@lge.com>
 <1645096204-31670-1-git-send-email-byungchul.park@lge.com>
 <1645096204-31670-2-git-send-email-byungchul.park@lge.com>
 <20220221190204.q675gtsb6qhylywa@quack3.lan>
 <20220223003534.GA26277@X58A-UD3R>
 <20220223144859.na2gjgl5efgw5zhn@quack3.lan>
 <20220224011102.GA29726@X58A-UD3R>
 <20220224102239.n7nzyyekuacgpnzg@quack3.lan>
 <20220228092826.GA5201@X58A-UD3R>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220228092826.GA5201@X58A-UD3R>
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
Cc: hamohammed.sa@gmail.com, Jan Kara <jack@suse.cz>, peterz@infradead.org,
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
 axboe@kernel.dk, melissa.srw@gmail.com, sj@kernel.org, tytso@mit.edu,
 rodrigosiqueiramelo@gmail.com, kernel-team@lge.com, gregkh@linuxfoundation.org,
 jlayton@kernel.org, linux-kernel@vger.kernel.org, penberg@kernel.org,
 minchan@kernel.org, hannes@cmpxchg.org, tj@kernel.org,
 akpm@linux-foundation.org, torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon 28-02-22 18:28:26, Byungchul Park wrote:
> On Thu, Feb 24, 2022 at 11:22:39AM +0100, Jan Kara wrote:
> > On Thu 24-02-22 10:11:02, Byungchul Park wrote:
> > > On Wed, Feb 23, 2022 at 03:48:59PM +0100, Jan Kara wrote:
> > > > > KJOURNALD2(kthread)	TASK1(ksys_write)	TASK2(ksys_write)
> > > > > 
> > > > > wait A
> > > > > --- stuck
> > > > > 			wait B
> > > > > 			--- stuck
> > > > > 						wait C
> > > > > 						--- stuck
> > > > > 
> > > > > wake up B		wake up C		wake up A
> > > > > 
> > > > > where:
> > > > > A is a wait_queue, j_wait_commit
> > > > > B is a wait_queue, j_wait_transaction_locked
> > > > > C is a rwsem, mapping.invalidate_lock
> > > > 
> > > > I see. But a situation like this is not necessarily a guarantee of a
> > > > deadlock, is it? I mean there can be task D that will eventually call say
> > > > 'wake up B' and unblock everything and this is how things were designed to
> > > > work? Multiple sources of wakeups are quite common I'd say... What does
> > > 
> > > Yes. At the very beginning when I desgined Dept, I was thinking whether
> > > to support multiple wakeup sources or not for a quite long time.
> > > Supporting it would be a better option to aovid non-critical reports.
> > > However, I thought anyway we'd better fix it - not urgent tho - if
> > > there's any single circle dependency. That's why I decided not to
> > > support it for now and wanted to gather the kernel guys' opinions. Thing
> > > is which policy we should go with.
> > 
> > I see. So supporting only a single wakeup source is fine for locks I guess.
> > But for general wait queues or other synchronization mechanisms, I'm afraid
> > it will lead to quite some false positive reports. Just my 2c.
> 
> Thank you for your feedback.
> 
> I realized we've been using "false positive" differently. There exist
> the three types of code in terms of dependency and deadlock. It's worth
> noting that dependencies are built from between waits and events in Dept.
> 
> ---
> 
> case 1. Code with an actual circular dependency, but not deadlock.
> 
>    A circular dependency can be broken by a rescue wakeup source e.g.
>    timeout. It's not a deadlock. If it's okay that the contexts
>    participating in the circular dependency and others waiting for the
>    events in the circle are stuck until it gets broken. Otherwise, say,
>    if it's not meant, then it's anyway problematic.
> 
>    1-1. What if we judge this code is problematic?
>    1-2. What if we judge this code is good?
> 
> case 2. Code with an actual circular dependency, and deadlock.
> 
>    There's no other wakeup source than those within the circular
>    dependency. Literally deadlock. It's problematic and critical.
> 
>    2-1. What if we judge this code is problematic?
>    2-2. What if we judge this code is good?
> 
> case 3. Code with no actual circular dependency, and not deadlock.
> 
>    Must be good.
> 
>    3-1. What if we judge this code is problematic?
>    3-2. What if we judge this code is good?
> 
> ---
> 
> I call only 3-1 "false positive" circular dependency. And you call 1-1
> and 3-1 "false positive" deadlock.
> 
> I've been wondering if the kernel guys esp. Linus considers code with
> any circular dependency is problematic or not, even if it won't lead to
> a deadlock, say, case 1. Even though I designed Dept based on what I
> believe is right, of course, I'm willing to change the design according
> to the majority opinion.
> 
> However, I would never allow case 1 if I were the owner of the kernel
> for better stability, even though the code works anyway okay for now.

So yes, I call a report for the situation "There is circular dependency but
deadlock is not possible." a false positive. And that is because in my
opinion your definition of circular dependency includes schemes that are
useful and used in the kernel.

Your example in case 1 is kind of borderline (I personally would consider
that bug as well) but there are other more valid schemes with multiple
wakeup sources like:

We have a queue of work to do Q protected by lock L. Consumer process has
code like:

while (1) {
	lock L
	prepare_to_wait(work_queued);
	if (no work) {
		unlock L
		sleep
	} else {
		unlock L
		do work
		wake_up(work_done)
	}
}

AFAIU Dept will create dependency here that 'wakeup work_done' is after
'wait for work_queued'. Producer has code like:

while (1) {
	lock L
	prepare_to_wait(work_done)
	if (too much work queued) {
		unlock L
		sleep
	} else {
		queue work
		unlock L
		wake_up(work_queued)
	}
}

And Dept will create dependency here that 'wakeup work_queued' is after
'wait for work_done'. And thus we have a trivial cycle in the dependencies
despite the code being perfectly valid and safe.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
