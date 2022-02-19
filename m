Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 014554BCD48
	for <lists+dri-devel@lfdr.de>; Sun, 20 Feb 2022 09:44:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2457010F748;
	Sun, 20 Feb 2022 08:44:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lgeamrelo11.lge.com (lgeamrelo13.lge.com [156.147.23.53])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4C55C10F7A0
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Feb 2022 10:18:30 +0000 (UTC)
Received: from unknown (HELO lgeamrelo01.lge.com) (156.147.1.125)
 by 156.147.23.53 with ESMTP; 19 Feb 2022 19:18:28 +0900
X-Original-SENDERIP: 156.147.1.125
X-Original-MAILFROM: byungchul.park@lge.com
Received: from unknown (HELO X58A-UD3R) (10.177.244.38)
 by 156.147.1.125 with ESMTP; 19 Feb 2022 19:18:28 +0900
X-Original-SENDERIP: 10.177.244.38
X-Original-MAILFROM: byungchul.park@lge.com
Date: Sat, 19 Feb 2022 19:18:20 +0900
From: Byungchul Park <byungchul.park@lge.com>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 00/16] DEPT(Dependency Tracker)
Message-ID: <20220219101820.GC10342@X58A-UD3R>
References: <1645095472-26530-1-git-send-email-byungchul.park@lge.com>
 <Yg5u7dzUxL3Vkncg@mit.edu>
 <20220217120005.67f5ddf4@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220217120005.67f5ddf4@gandalf.local.home>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Approved-At: Sun, 20 Feb 2022 08:44:16 +0000
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
 dan.j.williams@intel.com, josef@toxicpanda.com, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, jglisse@redhat.com, viro@zeniv.linux.org.uk,
 tglx@linutronix.de, mhocko@kernel.org, vbabka@suse.cz, axboe@kernel.dk,
 melissa.srw@gmail.com, sj@kernel.org, Theodore Ts'o <tytso@mit.edu>,
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

Appreciate your feedback. I'll be more careful in reporting things, and
I think I need to make it more conservative...

> The likely/unlikely tracing I do finds issues all over the kernel. But
> before I report anything, I look at the subsystem and determine *why* it's
> reporting what it does. In some cases, it's just a config issue. Where, I
> may submit a patch saying "this is 100% wrong in X config, and we should
> just remove the "unlikely". But I did the due diligence to find out exactly
> what the issue is, and why the tooling reported what it reported.

I'll try my best to do things that way. However, thing is that there's
few reports with my system... That's why I shared Dept in LKML space.

> I want to stress that your Dept tooling looks to have the potential of
> being something that will be worth while including. But the false positives
> needs to be down to the rate of lockdep false positives. As Ted said, if
> it's reporting 95% false positives, nobody is going to look at the 5% of
> real bugs that it finds.

Agree. Dept should not be merged if so. I'm not pushing ahead, but I'm
convinced that Dept works what a dependency tracker should do. Let's see
how valuable it is esp. in the middle of developing something in the
kernel.

Thanks,
Byungchul
