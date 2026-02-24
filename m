Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKTSOZWynWndRAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 15:15:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB7A1883F9
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 15:15:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBDDD10E300;
	Tue, 24 Feb 2026 14:15:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="O+8vHw3G";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="SmxFH0D4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2156410E300;
 Tue, 24 Feb 2026 14:15:46 +0000 (UTC)
Date: Tue, 24 Feb 2026 15:15:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1771942544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dNjYeM6hGv29WKg9kWtLMN+jylLCTcklCbR6s8aADa4=;
 b=O+8vHw3Gs8uRydlSqYfu9x2XLKlANTrfVM1Q/H2ZyTV0vrs2DFan+nNsqofOL/LmqJLXAM
 1yrRFVImChO6kNDkVxwLhXmAusOaNjJk7wFN7OE2S/puHKCYWb+zEK/WbqLbDYBVjPSR7L
 o1J7QLgzh+I5kObHcEtTkbA7+hLxNxLzKzDH9+4HdqUSDFF/n6r/mYgW+2hMKxtmDcPgub
 uSyTiNRkalGS0CzzSY6aKt1m6ziaZi61jFYUEnknUNOga0nPq4NwepUacda4KX+MoJzHQK
 fhjj6XhabvPIWaejFSv/ctdH3rfDO5t4qCdKXX/NPDfaJaXKHUqDwz9hjdV4Xg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1771942544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dNjYeM6hGv29WKg9kWtLMN+jylLCTcklCbR6s8aADa4=;
 b=SmxFH0D4T4i5DkM1Skr6VX9HCGXcn+1/b1CcRsM9dVfwNt/7OU9p0T4SyCv7c7Skdedqcj
 Grq9uKXvgF4VRTBg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-rt-devel@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: Re: [i915-rt v6 24/24] FOR-CI: bump MAX_STACK_TRACE_ENTRIES
Message-ID: <20260224141542.cDL_xEWb@linutronix.de>
References: <20260220083657.28815-26-dev@lankhorst.se>
 <20260220083657.28815-50-dev@lankhorst.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260220083657.28815-50-dev@lankhorst.se>
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
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[bigeasy@linutronix.de,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lankhorst.se:email,linutronix.de:mid,linutronix.de:dkim]
X-Rspamd-Queue-Id: 9CB7A1883F9
X-Rspamd-Action: no action

On 2026-02-20 09:37:22 [+0100], Maarten Lankhorst wrote:
> We're hitting a bug in CI where MAX_STACK_TRACE_ENTRIES is set too low.
> My guess is the repeated loading/unloading is creating multiples of the
> same entries. As a hack just reset lockdep. This might only be necessary
> for CI + PREEMPT_RT.

spinlock_t on PREEMPT_RT uses the rtmutex which from lockdep's point of
view counts twice: The "logical" lock and the inner wait lock. That
makes twice as many locks. I hope it is this and not some accounting
error=E2=80=A6

> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>

Sebastian
