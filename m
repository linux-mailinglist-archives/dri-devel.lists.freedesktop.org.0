Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC36A245B9
	for <lists+dri-devel@lfdr.de>; Sat,  1 Feb 2025 00:48:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25D7B10E0F5;
	Fri, 31 Jan 2025 23:48:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="t69v8Ler";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4485D10E0F5
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 23:48:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id AD6AAA41F48;
 Fri, 31 Jan 2025 23:46:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E26CFC4CED1;
 Fri, 31 Jan 2025 23:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738367307;
 bh=u2OybdTrTFJJeATfmnGixfpzVqUWWqbAZg6yJAb9pA4=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=t69v8LerCvvRW3DKUIWpnHmwzUICfU3h6rPU3zDPQyTNEIP/i7JnPnJSCkF0uAVGf
 Au4dwBZk/p6TjXn/Y2IivdxH6suYmbVJUdRuBFnpzaeWB1Gd8z0X0PqKohbZ8jFRjC
 0zdSWpaZxtFeUtv9yRJY0qbDlOoyS1RyyLpFzVfLPbP/oNterzcWLvXAp0iny59+lj
 h2UCDBh9zOf1YwwrbWA5V76EQ0aLf7MHodbUHuI+0MWmn0F2hwAhwEnvzDHAOYBlRy
 aHvXVQ4zstbWNZypZWJR80bpg8FUiAU1QYGSNPPVYYQqyuICZOcjUCsrPbCw44GgCJ
 gaX9wr5w++T5Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 AE46F380AA7D; Fri, 31 Jan 2025 23:48:55 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.14-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twWB85+Oz8ZSoAej1y4Otb6JesYm7_DE0XAfEU6CJbZxQ@mail.gmail.com>
References: <CAPM=9twWB85+Oz8ZSoAej1y4Otb6JesYm7_DE0XAfEU6CJbZxQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9twWB85+Oz8ZSoAej1y4Otb6JesYm7_DE0XAfEU6CJbZxQ@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-next-2025-02-01
X-PR-Tracked-Commit-Id: 8dcb26b493d3bab90851f93ae1c127af5cb2dbb5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 851faa888a523f74f9796c2c1cc7b3f7626f0e25
Message-Id: <173836733414.1763875.937968975075308162.pr-tracker-bot@kernel.org>
Date: Fri, 31 Jan 2025 23:48:54 +0000
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

The pull request you sent on Sat, 1 Feb 2025 07:31:07 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2025-02-01

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/851faa888a523f74f9796c2c1cc7b3f7626f0e25

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
