Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F145CBA5B9
	for <lists+dri-devel@lfdr.de>; Sat, 13 Dec 2025 06:54:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA4310E9C2;
	Sat, 13 Dec 2025 05:54:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gwWdQ2bE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C8DA10E9C2
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Dec 2025 05:54:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id F29AC4442C;
 Sat, 13 Dec 2025 05:54:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D750CC19421;
 Sat, 13 Dec 2025 05:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765605244;
 bh=WpuRXjhoH5UnfQ6ou5paonMOhN18FvkNbMLB0vK+jGg=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=gwWdQ2bEa4QgaMcs5VmsYpNZrrljR8EETqV6P412+NbYwIZQWtcCYUazA7CezeiAj
 DdreDsaCwiWS0JzOhwmJmHHw14hFFXARSrAGBMBYt9vc1edXv8SABrYjCNdHOBFjBq
 pHp9vU6j0QpTDvxSOp7eFt2ei5Or5aScJqa/E/WZsEnbkALaPci7RkXEovTpqffLau
 3ckLmrnCIt09JgSyTW9wB3QfIy23Y//r2hFIWkjXTaVc4wSwjF+GHLBT82mu8lfAgz
 S8E3llD54bw9nClg47AMUdUB4TlXAKJgnd8vOYTKWLnSUYmFto095gpJktmlkkuY19
 oUfy5WKdrp9tQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 F298A380A954; Sat, 13 Dec 2025 05:50:58 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.19-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txr+eWr=nCVWwAPA=bC8bBNnA+ReSkxGCYoQmhEhhyUmQ@mail.gmail.com>
References: <CAPM=9txr+eWr=nCVWwAPA=bC8bBNnA+ReSkxGCYoQmhEhhyUmQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9txr+eWr=nCVWwAPA=bC8bBNnA+ReSkxGCYoQmhEhhyUmQ@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2025-12-13
X-PR-Tracked-Commit-Id: 5300831555cc6bb45bf824262ac044e8891b581c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a859eca0e4cc96f63ff125dbe5388d961558b0e9
Message-Id: <176560505760.2419555.5172085673302574889.pr-tracker-bot@kernel.org>
Date: Sat, 13 Dec 2025 05:50:57 +0000
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

The pull request you sent on Sat, 13 Dec 2025 12:20:16 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-12-13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a859eca0e4cc96f63ff125dbe5388d961558b0e9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
