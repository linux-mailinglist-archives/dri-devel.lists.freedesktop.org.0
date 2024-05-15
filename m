Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D1A8C6B62
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 19:20:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 335E410E2F2;
	Wed, 15 May 2024 17:20:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JgkRZbAX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8B0D10E1BE
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 17:20:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 01A3560ACD;
 Wed, 15 May 2024 17:20:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A67DDC32781;
 Wed, 15 May 2024 17:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715793608;
 bh=PDCAtBJJsZQWI8/lbOPR4SI5lHA/YI+4rWdxytXXhOU=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=JgkRZbAX4kvSb7xoc+rJJ0TMuV4TlT++0qO92dvZfePlL/6cX9Avk9ZQj8CtQKzld
 C5Q+zI/zQ1OT9Fed8fPjDzmb1o0+G8Q+SYdy2CAfdhy7YMV3X0VL0RBKqpiTbvAa0b
 E+3s7oO3FD30PmCx6JjkR/rIs+Rp52Mqgx3BrQdYpGXd5GKvbaDBRi9wTN+mkMU8Ul
 ufplTTEqh7E84Zz19fCi2t9HjxOyQQOne0eFFjSsl0ZnucNBDIDAH5nHlTEGxYxT4d
 1ws3GKYJLrv6TkK/cV4ASgrUg8bM6/D4/ADnGVjwI5cAhjvnCqxm8uqEdjEVZE0lpZ
 zrGardYxftOEw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 91FADC43332; Wed, 15 May 2024 17:20:08 +0000 (UTC)
Subject: Re: [GIT PULL] fbdev fixes and cleanups for v6.10-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZkTQ9JoGXFwuMzZS@carbonx1>
References: <ZkTQ9JoGXFwuMzZS@carbonx1>
X-PR-Tracked-List-Id: <linux-fbdev.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZkTQ9JoGXFwuMzZS@carbonx1>
X-PR-Tracked-Remote: http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git
 tags/fbdev-for-6.10-rc1
X-PR-Tracked-Commit-Id: ce4a7ae84a58b9f33aae8d6c769b3c94f3d5ce76
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d34672777da3ea919e8adb0670ab91ddadf7dea0
Message-Id: <171579360857.17791.12648387199973228616.pr-tracker-bot@kernel.org>
Date: Wed, 15 May 2024 17:20:08 +0000
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

The pull request you sent on Wed, 15 May 2024 17:12:52 +0200:

> http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.10-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d34672777da3ea919e8adb0670ab91ddadf7dea0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
