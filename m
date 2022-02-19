Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5694BCD4C
	for <lists+dri-devel@lfdr.de>; Sun, 20 Feb 2022 09:44:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC91E10F74D;
	Sun, 20 Feb 2022 08:44:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lgeamrelo11.lge.com (lgeamrelo13.lge.com [156.147.23.53])
 by gabe.freedesktop.org (Postfix) with ESMTP id C866F10F640
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Feb 2022 10:35:08 +0000 (UTC)
Received: from unknown (HELO lgemrelse7q.lge.com) (156.147.1.151)
 by 156.147.23.53 with ESMTP; 19 Feb 2022 19:35:07 +0900
X-Original-SENDERIP: 156.147.1.151
X-Original-MAILFROM: byungchul.park@lge.com
Received: from unknown (HELO X58A-UD3R) (10.177.244.38)
 by 156.147.1.151 with ESMTP; 19 Feb 2022 19:35:07 +0900
X-Original-SENDERIP: 10.177.244.38
X-Original-MAILFROM: byungchul.park@lge.com
Date: Sat, 19 Feb 2022 19:34:58 +0900
From: Byungchul Park <byungchul.park@lge.com>
To: Theodore Ts'o <tytso@mit.edu>
Subject: Re: [PATCH 00/16] DEPT(Dependency Tracker)
Message-ID: <20220219103458.GD10342@X58A-UD3R>
References: <1645095472-26530-1-git-send-email-byungchul.park@lge.com>
 <Yg5u7dzUxL3Vkncg@mit.edu>
 <20220217120005.67f5ddf4@gandalf.local.home>
 <Yg8eQ/iR5H/AHZIg@mit.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yg8eQ/iR5H/AHZIg@mit.edu>
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
 dan.j.williams@intel.com, josef@toxicpanda.com,
 Steven Rostedt <rostedt@goodmis.org>, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, jglisse@redhat.com, viro@zeniv.linux.org.uk,
 tglx@linutronix.de, mhocko@kernel.org, vbabka@suse.cz, axboe@kernel.dk,
 melissa.srw@gmail.com, sj@kernel.org, rodrigosiqueiramelo@gmail.com,
 kernel-team@lge.com, gregkh@linuxfoundation.org, jlayton@kernel.org,
 linux-kernel@vger.kernel.org, penberg@kernel.org, minchan@kernel.org,
 hannes@cmpxchg.org, tj@kernel.org, akpm@linux-foundation.org,
 torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 17, 2022 at 11:19:15PM -0500, Theodore Ts'o wrote:
> On Thu, Feb 17, 2022 at 12:00:05PM -0500, Steven Rostedt wrote:
> > 
> > I personally believe that there's potential that this can be helpful and we
> > will want to merge it.
> > 
> > But, what I believe Ted is trying to say is, if you do not know if the
> > report is a bug or not, please do not ask the maintainers to determine it
> > for you. This is a good opportunity for you to look to see why your tool
> > reported an issue, and learn that subsystem. Look at if this is really a
> > bug or not, and investigate why.
> 
> I agree there's potential here, or I would have ignored the ext4 "bug
> report".

I just checked this one. Appreciate it...

> When we can get rid of the false positives, I think it should be

Of course, the false positives should be removed once it's found. I will
try my best to remove all of those on my own as much as possible.
However, thing is I can't see others than what I can see with my system.

> merged; I'd just rather it not be merged until after the false
> positives are fixed, since otherwise, someone well-meaning will start
> using it with Syzkaller, and noise that maintainers need to deal with
> (with people requesting reverts of two year old commits, etc) will
> increase by a factor of ten or more.  (With Syzbot reproducers that

Agree.

> set up random cgroups, IP tunnels with wiregaurd enabled, FUSE stress
> testers, etc., that file system maintainers will be asked to try to
> disentangle.)
> 
> So from a maintainer's perspective, false positives are highly
> negative.  It may be that from some people's POV, one bug found and 20
> false positive might still be "useful".  But if your tool gains a
> reputation of not valuing maintainers' time, it's just going to make
> us (or at least me :-) cranky, and it's going to be very hard to

Agree.

> recover from perception.  So it's probably better to be very
> conservative and careful in polishing it before asking for it to be
> merged.

If it's true that there are too many false positives like 95%, then I'll
fix those fist for sure before asking to merge it. Let's see if so.

To kernel developers,

It'd be appreciated if you'd let us know if you can see real ones than
false positives in the middle of developing something in the kernel so
it's useful. Otherwise, it's hard to measure how many false positives it
reports and how valuable it is and so on...

Thanks,
Byungchul
