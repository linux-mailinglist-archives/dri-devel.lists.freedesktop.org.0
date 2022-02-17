Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA824BA6B2
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 18:07:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF0C310E1F7;
	Thu, 17 Feb 2022 17:07:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDC2110E1F7
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 17:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=NkjFwjiqqX4QT/vg5SjVKkMGqKMMG5H/BF/lqfeUh3I=; b=CWQCbSEAF0GrUvyXOamn3kOn4G
 p7Qe3Bn4mhcwIIFNxozrBIeBisE0iKowk5CTtNW3j6nRX3bN5SeFq384aMEQx7BeItIuVOFwk8knh
 hufw5kkq3viwBBYj6eTlz6AA8PjAhWHRXzdebniWVxI9by1coH+3HRLHph6mh6jSpsAe+IrDyc5fA
 17ufitcGrr72bV+eQ4Rh9UOjDPsAi/2MnZGBWQXRfuFZyY1C/F1wQs+b5CpZDIY5lODR3AElwylOh
 ZwiG6DIMWTR/CpTK73Hw7b0Uob6KvItGO8QJ+XMVHJP1XDSBju2mA5yxqes3wIWbrh2aNeOKAwCEz
 MMZxPuCg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nKkEU-00Fn52-T9; Thu, 17 Feb 2022 17:06:18 +0000
Date: Thu, 17 Feb 2022 17:06:18 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 00/16] DEPT(Dependency Tracker)
Message-ID: <Yg6AigFqdhdO5/ya@casper.infradead.org>
References: <1645095472-26530-1-git-send-email-byungchul.park@lge.com>
 <Yg5u7dzUxL3Vkncg@mit.edu>
 <20220217120005.67f5ddf4@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220217120005.67f5ddf4@gandalf.local.home>
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
 hch@infradead.org, airlied@linux.ie, mingo@redhat.com, djwong@kernel.org,
 vdavydov.dev@gmail.com, rientjes@google.com, dennis@kernel.org,
 linux-ext4@vger.kernel.org, linux-mm@kvack.org, ngupta@vflare.org,
 melissa.srw@gmail.com, johannes.berg@intel.com, jack@suse.com,
 dan.j.williams@intel.com, josef@toxicpanda.com,
 Byungchul Park <byungchul.park@lge.com>, linux-fsdevel@vger.kernel.org,
 jglisse@redhat.com, viro@zeniv.linux.org.uk, tglx@linutronix.de,
 mhocko@kernel.org, vbabka@suse.cz, axboe@kernel.dk,
 linux-block@vger.kernel.org, sj@kernel.org, Theodore Ts'o <tytso@mit.edu>,
 rodrigosiqueiramelo@gmail.com, kernel-team@lge.com, gregkh@linuxfoundation.org,
 jlayton@kernel.org, linux-kernel@vger.kernel.org, penberg@kernel.org,
 minchan@kernel.org, hannes@cmpxchg.org, tj@kernel.org,
 akpm@linux-foundation.org, torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 17, 2022 at 12:00:05PM -0500, Steven Rostedt wrote:
> On Thu, 17 Feb 2022 10:51:09 -0500
> "Theodore Ts'o" <tytso@mit.edu> wrote:
> 
> > I know that you're trying to help us, but this tool needs to be far
> > better than Lockdep before we should think about merging it.  Even if
> > it finds 5% more potential deadlocks, if it creates 95% more false
> > positive reports --- and the ones it finds are crazy things that
> > rarely actually happen in practice, are the costs worth the benefits?
> > And who is bearing the costs, and who is receiving the benefits?
> 
> I personally believe that there's potential that this can be helpful and we
> will want to merge it.
> 
> But, what I believe Ted is trying to say is, if you do not know if the
> report is a bug or not, please do not ask the maintainers to determine it
> for you. This is a good opportunity for you to look to see why your tool
> reported an issue, and learn that subsystem. Look at if this is really a
> bug or not, and investigate why.

I agree with Steven here, to the point where I'm willing to invest some
time being a beta-tester for this, so if you focus your efforts on
filesystem/mm kinds of problems, I can continue looking at them and
tell you what's helpful and what's unhelpful in the reports.
