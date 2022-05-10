Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D43520ABA
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 03:33:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEBD110F4BA;
	Tue, 10 May 2022 01:33:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A54310F4BA
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 01:33:01 +0000 (UTC)
Received: from cwcc.thunk.org (pool-108-7-220-252.bstnma.fios.verizon.net
 [108.7.220.252]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 24A1WF09029249
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 9 May 2022 21:32:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1652146345; bh=kNxC32quScbCpNyL/wTfsRZfYUcVDoGEmAnwF+CO/RI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=km6W4YaByvgKGbZv4iigLhBLQKaouM7qOJbks5QBOy26HI3QALcwGS+dbcTKQS5sm
 Y/RfTPjh7Z/nGp7uw6lZldW4W7fDFvGwL50TgxrjuvPL3iRd3c4r5VsKVtA18CxFta
 K6h0nLQnpaLVIuO5cinKaeUKJnjTcwOHBqP8XAHNvf5t67+lRQdtNCcZd/4CjPjwJt
 TlD8gzwU7/lyuUjHaeuowq/VPSNP4EPKVvgcV9OldxEhxxvenlEiwduS3jOCyFWYYn
 fsw/0mi83B+RJaEAF7dXVO08S3PaX0rrxg/1+1D2s0+ctpfGHSZ240yR1Of3O+QVFm
 xIZ7hXIiuS2Nw==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id 5B4DC15C3F0A; Mon,  9 May 2022 21:32:15 -0400 (EDT)
Date: Mon, 9 May 2022 21:32:15 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Byungchul Park <byungchul.park@lge.com>
Subject: Re: [PATCH RFC v6 00/21] DEPT(Dependency Tracker)
Message-ID: <YnnAnzPFZZte/UR8@mit.edu>
References: <1651652269-15342-1-git-send-email-byungchul.park@lge.com>
 <YnmCE2iwa0MSqocr@mit.edu> <YnmVgVQ7usoXnJ1N@mit.edu>
 <20220510003213.GD6047@X58A-UD3R>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220510003213.GD6047@X58A-UD3R>
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
 joel@joelfernandes.org, 42.hyeyoo@gmail.com, cl@linux.com, will@kernel.org,
 duyuyang@gmail.com, sashal@kernel.org, paolo.valente@linaro.org,
 damien.lemoal@opensource.wdc.com, willy@infradead.org, hch@infradead.org,
 airlied@linux.ie, mingo@redhat.com, djwong@kernel.org, vdavydov.dev@gmail.com,
 rientjes@google.com, dennis@kernel.org, linux-ext4@vger.kernel.org,
 linux-mm@kvack.org, ngupta@vflare.org, johannes.berg@intel.com, jack@suse.com,
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

On Tue, May 10, 2022 at 09:32:13AM +0900, Byungchul Park wrote:
> Yes, right. DEPT has never been optimized. It rather turns on
> CONFIG_LOCKDEP and even CONFIG_PROVE_LOCKING when CONFIG_DEPT gets on
> because of porting issue. I have no choice but to rely on those to
> develop DEPT out of tree. Of course, that's what I don't like.

Sure, but blaming the overhead on unnecessary CONFIG_PROVE_LOCKING
overhead can explain only a tiny fraction of the slowdown.  Consider:
if time to first test (time to boot the kernel, setup the test
environment, figure out which tests to run, etc.) is 12 seconds w/o
LOCKDEP, 49 seconds with LOCKDEP/PROVE_LOCKING and 602 seconds with
DEPT, you can really only blame 37 seconds out of the 602 seconds of
DEPT on unnecessary PROVE_LOCKING overhead.

So let's assume we can get rid of all of the PROVE_LOCKING overhead.
We're still talking about 12 seconds for time-to-first test without
any lock debugging, versus ** 565 ** seconds for time-to-first test
with DEPT.  That's a factor of 47x for DEPT sans LOCKDEP overhead,
compared to a 4x overhead for PROVE_LOCKING.

> Plus, for now, I'm focusing on removing false positives. Once it's
> considered settled down, I will work on performance optimizaition. But
> it should still keep relying on Lockdep CONFIGs and adding additional
> overhead on it until DEPT can be developed in the tree.

Well, please take a look at the false positive which I reported.  I
suspect that in order to fix that particular false positive, we'll
either need to have a way to disable DEPT on waiting on all page/folio
dirty bits, or it will need to treat pages from different inodes
and/or address spaces as being entirely separate classes, instead of
collapsing all inode dirty bits, and all of various inode's mutexes
(such as ext4's i_data_sem) as being part of a single object class.

> DEPT is tracking way more objects than Lockdep so it's inevitable to be
> slower, but let me try to make it have the similar performance to
> Lockdep.

In order to eliminate some of these false positives, I suspect it's
going to increase the number of object classes that DEPT will need to
track even *more*.  At which point, the cost/benefit of DEPT may get
called into question, especially if all of the false positives can't
be suppressed.

					- Ted
