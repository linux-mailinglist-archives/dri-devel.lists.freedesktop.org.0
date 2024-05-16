Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4FA8C79D2
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 17:53:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51FC710E157;
	Thu, 16 May 2024 15:53:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VkYGEUO1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A140F10E157
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 15:53:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0E019CE1758;
 Thu, 16 May 2024 15:53:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 816E9C113CC;
 Thu, 16 May 2024 15:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715874798;
 bh=vJXNK/Tqo8zBAUsSHhEd6zAfV9a1tg/5MoYyOWTdTs0=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=VkYGEUO1BBeAKvdwFP0HGPkPnL7zHKxaGWxMoQkK92nbXG3j7yLrzn/wTu3IfokU9
 9lNsKXyTV/t2Ze8nRekL6yE1gqsmv4EOg9aDqT73auZR4GFuT2SjiABKsO8dAWkph/
 JeOogGCYFH7IsH2jYRN/wluMc8lxPhHRBMyD072QMv3Etx/5NI7RTDkVMXx14uxqZJ
 M1mynW+M4C4a224YNYJ0YL3dCPtx2PtFgdj4KXtKL6DtcAMXHnxy9N66FP7tjGmi5J
 CbvTmDTgESagRKyh9wGoluAoLxNAkTCBWfrRafy+A+ycUT9iGPzmaYz1vcixdPCcBB
 XAhdWQdJTBhhQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 79488C41620; Thu, 16 May 2024 15:53:18 +0000 (UTC)
Subject: Re: [git pull] drm urgent for 6.10-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tx_KS1qc8E1kUB5PPBvO9EKHNkk7hYWu-WwWJ6os=otJA@mail.gmail.com>
References: <CAPM=9tx_KS1qc8E1kUB5PPBvO9EKHNkk7hYWu-WwWJ6os=otJA@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tx_KS1qc8E1kUB5PPBvO9EKHNkk7hYWu-WwWJ6os=otJA@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-next-2024-05-16
X-PR-Tracked-Commit-Id: 431c590c3ab0469dfedad3a832fe73556396ee52
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 972a2543e3dd87f7310d65944b857631b4290e12
Message-Id: <171587479849.7101.896680176648713686.pr-tracker-bot@kernel.org>
Date: Thu, 16 May 2024 15:53:18 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
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

The pull request you sent on Thu, 16 May 2024 12:53:52 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2024-05-16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/972a2543e3dd87f7310d65944b857631b4290e12

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
