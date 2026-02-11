Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wH+ZK1RjjGkFmgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 12:09:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DF4123C0B
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 12:09:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D20510E3A1;
	Wed, 11 Feb 2026 11:09:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="nZ+rXX/b";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Y6Wymdv1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87C9810E3A1;
 Wed, 11 Feb 2026 11:09:04 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4f9wfk6ZtHz9sWs;
 Wed, 11 Feb 2026 12:09:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1770808142; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aAt5kr3OeUX5sX1ZVdpkNhANBexAhw4hyuYtW1lDL1E=;
 b=nZ+rXX/bFicHn7CaY6kJtqY30EAKXHP7SRUciP6IlcBuGg4ub+WPwdWkxF/06oByFhfSp6
 zlnWLHjPp+9jhp8dqJPR1eXTdXZ2c8713vj+7/Bm3LckoE/gqZfpL7CEyzdDfdy0ZBsZRW
 vFo9ivwsZtaww7zrtqyFS/V3LkLqttjLL++RuOhZDeg8me0GOPB7I1gN6ZtWGm7BrnfBYl
 41bAgHqNUtiBSg+8IrPPjRzGPwLhDNduxG9uX4BdKtnJqwJxar7lC6kdwN9aHMMh/4mU9G
 E21skq8VrKhUF+iX7uI2T+97HEtHqVZpb9URDsJ2zixXZSAVS6fTnBrigoPLmg==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=Y6Wymdv1;
 spf=pass (outgoing_mbo_mout: domain of phasta@mailbox.org designates
 2001:67c:2050:b231:465::102 as permitted sender)
 smtp.mailfrom=phasta@mailbox.org
Message-ID: <7fcca1f49427e0279a740b6c1b9bb072eabc2c35.camel@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1770808141; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aAt5kr3OeUX5sX1ZVdpkNhANBexAhw4hyuYtW1lDL1E=;
 b=Y6Wymdv1Zw15ufaZZNWAaKq9uCV9qW/Kkk86hpkFgqxZ83aDE70ukRKMLBglhsQYvYYgMB
 TIZJbm11mVKLaWxUu43acHS5jf2ureRL39xMVAm24PAl6Ba/SNtk7qgm6XxPytjfcQI1Zc
 r3/qqgtARC3K+4Ad55xWDnj6+PgekMjWLhH0xTxl5nqG55SSZYE+npMMueIs5VsEMYVRsc
 gMCJjtBF+dLNgUuQI1vj6lbu6N7e/5mK1PxcVt/vsbW3NUCoaKwOK+PBjMgm6mH6ecKxIl
 bwM1ehk63Qir8fT/uyXAQIpexpX0f3uvTN9/BAnEv3HlklcgGCzUg4iiV1AbAg==
Subject: Re: [PATCH v6 00/31] Fair(er) DRM scheduler
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 amd-gfx@lists.freedesktop.org,  dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Leo Liu
 <Leo.Liu@amd.com>, Lucas Stach <l.stach@pengutronix.de>, Matthew Brost
 <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>, Pierre-Eric
 Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, Michel
 =?ISO-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>
Date: Wed, 11 Feb 2026 12:08:53 +0100
In-Reply-To: <20260128110806.38350-1-tvrtko.ursulin@igalia.com>
References: <20260128110806.38350-1-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: d2a89d284befc9df5e4
X-MBO-RS-META: 3erjtmnqfahqyfy35u51eqq3qng61s43
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	HAS_REPLYTO(0.00)[phasta@kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:mid,mailbox.org:dkim]
X-Rspamd-Queue-Id: 36DF4123C0B
X-Rspamd-Action: no action

On Wed, 2026-01-28 at 11:07 +0000, Tvrtko Ursulin wrote:
> ** NOTE:
> =C2=A0=C2=A0 First three patches have been already reviewed and are conce=
ptualy
> =C2=A0=C2=A0 independent. But as the code conflicts, I am including them =
while waiting for
> =C2=A0=C2=A0 them to be merged via amd-next, and until they percolate bac=
k to drm-tip, in
> =C2=A0=C2=A0 order to avoid having to maintain two separate patch series.


So your intention with this v6 is just to get more reviews? What is the
purpose?

And since the plan is supposedly that the drm_sched maintainers take
it, when will they know that it's ready now?

Can we agree on delaying a v7 until all lights are green?


For the future, I think the more canonical (and less confusing) way to
handle situations like this is not to include foreign patches into a
single-topic patch series, but to hint in the cover letter at the
situation and provide links: "Series is blocked by [1], [2]".


P.
