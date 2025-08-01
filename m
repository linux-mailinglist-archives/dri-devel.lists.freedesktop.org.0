Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A53B17C3D
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 06:51:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCFE410E3A1;
	Fri,  1 Aug 2025 04:51:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AlpkL48Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7176A10E3A1
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 04:51:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 19E0841693;
 Fri,  1 Aug 2025 04:51:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF5A4C4CEEB;
 Fri,  1 Aug 2025 04:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754023890;
 bh=BRymtlzuxn/nDTRBdiswM96a4s9V1L5n3BdsG8BqbN4=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=AlpkL48Z8Qzfe7AZMrSIMpLYnCMON9pqdu7czC+5LuceV7XO0x1I74tykOmYD2Cow
 55IjyblBhW8PJjEL10IfrkB7kfrfoeJ1+VrSKC7n2+Zz7+0F/j1p2SsUXD8tOHHBn2
 VFflPuBz/lgO40JK+nCtlHOSsvTlcnDAFHxh9sauoOgdInb1enR/JrJLKqIiT32JlA
 FwKu7qCgVTUg5dcsVPEcXlrsaFRtzTR5/BxxUQa6FItxt4kNmlaYdBVdCgBHwlteO9
 G7WQ7yf2vezypIrfkCht2OrfKmW40T0lKhA1LJRVtU+IH4Y5FQZNP2zcjOefSq6Uxr
 SAV8G8+G6XSMw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 A130D383BF52; Fri,  1 Aug 2025 04:51:46 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.17-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twBSSdGXPYQMTz9yWqKg=8RNpAXui4Uf=BvB60mUiZqfw@mail.gmail.com>
References: <CAPM=9twBSSdGXPYQMTz9yWqKg=8RNpAXui4Uf=BvB60mUiZqfw@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9twBSSdGXPYQMTz9yWqKg=8RNpAXui4Uf=BvB60mUiZqfw@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-next-2025-08-01
X-PR-Tracked-Commit-Id: 6531a2cf07ef156956840853692755cc7e1621b7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 89748acdf226fd1a8775ff6fa2703f8412b286c8
Message-Id: <175402390531.3433303.7044614939045683231.pr-tracker-bot@kernel.org>
Date: Fri, 01 Aug 2025 04:51:45 +0000
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

The pull request you sent on Fri, 1 Aug 2025 09:05:07 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2025-08-01

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/89748acdf226fd1a8775ff6fa2703f8412b286c8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
