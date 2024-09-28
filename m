Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0B0989087
	for <lists+dri-devel@lfdr.de>; Sat, 28 Sep 2024 18:45:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3422E10E219;
	Sat, 28 Sep 2024 16:45:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FGTqli07";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 733FB10E219
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Sep 2024 16:45:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 27399A4083A;
 Sat, 28 Sep 2024 16:45:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33AE4C4CEC7;
 Sat, 28 Sep 2024 16:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727541909;
 bh=x3/7eRtcjfaX1v6knyhjD77xA6AShBFl/LoZXlJgSmI=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=FGTqli07lZ7bLOq4T2AUQnwWi813nEtvpSSvCnkfK4wP8Hx7Wyl1jJkcKNJyyYIwA
 nIEGSsVKFkVvoZAyQLPouQEbVRufAArNkvs46058v6oi6lfy8IqEOZIciY6chAUPNn
 KuvH8xshUZyPJQ0D+Q3jTVR7fOHo4dFgzC5CQ0M27c5W923aZYcV2I2+B/dnqfiYZV
 noJrjaEtrmyRFUlo1/SydUW1sNkUIzWqa+/O8IdbGvRIwCCA1G4EHrrjRKytkljxXi
 EIdz5Tc7ajwGjhTAJykh3Z7E5ynb/VPCoP09QArE2322HaGQSKnQJ/OR6RluySk6k1
 7ik4nbKMX2BqA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33FD43809A80; Sat, 28 Sep 2024 16:45:13 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.12-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyzGT9vTmFUBK51bJAT-fEsKMkfScQZCCEcHCX7Lq553w@mail.gmail.com>
References: <CAPM=9tyzGT9vTmFUBK51bJAT-fEsKMkfScQZCCEcHCX7Lq553w@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tyzGT9vTmFUBK51bJAT-fEsKMkfScQZCCEcHCX7Lq553w@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-next-2024-09-28
X-PR-Tracked-Commit-Id: e7268dd9bb9953a9eb0df9948abf5195bf474538
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 994aeacbb3c039b4f3e02e76e6d39407920e76c6
Message-Id: <172754191163.2302262.7896837503794633461.pr-tracker-bot@kernel.org>
Date: Sat, 28 Sep 2024 16:45:11 +0000
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

The pull request you sent on Sat, 28 Sep 2024 09:39:41 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2024-09-28

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/994aeacbb3c039b4f3e02e76e6d39407920e76c6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
