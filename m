Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 994AEA2D077
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 23:26:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55E4310E2A5;
	Fri,  7 Feb 2025 22:26:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hwhMbOki";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F314B10E2A5
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 22:26:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 527DE5C5684;
 Fri,  7 Feb 2025 22:25:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8FEAC4CED1;
 Fri,  7 Feb 2025 22:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738967180;
 bh=qCEL7vORsi3ZHCZde7hHjmWhRMeVyaauLNReBu6dAQA=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=hwhMbOkijOPbPyjF8JZ58IzHtKTN27w5i4IecKySfzFoXADbCQCZ8QM5LPtcnW5ag
 QGa/+EA0fHlFkfvS6hrXUYaM541CyZfEV1ZcM7s6zOOXi9DBExtp1Gi1lnKJjkHlLA
 P3eKXVucSqzAicUxfXxNO8dOE3gy+h/FGQ/kJ3Ldd/Aegd80zT2J8i+vBiBMLHr2AN
 oFJFrGZM3rk+6TOTOmjtZHHyhJeFnqBTTvSbv9SYRHbOqDyCk64vK4zXj1kY7zgh/B
 QkvLSt5D4Ym9tUTTw/y/HJ8T10jO4E/BGx7PhZl/OsU+HtNZylGsUE4ltSh4UOjt3c
 vuoLvzB+ezpnQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EB543380AAEB; Fri,  7 Feb 2025 22:26:49 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.14-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tw9VgDGf5qioLH+qZWcbm0Vx7UhucXp2y5hTjjQSAUi-A@mail.gmail.com>
References: <CAPM=9tw9VgDGf5qioLH+qZWcbm0Vx7UhucXp2y5hTjjQSAUi-A@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tw9VgDGf5qioLH+qZWcbm0Vx7UhucXp2y5hTjjQSAUi-A@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2025-02-08
X-PR-Tracked-Commit-Id: 4f6993b3feab7bfb1869a8fa12eb8b375964c19f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7ee983c850b40043ac4751836fbd9a2b4d0c5937
Message-Id: <173896720858.2405435.7831952148150567351.pr-tracker-bot@kernel.org>
Date: Fri, 07 Feb 2025 22:26:48 +0000
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

The pull request you sent on Sat, 8 Feb 2025 05:34:09 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-02-08

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7ee983c850b40043ac4751836fbd9a2b4d0c5937

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
