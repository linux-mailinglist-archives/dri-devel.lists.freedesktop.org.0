Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNRdDTRWn2mIaQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 21:06:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA6519D082
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 21:06:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1714310E827;
	Wed, 25 Feb 2026 20:06:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="KLcHkTGB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E9DB10E827;
 Wed, 25 Feb 2026 20:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1772049966;
 bh=m0jI+91ZfLMP+Bf2OhJVOZYQ73gUlZTgUnjRJsTmi04=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KLcHkTGBMUGND86ai4aFWFeAjsLPti++nW7JDWlKH+BQNsiodRppa8+u0WdJZ0+l8
 bGko4om0ckOPqghTw7mAYTihVNP4aNHyfdLD5nEPI5+F3cqVZfSvTkAs8xcGlw5J7a
 plExoI4dFGc1uKlUL1d8r3LcXGPoNydB06w+QV9vMp/R+ui/tLvVvWrh8x4m4ksfYO
 de9JHs66rjkPRcFygnfusWlMwpkBQx1Xx9uRcF5/xS8BkcjVl0yhwEHfNXvEiR2VkL
 moKlYzmi4WY2zDPO3z0yRKaFtCcw3JgAnylFUERYYh8y9VGjPWbx5zMAADJ1wAELpI
 HW5uMgTVwflfg==
Message-ID: <7ee8b784-a714-4329-aab2-a571f25c3baa@lankhorst.se>
Date: Wed, 25 Feb 2026 21:06:05 +0100
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,patchwork.freedesktop.org:url,01.org:url,lankhorst.se:mid,lankhorst.se:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lankhorst.se:+]
X-Rspamd-Queue-Id: AAA6519D082
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

After realizing the uncore lock only needed to be converted to a raw spinlock
because the testcase was broken, I tested the alternative fix of using
sleeping context only in the selftests:
https://patchwork.freedesktop.org/patch/707063/?series=162145&rev=1

With that the reset selftest works as expected.

But I do see some weird lockdep splats and aborts after that fixed the uncore lock testcases:
https://patchwork.freedesktop.org/series/162145/

I believe it could be a different instance of:
https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_162145v1/bat-dg2-9/igt@gem_lmem_swapping@parallel-random-engines.html#dmesg-warnings904

Which is tracked under:

https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15759

Perhaps those are related to what you are seeing?

Also don't use that series for anything but CI results, I rather want to submit
a new version of this series.

Kind regards,
~Maarten Lankhorst
