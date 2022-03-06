Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D79374CEBDE
	for <lists+dri-devel@lfdr.de>; Sun,  6 Mar 2022 15:20:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F2610E30C;
	Sun,  6 Mar 2022 14:20:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B81410E30C
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Mar 2022 14:20:13 +0000 (UTC)
Received: from cwcc.thunk.org (pool-108-7-220-252.bstnma.fios.verizon.net
 [108.7.220.252]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 226EJAPh008887
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 6 Mar 2022 09:19:10 -0500
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id 3595415C0038; Sun,  6 Mar 2022 09:19:10 -0500 (EST)
Date: Sun, 6 Mar 2022 09:19:10 -0500
From: "Theodore Ts'o" <tytso@mit.edu>
To: Byungchul Park <byungchul.park@lge.com>
Subject: Re: Report 2 in ext4 and journal based on v5.17-rc1
Message-ID: <YiTC3j6Igkw7xvIM@mit.edu>
References: <YiQq6Ou39uzHC0mu@mit.edu>
 <1646563902-6671-1-git-send-email-byungchul.park@lge.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1646563902-6671-1-git-send-email-byungchul.park@lge.com>
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

On Sun, Mar 06, 2022 at 07:51:42PM +0900, Byungchul Park wrote:
> > 
> > Users of DEPT must not have to understand how DEPT works in order to
> 
> Users must not have to understand how Dept works for sure, and haters
> must not blame things based on what they guess wrong.

For the record, I don't hate DEPT.  I *fear* that DEPT will result in
my getting spammed with a huge number of false posiives once automated
testing systems like Syzkaller, zero-day test robot, etcs., get a hold
of it once it gets merged and start generating hundreds of automated
reports.

And when I tried to read the DEPT reports, and the DEPT documentation,
and I found that its explanation for why ext4 had a circular
dependency simply did not make sense.  If my struggles to understand
why DEPT was issuing a false positive is "guessing", then how do we
have discussions over how to make DEPT better?

> > called prepare-to-wait on more than one wait queue, how is DEPT going
> > to distinguish between your "morally correct" wkaeup source, and the
> > "rescue wakeup source"?
> 
> Sure, it should be done manually. I should do it on my own when that
> kind of issue arises.

The question here is how often will it need to be done, and how easy
will it be to "do it manually"?  Suppose we mark all of the DEPT false
positives before it gets merged?  How easy will it be able to suppress
future false positives in the future, as the kernel evolves?

Perhaps one method is to haved a way to take a particular wait queue,
or call to schedule(), or at the level of an entire kernel source
file, and opt it out from DEPT analysis?  That way, if DEPT gets
merged, and a maintainer starts getting spammed by bogus (or
incomprehensible) reports, there is a simople way they can annotate
their source code to prevent DEPT from analyzing code that it is
apparently not able to understand correctly.

That way we don't necessarily need to have a debate over how close to
zero percent false positives is necessary before DEPT can get merged.
And we avoid needing to force maintainers to prove that a DEPT report
is a false positive, which is from my experience hard to do, since
they get accused of being DEPT haters and not understanding DEPT.

	  	   	      	    	    	     - Ted
