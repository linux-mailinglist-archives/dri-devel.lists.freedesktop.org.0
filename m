Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B68611C3A
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 23:11:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EC7F10E1ED;
	Fri, 28 Oct 2022 21:10:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C4A310E1ED
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 21:10:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B126162A7A;
 Fri, 28 Oct 2022 21:10:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 21110C433C1;
 Fri, 28 Oct 2022 21:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666991449;
 bh=wf/8jsLnB4pzjsM6ppMfJLA/5kw2a4UPsAVbd+cvZ1k=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=qukH1UhyYPtl0Rf60dX3kpfGl1T/2eGHJXavcWAmLZZ3ay2o+TVrG5tlTO62dBjyl
 WO/KTkRPDbKLSLkxxNRf+09vBvHMYK7nxOmCdMI2UXIdLvKDHlHnEx6qZKkfGxZEAD
 2Kfan1CADmknBUn2gyXHmzp+mbbvzgmJS9IDRk84Onc94pdHL1gdzisXEtKbbw+FG4
 +2AEYY3F8hF2DfmLH3VMbusDEctE2FfLbsKJKtws8gO9hNTq75nlvTC6mCcGDyEI0j
 uENUmRYA7rLuuhI4iJra5/p1naItD073YDvocnS+m92j4cLbnPY+sKZcgHu9mGmpNT
 O2p5+j3WS81Yw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 0DB55C4314C; Fri, 28 Oct 2022 21:10:49 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.1-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tz-_RXszedVsU-Wx64==1dihXzoMLzT6ghOD8ATwJ8rWA@mail.gmail.com>
References: <CAPM=9tz-_RXszedVsU-Wx64==1dihXzoMLzT6ghOD8ATwJ8rWA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tz-_RXszedVsU-Wx64==1dihXzoMLzT6ghOD8ATwJ8rWA@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2022-10-28
X-PR-Tracked-Commit-Id: b2196401949ed2517bec676928f837e6bbd01a65
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e3493d682516e2b7ef69587ddf91b0371a1511d0
Message-Id: <166699144904.13387.15685587718628402711.pr-tracker-bot@kernel.org>
Date: Fri, 28 Oct 2022 21:10:49 +0000
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

The pull request you sent on Fri, 28 Oct 2022 13:53:24 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-10-28

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e3493d682516e2b7ef69587ddf91b0371a1511d0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
