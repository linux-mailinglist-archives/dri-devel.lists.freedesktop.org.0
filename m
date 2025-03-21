Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B701A6B3C7
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 05:43:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7182210E551;
	Fri, 21 Mar 2025 04:43:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ATCKSwGF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 581 seconds by postgrey-1.36 at gabe;
 Fri, 21 Mar 2025 04:43:54 UTC
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B682610E551
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 04:43:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7EAFC40BF3;
 Fri, 21 Mar 2025 04:33:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C74A4C4CEE8;
 Fri, 21 Mar 2025 04:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742531638;
 bh=KcOx8O1H77hnjxGqdj4bgLJ6OhoSyJWcxsShykGdxUU=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=ATCKSwGFIwTIwgUwQ9BpDyWxy1ilvQYzYB2ztncNodEX2ssTHBIp0rqBxfPRh9JYl
 VQ1pkc6ery4Fa19EO5VPksdfxNtF950OfxyrMXPG0M4FYS3c8+ocfqfk9jFB02yvUx
 mb/yydsLc95A0slw9EdNJ4vVQEgORkl3iFZWDesRyYKnzE6bnWXBdBGXHdPoDYvVwH
 CX8Skwy+l2X+nLwjn2OPtbNqh6aDFIjOu74Qry3pm/71WJRBgZhkbhhtC3fQJd5Ys2
 hwOI5YDw9S46Xmr5k3RZYZ0JXgkKZ6gme0HmtcxJ1vw8QgTsBtu00XAwQNaGt1y4j1
 HPAv4FC5reCtw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EB15B3806654; Fri, 21 Mar 2025 04:34:35 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.14-rc8/final
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txGdh-rbWbxA_nQVV_1AMin8SgJpo1T4HNcCc_4aRtJ0Q@mail.gmail.com>
References: <CAPM=9txGdh-rbWbxA_nQVV_1AMin8SgJpo1T4HNcCc_4aRtJ0Q@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9txGdh-rbWbxA_nQVV_1AMin8SgJpo1T4HNcCc_4aRtJ0Q@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2025-03-21
X-PR-Tracked-Commit-Id: 41e09ef6c26f0bd89f93691ef967fd621a38d759
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b3ee1e4609512dfff642a96b34d7e5dfcdc92d05
Message-Id: <174253167447.2013956.2398442468965880120.pr-tracker-bot@kernel.org>
Date: Fri, 21 Mar 2025 04:34:34 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
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

The pull request you sent on Fri, 21 Mar 2025 14:19:05 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-03-21

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b3ee1e4609512dfff642a96b34d7e5dfcdc92d05

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
