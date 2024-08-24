Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E07FB95DA3A
	for <lists+dri-devel@lfdr.de>; Sat, 24 Aug 2024 02:19:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C93D10E180;
	Sat, 24 Aug 2024 00:19:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FfO2Xq31";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADAA210E180
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Aug 2024 00:19:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D7A5CA40A71;
 Sat, 24 Aug 2024 00:19:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F548C4AF09;
 Sat, 24 Aug 2024 00:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724458773;
 bh=1f2sfOtBrorhoRoNtbXAAF595fhdwABi8MUaRUUiVcA=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=FfO2Xq314XNSb08nVD9b9hR/Psi70gXVmQUMvgPHHYDNK7zfnLukx58lv9HQj652j
 jprDaieMA6IfSKV/1iQWYsUS8yDBiQlJsTqv30hC/j4pphx9qMyHYDC1cnrYzYENir
 jl584E+ZE18DHE6U66R3bWJILfVflO0kXG13Tgsv4wfrWJtwK4S43e/nmmnkcelgjD
 Otj1BvLaMtm0IyGV3Gvo011vD3r6zMZHngG1fAlak7Ry13W3ik6a/XSI7BCPykDykq
 qjTqMvf7GX2qoxQmM6aKeCS0ZPjYNUTtLsm+dPazXQI2MwUK41ELGJ/dP651EFIb87
 0+FKljHBIqc4g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 711653804C87; Sat, 24 Aug 2024 00:19:34 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.11-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tw7_X_1Bhji+DNJXK+940VH2MwgLPsvjX72doJkKt2SHQ@mail.gmail.com>
References: <CAPM=9tw7_X_1Bhji+DNJXK+940VH2MwgLPsvjX72doJkKt2SHQ@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tw7_X_1Bhji+DNJXK+940VH2MwgLPsvjX72doJkKt2SHQ@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2024-08-24
X-PR-Tracked-Commit-Id: 76f461867800fa9421d26a70a1640eed55dff0cd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 79a899e3d643a256b120d3e9cbf518b55e6f3686
Message-Id: <172445877305.3119442.1587059426359361110.pr-tracker-bot@kernel.org>
Date: Sat, 24 Aug 2024 00:19:33 +0000
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

The pull request you sent on Sat, 24 Aug 2024 04:27:35 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-08-24

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/79a899e3d643a256b120d3e9cbf518b55e6f3686

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
