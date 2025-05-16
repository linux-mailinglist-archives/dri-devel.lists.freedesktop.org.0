Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E606ABA6AD
	for <lists+dri-devel@lfdr.de>; Sat, 17 May 2025 01:41:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1669D10E0EF;
	Fri, 16 May 2025 23:40:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qA1d7TXQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7372210E0EF
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 23:40:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B95F860EDF;
 Fri, 16 May 2025 23:40:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D610C4CEE4;
 Fri, 16 May 2025 23:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747438845;
 bh=xrXiwvcDvwTciw4SLVynORnx+1TUmtqOisuAk39oEmI=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=qA1d7TXQHqUMkHFl1bYMJQy5ormuVuG+ROWvpa2Z5A8WVk8FNGHAHjD/MT6WRGGdL
 HID+yJO4xNWQmB8G+R8eUUnUEOSgRdo54yHZ6Q47zeaw2HfT+Cv5zEJqfFW5aTBHKn
 awm6WznAQKvz9SZqf+fLre9zsy/z4fRXYRZbA2jiMPvMtFny8GG3rZlT9MfZfp5BDN
 l2ngSJteDegYIdvPJRMlmwbXhCj+jNmnrhYZ6wqiotEDtX3yE1mLu0ikPWoFk2Q7rq
 Ue2EfHnGZOjv4omu/2TB2oHZzkibY5hoL2hNPnL1sI8Gj1AIgsXfU6Dis1JOfXmkwV
 kmC9c+83h6ExA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70D913806659; Fri, 16 May 2025 23:41:23 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.15-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzOu5FL6KXJDSJbAScqJjWnn12KLi3Va8V_WDrg6KUrPQ@mail.gmail.com>
References: <CAPM=9tzOu5FL6KXJDSJbAScqJjWnn12KLi3Va8V_WDrg6KUrPQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tzOu5FL6KXJDSJbAScqJjWnn12KLi3Va8V_WDrg6KUrPQ@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2025-05-17
X-PR-Tracked-Commit-Id: c81dbc490bcdfd0dd6199c5c382dc923cea0029b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 12b6c62c038e85354154aee4eb2cf7a2168b3ecc
Message-Id: <174743888206.4096732.638912975486071931.pr-tracker-bot@kernel.org>
Date: Fri, 16 May 2025 23:41:22 +0000
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

The pull request you sent on Sat, 17 May 2025 06:44:48 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-05-17

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/12b6c62c038e85354154aee4eb2cf7a2168b3ecc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
