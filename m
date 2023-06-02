Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 017027201E2
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 14:19:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F52210E04E;
	Fri,  2 Jun 2023 12:19:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B436F10E04E
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 12:19:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 11F6764FE3;
 Fri,  2 Jun 2023 12:19:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 77647C433D2;
 Fri,  2 Jun 2023 12:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685708374;
 bh=Tob221A3m45GIyyZajyCi0Hv+Wx+6rRm67D2dy4z+5M=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=mTD+VIhlgB6KyqFcSmnM8pDGxev7x+o/g1szMdFdp2EQgSPIbkgC8oMUOJTKRRYp0
 oZvjiwW9Srl69j6r5Z+m9hiJ92xX/hNTmfc3L2ryjCt9pjTXbIstkmaESDqRLGK8/J
 +TGUCiDUubT+0w+2aLYmsL6O1HQNj+BruGhc7fXJm1Fa9DDFGdj8selT32RneEZbhM
 qzW/BEbbKfH0Fb2zj2LkEj3pS4takYHBAV7fARaEof8UnU/oXEzCF95k9lQXrIXbc3
 2EN1PU6pfF82DohpDrpGLGDSrRHyrov0gaHReb6kzDWGN91n7ObuvNRnk2hWi3xSUQ
 M5kuShmJcdD7g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 63C96E52BF5; Fri,  2 Jun 2023 12:19:34 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.4-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyD7t3pBvY9PN5g8M3KN-y7i-cNHwtoR3x5-f=-U+fAEw@mail.gmail.com>
References: <CAPM=9tyD7t3pBvY9PN5g8M3KN-y7i-cNHwtoR3x5-f=-U+fAEw@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tyD7t3pBvY9PN5g8M3KN-y7i-cNHwtoR3x5-f=-U+fAEw@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2023-06-02
X-PR-Tracked-Commit-Id: b6ccf213d95e9373ac1f7fbcb5de3b52eec0ddb3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e99a74673a19631d4a23c7e1fe2f21c55471a5d1
Message-Id: <168570837439.24915.90131940673764589.pr-tracker-bot@kernel.org>
Date: Fri, 02 Jun 2023 12:19:34 +0000
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

The pull request you sent on Fri, 2 Jun 2023 14:12:59 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-06-02

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e99a74673a19631d4a23c7e1fe2f21c55471a5d1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
