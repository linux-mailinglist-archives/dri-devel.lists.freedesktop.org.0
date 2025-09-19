Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AC0B8A494
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 17:29:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B258810EA45;
	Fri, 19 Sep 2025 15:29:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hBMvPajP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C95C910EA45
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 15:29:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CBB8F60140;
 Fri, 19 Sep 2025 15:29:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EC49C4CEF0;
 Fri, 19 Sep 2025 15:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758295760;
 bh=Pq6EHbbwb98eZ9sDtiodWWMphCLSDbXllaF1mBAf+FI=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=hBMvPajPx8+1pCflyg3x19KrHxuzNJLDeGBUo0tUL14X1DaaL/lcGbV/fwp+sTbtY
 pD/4t7ET/y8vFMcDpfvsa1/9s+LANFzoiMcuoxNGP5mFB+DjukIJHE5SQvsdTt/jgc
 JJ9f6YebD2DTgABTGXtnzHzd8Y90peo62dLiFFRhfunwgj0BCbzoORKNQTSkSFRyCK
 tLnFEeDa7ylVEHX76eKpEqoG18d5jkhiRBKqWv7Z+jQy2P57wyiCM0haVdy9DIkzYN
 ylwP/FOklly6J6V64T6TdyDM7ytMc2s3/R8nskphuv+D5jnKkcCLT452Rndgc3XKPF
 aOpxy711HbEKA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33FD339D0C20; Fri, 19 Sep 2025 15:29:21 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.17-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txMJGoLbbEHXCXKzx4=gYSKbKDpar7z5FOHaBgeLagr6Q@mail.gmail.com>
References: <CAPM=9txMJGoLbbEHXCXKzx4=gYSKbKDpar7z5FOHaBgeLagr6Q@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9txMJGoLbbEHXCXKzx4=gYSKbKDpar7z5FOHaBgeLagr6Q@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2025-09-19
X-PR-Tracked-Commit-Id: feb96ccb33189244eaa5a7e8064e623976dbbfe3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f2738f5660f5c48eb9254689b569640091d3674f
Message-Id: <175829575981.3599397.12172364391527265150.pr-tracker-bot@kernel.org>
Date: Fri, 19 Sep 2025 15:29:19 +0000
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

The pull request you sent on Fri, 19 Sep 2025 13:32:16 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-09-19

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f2738f5660f5c48eb9254689b569640091d3674f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
