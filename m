Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B5B420773
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 10:39:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D83F6E95C;
	Mon,  4 Oct 2021 08:39:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78E346E159;
 Mon,  4 Oct 2021 08:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=zKfDV0YNjCwsU17bwwpjgv9Pzvz+7OLk3zePGdmFYy8=; b=hlLS99M+YxsFJUfufRgK/afR0W
 ke9AhprYdInkVZ9Mv2erU7XbHL9jtxpzkFdrrOaSDlvyTId9EStVoWAnvVMJhG6qU9awxJHSBp6KK
 S95QdHlOJaVVpPJfYxFpc+nM+JHNET9gi3mmEso5KUo1Hl+a0CrVPBAS+IJbvniFo7cTPPSE0Ejxu
 KxWUsaWT8uXQ0iZPbNFdllxGEqkIwgZ/szqvX9YnQnGg3Pao47a0xftztbZ/Dx8iOCvbDZuNr1mUL
 RvDgrbK8eUjfbT4ApAnZA4oiEH4ZdqIpIzzYsmcFmDW+b0mMD/6TFOycb5ljUIzK9xOyA6oWgH0OW
 AN3npNZw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXJVS-007nRF-IH; Mon, 04 Oct 2021 08:39:30 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id AB97A3002DE;
 Mon,  4 Oct 2021 10:39:29 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 557BF20A660F3; Mon,  4 Oct 2021 10:39:29 +0200 (CEST)
Date: Mon, 4 Oct 2021 10:39:29 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>
Subject: Re: [RFC 1/6] sched: Add nice value change notifier
Message-ID: <YVq9weHmEGOVsj/p@hirez.programming.kicks-ass.net>
References: <20210930171552.501553-1-tvrtko.ursulin@linux.intel.com>
 <20210930171552.501553-2-tvrtko.ursulin@linux.intel.com>
 <20210930183316.GC4323@worktop.programming.kicks-ass.net>
 <4aca656d-678f-4d61-38a4-d2e7a8fd89ab@linux.intel.com>
 <5c71ec04-9148-0587-c495-11dbd8f77d67@linux.intel.com>
 <YVct0D9kB1KtrwZ3@hirez.programming.kicks-ass.net>
 <01a968c9-c427-f4c7-44d5-2f47f939f9eb@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01a968c9-c427-f4c7-44d5-2f47f939f9eb@linux.intel.com>
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

On Mon, Oct 04, 2021 at 09:12:37AM +0100, Tvrtko Ursulin wrote:
> On 01/10/2021 16:48, Peter Zijlstra wrote:

> > Hmm? That's for normalize_rt_tasks() only, right? Just don't have it
> > call the notifier in that special case (that's a magic sysrq thing
> > anyway).
> 
> You mean my talk about tasklist_lock? No, it is also on the syscall part I
> am interested in as well. Call chain looks like this:

Urgh, I alwys miss that because it lives outside of sched.. :/

> sys_setpriority()
> {
>   ...
>   rcu_read_lock();
>   read_lock(&tasklist_lock);
>   ...
>   set_one_prio()
>     set_user_nice()
>     {
>       ...
>       task_rq_lock();
>         -> my notifier from this RFC [1]
>       task_rq_unlock();
>         -> I can move the notifier here for _some_ improvement [2]
>     }
>   ...
>   read_unlock(&tasklist_lock);
>   rcu_read_unlock();
> }
> 
> So this RFC had the notifier call chain at [1], which I understood was the
> thing you initially pointed was horrible, being under a scheduler lock.
> 
> I can trivially move it to [2] but that still leaves it under the tasklist
> lock. I don't have a good feel how much better that would be. If not good
> enough then I will look for a smarter solution with less opportunity for
> global impact.

So task_list lock is pretty terrible and effectively unbound already
(just create more tasks etc..) so adding a notifier call there shouldn't
really make it much worse.


