Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD7BB02804
	for <lists+dri-devel@lfdr.de>; Sat, 12 Jul 2025 01:59:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EEE010E2F5;
	Fri, 11 Jul 2025 23:58:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="FDGJe12W";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="W7kso2If";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A445D10E2F5
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 23:58:57 +0000 (UTC)
Date: Sat, 12 Jul 2025 01:58:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1752278335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=imT5HqEkRSNprP7W6NEIrAdL8HwowAu3v+5Es6PMFwM=;
 b=FDGJe12WV9YV6S3fOxMQ+q4kz9C+xvc9/5227EAJ793/L4hXgNzPtri4QIAKKLFHbVO8RT
 uW6B9B05weML4Vz4LU0D3IjvnvYmFpD7BweyRpEGBbQ9ASPi38tPIZusebyM26b1dUzau4
 brQSyBwmjYDNOqfrE7eYeeRvMSFs0YxpAdHh7rppoY71nJXYqDfhFObtnbtqP+L1kY93jf
 9b4OokjKzeM1KDIhVuehERYguwk4E9xu5Psh1sE/ZOuOXxSnvKRyDADdOWnov36ibGbqLX
 xzn5096FQq7D3q30RjJ35gwY0pWI/19ITsKGatekP02CfRQeVtTXKYlkG2sDow==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1752278335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=imT5HqEkRSNprP7W6NEIrAdL8HwowAu3v+5Es6PMFwM=;
 b=W7kso2IfTKsUrGr4a0eZJAEAENj+pddcsr3DyvSVsWDnogvCKgOeudCbk4HPfVsHOG/80i
 4W9bLePA2Sc7K1AA==
From: Nam Cao <namcao@linutronix.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Jakub Kicinski <kuba@kernel.org>,
 Frederic Weisbecker <frederic@kernel.org>,
 Valentin Schneider <vschneid@redhat.com>,
 Christian Brauner <brauner@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, Dave Airlie <airlied@gmail.com>,
 davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, pabeni@redhat.com,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: [GIT PULL] Networking for v6.16-rc6 (follow up)
Message-ID: <20250711235854.c7rIj1Ix@linutronix.de>
References: <20250711114642.2664f28a@kernel.org>
 <CAHk-=wjb_8B85uKhr1xuQSei_85u=UzejphRGk2QFiByP+8Brw@mail.gmail.com>
 <CAHk-=wiwVkGyDngsNR1Hv5ZUqvmc-x0NUD9aRTOcK3=8fTUO=Q@mail.gmail.com>
 <CAHk-=whMyX44=Ga_nK-XUffhFH47cgVd2M_Buhi_b+Lz1jV5oQ@mail.gmail.com>
 <CAHk-=whxjOfjufO8hS27NGnRhfkZfXWTXp1ki=xZz3VPWikMgQ@mail.gmail.com>
 <20250711125349.0ccc4ac0@kernel.org>
 <CAHk-=wjp9vnw46tJ_7r-+Q73EWABHsO0EBvBM2ww8ibK9XfSZg@mail.gmail.com>
 <CAHk-=wjv_uCzWGFoYZVg0_A--jOBSPMWCvdpFo0rW2NnZ=QyLQ@mail.gmail.com>
 <CAHk-=wi8+Ecn9VJH8WYPb7BR4ECYRZGKiiWdhcCjTKZbNkbTkQ@mail.gmail.com>
 <CAHk-=wiMJWwgJ4HYsLzJ4_OkhzJ75ah0HrfBBk+W-RGjk4-h2g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wiMJWwgJ4HYsLzJ4_OkhzJ75ah0HrfBBk+W-RGjk4-h2g@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 11, 2025 at 03:19:00PM -0700, Linus Torvalds wrote:
> On Fri, 11 Jul 2025 at 14:46, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > I've only tested the previous commit being good twice now, but I'll go
> > back to the head of tree and try a revert to verify that this is
> > really it. Because maybe it's the now Nth time I found something that
> > hides the problem, not the real issue.
> >
> > Fingers crossed that this very timing-dependent odd problem really did
> > bisect right finally, after many false starts.
> 
> Ok, verified. Finally.
> 
> I've rebooted this machine five times now with the revert in place,
> and now that I know to recognize all the subtler signs of breakage,
> I'm pretty sure I finally got the right culprit.
> 
> Sometimes the breakage is literally just something like "it takes an
> extra ten or fifteen seconds to start up some app" and then everything
> ends up working, which is why it was so easy to overlook, and why my
> other bisection attempts were such abject failures.
> 
> But that last bisection when I was more careful and knew what to look
> for ended up laser-guided to that thing.
> 
> And apologies to the drm and netlink people who I initially blamed
> just because there were unrelated bugs that just got merged in the
> timeframe when I started noticing oddities. You may have had your own
> bugs, but you were blameless on this issue that I basically spent the
> last day on (I'd say "wasted" the last day on, but right now I feel
> good about finding it, so I guess it wasn't wasted time after all).
> 
> Anyway, I think reverting that commit 8c44dac8add7 ("eventpoll: Fix
> priority inversion problem") is the right thing for 6.16, and
> hopefully Nam Cao & co can figure out what went wrong and we'll
> revisit this in the future.

Yes, please revert it. I had another person reported to me earlier today
about a breakage. We also think that reverting this commit for 6.16 is the
right thing.

Sorry for causing trouble. Strangely my laptop has been running with this
commit for ~6 weeks now without any trouble. Maybe I shouldn't have touched
this lockless business in the first place.

Best regards,
Nam
