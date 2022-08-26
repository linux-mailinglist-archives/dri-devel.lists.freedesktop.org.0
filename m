Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB025A2FAB
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 21:09:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15CF710E082;
	Fri, 26 Aug 2022 19:09:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1B3C10E082
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 19:09:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CA29761ECC;
 Fri, 26 Aug 2022 19:09:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 39CFFC433D7;
 Fri, 26 Aug 2022 19:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661540965;
 bh=6QjjBEtO3m3aDTS+sboZqzDbXJWLUW4OKiYkV03Tt2w=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=e/TCZz2hY37f9KpO6CZd8D2gO7C30i8hmmHWet8r4ZdMDdiuuKQkJpm0//RBFp3YW
 xczMnDKevvpu2UQIzFdi+vSVxOd/J6N4BzUctogkvKfTrs2fRcjWwUXI9sa1mNYUf5
 8nAzbhSbyP5v3mCJrLiAA1G0beT3Cl0cRDSzrFbadd8qUre34/WLUJVId4eOLQZV/L
 YsQ26wqA2t71efrOLIBzdAE47EGi8WtYWE1JNP5ELHYHGQnFduBcF4AgT307IBeBNE
 F7uMa9xKoHYjy4/9fiUIegu0zVxrOTU6KSrfO/KvvrsAEilSypLWLL3nW2Pdn4qi02
 cxv+5pKDqfPmg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 21AD9E2A040; Fri, 26 Aug 2022 19:09:25 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.0-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzv9SAUpqMNh=4EuE3kCOYrsO9bW1vH8NiB+0rbOZv3LA@mail.gmail.com>
References: <CAPM=9tzv9SAUpqMNh=4EuE3kCOYrsO9bW1vH8NiB+0rbOZv3LA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tzv9SAUpqMNh=4EuE3kCOYrsO9bW1vH8NiB+0rbOZv3LA@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2022-08-26-1
X-PR-Tracked-Commit-Id: 100d0ae82b5c240a4dc17486698e67bf116bd598
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 78effb4a9b8c3589519b84759ac1757647072448
Message-Id: <166154096513.10698.8394863129118772315.pr-tracker-bot@kernel.org>
Date: Fri, 26 Aug 2022 19:09:25 +0000
To: Dave Airlie <airlied@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pull request you sent on Fri, 26 Aug 2022 14:30:12 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-08-26-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/78effb4a9b8c3589519b84759ac1757647072448

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
