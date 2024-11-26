Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2A09D900A
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 02:40:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E99410E1E1;
	Tue, 26 Nov 2024 01:40:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CHJmywzJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 193EE10E1E1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 01:40:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CF5305C569B;
 Tue, 26 Nov 2024 01:39:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F412DC4CECE;
 Tue, 26 Nov 2024 01:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732585203;
 bh=cnrA5iZFmRC8kQduUCs0XN5cQnzWr+UiV47ifV/i8OY=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=CHJmywzJu9zUwBwB9HOFBmO6tMJHutW/stzR55SFydMm1HFGBmTZ+M1b8vPRpPGM/
 1rWVIe4ptO7yJGJQ7etOdkU1R8niHLEM/NGLWU9uRf8vY1/MPwMR6Vuzh75o9c5VzD
 Aq42hLkO+coW0yOCwKVBTMmTcELXTq9pXt41W+M8S7RqloCtUd718PDwLvTRPyR+RN
 4bs5w0P08ZFOIH+GU+QwN47nXPd0/UqQcn/ROYaB2M2q529MzigktDSNO5n7nPoDNJ
 8yhz/GDuJKXHaLmvC5tZQwG/Tg7re4GrC8flVEVFDLkd/9A+VruTkCqOQj/c/GrIia
 Yc+ikRH9ZeVLg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EB5263809A00; Tue, 26 Nov 2024 01:40:16 +0000 (UTC)
Subject: Re: [GIT PULL] fbdev fixes and cleanups for v6.13-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z0NkkihDqEwi3k9Y@carbonx1>
References: <Z0NkkihDqEwi3k9Y@carbonx1>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <Z0NkkihDqEwi3k9Y@carbonx1>
X-PR-Tracked-Remote: http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git
 tags/fbdev-for-6.13-rc1
X-PR-Tracked-Commit-Id: 8d7493133bfd89322349be3daaf39a256e4354ac
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4e07155dd58cab024813e97dc384d48f34e3d16e
Message-Id: <173258521564.4103683.3291676573483686961.pr-tracker-bot@kernel.org>
Date: Tue, 26 Nov 2024 01:40:15 +0000
To: Helge Deller <deller@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
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

The pull request you sent on Sun, 24 Nov 2024 18:38:26 +0100:

> http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.13-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4e07155dd58cab024813e97dc384d48f34e3d16e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
