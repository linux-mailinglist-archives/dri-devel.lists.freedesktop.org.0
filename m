Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6E48B3EEA
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 20:10:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28DC511A48C;
	Fri, 26 Apr 2024 18:10:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HA4ONEoe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5150011A393
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 18:10:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 85ACBCE1CFC;
 Fri, 26 Apr 2024 18:10:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AB324C113CD;
 Fri, 26 Apr 2024 18:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714154999;
 bh=JYRmKjYeeyfSPfIhg2ddbubocr3HKtws+FI4Stbneg4=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=HA4ONEoe9BtUco2mpWEli0LCEOiRGCJSpgamcvzt+5wu+3T0yF2RLfJog7p8MOlIC
 5DBuCVyVkBdbPBD1QwP2PQ5dQ2IzXcwn76QwWEc5qGBsVizSWekEPDZsuPneZG26sS
 9tJhUjGxlCg+GbbKkQNm4qN4Fj65IcAvvQOyVjWM8IxyOJ2iPRSGKibEJPiPincssh
 1LtmJZHC1DumnHsYMjRg58LzbILjwbIYaXopSZ6TEca++8ZwEJQlgPEbcznvbTr16D
 au60Ps37CPlqVwDV+laAHNpSPeWs4i7vSFL/AL9d4xYDHG/5GZl3stsdwNjd3jm1qz
 zYqRzvTLz2hqw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 A0199C433F2; Fri, 26 Apr 2024 18:09:59 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.8-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzOc8ybNWouvj+Zz2kZy1iXVDgJ9v3yi_Owfz+jp2tqkw@mail.gmail.com>
References: <CAPM=9tzOc8ybNWouvj+Zz2kZy1iXVDgJ9v3yi_Owfz+jp2tqkw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tzOc8ybNWouvj+Zz2kZy1iXVDgJ9v3yi_Owfz+jp2tqkw@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2024-04-26
X-PR-Tracked-Commit-Id: 3a8534035c0747610312f9552898a0ece10ef8a7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 61ef6208e0df073072a764eb5c5f5a6db3ffadb6
Message-Id: <171415499964.9216.14679560198090633431.pr-tracker-bot@kernel.org>
Date: Fri, 26 Apr 2024 18:09:59 +0000
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

The pull request you sent on Fri, 26 Apr 2024 13:12:03 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-04-26

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/61ef6208e0df073072a764eb5c5f5a6db3ffadb6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
