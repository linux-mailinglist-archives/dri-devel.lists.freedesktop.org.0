Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLvzH7BYqWkh5wAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 11:19:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FD620F975
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 11:19:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76F0B10E245;
	Thu,  5 Mar 2026 10:19:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="ezRpV7hl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A87C10E23D;
 Thu,  5 Mar 2026 10:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1772705962;
 bh=pO8bh3aI9LNbJmw/ZXCQzNQH2nwTzx/BXqsFJBiQUFs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ezRpV7hlpttb8h0VEeYs8FOQRg2HIO/0xR19GBJuwjyNnwCZpFNxvi2AzDOo/3Q3H
 Sr5rra6zJoUFdvY8DRuCzDKHUCwdeE7L8Gcgdn0KVfjKaAfO8KDC3kPfrC7FrCVbXk
 1z5cycooxQnSFtLQXnMSleDPMHeOKK8Pdgn4KNqt95AgaeXhrEeOsdeOIidLenIUih
 6q0YLrjnb/KhhUUow9/APtd/iZ3l4/0Q358IlMy0GNjuFBry6uY/kqcniqVJfJrles
 JMmyBmNH4HTNvc7Mgxye8QT8ytVIgFoDB5SkS3h4lSv6h9OC3Stf/8Gv+n89+Pqgjv
 2M1sEUMOZQAWw==
Message-ID: <d280719b-163f-4cce-a978-24f1e028505f@lankhorst.se>
Date: Thu, 5 Mar 2026 11:19:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i915-rt v6 00/24] drm/i915/display: All patches to make
 PREEMPT_RT work on i915 + xe.
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-rt-devel@lists.linux.dev, dri-devel@lists.freedesktop.org
References: <20260220083657.28815-26-dev@lankhorst.se>
 <20260224162703.Q_taYjEC@linutronix.de>
 <20260224165903.2mn24oQy@linutronix.de>
 <20260225075806.XNtXjZ5E@linutronix.de>
 <7ee8b784-a714-4329-aab2-a571f25c3baa@lankhorst.se>
 <20260226120715.6Ug1Qkse@linutronix.de>
 <20260226141942.Z6vUrEQ3@linutronix.de>
 <20260226143857.4ZJAFzf6@linutronix.de>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <20260226143857.4ZJAFzf6@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
X-Rspamd-Queue-Id: 30FD620F975
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[lankhorst.se,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lankhorst.se:s=default];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[dev@lankhorst.se,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lankhorst.se:dkim,lankhorst.se:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lankhorst.se:+]
X-Rspamd-Action: no action

Hey,

Den 2026-02-26 kl. 15:38, skrev Sebastian Andrzej Siewior:
> On 2026-02-26 15:19:42 [+0100], To Maarten Lankhorst wrote:
>> On 2026-02-26 13:07:18 [+0100], To Maarten Lankhorst wrote:
>>> series somewhere I could pull and check. In meantime I would look what
>>> causes the lockup on i915.
>>
>> I think I got it.
> 
> This the atomic sync as-is, IRQ-Work (FIFO-1) will be preempted by the
> threaded-interrupt (FIFO-50) and the interrupt will poll on
> signaler_active while the irq-work can't make progress.
> 
> This will provide the needed sync:
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
> index a2b413982ce64..337f6e88faf05 100644
> --- a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
> @@ -209,6 +209,7 @@ static void signal_irq_work(struct irq_work *work)
>  		intel_breadcrumbs_disarm_irq(b);
>  
>  	rcu_read_lock();
> +	spin_lock(&b->signaler_active_sync);
>  	atomic_inc(&b->signaler_active);
>  	list_for_each_entry_rcu(ce, &b->signalers, signal_link) {
>  		struct i915_request *rq;
> @@ -246,6 +247,7 @@ static void signal_irq_work(struct irq_work *work)
>  		}
>  	}
>  	atomic_dec(&b->signaler_active);
> +	spin_unlock(&b->signaler_active_sync);
>  	rcu_read_unlock();
>  
>  	llist_for_each_safe(signal, sn, signal) {
> @@ -290,6 +292,7 @@ intel_breadcrumbs_create(struct intel_engine_cs *irq_engine)
>  	init_llist_head(&b->signaled_requests);
>  
>  	spin_lock_init(&b->irq_lock);
> +	spin_lock_init(&b->signaler_active_sync);
>  	init_irq_work(&b->irq_work, signal_irq_work);
>  
>  	b->irq_engine = irq_engine;
> @@ -487,8 +490,11 @@ void intel_context_remove_breadcrumbs(struct intel_context *ce,
>  	if (release)
>  		intel_context_put(ce);
>  
> -	while (atomic_read(&b->signaler_active))
> +	while (atomic_read(&b->signaler_active)) {
> +		spin_lock(&b->signaler_active_sync);
> +		spin_unlock(&b->signaler_active_sync);
>  		cpu_relax();
> +	}
>  }
>  
>  static void print_signals(struct intel_breadcrumbs *b, struct drm_printer *p)
> diff --git a/drivers/gpu/drm/i915/gt/intel_breadcrumbs_types.h b/drivers/gpu/drm/i915/gt/intel_breadcrumbs_types.h
> index bdf09fd67b6e7..28dae32628aab 100644
> --- a/drivers/gpu/drm/i915/gt/intel_breadcrumbs_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_breadcrumbs_types.h
> @@ -40,6 +40,7 @@ struct intel_breadcrumbs {
>  	struct list_head signalers;
>  	struct llist_head signaled_requests;
>  	atomic_t signaler_active;
> +	spinlock_t signaler_active_sync;
>  
>  	spinlock_t irq_lock; /* protects the interrupt from hardirq context */
>  	struct irq_work irq_work; /* for use from inside irq_lock */
> 
> Sebastian
Seems like signaler_active is used as a hand-rolled completion barrier here,
your patch would be even better if we could use the correct primitive here instead?

or if that doesn't exist, remove signaler_active, and replace the read side with
a 'if spin_is_locked() { lock/unlock }' pair and comments it waits for completion?

Kind regards,
~Maarten Lankhorst
