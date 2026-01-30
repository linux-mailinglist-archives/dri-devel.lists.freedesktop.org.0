Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELpVDcWFfGmINgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 11:19:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E01B948C
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 11:19:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C6D410E2C4;
	Fri, 30 Jan 2026 10:19:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="MXUAQv1t";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="btQnOSj6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D6EA10E2C4;
 Fri, 30 Jan 2026 10:19:44 +0000 (UTC)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1769768382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MDQReRTTA6Sdb+48RVvFkziz88dbrVuuDKUTtXCwsok=;
 b=MXUAQv1toSe/JyZj7c3+FzrvL3i2P8hM2QF/zHvlaVYHdcCEYALa1cGcXBp9agBf/JtT4E
 +uEAPz7tI5f7jNysKtKFmOiBNCdGIV3XYLn88GkD2jMrN8gxVZAq7c1kKrq4/2cJzrZ5Ds
 2uKv/gkHVliNcSTyp44qvmO6eh4cIH6y0uaNzF+8XKFppxYJ1rhObCDgN9go2LlQelba58
 fSfMsaXLKcR3JyYOG4PyCX5wFwHCWpmOFrTtawfhAVl6mtjfwaCONfDDEecqKQb28kQezL
 bCYllcNDZKLiZq594ssQCk22EczJo7Ps6lxEzyYP/k/K9vpRofxHNhgcH73ZHA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1769768382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MDQReRTTA6Sdb+48RVvFkziz88dbrVuuDKUTtXCwsok=;
 b=btQnOSj6arJLWadMl0nAZ5T05xVOfLwEBi5bY1EaWNzjhpITVrtgZQCuplNG8tUpVkMFe+
 LQkgX2vFmH5OWQAg==
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Sean Paul <seanpaul@chromium.org>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: nouveau regression with 6.19.0-rc7
In-Reply-To: <87ldhf1prw.fsf@jogness.linutronix.de>
References: <87ldhf1prw.fsf@jogness.linutronix.de>
Date: Fri, 30 Jan 2026 11:25:41 +0106
Message-ID: <87h5s34d36.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,chromium.org,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[john.ogness@linutronix.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linutronix.de:email,linutronix.de:dkim,jogness.linutronix.de:mid]
X-Rspamd-Queue-Id: B7E01B948C
X-Rspamd-Action: no action

On 2026-01-30, John Ogness <john.ogness@linutronix.de> wrote:
> On my workstation I have been using 6.19.0-rc4 with no problems. This
> morning I switched to 6.19.0-rc7 and now my graphics explodes when the
> nouveau module is loaded.

Reverting commit 604826acb3f5 ("drm/nouveau/disp: Set
drm_mode_config_funcs.atomic_(check|commit)") allows the nouveau driver
to load and work again.

Even though nouveau "technically supports atomic modesetting", it seems
more callbacks need to be implemented than just atomic_(check|commit).

Should I submit a patch with the revert? Or is there a quick fix to
allow drm_drv_uses_atomic_modeset() to return true and properly support
atomic modesetting?

John Ogness
