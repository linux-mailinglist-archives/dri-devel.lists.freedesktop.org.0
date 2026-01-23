Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FafB0Hec2nMzAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 21:46:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDEE7AB89
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 21:46:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62ED210EBD6;
	Fri, 23 Jan 2026 20:46:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TtDCYpKF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF1D010EBD6
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 20:46:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C196C600C4;
 Fri, 23 Jan 2026 20:46:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7885BC4CEF1;
 Fri, 23 Jan 2026 20:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769201210;
 bh=Mw95Xlar80JnQfwA7bDeE7TKJk1eXQeXer12R2i5agk=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=TtDCYpKFJV8GKq0c8/xcwtD0FyKjh10N62IzzpvFFMQSBLJ/3ppsB5teoo0jRy1cZ
 /Ct9q0+Hk6Zrs4TfNyDjCP3oYkUDVsUV3cFZosgALMQP4BVOuFmfOWCTM97nFhr02h
 nLBvwqxIDsHm5JuLs0j1DqA/qiiRGsGlNlqTzau6t4mbtSJmudAuUq+ppp83JCkxp9
 n1FQyJPL1Y+sZhcpissVU9HJFMPPQAK6qmyP/g1wxvQD0BubnOGBgpM2lsg1iY8+Or
 UM3SoZENgjO3LWX1+g0jYYCaeu3QZexOE2D5/ZjHyIU4UoqzQ2W0M8hqwokVpl5MtM
 KLASS9YcDcp6Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 8BCA93808200; Fri, 23 Jan 2026 20:46:47 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.19-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tznJ3wXkXceM6poZ3Y2nWbFaWdyXyusAMyXZjhUTt50ew@mail.gmail.com>
References: <CAPM=9tznJ3wXkXceM6poZ3Y2nWbFaWdyXyusAMyXZjhUTt50ew@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tznJ3wXkXceM6poZ3Y2nWbFaWdyXyusAMyXZjhUTt50ew@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2026-01-23
X-PR-Tracked-Commit-Id: b91adbe83093629a675c77d39ac638610630b1e8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d6112dddbf354d21ff2fcd49338df68782492c73
Message-Id: <176920120617.2710575.16224122053699418639.pr-tracker-bot@kernel.org>
Date: Fri, 23 Jan 2026 20:46:46 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
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
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:torvalds@linux-foundation.org,m:sima@ffwll.ch,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.286];
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
X-Rspamd-Queue-Id: 9FDEE7AB89
X-Rspamd-Action: no action

The pull request you sent on Fri, 23 Jan 2026 15:28:55 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2026-01-23

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d6112dddbf354d21ff2fcd49338df68782492c73

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
