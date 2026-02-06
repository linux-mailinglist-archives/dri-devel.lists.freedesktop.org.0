Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCwRMUOAhWlmCgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 06:46:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 498D8FA6E5
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 06:46:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B11710E346;
	Fri,  6 Feb 2026 05:46:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iwcqFtUE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3BBD10E0A5
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 05:46:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4DB6A435FF;
 Fri,  6 Feb 2026 05:46:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30D86C2BC86;
 Fri,  6 Feb 2026 05:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770356799;
 bh=jVtoTK6mBLPaV2rRgNZkYoz7XVmQxsZe7NxFiUGc9Lw=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=iwcqFtUEiReoC5rNN+nE7pWwS3KEfvjjwT4FnUhWhYZxCtkDXTVpH2t+tXqQyX0LU
 qy5Mc3bg5/Kh3I2wyqi/gORQ1sKrfE6gktZmL3SScKQVOE9eEnzmu4Lpy7d3qe+fOD
 XMJYwjNOSSTlJj+T2SLsIv43DbbDMuJIQVMLFhB+Sr5nTLU3ImzUCIkRNPGIlveqqW
 ugh7wsKzII1mhOOJxUXaj03TTSWHAn6UugTEnXkSBzBe/d7qATjA1u2aKSfltNkXM/
 Qokm7ryTAPC85FwHVGgH7bAkiP2mTgvghFlRPGCgogpS4cAILSDCdirMlEkHDOjquB
 O1hErTbgmbyYA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 E35283808200; Fri,  6 Feb 2026 05:46:37 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.19-final
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twrSEbBC1pGvxghuJtYzPtRHxN1OC103HLj3v_d+h_P2g@mail.gmail.com>
References: <CAPM=9twrSEbBC1pGvxghuJtYzPtRHxN1OC103HLj3v_d+h_P2g@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9twrSEbBC1pGvxghuJtYzPtRHxN1OC103HLj3v_d+h_P2g@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2026-02-06
X-PR-Tracked-Commit-Id: 7ef92d2ecef7486d46eda0f911dc53b873fdf567
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8185461e531c39d67aa4705d7f94873feb87adfd
Message-Id: <177035679647.699553.6285712000068265688.pr-tracker-bot@kernel.org>
Date: Fri, 06 Feb 2026 05:46:36 +0000
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: 498D8FA6E5
X-Rspamd-Action: no action

The pull request you sent on Fri, 6 Feb 2026 13:27:42 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2026-02-06

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8185461e531c39d67aa4705d7f94873feb87adfd

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
