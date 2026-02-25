Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIs4K9Tnnmk/XwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 13:15:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2191971D0
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 13:15:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7554510E753;
	Wed, 25 Feb 2026 12:15:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="m5rL2tlG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25BAD10E753;
 Wed, 25 Feb 2026 12:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1772021710;
 bh=PJiUDFQ1DQQRZwqKOW72XNDSnj66CFtkXC+fGy1J9rU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=m5rL2tlGFQZ+wBp4VoGsrmq6W3b4cvSwTo07KIORZPboWl7VGRWisLl1IaeRI5nPQ
 L9wAc93rlKMr3BnXJ342Cm0fgN6lbPBuj/OAvyV+D0Llvuaoe0V769CXkq9PYRU83Y
 Bqwxk5CVIIh6U03QExSQWVEnkLKoB3HYd1RVbkJeVsme3covhWs61L8GK5ObP3qrZa
 urQHxZbkq/NK5j3qp9/bOHv0ixRQnDyaqq0derSbOWttD+c6z16psNeo76q1Sdw7jZ
 wLTddEat62yFlrN7KW34m4RrL/gy4hc9HRV3op4JKVfovu8gef76d674e5MZNtlBOK
 HzTJKaGOsQkBw==
Message-ID: <d5039bbd-0eee-4057-b643-67633150eb24@lankhorst.se>
Date: Wed, 25 Feb 2026 13:15:09 +0100
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
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <20260225075806.XNtXjZ5E@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[lankhorst.se,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[lankhorst.se:s=default];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[dev@lankhorst.se,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[lankhorst.se:+]
X-Rspamd-Queue-Id: 3F2191971D0
X-Rspamd-Action: no action

Hey,

Den 2026-02-25 kl. 08:58, skrev Sebastian Andrzej Siewior:
> On 2026-02-24 17:59:04 [+0100], To Maarten Lankhorst wrote:
> …
>> This one I can reproduce while opening a browser and surfing a bit. Let
>> me try step by step without lockdep, without RT and maybe just play
>> v7.0-rc1 to figure out where this is from…
> 
> It triggers without lockdep but takes longer. It does not trigger
> without RT so far. I will try to narrow it down later unless it is
> obvious where this is coming from.
>  
> Sebastian
Personally I've been running this entirely on xe, and it in stability
it is comparable to !PREEMPT_RT.

I didn't entirely fix i915 yet. The changes I've made are the changes
from the PREEMPT_RT tree, plus what I found when running the submissions
against CI.

The most likely problem is that the uncore lock needs to be converted to
a raw spinlock. I postponed this, as I have been focused mostly on
display and then especially the vblank bits.

The selftests failing are very likely related, GPU reset is probably
broken on i915 if I look at the CI results.

GPU reset failure:
https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_159035v12/fi-cfl-8700k/igt@i915_selftest@live@reset.html#dmesg-warnings533

I'll check what happens if I convert the spinlock to a raw_spinlock.

Kind regards,
~Maarten Lankhorst
