Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EFC280381
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 18:04:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C2006E8C1;
	Thu,  1 Oct 2020 16:03:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52A7B6E8C1;
 Thu,  1 Oct 2020 16:03:55 +0000 (UTC)
Received: from paulmck-ThinkPad-P72.home (unknown [50.45.173.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0124620872;
 Thu,  1 Oct 2020 16:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601568235;
 bh=tPAbUsIyJx/7A7VHjxZeeEsElWnfl/HBPtl67O4vTvc=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=HvzwcNriJ1FpPxUkkMHDDjM8CjnqGRzMzcIOPJ00vQgPr1sbggefQpPQRzKfXGQkC
 NS69q07UzhQsb1c/SWQoajUgnWuHFPtlWhrsmznKxJfoz0gb2FAG/5A4V22q9/yv/F
 Vi1dJ9FEFq0fDdvPTWhlUWhTXMHtBYgMHn5q6gc8=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
 id BC88D3522B33; Thu,  1 Oct 2020 09:03:54 -0700 (PDT)
Date: Thu, 1 Oct 2020 09:03:54 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH tip/core/rcu 11/15] drm/i915: Cleanup PREEMPT_COUNT
 leftovers
Message-ID: <20201001160354.GC29330@paulmck-ThinkPad-P72>
References: <20200928233041.GA23230@paulmck-ThinkPad-P72>
 <20200928233102.24265-11-paulmck@kernel.org>
 <160153665673.4398.6268028176406103680@jlahtine-mobl.ger.corp.intel.com>
 <871riigxp9.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <871riigxp9.fsf@nanos.tec.linutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Reply-To: paulmck@kernel.org
Cc: peterz@infradead.org, fweisbec@gmail.com, jiangshanlai@gmail.com,
 dri-devel@lists.freedesktop.org, oleg@redhat.com, dhowells@redhat.com,
 edumazet@google.com, joel@joelfernandes.org, mingo@kernel.org,
 David Airlie <airlied@linux.ie>, kernel-team@fb.com,
 intel-gfx@lists.freedesktop.org, josh@joshtriplett.org, rostedt@goodmis.org,
 rcu@vger.kernel.org, mathieu.desnoyers@efficios.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, mhocko@kernel.org,
 mgorman@techsingularity.net, linux-kernel@vger.kernel.org,
 akpm@linux-foundation.org, torvalds@linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 01, 2020 at 10:25:06AM +0200, Thomas Gleixner wrote:
> On Thu, Oct 01 2020 at 10:17, Joonas Lahtinen wrote:
> > Quoting paulmck@kernel.org (2020-09-29 02:30:58)
> >> CONFIG_PREEMPT_COUNT is now unconditionally enabled and will be
> >> removed. Cleanup the leftovers before doing so.
> >
> > Change looks fine:
> >
> > Reviewed-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>

Applied, thank you!

> > Are you looking for us to merge or merge through another tree?
> >
> > If us, did the base patch always enabling PREEMPT_COUNT go into 5.9 or is
> > it heading to 5.10? We can queue this earliest for 5.11 as drm-next closed
> > for 5.10 at week of -rc5.
> 
> If at all it goes through rcu/tip because it depends on the earlier patches.

I was figuring on sending a pull request later today, Pacific Time.

							Thanx, Paul
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
