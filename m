Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A37C83303F
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 22:28:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9407710EA73;
	Fri, 19 Jan 2024 21:28:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA0A10EA73
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 21:28:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EF448614E9;
 Fri, 19 Jan 2024 21:27:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BC90BC43390;
 Fri, 19 Jan 2024 21:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705699646;
 bh=MUPwA4IFefntHztqjaV/D/3z0tkRyR7m6xm0RVOB31k=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=dX8K8w4B1JGo5XA4hN/tMPjzlIKcjOCCNtk674FDneyCglLcvqUqVMN82nGwiNfAs
 DXc2zktKF9bEVGCDSgak/tA9nXqWvFiHnho0nHvFYaAZFydB1aD2Bj5/rDci5bYPW3
 PvB/Edbp9eh/xTSw532OZBYnwOz6lO5iy7YQ1iOcJaKjuhC+t8nFdi5YvbbEyuBvwb
 wK5XKE6xkp9mwsjeOsgemMLkXgEeeVX9cUDM+1pQ+SkIjkQrNn1+G8vA/Q7eMXCZG6
 nj8/OvThvGqVNRfmuyDvwj9vMusR/5MUfpP9aQ3DudE2dJUHERS/xi+mLFzjS5p4NG
 7zJqh0Kr90Dng==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 AD390D8C96C; Fri, 19 Jan 2024 21:27:26 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.8-rc1 (part two)
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txpkzp1nciq+8TrVU1pmsRC9LEVqLaQV9ug=XX0hnmLmw@mail.gmail.com>
References: <CAPM=9txpkzp1nciq+8TrVU1pmsRC9LEVqLaQV9ug=XX0hnmLmw@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9txpkzp1nciq+8TrVU1pmsRC9LEVqLaQV9ug=XX0hnmLmw@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-next-2024-01-19
X-PR-Tracked-Commit-Id: 009f0a64f9ccee9db9d758b883059e5c74bb7330
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e08b5758153981ca812c5991209a6133c732e799
Message-Id: <170569964670.21908.6698361087157315155.pr-tracker-bot@kernel.org>
Date: Fri, 19 Jan 2024 21:27:26 +0000
To: Dave Airlie <airlied@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pull request you sent on Fri, 19 Jan 2024 16:58:59 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-next-2024-01-19

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e08b5758153981ca812c5991209a6133c732e799

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
