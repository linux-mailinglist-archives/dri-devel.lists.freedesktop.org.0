Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D87B45F89
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 19:06:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E841410EC10;
	Fri,  5 Sep 2025 17:06:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KysTyEpH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D6910EC10
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 17:06:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D2AB1601AF;
 Fri,  5 Sep 2025 17:06:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78C61C4CEF1;
 Fri,  5 Sep 2025 17:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757091983;
 bh=INGC+ajHsIl3FNeM6kwVLgXWfBs7RhWtijR0UOSFhxg=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=KysTyEpHki7zWpgdQpzezd+bZh2ih2MlN38ZIGUOWNRyLHGvN15DCurIq6s4J8atv
 pga1ecFQCi6KcBthiTGOWdc3I86C1CSZb6EqPNgP6hRzIrciV2OSnckDVle5harGQY
 Y9JIENkP58AdFLveMBMxPGS67pBLO+rkxS3lan80jzCrLsYbyRL9ji+45vrFtmgtJl
 Xpurn9ceov+3Oe0HIlgJj/i4gDnzIqQpePELfVIUMEp+CD+Qtjb2YU+M+Aiw+9PFdC
 e83wb0lkNVOjSjgAFHV0BFMWfAbqe/vvIFMcsVOZjyNJpSToCeyMrxCuMRm9shZcaX
 oRo0ILY5VUV+g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 343F4383BF69; Fri,  5 Sep 2025 17:06:29 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.17-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txcDaRBOKZEWzAcDsdT=APUzcSicYA=-fno+52zGz0bOA@mail.gmail.com>
References: <CAPM=9txcDaRBOKZEWzAcDsdT=APUzcSicYA=-fno+52zGz0bOA@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9txcDaRBOKZEWzAcDsdT=APUzcSicYA=-fno+52zGz0bOA@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2025-09-05
X-PR-Tracked-Commit-Id: 8b556ddeee8da9420699ce221b6267f395e7d72b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c8ed9b5c02a5ceb3d8244f3862a7e64cf0b5648e
Message-Id: <175709198781.2623294.1625813420546569754.pr-tracker-bot@kernel.org>
Date: Fri, 05 Sep 2025 17:06:27 +0000
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

The pull request you sent on Fri, 5 Sep 2025 14:12:52 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-09-05

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c8ed9b5c02a5ceb3d8244f3862a7e64cf0b5648e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
