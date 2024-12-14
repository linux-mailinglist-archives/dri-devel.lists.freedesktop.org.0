Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE359F1BE8
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2024 02:35:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C70E310E0B9;
	Sat, 14 Dec 2024 01:35:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="X5p7UXwT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A943A10E0B9
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Dec 2024 01:35:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C47575C5AEC;
 Sat, 14 Dec 2024 01:34:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACEF4C4CED0;
 Sat, 14 Dec 2024 01:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734140118;
 bh=FWO3E/XoZLlJuIEe8a6qtXunEBSJTNsRV4xPaCmttuc=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=X5p7UXwTVB0d3xqZ7MMdDgZio46PijTq0/y46LUSJ4yyT8QDzK8u69pREBgk0lwZc
 n7ESAmtcyM7rYiPDhbbdfxH4BRq2KZ8jnuUSwvaZ/n3sDrWEFtRoAnZdJQCji8NwlC
 tuePmWSeF33X3NNf2TPhtHUJshMy2bqrYpMt2CCymnAS/huWXh1QtW4SxlOwJnZYft
 JY5ZFA1W6vC5TuXiJrvHdZLqgQ1/6kQ/Hjl7rfVanybdvw7Ydnb4fBw+yO9l1+aJSn
 OVTsdaE9Omdh218r/P0aOSRxKliXheM4kkGRvIpmB6U5OK4eKAAt2sk92XUK6RiCmg
 dkTuyhyh3mI+A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 715E2380A959; Sat, 14 Dec 2024 01:35:36 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.13-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyHzxubr_sRuNSoPdJB4uL=E1cFzUzNxY1dPrOW=y-NdQ@mail.gmail.com>
References: <CAPM=9tyHzxubr_sRuNSoPdJB4uL=E1cFzUzNxY1dPrOW=y-NdQ@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tyHzxubr_sRuNSoPdJB4uL=E1cFzUzNxY1dPrOW=y-NdQ@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2024-12-14
X-PR-Tracked-Commit-Id: d172ea67dbeec5c90f72752c91d202d5718e3754
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e72da82d5a6deec67a680434e1f19ba3996fbb11
Message-Id: <173414013500.3218065.12670757919328687969.pr-tracker-bot@kernel.org>
Date: Sat, 14 Dec 2024 01:35:35 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
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

The pull request you sent on Sat, 14 Dec 2024 07:23:44 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-12-14

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e72da82d5a6deec67a680434e1f19ba3996fbb11

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
