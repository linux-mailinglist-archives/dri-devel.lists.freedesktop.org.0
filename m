Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80259728DC7
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 04:25:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD84110E62C;
	Fri,  9 Jun 2023 02:25:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAF9010E62C
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 02:24:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4422C652F8;
 Fri,  9 Jun 2023 02:24:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A947DC433D2;
 Fri,  9 Jun 2023 02:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686277496;
 bh=MiFfb6W4vnvURKlH04KMHTqs85qyDTvhLLZ/eyg75oY=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=PUjGCdyUlspEvolr3xBcDcNptQIu0NYio+Cvch0JxJhIUlXJGrJ2GbZCR41uz44kh
 pTn1x4OKObN2v5AFTn1ytCk62Lbn8ER61pgDQMv29HtCn5MXx/xUD6f3b29sJt7+HU
 I8zovNqVp1GLRUUC4uR1Q8tFzyvIAwp+jyTEMnEYwjUPgbwoDuA+nbV+mE24FNvo16
 9dOUXvPh+BrPWABsK+mtH1JYnNUEDAY7/WYuZf842cUPCRxS2VHN90P/EcrnpSpB9h
 Nwr4zDotSa1gYjvGFsJmB/286rpUksIGOWa3TQpwE/3gMcJmeIWgsnHeaqKkn4GoXb
 NiidtkUe+H8wA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 86290E29F3C; Fri,  9 Jun 2023 02:24:56 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.4-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tweJxBYq_08o-ZtgXRgdRQYZCbFiN+VdunddCaA+UwSEw@mail.gmail.com>
References: <CAPM=9tweJxBYq_08o-ZtgXRgdRQYZCbFiN+VdunddCaA+UwSEw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tweJxBYq_08o-ZtgXRgdRQYZCbFiN+VdunddCaA+UwSEw@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2023-06-09
X-PR-Tracked-Commit-Id: 986c34b495810b38f365bb71665b77de60f15b2c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 33f2b5785a2b6b0ed1948aafee60d3abb12f1e3a
Message-Id: <168627749654.4066.792406602015930825.pr-tracker-bot@kernel.org>
Date: Fri, 09 Jun 2023 02:24:56 +0000
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

The pull request you sent on Fri, 9 Jun 2023 11:39:32 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-06-09

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/33f2b5785a2b6b0ed1948aafee60d3abb12f1e3a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
