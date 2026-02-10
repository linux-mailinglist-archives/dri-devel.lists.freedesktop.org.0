Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAtdBh4pi2n1QQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 13:48:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9595511AFD1
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 13:48:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADBD710E082;
	Tue, 10 Feb 2026 12:48:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Omxd9ntP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF8A10E082
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 12:48:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 47D8A6013E;
 Tue, 10 Feb 2026 12:48:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AAD6C116C6;
 Tue, 10 Feb 2026 12:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770727704;
 bh=f9Hioy1nBNAN6Nj6FmxHzvPM8qjWxbtxXn6ma/BOEN4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Omxd9ntPib7buprI2avF9vcC5Snk52LrNPhoNyFSO+Pp/RnFY9OpJi8PDjJVaxHmb
 JXUYYvf8mDOqJL00C/SA5U6DUzy7M/eEd+7C4i1SVv3A4qZh92mM5Rm14mro68cR2t
 6h0t8AeSTNBPNmliXeDF6glQjfeed1kx5MhPTPGFC1WpXrv0JLEgHiJbUaah2n5b5Z
 gAdRG3klf2YYAP5MWPc6bLxDm6TKYyUEZQvEGN2z5fMUW9rlSD2hezSOCJvY1XcU/+
 BRxCvbm1bcNecNnEBO0TGKpRpqR28vrU2kjBTA1jfqTtyRVkkCx0KnIFJBp3Nan0jG
 VoQHRcdYSklIg==
Date: Tue, 10 Feb 2026 14:48:19 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Jiri Pirko <jiri@resnulli.us>
Cc: John Stultz <jstultz@google.com>, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev,
 linux-media@vger.kernel.org, sumit.semwal@linaro.org,
 benjamin.gaignard@collabora.com, Brian.Starkey@arm.com,
 tjmercier@google.com, christian.koenig@amd.com,
 m.szyprowski@samsung.com, robin.murphy@arm.com, jgg@ziepe.ca,
 sean.anderson@linux.dev, ptesarik@suse.com, catalin.marinas@arm.com,
 aneesh.kumar@kernel.org, suzuki.poulose@arm.com,
 steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com,
 ashish.kalra@amd.com, suravee.suthikulpanit@amd.com,
 linux-coco@lists.linux.dev
Subject: Re: [PATCH 4/5] dma-buf: heaps: allow heap to specify valid heap flags
Message-ID: <20260210124819.GC12887@unreal>
References: <20260209153809.250835-1-jiri@resnulli.us>
 <20260209153809.250835-5-jiri@resnulli.us>
 <CANDhNCoHEZsNRmU+3z5AbeAy05H7PTtUdTq1apNd5k0f9hWW8A@mail.gmail.com>
 <hwdezwktndbm6hoko3rz5lffgfljodegcygzf6rbdf2ferokj6@ftk2uk3rqfdq>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <hwdezwktndbm6hoko3rz5lffgfljodegcygzf6rbdf2ferokj6@ftk2uk3rqfdq>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:jiri@resnulli.us,m:jstultz@google.com,m:linaro-mm-sig@lists.linaro.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:jgg@ziepe.ca,m:sean.anderson@linux.dev,m:ptesarik@suse.com,m:catalin.marinas@arm.com,m:aneesh.kumar@kernel.org,m:suzuki.poulose@arm.com,m:steven.price@arm.com,m:thomas.lendacky@amd.com,m:john.allen@amd.com,m:ashish.kalra@amd.com,m:suravee.suthikulpanit@amd.com,m:linux-coco@lists.linux.dev,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[leon@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[leon@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 9595511AFD1
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 10:05:14AM +0100, Jiri Pirko wrote:
> Mon, Feb 09, 2026 at 09:08:03PM +0100, jstultz@google.com wrote:
> >On Mon, Feb 9, 2026 at 7:38 AM Jiri Pirko <jiri@resnulli.us> wrote:
> >>
> >> From: Jiri Pirko <jiri@nvidia.com>
> >>
> >> Currently the flags, which are unused, are validated for all heaps.
> >> Since the follow-up patch introduces a flag valid for only one of the
> >> heaps, allow to specify the valid flags per-heap.
> >
> >I'm not really in this space anymore, so take my feedback with a grain of salt.
> >
> >While the heap allocate flags argument is unused, it was intended to
> >be used for generic allocation flags that would apply to all or at
> >least a wide majority of heaps.
> >
> >It was definitely not added to allow for per-heap or heap specific
> >flags (as this patch tries to utilize it). That was the mess we had
> >with ION driver that we were trying to avoid.
> >
> >The intent of dma-buf heaps is to try to abstract all the different
> >device memory constraints so there only needs to be a [usage] ->
> >[heap] mapping, and otherwise userland can be generalized so that it
> >doesn't need to be re-written to work with different devices/memory
> >types.  Adding heap-specific allocation flags prevents that
> >generalization.
> >
> >So instead of adding heap specific flags, the general advice has been
> >to add a separate heap name for the flag property.
> 
> Right, my original idea was to add a separate heap. Then I spotted the
> flags and seemed like a great fit. Was not aware or the history or
> original intention. Would be probably good to document it for
> future generations.
> 
> So instead of flag, I will add heap named something
> like "system_cc_decrypted" to implement this.

It is problematic to expose a user‑visible API that depends on a name.
Such a design limits our ability to extend the functionality in the
future, should new use cases arise.

Thanks

> 
> Thanks!
