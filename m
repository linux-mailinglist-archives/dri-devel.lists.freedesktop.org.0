Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D9E58561D
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 22:29:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5339710E930;
	Fri, 29 Jul 2022 20:29:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B35CD10E48B
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 20:29:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 885FBCE2BC4;
 Fri, 29 Jul 2022 20:29:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ABDD5C433D6;
 Fri, 29 Jul 2022 20:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659126588;
 bh=HRGWYs0/HzrW2tsrcPwrr6IHY+Ga7oXs1x94vE6HiTk=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=nvNN1jk2KEZFuOQlo5AFjgJGOBYK+1ZnGyqtyGtINN64xAhdBK2/HbA25cUFQwqnI
 If1Gnj7dPOvuorHju96cdAoPrOUGLTY0rwZqGTfhaYA+GJSR0QmMzLLY2mxQCQ/gfw
 1l8ZyA62lh1Dt+ff5MarL5QCApNLVQBEEnwj/XJBQU+CTMVo0SPNGdhZR/a23voIaG
 Rsdyrd6SrR9vSDQ84PiaLmWDQLRAukMFhWshm8sipjdu0tP/4fVMO4LW3Jym6dcHzi
 0CoGLLpJTf3wXJH4f2XZuE0fBIVWmweviUUCiGJhrNWOZzLI9Q5um1sTkMUXM/9Scb
 5EjeVVeLIBk5w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 99838C43140; Fri, 29 Jul 2022 20:29:48 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.19 final (part 2)
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twcrq24uhTF4yYR2v1tJsK76D_S4=fjE=K4s+78Wds91Q@mail.gmail.com>
References: <CAPM=9twcrq24uhTF4yYR2v1tJsK76D_S4=fjE=K4s+78Wds91Q@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9twcrq24uhTF4yYR2v1tJsK76D_S4=fjE=K4s+78Wds91Q@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2022-07-30
X-PR-Tracked-Commit-Id: ce156c8a1811c96a243590abd0e9b5a3b72c1f3a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e65c6a46df94c8d76ea1129eb2d4564670c6f214
Message-Id: <165912658862.29108.5417045063800649349.pr-tracker-bot@kernel.org>
Date: Fri, 29 Jul 2022 20:29:48 +0000
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

The pull request you sent on Sat, 30 Jul 2022 06:24:26 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-07-30

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e65c6a46df94c8d76ea1129eb2d4564670c6f214

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
