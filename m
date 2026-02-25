Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EB9BJgHsnmk/XwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 13:33:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 689B3197678
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 13:33:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43DD110E76C;
	Wed, 25 Feb 2026 12:33:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="F4V3LuGj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6817210E76C;
 Wed, 25 Feb 2026 12:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1772022779;
 bh=JMqJdyv/tZPCdVSQBG9OTpQD8Nys7penXlEHC3gj99E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=F4V3LuGj9CGfwWjhAM/mbQsGlLtMt+t0S4Tk+NuwcKwsheVE8sv05fXOQ0RveS8LE
 oiRaIwgdPjxI/lKK+0Bw03W1Xj/KoI2Ty2ADmkjA95lJLnnAxzhhJfAtDsQtP9y7yW
 geXx+pgB5ZOmaIe2PHgLjRw9mCMsnRXMxppYTBRlRumPSDhuDLslxhOv3iYrJX2SIp
 jXlC9a7la+IEkfH/ZG6WjZ1OysBEXRfwAhzs2J/7immrXb/nCwb4KDncNtuvoV4nlw
 BCikZPMBt6SnayrsrL2TVEbsJ3rbhQEQeI8wcUPzYstcZ1DZaJ9JHfSmkYLk2+9y3f
 c/7yH1fXaHR1g==
Message-ID: <4aac9ace-4529-45b3-9ac6-065d7415699a@lankhorst.se>
Date: Wed, 25 Feb 2026 13:32:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i915-rt v6 24/24] FOR-CI: bump MAX_STACK_TRACE_ENTRIES
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-rt-devel@lists.linux.dev, dri-devel@lists.freedesktop.org
References: <20260220083657.28815-26-dev@lankhorst.se>
 <20260220083657.28815-50-dev@lankhorst.se>
 <20260224141542.cDL_xEWb@linutronix.de>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <20260224141542.cDL_xEWb@linutronix.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lankhorst.se:mid,lankhorst.se:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lankhorst.se:+]
X-Rspamd-Queue-Id: 689B3197678
X-Rspamd-Action: no action

Hey,

Den 2026-02-24 kl. 15:15, skrev Sebastian Andrzej Siewior:
> On 2026-02-20 09:37:22 [+0100], Maarten Lankhorst wrote:
>> We're hitting a bug in CI where MAX_STACK_TRACE_ENTRIES is set too low.
>> My guess is the repeated loading/unloading is creating multiples of the
>> same entries. As a hack just reset lockdep. This might only be necessary
>> for CI + PREEMPT_RT.
> 
> spinlock_t on PREEMPT_RT uses the rtmutex which from lockdep's point of
> view counts twice: The "logical" lock and the inner wait lock. That
> makes twice as many locks. I hope it is this and not some accounting
> error…

Yeah that will probably help explode the amount of entries, thanks for
the explanation.

I'm running out of entries with default PROVE_LOCKING settings on PREEMPT_RT
within a minute of booting.

Kind regards,
~Maarten Lankhorst
