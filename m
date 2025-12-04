Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74728CA4C84
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 18:34:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C67F10E99A;
	Thu,  4 Dec 2025 17:34:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="P5SSG5PY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A97410E99A
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 17:34:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 07A60601FD;
 Thu,  4 Dec 2025 17:34:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE6F9C116C6;
 Thu,  4 Dec 2025 17:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764869655;
 bh=lYYQN6kitAipNg8l/QtQued9OYwAsAj+jwXeeZ73c9I=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=P5SSG5PYqjN6b4jFxY+P51bmIhTx9XZhwwPfZPwO3Hd7ariCtBblTvJi1AZzat4XC
 /wOEMKZwnof6qqkNAgL9D86UIjK+D0PL3kKo8IoDbEygNP8RP6Zdb8AwcJdKdg5npd
 eg/gcqJ+qz8UhgctC6/tb8hnBp/kPmX5fRMhoxIUu4nOkXk11mFoM/BY1EvNzBHehL
 XKpBV4s1DFah7YH5QLh/Z4g6ncwtpBf9FR/xzk5qZLyHcYYcu10H/yCFuVWICkK5+F
 tHqwZ5hELqHl5bmbBWDqQMWaVlbLPsnuImLqQLUsEomzrAMoRBKFe+wZsV4IC6vmUd
 g4/XXTiF8dN+Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 338BD3AA9F40; Thu,  4 Dec 2025 17:31:15 +0000 (UTC)
Subject: Re: [git pull] drm for 6.19-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tySHmq2KLAvW95MeKcb-37gZBhHTY5hf4dCTgUFLd+RKg@mail.gmail.com>
References: <CAPM=9tySHmq2KLAvW95MeKcb-37gZBhHTY5hf4dCTgUFLd+RKg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tySHmq2KLAvW95MeKcb-37gZBhHTY5hf4dCTgUFLd+RKg@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-next-2025-12-03
X-PR-Tracked-Commit-Id: 0692602defb0c273f80dec9c564ca50726404aca
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6dfafbd0299a60bfb5d5e277fdf100037c7ded07
Message-Id: <176486947377.869337.1470204818814632832.pr-tracker-bot@kernel.org>
Date: Thu, 04 Dec 2025 17:31:13 +0000
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

The pull request you sent on Wed, 3 Dec 2025 17:22:42 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2025-12-03

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6dfafbd0299a60bfb5d5e277fdf100037c7ded07

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
