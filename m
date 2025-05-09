Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA49AB1DAA
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 22:06:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B1B510EAD5;
	Fri,  9 May 2025 20:06:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BKkkVgdT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63B0810EAD5
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 20:06:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 610A3A4C78E;
 Fri,  9 May 2025 20:06:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05CB5C4CEE4;
 Fri,  9 May 2025 20:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746821183;
 bh=fvDbPvxwlUnXxCffuytLI9BM/io6jdDkaxMzcMkIi7Q=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=BKkkVgdTrujKIZ1Cb1tm9mBZ/r0A4A3efnkZ+fFp9hGOK15u1e823yKs6g7qnD4yD
 vJkyDsedfe0qCNZH6aZo3/+8H7+gW0z4wGfA9JRHEom+6B3lzCqW5CWlrgxNShav16
 zT4z7vtr5PEaPulET3yXUPosihRYW+fcTVcL2fyhg7EjFuZFhs0Qr9gVYfHhc7QHcX
 mP84YrPEkIKEGNSjnK6C/xgaICP2aTkf+9EZEJZAB0BR//dtU0j03V41cxYokkGB2k
 ItLpnAsJ3H3dVuf7u1HOEa4TM66HZHggvFJw5Hx71cp9ZoZCkLXZrrLZNjHqLqzWtF
 WQA/LwD0I5aFw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADF6F39D61FF; Fri,  9 May 2025 20:07:02 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.15-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txyi2mTEZtVzeR71wmaSvXNXrn-TFQbPm5n1_LQqRy8zQ@mail.gmail.com>
References: <CAPM=9txyi2mTEZtVzeR71wmaSvXNXrn-TFQbPm5n1_LQqRy8zQ@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9txyi2mTEZtVzeR71wmaSvXNXrn-TFQbPm5n1_LQqRy8zQ@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2025-05-10
X-PR-Tracked-Commit-Id: c2c64ed09c7b44a893d22c8b8ddb3ba7265494f3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ea34704d6ad7225421cc3543906deacae35a6ea2
Message-Id: <174682122125.3766575.18016924550297481918.pr-tracker-bot@kernel.org>
Date: Fri, 09 May 2025 20:07:01 +0000
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

The pull request you sent on Sat, 10 May 2025 05:19:27 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-05-10

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ea34704d6ad7225421cc3543906deacae35a6ea2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
