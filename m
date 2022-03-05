Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AEA4CE563
	for <lists+dri-devel@lfdr.de>; Sat,  5 Mar 2022 15:56:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15B0710E25F;
	Sat,  5 Mar 2022 14:56:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by gabe.freedesktop.org (Postfix) with ESMTP id 68F8710E25F
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Mar 2022 14:56:00 +0000 (UTC)
Received: from unknown (HELO lgeamrelo01.lge.com) (156.147.1.125)
 by 156.147.23.51 with ESMTP; 5 Mar 2022 23:55:58 +0900
X-Original-SENDERIP: 156.147.1.125
X-Original-MAILFROM: byungchul.park@lge.com
Received: from unknown (HELO X58A-UD3R) (10.177.244.38)
 by 156.147.1.125 with ESMTP; 5 Mar 2022 23:55:58 +0900
X-Original-SENDERIP: 10.177.244.38
X-Original-MAILFROM: byungchul.park@lge.com
Date: Sat, 5 Mar 2022 23:55:34 +0900
From: Byungchul Park <byungchul.park@lge.com>
To: Theodore Ts'o <tytso@mit.edu>
Subject: Re: Report 2 in ext4 and journal based on v5.17-rc1
Message-ID: <20220305145534.GB31268@X58A-UD3R>
References: <YiAow5gi21zwUT54@mit.edu>
 <1646285013-3934-1-git-send-email-byungchul.park@lge.com>
 <YiDSabde88HJ/aTt@mit.edu> <20220304032002.GD6112@X58A-UD3R>
 <YiLbs9rszWXpHm/P@mit.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YiLbs9rszWXpHm/P@mit.edu>
User-Agent: Mutt/1.5.21 (2010-09-15)
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

On Fri, Mar 04, 2022 at 10:40:35PM -0500, Theodore Ts'o wrote:
> On Fri, Mar 04, 2022 at 12:20:02PM +0900, Byungchul Park wrote:
> > 
> > I found a point that the two wait channels don't lead a deadlock in
> > some cases thanks to Jan Kara. I will fix it so that Dept won't
> > complain it.
> 
> I sent my last (admittedly cranky) message before you sent this.  I'm
> glad you finally understood Jan's explanation.  I was trying to tell

Not finally. I've understood him whenever he tried to tell me something.

> you the same thing, but apparently I failed to communicate in a

I don't think so. Your point and Jan's point are different. All he has
said make sense. But yours does not.

> sufficiently clear manner.  In any case, what Jan described is a
> fundamental part of how wait queues work, and I'm kind of amazed that
> you were able to implement DEPT without understanding it.  (But maybe

Of course, it was possible because all that Dept has to know for basic
work is wait and event. The subtle things like what Jan told me help
Dept be better.

> that is why some of the DEPT reports were completely incomprehensible

It's because you are blinded to blame at it without understanding how
Dept works at all. I will fix those that must be fixed. Don't worry.

> to me; I couldn't interpret why in the world DEPT was saying there was
> a problem.)

I can tell you if you really want to understand why. But I can't if you
are like this.

> In any case, the thing I would ask is a little humility.  We regularly
> use lockdep, and we run a huge number of stress tests, throughout each
> development cycle.

Sure.

> So if DEPT is issuing lots of reports about apparently circular
> dependencies, please try to be open to the thought that the fault is

No one was convinced that Dept doesn't have a fault. I think your
worries are too much.

> in DEPT, and don't try to argue with maintainers that their code MUST
> be buggy --- but since you don't understand our code, and DEPT must be

No one argued that their code must be buggy, either. So I don't think
you have to worry about what's never happened.

> theoretically perfect, that it is up to the Maintainers to prove to
> you that their code is correct.
> 
> I am going to gently suggest that it is at least as likely, if not
> more likely, that the failure is in DEPT or your understanding of what

No doubt. I already think so. But it doesn't mean that I have to keep
quiet without discussing to imporve Dept. I will keep improving Dept in
a reasonable way.

> how kernel wait channels and locking works.  After all, why would it
> be that we haven't found these problems via our other QA practices?

Let's talk more once you understand how Dept works at least 10%. Or I
think we cannot talk in a productive way.

