Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A83CEC7B793
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 20:20:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 353FD10E8F6;
	Fri, 21 Nov 2025 19:20:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZSnwJtvA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E65C10E8F4
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 19:20:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BB74140D5E;
 Fri, 21 Nov 2025 19:20:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98A7CC4CEF1;
 Fri, 21 Nov 2025 19:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763752805;
 bh=QH4lIF44ftVoiMahfu3EzkHBsoJILLMAKq133zBhDsc=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=ZSnwJtvAO8OV67umcBuisTryEsUnFplbY/ousPPY8b63fRKs/0OHdy6mzWyEnJM19
 Gqs8j+48d7/75txGS44E9ZpyW4HidGhJiv8JU8JlNkuWxucBQcW65LBM2FyAYJO/jk
 n/9WbX4yyLbBLcuI+KKIoIyE6oTtT0FZ2qTbXf4SWA0tGSP66QfloCD6ut3rL8JH/D
 BzYQxSGbsQ+Cd5UZpqXGx2FnNpORo+DXX/dReVUkg2CdBzNgxLrFrq+zwgVCik9AoT
 24ahjpC4FoawfNTWCX6SHVOocfG5fsvw+p+Remv56cmIeFgTf+XyDEKM9jzMtVE8KS
 0+njUGCEEVb+Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 711613A78A5F; Fri, 21 Nov 2025 19:19:31 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.18-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tz19=6NpVyQ0T4m_V1GGUZ9u7-6AQ7=OxSuZWkX3bU7Dg@mail.gmail.com>
References: <CAPM=9tz19=6NpVyQ0T4m_V1GGUZ9u7-6AQ7=OxSuZWkX3bU7Dg@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tz19=6NpVyQ0T4m_V1GGUZ9u7-6AQ7=OxSuZWkX3bU7Dg@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2025-11-21
X-PR-Tracked-Commit-Id: 40b53db87c998b36649292a3b0daff4fa65cf481
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c6d732c3bd41375d176447b043274396268aa6ab
Message-Id: <176375276994.2554018.5330343734466571550.pr-tracker-bot@kernel.org>
Date: Fri, 21 Nov 2025 19:19:29 +0000
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

The pull request you sent on Fri, 21 Nov 2025 19:07:32 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-11-21

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c6d732c3bd41375d176447b043274396268aa6ab

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
