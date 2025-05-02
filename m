Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8945EAA7BDC
	for <lists+dri-devel@lfdr.de>; Sat,  3 May 2025 00:02:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9C3D10E96A;
	Fri,  2 May 2025 22:02:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hghjGKS9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C669C10E96A
 for <dri-devel@lists.freedesktop.org>; Fri,  2 May 2025 22:02:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3D00743A24;
 Fri,  2 May 2025 22:02:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86F16C4CEE4;
 Fri,  2 May 2025 22:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746223363;
 bh=tvSeCPW9J+1MEZEYnoVNTNuF5VlbB3kil8DoNBx1K+U=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=hghjGKS9VVKh5m7PwKtAQz1PXs2Si4Fkc2lKWUSLDiZ8dkOTU5rFZEhLI5NYAR13a
 EZuVv8Phv5yi2XJ0jYQaT1nOipxy1MIVmuff64C5SGUpHeWwkG5CP+rKTrWXYKZGl4
 abE9vzhVx+IqS4jZBrjguiOxZDHz6ROJ3jzgMLuAzFBAbu4Cc8OkGfFo8B9z/aKK1g
 1+fqaOTvfthlGyAYECg8hadkm73F1wzXTkRcQ6q/hgDDZGeQMpUHgnQInZoNk7XRQ7
 TJhD/bV08xVXj2ww/lhZG73jdQ66CZVxgO52d6HMlnvEvAMnm+QeZLNYaJaQYGNEbL
 IOolxR2HTHViw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EAFA4380DBE9; Fri,  2 May 2025 22:03:23 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.15-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txGv4UObO6mWDtU+RLCaswfHPovigKQwuD3XK3BtqF07A@mail.gmail.com>
References: <CAPM=9txGv4UObO6mWDtU+RLCaswfHPovigKQwuD3XK3BtqF07A@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9txGv4UObO6mWDtU+RLCaswfHPovigKQwuD3XK3BtqF07A@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2025-05-03
X-PR-Tracked-Commit-Id: 4e6de6b8f0d5181fcf546ee98b908372fa3cfc0d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6de6674c66bce543c6ae62f49eb35a1ab9bb7425
Message-Id: <174622340263.3739591.10860387119656823373.pr-tracker-bot@kernel.org>
Date: Fri, 02 May 2025 22:03:22 +0000
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

The pull request you sent on Sat, 3 May 2025 06:13:49 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-05-03

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6de6674c66bce543c6ae62f49eb35a1ab9bb7425

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
