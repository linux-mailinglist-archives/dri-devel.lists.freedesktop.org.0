Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OK0EB3iXrGlarAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 07 Mar 2026 22:24:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 777B722DAEC
	for <lists+dri-devel@lfdr.de>; Sat, 07 Mar 2026 22:24:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6BED10E11B;
	Sat,  7 Mar 2026 21:24:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ovh9Tano";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65DAA10E11B
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Mar 2026 21:24:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B99CB60051;
 Sat,  7 Mar 2026 21:24:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CDC2C19422;
 Sat,  7 Mar 2026 21:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772918643;
 bh=fVWek9dUrL/Ln52UfkGDHG5nVzdDqNEpD8OAzGaTD9o=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=ovh9Tano4PoNs1fZCg7/59OqBdDv98QCQfzo/sZWvK5aEHlQJnGNWwD89KbdSYVVW
 cgi7HxeB9PljR5ilEeawLtFajiRaGxP0Efz6RumEGMq1Y/X24UJbH2t8zZZ160mnLx
 M4cKmWKHbVpu1UiOR17WYxsS9AoVaKgGtd+T6NxrUHLQTSbdDIAwFg2NHNLB2jJpgf
 M2UyJRoHckAeQigB7mDyOZrrzAnqHzpvM+0DR59Y8uGDYV+mlRMyVKQDZOvnDRMf3J
 6BRsPJix8sJUOEIZp6mjcZ3ohv/ZCbYQng51H9aEMvuIdKD4lUIhZ6bJqQg9ZJCHDu
 7p47cLT+BLFyA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 0309F3808200; Sat,  7 Mar 2026 21:24:03 +0000 (UTC)
Subject: Re: [GIT PULL] fbdev fix for v7.0-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <aayOLznDX70UUs6T@carbonx1>
References: <aayOLznDX70UUs6T@carbonx1>
X-PR-Tracked-List-Id: <linux-fbdev.vger.kernel.org>
X-PR-Tracked-Message-Id: <aayOLznDX70UUs6T@carbonx1>
X-PR-Tracked-Remote: http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git
 tags/fbdev-for-7.0-rc3
X-PR-Tracked-Commit-Id: e31a374a99f5026df6ebff2a1c49492276e776fd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fb07430e6f98ccff61f6f1a06d01d7f12e29c6d3
Message-Id: <177291864170.323982.13715608528142906828.pr-tracker-bot@kernel.org>
Date: Sat, 07 Mar 2026 21:24:01 +0000
To: Helge Deller <deller@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Uwe =?iso-8859-15?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
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
X-Rspamd-Queue-Id: 777B722DAEC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:deller@kernel.org,m:torvalds@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:u.kleine-koenig@baylibre.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[pr-tracker-bot@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

The pull request you sent on Sat, 7 Mar 2026 21:44:31 +0100:

> http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-7.0-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fb07430e6f98ccff61f6f1a06d01d7f12e29c6d3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
