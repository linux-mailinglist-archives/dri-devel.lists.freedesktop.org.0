Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B966A935169
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 20:00:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0CC310EA97;
	Thu, 18 Jul 2024 18:00:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nZOvrB+k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5758B10EA97
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 18:00:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8490861A46;
 Thu, 18 Jul 2024 18:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2D281C116B1;
 Thu, 18 Jul 2024 18:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721325621;
 bh=BNxOr+PKf5mfSUnC5XVsqhN7i4Qre/JBnqZaBkvH6ZM=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=nZOvrB+kTmJgF41/lpt3JvwINnD7zBFYCh4igpD4DI8tgIFQ6FFXOsAZfU6cnshhv
 nvxi4DNh/mRhT3tdh5MmJUWKEnXHQ8/M04dn+l3Qv7WPNgCJHS2XexlqTAvuWWazu6
 XC6SuSNUcYMAO8UPSP/PESk65RICP5g51m8ijbrD5WjiJnRqj/wEyNqV2xeahtAiCT
 ON/Td2fBjrJMCq8gAd9K/mxLqY0Xqot23BJpKmDYs53AlJ08VkQb8j3/T5I/0L2jLr
 3bHpbjKZIrbcnzgSJ8pLIIhPNpa9TMftyeJDpQa0UXzENORa3SBqbChN7wb5e/C6sN
 UfSLbVDYD4fPA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 1D1E0C433E9; Thu, 18 Jul 2024 18:00:21 +0000 (UTC)
Subject: Re: [git pull] drm next for 6.11-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzsihck03q+ooJQhTdJsuT3eQ96zF6gd5cjDwLFu_zJhA@mail.gmail.com>
References: <CAPM=9tzsihck03q+ooJQhTdJsuT3eQ96zF6gd5cjDwLFu_zJhA@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tzsihck03q+ooJQhTdJsuT3eQ96zF6gd5cjDwLFu_zJhA@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-next-2024-07-18
X-PR-Tracked-Commit-Id: 478a52707b0abe98aac7f8c53ccddb759be66b06
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b3ce7a30847a54a7f96a35e609303d8afecd460b
Message-Id: <172132562105.11827.13490312017811279767.pr-tracker-bot@kernel.org>
Date: Thu, 18 Jul 2024 18:00:21 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
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

The pull request you sent on Thu, 18 Jul 2024 15:40:08 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2024-07-18

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b3ce7a30847a54a7f96a35e609303d8afecd460b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
