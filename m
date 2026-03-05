Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHqlK7NmqWlN6wAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 12:19:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F7B21080E
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 12:19:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99BDA10E27D;
	Thu,  5 Mar 2026 11:19:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="T8jnhV/g";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="s2wGBiOL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C79F710E268;
 Thu,  5 Mar 2026 11:19:11 +0000 (UTC)
Date: Thu, 5 Mar 2026 12:19:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1772709550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OLOVNLzkgKZr6pl7bNGGllfA0IdilTf9V2IBstJHMXA=;
 b=T8jnhV/g40XG8LivknAXA2L9jKfffKrA4x+FA/twWq3hm9NOP2mPYZNCKwe+76ZnRjWQDs
 2JJWvHfur49km2Zsq4DM7hYMwN0E9oec1e4VQqeS6qV42jcASvV/7B3uOCQ43F8INn48nT
 E968kk7X6w1kXwwjDQSx4d914ekRCtJfRbiXb2bfXC66EKGeQPXCZA5i5ZvHu7An9vkaco
 etYZLqjjw5I3jH183WPA9g6BCOpPA2zhW457pwvkAWjIC3SX/xUidibrO7WYty9aOrLaNp
 8SI9QTw3vdRIF+nYPEWjUQZ77LqH/bGjWgXcAy/C/AdAJPxzHtn3lpOtV47GEA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1772709550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OLOVNLzkgKZr6pl7bNGGllfA0IdilTf9V2IBstJHMXA=;
 b=s2wGBiOLk/C92P1XkAEBUXaztaon2ye+0MCGwIgr+AsIN1xYpdp/iRrjw5MeFCMlrDIO4z
 jhesiWiOHTia9wDw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-rt-devel@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: Re: [i915-rt v6 00/24] drm/i915/display: All patches to make
 PREEMPT_RT work on i915 + xe.
Message-ID: <20260305111908.eiL2_aF1@linutronix.de>
References: <20260224162703.Q_taYjEC@linutronix.de>
 <20260224165903.2mn24oQy@linutronix.de>
 <20260225075806.XNtXjZ5E@linutronix.de>
 <7ee8b784-a714-4329-aab2-a571f25c3baa@lankhorst.se>
 <20260226120715.6Ug1Qkse@linutronix.de>
 <20260226141942.Z6vUrEQ3@linutronix.de>
 <20260226143857.4ZJAFzf6@linutronix.de>
 <98af7aba-f86f-4ff0-a53b-60e0e9784e37@lankhorst.se>
 <20260305105022.cc1qAMoO@linutronix.de>
 <08ff34aa-acb2-4110-9dec-db6dde6edd5c@lankhorst.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <08ff34aa-acb2-4110-9dec-db6dde6edd5c@lankhorst.se>
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
X-Rspamd-Queue-Id: 87F7B21080E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[bigeasy@linutronix.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linutronix.de:+]
X-Rspamd-Action: no action

On 2026-03-05 12:11:50 [+0100], Maarten Lankhorst wrote:
> Hey,
Hi,

> I think it should be possible then to remove signaler_active, and change
> the reader side to if (spin_is_locked()) { spin_lock(); spin_unlock(); } ?

If signaler_active is only going 0 <-> 1 then it should be doable. Let
me get to this then.

Sebastian
