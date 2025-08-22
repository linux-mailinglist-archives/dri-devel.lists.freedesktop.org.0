Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4F4B32500
	for <lists+dri-devel@lfdr.de>; Sat, 23 Aug 2025 00:21:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE07D10E046;
	Fri, 22 Aug 2025 22:21:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CJXgVyIm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CC1310E046
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 22:21:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6DE29A5850B;
 Fri, 22 Aug 2025 22:21:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18CC9C4CEED;
 Fri, 22 Aug 2025 22:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755901309;
 bh=BMOxwfSNpAEUbgWcSk+9Ur6RChgCBTmACh4pdd2awNA=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=CJXgVyIm3RV++2/6oRgGxzuKvaforJghA9okVb3UGdcwGd9SMRXW39mWKvsb1e5sR
 alWhVF6zqtCIByXhIALnb4ep1SvBzXBdTaje2pi1j5LA/TANyJ7TuaW4EllklzCjAR
 vIcXR2hIgH8kiIsVFKGcOGjVJw3gw8G32ivIUwRUM2LtChCk0iQN4rHsEOpppQRc+i
 QE6G0WF5yHBtzxycpqN8UeBkXHumglmaxXykfoJcfT/r3RTzFXMIfgyrZ5tx2pFJdd
 VqsR2Xbz5L7StDCXedQGszuF50abb/cna3IqCjxaTMVwXlu6Elb4p0xqFOtHwLUm0l
 ST5RqZJChwn5w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33FB2383BF69; Fri, 22 Aug 2025 22:21:59 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.17-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tx3c2SzxmsTaySLHVVUyHd+zcB-axUL0Hbtk5DdQQ8rrQ@mail.gmail.com>
References: <CAPM=9tx3c2SzxmsTaySLHVVUyHd+zcB-axUL0Hbtk5DdQQ8rrQ@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tx3c2SzxmsTaySLHVVUyHd+zcB-axUL0Hbtk5DdQQ8rrQ@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2025-08-23-1
X-PR-Tracked-Commit-Id: a60f5ee68efd91b4507eacbb40d4024ecf363304
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6debb69041724bae8a8a4d0ac60502754c1cd945
Message-Id: <175590131783.2018712.14349272942198070563.pr-tracker-bot@kernel.org>
Date: Fri, 22 Aug 2025 22:21:57 +0000
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

The pull request you sent on Sat, 23 Aug 2025 07:49:34 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-08-23-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6debb69041724bae8a8a4d0ac60502754c1cd945

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
