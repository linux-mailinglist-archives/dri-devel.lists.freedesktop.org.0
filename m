Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B55781A6A
	for <lists+dri-devel@lfdr.de>; Sat, 19 Aug 2023 18:01:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2748E10E0B9;
	Sat, 19 Aug 2023 16:01:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D61610E0B9
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Aug 2023 16:01:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AA1AA60C8C;
 Sat, 19 Aug 2023 16:01:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7AEACC433C7;
 Sat, 19 Aug 2023 16:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692460908;
 bh=7n1CC74HKqRSxoIXlvbbxvblK1V2CUJ1qbAXF+3uiu0=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=U2FYUJdukI1452thIbV2EQUFdp+3uvjJ2X9rLc3blPCs4DsQcq+eDLhrzD8EOEo+U
 6sGKUOhGBNFw/WIocMkpOFUblwEyJC3z4ZZLoll6rw0Lx2ic4EvgbTCnW20iZUZaAF
 rztVAKshRKqB9MORQ6hNOrkBdThPxngb8VjB8S/fKRkz1wcuBvYS5w+gTJp+HbEG8Q
 MJE3cEXkfP0Xj9+rycSclMr9FzsSiPQ6W3FZPVLTRWzapSCye3RpB6vbzohbLjhpO0
 AEvLB491oBzBE/YPj7AfWXn3ivjFXEIPPJPXUaK5vCHFM5TrPfWHMXwkesqefzTY/b
 3vYGXBO+kcgSQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 66F78C395DC; Sat, 19 Aug 2023 16:01:48 +0000 (UTC)
Subject: Re: [GIT PULL] fbdev fixes and cleanups for v6.5-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZODfqGYs/M1xvIJ8@ls3530>
References: <ZODfqGYs/M1xvIJ8@ls3530>
X-PR-Tracked-List-Id: <linux-fbdev.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZODfqGYs/M1xvIJ8@ls3530>
X-PR-Tracked-Remote: http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git
 tags/fbdev-for-6.5-rc7
X-PR-Tracked-Commit-Id: 0650d5098f8b6b232cd5ea0e15437fc38f7d63ba
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b5cab28be6ccf08237078b675fc1d446679779ba
Message-Id: <169246090841.15016.6846906717154418207.pr-tracker-bot@kernel.org>
Date: Sat, 19 Aug 2023 16:01:48 +0000
To: Helge Deller <deller@gmx.de>
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
Cc: linux-fbdev@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pull request you sent on Sat, 19 Aug 2023 17:28:40 +0200:

> http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.5-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b5cab28be6ccf08237078b675fc1d446679779ba

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
