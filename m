Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE139673AC0
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 14:52:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2001310E12F;
	Thu, 19 Jan 2023 13:52:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1057 seconds by postgrey-1.36 at gabe;
 Thu, 19 Jan 2023 13:52:28 UTC
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F03010E12F
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 13:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Dd4KE++vWIKamqThkehHj7fJpHW3aChCNzZyFef73OI=; b=ZiBP9IU8e0RQ32NiZKka8MnWTR
 Dn0s9lTcFdzt4feEZuNn6vIgEPzmD5cviY4HNiw+EGim/+fdqSp83CwedDaJFyd2q2vePAOMF7R47
 /mT/pV3FrXZ0OCNIOm/rgdNiJAiF9udqbmgCvdv8tlfjrQES8QDp+06hIwoNapYXBTR+i6XKWX5ij
 qkK3CEH0iS8hZp+JgId9L10gYqA1yZnepzrHrEzU/DThBM4jGZH4pD6906x9w3V5a2ZVJlG7+GsLd
 IX8t76QoYPJmUT+lx0lOj7EEt0PIr724UtBaPXC85udHqrL+r1umcOCxsWYgULtsg+F/hymdVlFkZ
 MS0yEAZA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pIV3G-00106x-OP; Thu, 19 Jan 2023 13:33:58 +0000
Date: Thu, 19 Jan 2023 13:33:58 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Byungchul Park <byungchul.park@lge.com>
Subject: Re: [PATCH RFC v7 00/23] DEPT(Dependency Tracker)
Message-ID: <Y8lGxkBrls6qQOdM@casper.infradead.org>
References: <Y8bmeffIQ3iXU3Ux@boqun-archlinux>
 <1674109388-6663-1-git-send-email-byungchul.park@lge.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1674109388-6663-1-git-send-email-byungchul.park@lge.com>
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
 dri-devel@lists.freedesktop.org, mhocko@kernel.org, linux-mm@kvack.org,
 linux-ide@vger.kernel.org, adilger.kernel@dilger.ca, joel@joelfernandes.org,
 42.hyeyoo@gmail.com, cl@linux.com, will@kernel.org, duyuyang@gmail.com,
 sashal@kernel.org, paolo.valente@linaro.org, damien.lemoal@opensource.wdc.com,
 chris.p.wilson@intel.com, hch@infradead.org, mingo@redhat.com,
 djwong@kernel.org, vdavydov.dev@gmail.com, rientjes@google.com,
 dennis@kernel.org, linux-ext4@vger.kernel.org, ngupta@vflare.org,
 johannes.berg@intel.com, boqun.feng@gmail.com, dan.j.williams@intel.com,
 josef@toxicpanda.com, rostedt@goodmis.org, gwan-gyeong.mun@intel.com,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, jglisse@redhat.com,
 viro@zeniv.linux.org.uk, longman@redhat.com, tglx@linutronix.de,
 vbabka@suse.cz, melissa.srw@gmail.com, sj@kernel.org, tytso@mit.edu,
 rodrigosiqueiramelo@gmail.com, kernel-team@lge.com, gregkh@linuxfoundation.org,
 jlayton@kernel.org, linux-kernel@vger.kernel.org, penberg@kernel.org,
 minchan@kernel.org, max.byungchul.park@gmail.com, hannes@cmpxchg.org,
 tj@kernel.org, akpm@linux-foundation.org, torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 19, 2023 at 03:23:08PM +0900, Byungchul Park wrote:
> Boqun wrote:
> > *	Looks like the DEPT dependency graph doesn't handle the
> > 	fair/unfair readers as lockdep current does. Which bring the
> > 	next question.
> 
> No. DEPT works better for unfair read. It works based on wait/event. So
> read_lock() is considered a potential wait waiting on write_unlock()
> while write_lock() is considered a potential wait waiting on either
> write_unlock() or read_unlock(). DEPT is working perfect for it.
> 
> For fair read (maybe you meant queued read lock), I think the case
> should be handled in the same way as normal lock. I might get it wrong.
> Please let me know if I miss something.

From the lockdep/DEPT point of view, the question is whether:

	read_lock(A)
	read_lock(A)

can deadlock if a writer comes in between the two acquisitions and
sleeps waiting on A to be released.  A fair lock will block new
readers when a writer is waiting, while an unfair lock will allow
new readers even while a writer is waiting.

