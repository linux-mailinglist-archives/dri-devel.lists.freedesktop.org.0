Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5BA572031
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 18:02:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DB4095271;
	Tue, 12 Jul 2022 16:02:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DF5395272
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 16:02:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D823BB819F0;
 Tue, 12 Jul 2022 16:02:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8F327C385A2;
 Tue, 12 Jul 2022 16:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657641737;
 bh=QtU3FGnjdAW2K33sbhjmclVF+56NM4AMTXmCBTeRLEU=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=N+EzdGDP/cgfUh0zG8BjK6qeQnbLEHSCL6V46GIBbrP/7SAlMW6JhRizmEwnircvy
 qxCcvPkYS3i9lruD2W9HJLcav7+lU99fZuFaD5rfEb3zVqb3E27mNUZgWwzGNOuR7m
 DnBaid9tzXAzAg0nXd4hQpY/gwn2aOuhCIcG0mj/Rcs2NgLEH4kMwUQ5zt4S32mgFO
 iNK0/egAK3TURplfHFRSWDlGerp03trmxOIkejwiu7BsFi2Tq8fYUMWcxDKgUJj+Gv
 gTt8BIuaT4s20ku1ebbUkXifVcQEDDShPUqCn0SitXFupLLDlntpfPaTrG83uVtOJH
 1NyOcP8LNQ2ow==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 7AE15E45221; Tue, 12 Jul 2022 16:02:17 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.19-rc7 (late rc6)
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyJzO0bwtopJsfkZ6FRjkk9EghPzhBOQ-_9qQAALvOq+A@mail.gmail.com>
References: <CAPM=9tyJzO0bwtopJsfkZ6FRjkk9EghPzhBOQ-_9qQAALvOq+A@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tyJzO0bwtopJsfkZ6FRjkk9EghPzhBOQ-_9qQAALvOq+A@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2022-07-12
X-PR-Tracked-Commit-Id: 3590b44b9434af1b9c81c3f40189087ed4fe3635
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 29851567d1aa8f0045170545d2e1a5d7a4057667
Message-Id: <165764173749.23543.17016967213251175465.pr-tracker-bot@kernel.org>
Date: Tue, 12 Jul 2022 16:02:17 +0000
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

The pull request you sent on Tue, 12 Jul 2022 11:32:31 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-07-12

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/29851567d1aa8f0045170545d2e1a5d7a4057667

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
