Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8137DE670
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 20:37:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7276510E0F0;
	Wed,  1 Nov 2023 19:37:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC39A10E0F0
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Nov 2023 19:37:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E57A0CE131D;
 Wed,  1 Nov 2023 19:37:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2A52CC433CD;
 Wed,  1 Nov 2023 19:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698867438;
 bh=Nj68XnXkW61dweRYG7A5fVa3Ibn7gLCpfGnDxMsUDn4=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=nMxwv7VMw6o4b9/qJspcYo7Kc4Eb3MnWt9fooO5SqyWdWgToQn+yak2iBBkSXwQ0E
 lXfdXQjNc4UW91fuWpGx3UCxazqF+OW4XYTrTOv0NY7nMXFCg6IJz9o6OOwjtgxwTL
 W7z0ImVMhqfkBzdw1D61DKQFDGfsnY7eScoO8RJ4hguhpmBmD2AHBH6YDTDIsZoS04
 jJvwtjl4r1QAzjgnLueHCPgBFk+8vfX9RXZrEOIim4maujEfWrE1UXw8UQCo9+8t3D
 7eyPq2SdZu5/pxjYOPUHjLMH2qKJHLa/jo0TSIZtRgGRJzWjxhMUpomFBqsWI+el8H
 LTUv6FWDA06wg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 17CC5C43168; Wed,  1 Nov 2023 19:37:18 +0000 (UTC)
Subject: Re: [git pull] drm for 6.7-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txd+1FtqU-R_8Zr_UePUzu7QUWsDBV1syKBo16v_gx2XQ@mail.gmail.com>
References: <CAPM=9txd+1FtqU-R_8Zr_UePUzu7QUWsDBV1syKBo16v_gx2XQ@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9txd+1FtqU-R_8Zr_UePUzu7QUWsDBV1syKBo16v_gx2XQ@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-next-2023-10-31-1
X-PR-Tracked-Commit-Id: 631808095a82e6b6f8410a95f8b12b8d0d38b161
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7d461b291e65938f15f56fe58da2303b07578a76
Message-Id: <169886743808.2396.17544791408117731525.pr-tracker-bot@kernel.org>
Date: Wed, 01 Nov 2023 19:37:18 +0000
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

The pull request you sent on Tue, 31 Oct 2023 15:07:23 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-next-2023-10-31-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7d461b291e65938f15f56fe58da2303b07578a76

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
