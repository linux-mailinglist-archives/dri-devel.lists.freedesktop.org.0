Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA5D8926FD
	for <lists+dri-devel@lfdr.de>; Fri, 29 Mar 2024 23:59:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88B5C10EFF9;
	Fri, 29 Mar 2024 22:58:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NQsKNKrc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B184D10EFF9
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Mar 2024 22:58:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A3A8561953;
 Fri, 29 Mar 2024 22:58:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 529C7C43390;
 Fri, 29 Mar 2024 22:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711753124;
 bh=f0Qpk7qib2AGcBvYzgeXZvstWjnZ8QdP1Of80q5WTvk=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=NQsKNKrcX0PRITxtqhVGUKSyE0i5sGhTfIXjjtXLHNr6Z89wbcDcHso4Hd+OXP5Zr
 hcgs5WKWL3iwp70xTkHbvgH8Z5ZWmxNNC4EjgZ7ZY0uVW0tHzuynxoY0R97PAh79K2
 2D4yDoL+2y0jHozEGUxcnQrhcwAKwTV6+2z91R5ZoV/qBuZsyMvyxzECiVoOrs9mIZ
 LVionvClQ9mgXswgJ+ZeXFodLy6YHo1T7wSuOw9Ehrcqvv5cfUDgpaGMubLkYA/XeU
 sWpCg9PEy+yBTeKDsZBdWTp/g+kasJckueOpy6iooRhpXgU3OMBXzM2yhWOfneV+S2
 aH9IRX4ASnmhw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 48A68D2D0EE; Fri, 29 Mar 2024 22:58:44 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.9-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyTKh_qXRW8MaTrRnjN=Da_hLLm66dj2_WcwFQ3e3O+kg@mail.gmail.com>
References: <CAPM=9tyTKh_qXRW8MaTrRnjN=Da_hLLm66dj2_WcwFQ3e3O+kg@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tyTKh_qXRW8MaTrRnjN=Da_hLLm66dj2_WcwFQ3e3O+kg@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2024-03-30
X-PR-Tracked-Commit-Id: b01f596ab1dd027ce937358007dc1fa3e5a25917
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 486291a0e6246364936df1ecd64c90affef4b9c5
Message-Id: <171175312427.6484.2452378294230925405.pr-tracker-bot@kernel.org>
Date: Fri, 29 Mar 2024 22:58:44 +0000
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

The pull request you sent on Sat, 30 Mar 2024 06:29:04 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-03-30

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/486291a0e6246364936df1ecd64c90affef4b9c5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
