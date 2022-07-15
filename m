Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72074576F2A
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 16:41:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0DED10EF22;
	Sat, 16 Jul 2022 14:36:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C7710E13C
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 17:45:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BD40EB82D71;
 Fri, 15 Jul 2022 17:45:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7CA1BC3411E;
 Fri, 15 Jul 2022 17:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657907130;
 bh=CuTRal5okKM9j1PFVlEKp6GRIJx0+aW1oFToCDlirE4=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=YS95odb9Gm6sQMPobEJDXqQ1Ec45D6d8AetChy0kggbNuLRQw7aAeHWSoxrbm6aSX
 DeJ20CbmWgXH/yz9ZU3WxQBkSXWigVaeXz55wZ1J8K0evHEpLZBlIuSHy4K/8qv+N6
 q6UM7k7DSrIvv38oWpwD0sSbPiOCd0NmZ1VNZO7FrqJCZCAM6q3Dn/pK5sTMvRta0f
 Pw2ScaPf3X6SFYzde0cmIqlFE7HlOcG1M10v2PasVABytL0/7U3Ru/jUMAhTDfisHF
 stvWQKx9gLtY9mh5nb9CwO15zuOLwSykBbEfy6eaEA5S2sPI97E/u8+mU+3QvQJuFN
 HV0UPokVb7RzA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 6A0FCE4522F; Fri, 15 Jul 2022 17:45:30 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.19-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twM75GDM9t+9-CSCPDZG3QdcEpQ-X+FzQ4CLUCM7cKLkw@mail.gmail.com>
References: <CAPM=9twM75GDM9t+9-CSCPDZG3QdcEpQ-X+FzQ4CLUCM7cKLkw@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9twM75GDM9t+9-CSCPDZG3QdcEpQ-X+FzQ4CLUCM7cKLkw@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2022-07-15
X-PR-Tracked-Commit-Id: 093f8d8f10aa22935bc8bf7100700f714ebaba9c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fcd1b2b9c7b085e9c200f73c079b322eb8c666f9
Message-Id: <165790713042.27298.9446072286219150279.pr-tracker-bot@kernel.org>
Date: Fri, 15 Jul 2022 17:45:30 +0000
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

The pull request you sent on Fri, 15 Jul 2022 13:36:17 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-07-15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fcd1b2b9c7b085e9c200f73c079b322eb8c666f9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
