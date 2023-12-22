Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A0C81CC83
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 17:03:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71EAE10E7CC;
	Fri, 22 Dec 2023 16:02:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D008B10E7CC
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 16:02:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EDA5961C61;
 Fri, 22 Dec 2023 16:02:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9EFFCC433C7;
 Fri, 22 Dec 2023 16:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703260976;
 bh=CPmTjYBtuhsovYGOkaccdtO0Mov4KGKnL7+0splSCH0=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=s0xocgyO232js75/Q5m8+N04Y7+KFDgRcmFbujuBL4GlY1hQuflw0QRREHHbsLpes
 XAhHof3A1UVYnrvBSbcoGx4BfzN5os8NQ99xZRHAGfFj/M4s7yfnMQ6CoKGCnB13XH
 PU6BVzdXkovSDmk+ZEcQDwXM4MCmG2n1FT2auCVLUuUWDqgoug6fmKsITTsUCJEKqn
 9Mkx+bkNmqziYjvSqQGv/Ww0Aoq9Xo/QcHiV8W+r+r+ntPjisKNfwHdQ9dGlHMgr8I
 RubEU0Ob1NBiW3HWGHQCJURBR4M4P0V76NgszpIDK0BPwpDa5e50ovjZuzrho3l6JL
 ixnwEM7pBsqZA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 8E09AC41620; Fri, 22 Dec 2023 16:02:56 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.7-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txmoVE1CPtarnL=Y4M8XxHs0VYkfdWw-X2MErNHt+DEig@mail.gmail.com>
References: <CAPM=9txmoVE1CPtarnL=Y4M8XxHs0VYkfdWw-X2MErNHt+DEig@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9txmoVE1CPtarnL=Y4M8XxHs0VYkfdWw-X2MErNHt+DEig@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2023-12-22
X-PR-Tracked-Commit-Id: d4b6e7f582e29acac17bcaf7f7771138d72f89d2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8afe6f0e0e257bf7f79f5996c037e8977dcc8cc1
Message-Id: <170326097657.10957.15303638903528908234.pr-tracker-bot@kernel.org>
Date: Fri, 22 Dec 2023 16:02:56 +0000
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

The pull request you sent on Fri, 22 Dec 2023 14:59:38 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-12-22

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8afe6f0e0e257bf7f79f5996c037e8977dcc8cc1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
