Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6E699AF55
	for <lists+dri-devel@lfdr.de>; Sat, 12 Oct 2024 01:25:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C2110EB46;
	Fri, 11 Oct 2024 23:25:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hu3EaJvN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1038C10EB46
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 23:25:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CAD7A5C5E8A;
 Fri, 11 Oct 2024 23:24:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D168DC4CEC3;
 Fri, 11 Oct 2024 23:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728689098;
 bh=EDvlZqMBPpTZRu6/GWfrIW93H8umTl5FQq5+12AgqkA=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=hu3EaJvNmdNhVAECGdlyy4bptgn3RY0AbH9+cSkAbtq6K1fdW26/r59utjIjApC+6
 MjX1ec5UrSOpqHazjdHUcoJhPnzOxG/YOzVe9djmDSkTj0YbazkAmyuFKjMxKbqVTA
 1VI5gWMNt0SwDr2pSiTVKNxviePomDijHonSSQc0+iFyhnwcv4FnnaiqOXkmNzV4mZ
 VDawtiJ0UT0mWr5RRvGpq+JlDKwKvsgafw3fPmgaoPwAYCyVWS4eMLj2eIKBZ1N+5+
 5kpi0lDf9kp2upguDXQhjLLZaAc4j6DEsb5dYEuSXabcODUlXha3nH05pDWiXGQjDT
 m8nM5tKYp682A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 AE07A38363CB; Fri, 11 Oct 2024 23:25:04 +0000 (UTC)
Subject: Re: [GIT PULL] fbdev platform_driver::remove() migration for v6.12-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZwmPlIK9-O-396Sh@carbonx1>
References: <ZwmPlIK9-O-396Sh@carbonx1>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZwmPlIK9-O-396Sh@carbonx1>
X-PR-Tracked-Remote: http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git
 tags/fbdev-for-6.12-rc3
X-PR-Tracked-Commit-Id: 01ecc142ef7c8c5081a39be81c1d8ab7c10dd7b8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9066258d0a533530c2508f784e85c53b44f5d9e4
Message-Id: <172868910338.3026331.13025842781495565900.pr-tracker-bot@kernel.org>
Date: Fri, 11 Oct 2024 23:25:03 +0000
To: Helge Deller <deller@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Uwe =?iso-8859-15?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
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

The pull request you sent on Fri, 11 Oct 2024 22:50:28 +0200:

> http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.12-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9066258d0a533530c2508f784e85c53b44f5d9e4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
