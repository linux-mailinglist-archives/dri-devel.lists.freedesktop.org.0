Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E0396555E
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 04:44:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1C0010E7C1;
	Fri, 30 Aug 2024 02:44:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jgoYIFM5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF80E10E7C1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 02:44:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B6C96A43E72;
 Fri, 30 Aug 2024 02:44:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20BBAC4CEC1;
 Fri, 30 Aug 2024 02:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724985871;
 bh=YwtLZX5pURwfENoqmHQ8x9epk3jKD/jNs/+Im2Zpaoc=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=jgoYIFM5M3OO9DXoZr2doObHCrVSZ8KoI0xiSv9VBlSyUjH64PuSBNbw+8lFkaVyM
 1h9zmJYgc6IL4w3bgy78Rlkg2LazOlLhZ0SghltpHLnZCx9LFe65VdFR04gyKXQHMM
 bQSwL5Y3DZmbhiOocGbYIYDiBtThnwzlTcaM8D51c0w7T1ADSN0jCkfY+l665OdmlG
 VOIr3HOdKoaB9ezLDcP8QfsHI1MB2Q9N7BvM6knlRqh5sEYqb/vj2N20wX1VV5LfN9
 qKff4RFJGZ313vmMg43NYLeFSoV6rRExtflDJuP6w8AywM4lzFMIrg4uapw5zwP+eI
 UXsm0Wp9FSJVg==
Received: from ip-10-30-226-235.us-west-2.compute.internal (localhost
 [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 BD0DA3805D82; Fri, 30 Aug 2024 02:44:32 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.11-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzX71UKndfu8JECMOzc9kf4s4pp9cWTMWwE476cQXt_Yw@mail.gmail.com>
References: <CAPM=9tzX71UKndfu8JECMOzc9kf4s4pp9cWTMWwE476cQXt_Yw@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tzX71UKndfu8JECMOzc9kf4s4pp9cWTMWwE476cQXt_Yw@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2024-08-30
X-PR-Tracked-Commit-Id: 27f5b729cb56e46d8beca47c227c0edf1e958fbb
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 20371ba120635d9ab7fc7670497105af8f33eb08
Message-Id: <172498587276.2149268.13806942469470410020.pr-tracker-bot@kernel.org>
Date: Fri, 30 Aug 2024 02:44:32 +0000
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

The pull request you sent on Fri, 30 Aug 2024 12:08:41 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-08-30

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/20371ba120635d9ab7fc7670497105af8f33eb08

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
