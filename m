Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNhnBp3frmm/JQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 15:56:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9975C23B0AD
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 15:56:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCF8E10E18E;
	Mon,  9 Mar 2026 14:56:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0626E10E18E
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 14:56:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4DE5D1570
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 07:56:17 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id
 55FD73F7BD
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 07:56:23 -0700 (PDT)
Date: Mon, 9 Mar 2026 14:54:21 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, kernel@collabora.com,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Philipp Stanner <phasta@kernel.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH] drm/panthor: Fix the "done_fence is initialized"
 detection logic
Message-ID: <aa7fHayRMdHn2Yxo@e142607>
References: <20260309103053.211415-1-boris.brezillon@collabora.com>
 <aa6pYsoS6Ahdi8nu@e142607> <20260309141549.3b254c46@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260309141549.3b254c46@fedora>
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
X-Rspamd-Queue-Id: 9975C23B0AD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:steven.price@arm.com,m:adrian.larumbe@collabora.com,m:kernel@collabora.com,m:nicolas.frattaroli@collabora.com,m:tvrtko.ursulin@igalia.com,m:phasta@kernel.org,m:christian.koenig@amd.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[liviu.dudau@arm.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.542];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[liviu.dudau@arm.com,dri-devel-bounces@lists.freedesktop.org];
	MISSING_XM_UA(0.00)[];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,gitlab.freedesktop.org:url,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 02:15:49PM +0100, Boris Brezillon wrote:
> On Mon, 9 Mar 2026 11:05:06 +0000
> Liviu Dudau <liviu.dudau@arm.com> wrote:
> 
> > > After commit 541c8f2468b9 ("dma-buf: detach fence ops on signal v3"),
> > > dma_fence::ops == NULL can't be used to check if the fence is initialized
> > > or not. We could turn this into an "is_signaled() || ops == NULL" test,
> > > but that's fragile, since it's still subject to dma_fence internal
> > > changes. So let's have the "is_initialized" state encoded directly in
> > > the pointer through the lowest bit which is guaranteed to be unused
> > > because of the dma_fence alignment constraint.  
> > 
> > I'm confused! There is only one place where we end up being interested if the
> > fence has been initialized or not, and that is in job_release(). I don't
> > see why checking for "ops != NULL" before calling dma_fence_put() should not
> > be enough,
> 
> Because after 541c8f2468b9 ("dma-buf: detach fence ops on signal v3"),
> dma_fence->ops is set back to NULL at signal time[1].

Yes, I gathered that. What I meant to say was that I don't understand why we need
all this infrastructure just for one check. Meanwhile Christian pointed out that
a simpler solution already exists.

> 
> > or even better, why don't we call dma_fence_put() regardless,
> > as the core code should take care of an uninitialized dma_fence AFAICT.
> 
> When the job is created, we pre-allocate the done_fence, but we leave it
> uninitialized until ::run_job() is called. If we call
> dma_fence_release() (through dma_fence_put()) on a dma_fence that was
> not dma_fence_init()-ialized, we have a NULL deref on the cb_list, and
> probably other issues too.

I don't see the benefit of not initializing the done_fence until we ::run_job()
but I might have missed something obvious. If we want to keep that, maybe we
should not be droping the reference in job_release() but when we
signal the fence. But that would leak the memory of the uninitialized done_fence.

Best regards,
Liviu

> 
> [1]https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/drivers/dma-buf/dma-fence.c?ref_type=heads#L373

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
