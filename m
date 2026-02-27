Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0O0JBo7poWmSxAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 19:59:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECFC1BC394
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 19:59:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89A8A10EBE6;
	Fri, 27 Feb 2026 18:59:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kBWdY/ux";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46E5010EBE6
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 18:59:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E52F6401F9;
 Fri, 27 Feb 2026 18:59:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C33EFC116C6;
 Fri, 27 Feb 2026 18:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772218761;
 bh=/M4nLhWfyqyQVbgbcN5gmJSfh8u5nBPrgpViG2smdfc=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=kBWdY/uxr/hm7KrNKpt9LPDcRx5rRjP0MEBc/ZuysRo8V8apuvQhniWu4Ej0Lq/RV
 DnCxpSppDXvdL47i+mKDR+LPnPphqD2shWtceatVibPFMdWXMRcIVeZCySbNCGzt3m
 5J8PjDoZefBhKrfF9ZWgp1lWbBsS8mRlXxC1lhPCG+m3Z0meY09QvEYvlcRlWDt0+O
 YPDbT9I3Vq1Q7n0VbaiSsceqIq6KPRwpzszK0UL/L7wasMTzAsMx90wURL2mmXDJgE
 WL+KFcIPgShM5e/p4E5jneg6lpH1L6pJj2jAfe6D3ayaSo7dM5tXCi3/wDQWWuVjDm
 8PDtjSV9ikIwg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 B9F6339E9614; Fri, 27 Feb 2026 18:59:26 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 7.0-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twT7RhgErNvOEjOGY1UUtLY-Z8koZGe6TXLc3gZ_tuePw@mail.gmail.com>
References: <CAPM=9twT7RhgErNvOEjOGY1UUtLY-Z8koZGe6TXLc3gZ_tuePw@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9twT7RhgErNvOEjOGY1UUtLY-Z8koZGe6TXLc3gZ_tuePw@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2026-02-27
X-PR-Tracked-Commit-Id: 103d53eb6fb11cfc3d502eb7b6efa706e139b947
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 466d6175e3451fd7758928a1050bdab44f8ebc48
Message-Id: <177221876535.2713791.14721656710842982867.pr-tracker-bot@kernel.org>
Date: Fri, 27 Feb 2026 18:59:25 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Simona Vetter <simona@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[pr-tracker-bot@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:torvalds@linux-foundation.org,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,dri-devel-bounces@lists.freedesktop.org]
X-Rspamd-Queue-Id: 8ECFC1BC394
X-Rspamd-Action: no action

The pull request you sent on Fri, 27 Feb 2026 16:13:40 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2026-02-27

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/466d6175e3451fd7758928a1050bdab44f8ebc48

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
