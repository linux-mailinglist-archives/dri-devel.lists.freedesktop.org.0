Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 991764C15B3
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 15:49:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8882610E141;
	Wed, 23 Feb 2022 14:49:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A55610E1E8
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 14:49:06 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 641D41F43E;
 Wed, 23 Feb 2022 14:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1645627744; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FK9sEqjfjXY5LitlS8xP8QxizShsUv7zVJcMSguuQsI=;
 b=hTijlMheXX8NY4acif2Q2mtWvZUu3e+JT/sBPkLSIE2dDue28Vn/sgW5LwqXETaS71l7ah
 fVF55fzFgzF0E6kS8rohTgqO/fIs0YvzxhPx5Ist3vT9OXA0145aQ7hLnNHBQ0FNZpZhuD
 PZRcLnqB1WJWWNowRFHO31oPhpkUTTA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1645627744;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FK9sEqjfjXY5LitlS8xP8QxizShsUv7zVJcMSguuQsI=;
 b=+Yr2hi8PuvORyKM8X5hw/nPb2WZQbZ6hX4K31tkv38CYDNL9C3wdl7imBOrxgxm5hGV7CB
 nincL23NWtuKgvBw==
Received: from quack3.suse.cz (unknown [10.163.28.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 5E2E6A3B94;
 Wed, 23 Feb 2022 14:49:00 +0000 (UTC)
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 03F62A0605; Wed, 23 Feb 2022 15:48:59 +0100 (CET)
Date: Wed, 23 Feb 2022 15:48:59 +0100
From: Jan Kara <jack@suse.cz>
To: Byungchul Park <byungchul.park@lge.com>
Subject: Re: Report 2 in ext4 and journal based on v5.17-rc1
Message-ID: <20220223144859.na2gjgl5efgw5zhn@quack3.lan>
References: <1645095472-26530-1-git-send-email-byungchul.park@lge.com>
 <1645096204-31670-1-git-send-email-byungchul.park@lge.com>
 <1645096204-31670-2-git-send-email-byungchul.park@lge.com>
 <20220221190204.q675gtsb6qhylywa@quack3.lan>
 <20220223003534.GA26277@X58A-UD3R>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220223003534.GA26277@X58A-UD3R>
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

On Wed 23-02-22 09:35:34, Byungchul Park wrote:
> On Mon, Feb 21, 2022 at 08:02:04PM +0100, Jan Kara wrote:
> > On Thu 17-02-22 20:10:04, Byungchul Park wrote:
> > > [    9.008161] ===================================================
> > > [    9.008163] DEPT: Circular dependency has been detected.
> > > [    9.008164] 5.17.0-rc1-00015-gb94f67143867-dirty #2 Tainted: G        W
> > > [    9.008166] ---------------------------------------------------
> > > [    9.008167] summary
> > > [    9.008167] ---------------------------------------------------
> > > [    9.008168] *** DEADLOCK ***
> > > [    9.008168]
> > > [    9.008168] context A
> > > [    9.008169]     [S] (unknown)(&(&journal->j_wait_transaction_locked)->dmap:0)
> > > [    9.008171]     [W] wait(&(&journal->j_wait_commit)->dmap:0)
> > > [    9.008172]     [E] event(&(&journal->j_wait_transaction_locked)->dmap:0)
> > > [    9.008173]
> > > [    9.008173] context B
> > > [    9.008174]     [S] down_write(mapping.invalidate_lock:0)
> > > [    9.008175]     [W] wait(&(&journal->j_wait_transaction_locked)->dmap:0)
> > > [    9.008176]     [E] up_write(mapping.invalidate_lock:0)
> > > [    9.008177]
> > > [    9.008178] context C
> > > [    9.008179]     [S] (unknown)(&(&journal->j_wait_commit)->dmap:0)
> > > [    9.008180]     [W] down_write(mapping.invalidate_lock:0)
> > > [    9.008181]     [E] event(&(&journal->j_wait_commit)->dmap:0)
> > > [    9.008181]
> > > [    9.008182] [S]: start of the event context
> > > [    9.008183] [W]: the wait blocked
> > > [    9.008183] [E]: the event not reachable
> > 
> > So what situation is your tool complaining about here? Can you perhaps show
> > it here in more common visualization like:
> 
> Sure.
> 
> > TASK1				TASK2
> > 				does foo, grabs Z
> > does X, grabs lock Y
> > blocks on Z
> > 				blocks on Y
> > 
> > or something like that? Because I was not able to decipher this from the
> > report even after trying for some time...
> 
> KJOURNALD2(kthread)	TASK1(ksys_write)	TASK2(ksys_write)
> 
> wait A
> --- stuck
> 			wait B
> 			--- stuck
> 						wait C
> 						--- stuck
> 
> wake up B		wake up C		wake up A
> 
> where:
> A is a wait_queue, j_wait_commit
> B is a wait_queue, j_wait_transaction_locked
> C is a rwsem, mapping.invalidate_lock

I see. But a situation like this is not necessarily a guarantee of a
deadlock, is it? I mean there can be task D that will eventually call say
'wake up B' and unblock everything and this is how things were designed to
work? Multiple sources of wakeups are quite common I'd say... What does
Dept do to prevent false reports in cases like this?

> The above is the simplest form. And it's worth noting that Dept focuses
> on wait and event itself rather than grabing and releasing things like
> lock. The following is the more descriptive form of it.
> 
> KJOURNALD2(kthread)	TASK1(ksys_write)	TASK2(ksys_write)
> 
> wait @j_wait_commit
> 			ext4_truncate_failed_write()
> 			   down_write(mapping.invalidate_lock)
> 
> 			   ext4_truncate()
> 			      ...
> 			      wait @j_wait_transaction_locked
> 
> 						ext_truncate_failed_write()
> 						   down_write(mapping.invalidate_lock)
> 
> 						ext4_should_retry_alloc()
> 						   ...
> 						   __jbd2_log_start_commit()
> 						      wake_up(j_wait_commit)
> jbd2_journal_commit_transaction()
>    wake_up(j_wait_transaction_locked)
> 			   up_write(mapping.invalidate_lock)
> 
> I hope this would help you understand the report.

I see, thanks for explanation! So the above scenario is impossible because
for anyone to block on @j_wait_transaction_locked the transaction must be
committing, which is done only by kjournald2 kthread and so that thread
cannot be waiting at @j_wait_commit. Essentially blocking on
@j_wait_transaction_locked means @j_wait_commit wakeup was already done.

I guess this shows there can be non-trivial dependencies between wait
queues which are difficult to track in an automated way and without such
tracking we are going to see false positives...

								Honza

-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
