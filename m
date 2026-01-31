Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPSsClNUfWn9RQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 02:01:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A45E4BFCC0
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 02:01:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C615E10E109;
	Sat, 31 Jan 2026 01:01:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IAAYf+QF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E57B010E109
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jan 2026 01:01:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D82316001A;
 Sat, 31 Jan 2026 01:01:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91684C16AAE;
 Sat, 31 Jan 2026 01:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769821262;
 bh=fcWthGC6w+2EoDQ4mv+GOvpIDN8aCQkLQQJIxLHOocg=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=IAAYf+QFd4vmc/KiVLmWkjSRs6uJgGlzWDw5K1uHoCRr4Ty37JsqCVHolQJGzaYSd
 NTQT5wZrndD7B2/lAJK3cC0KQbN5Lo0LDfI9UcxObmEuc1cySe2bcWSD2wsafI/x15
 U6Hj4V/3Sx9FSAeccnL6aElSiJcaXHY2fps0fnl5pEzOQC1kjsHs82WIjCT1WB+3ri
 bIg1ulT74rF0ugHRyIWraxODmGqdLNVs/bv451psZGKpqjX/IVZGo6zA/0W9qnL2qZ
 3rSlGiJXVADgR0mgtxHILOf8UZfTtCjBQs/F4w84aFt6PeJDrChXKstpFkI6/ZA5gP
 qIcr5agZajLFw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 11ADB380CFFB; Sat, 31 Jan 2026 01:00:56 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.19-rc8
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tx0m4T9BQEO6DNVZ44pUcknBmXX+E3S9HSBKpiQDh_G+g@mail.gmail.com>
References: <CAPM=9tx0m4T9BQEO6DNVZ44pUcknBmXX+E3S9HSBKpiQDh_G+g@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tx0m4T9BQEO6DNVZ44pUcknBmXX+E3S9HSBKpiQDh_G+g@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2026-01-30
X-PR-Tracked-Commit-Id: 3a390a21ff0bc53800433441045c00b51de9d439
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4327db89f5e02458001b9c296a961265b8613395
Message-Id: <176982125478.3947395.7351631278024021424.pr-tracker-bot@kernel.org>
Date: Sat, 31 Jan 2026 01:00:54 +0000
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
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:torvalds@linux-foundation.org,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[pr-tracker-bot@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: A45E4BFCC0
X-Rspamd-Action: no action

The pull request you sent on Fri, 30 Jan 2026 16:22:37 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2026-01-30

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4327db89f5e02458001b9c296a961265b8613395

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
