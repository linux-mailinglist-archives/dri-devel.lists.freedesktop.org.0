Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 845A89DECF8
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 22:33:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0693210E0B5;
	Fri, 29 Nov 2024 21:33:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="olmrFY2o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A05510E0B5
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 21:33:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9FF1CA40F90;
 Fri, 29 Nov 2024 21:31:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDA6EC4CECF;
 Fri, 29 Nov 2024 21:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732916016;
 bh=4LPxw8NLKEvTsTwQkiku9k9b0iolpwIs1mbFwwujtwc=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=olmrFY2oxHsXuGqXxZj8gMCUUnTDxytOjDfWX7IV+9K6CCCmDuZZOY2UD7xfo8tcg
 en5PdbYOXk+8/TyiLdtNhGV/Iwr7DwDN/2qba0gVwDfQ7j7qQAO6Okit5x8v4+XDdu
 1Ai+GhdopMrwCRdigm54tpbVNaJjh3sYevftcRvGEeiR9qcS3WD4GloJvHxdKld6CK
 +usJOeAjnNJC8FtawNvfoI27IYd23525KopLTOGf6mIZ+NaiCLgTbWYcOp2yr/aDS4
 vYKWb/Zi0C+7rROczm7oTIvLySfYl83TjsI2Q1D8aknhPvJSACVIwkhJWF5d+jtCp5
 6hcGn3PMh0GVA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADDB7380A944; Fri, 29 Nov 2024 21:33:50 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.13-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzpFOhQN3yCb4+OpLsfYVrq4mLuUS+SP=H=gq=qSLDz7g@mail.gmail.com>
References: <CAPM=9tzpFOhQN3yCb4+OpLsfYVrq4mLuUS+SP=H=gq=qSLDz7g@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tzpFOhQN3yCb4+OpLsfYVrq4mLuUS+SP=H=gq=qSLDz7g@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-next-2024-11-29
X-PR-Tracked-Commit-Id: 9794b89c50f7fc972c6b4ddc69693c9f9d1ae7d7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2ba9f676d0a2e408aef14d679984c26373bf37b7
Message-Id: <173291602931.2191389.5966734357629265259.pr-tracker-bot@kernel.org>
Date: Fri, 29 Nov 2024 21:33:49 +0000
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

The pull request you sent on Fri, 29 Nov 2024 06:42:18 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2024-11-29

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2ba9f676d0a2e408aef14d679984c26373bf37b7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
