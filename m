Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A509C2620
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 21:05:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E90F10E2A0;
	Fri,  8 Nov 2024 20:05:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LBITd6Wj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6917010E2A0
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 20:05:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B45B4A44DEE;
 Fri,  8 Nov 2024 20:03:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 144F0C4CED0;
 Fri,  8 Nov 2024 20:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731096350;
 bh=RiInFnZtd+yq4KTcsnqpGXeJXhkdBPO/yaqnzdZ/9rE=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=LBITd6Wj5JXYnA5yqyaVCEggcNkE4dHAGZ3bS7v9/TF7Unll93SXYvTiOYv21SmDA
 bA4AVOpW5q+jguw1WKWfIGtzIosLHfkESD80B1kxmRpah05kt/SQ1QB6BvKkEg3C9K
 nbhhjjICnzQAJ5ZlxG3VSURVzCK9/4vTHcwnEJyDuEuWCPpRmIfSfCGPIkXtNe/wBE
 /EXIwe0SnF45K6f1cgvGBlzhoj0DC7PIhF0FViJ/MKPRuaoV8/wyksh/q6w4dOz5X1
 K94BfzReq0SYG2TPfI0Z3lUM+fShlcvxVqLkPqCmCdMuENbq3xduJZOBdxxnmc84KS
 eLewC2Y+yzvwQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 AE6E03809A80; Fri,  8 Nov 2024 20:06:00 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.12-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9typGnBRiPLJwjeYnWSWAXtuvi_4gi55zBXzLGD7+Kus0w@mail.gmail.com>
References: <CAPM=9typGnBRiPLJwjeYnWSWAXtuvi_4gi55zBXzLGD7+Kus0w@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9typGnBRiPLJwjeYnWSWAXtuvi_4gi55zBXzLGD7+Kus0w@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2024-11-09
X-PR-Tracked-Commit-Id: 1a6bbc4d9e55d6c9df2dfe7d4f2705a544d8ca13
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 952a33dc08cefde50540cc82abaa2e09f37ef540
Message-Id: <173109635919.2749259.3637012080355381927.pr-tracker-bot@kernel.org>
Date: Fri, 08 Nov 2024 20:05:59 +0000
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

The pull request you sent on Sat, 9 Nov 2024 05:31:26 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-11-09

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/952a33dc08cefde50540cc82abaa2e09f37ef540

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
