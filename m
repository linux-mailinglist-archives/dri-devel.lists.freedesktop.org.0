Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BDC754251
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 20:11:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55BE710E2DD;
	Fri, 14 Jul 2023 18:11:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BBD810E2DD
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 18:11:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5610D61E01;
 Fri, 14 Jul 2023 18:11:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BBD6AC433C8;
 Fri, 14 Jul 2023 18:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689358286;
 bh=DWqcNf1a7AJvPYwW1a7bvmef79UycEwhJtXh0d6CM6U=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=htrJjd8zMxuRtoxhg5R11t+6WHWdHhfumFBCssLHgz9OfJHp9dzUDCBB6KoiovhS+
 ySz+gs/4h1ugCyUvioUvDq+iF4FTQ00S3FDqouCWzZh/WRC7xKC2dyFx3PcEsP0XHK
 l9Z466wB4182/3wpjV6XKMu3lHkk8qVSl65vgGOsGN/XjBmW2IK7lgZLDbuKPosH2s
 Nqp91PH8kJgs07hfwUC77Yft8k/f+nK+yaJ9ijuv7A3IR7hojxtVuv2hc0Sp8nLLCA
 3z8nZG8JLI+QXOOxIIIA59DcD67fgEkIKqu+JCpwzxvCxny26JCM4hr0E674pgCX9o
 r03AKdVcVQrTQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 A8F34E4508D; Fri, 14 Jul 2023 18:11:26 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.5-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txdhgYF63eL7VMpc3gmnvCz=gnxLW=HwTRNHNU8geU5Ww@mail.gmail.com>
References: <CAPM=9txdhgYF63eL7VMpc3gmnvCz=gnxLW=HwTRNHNU8geU5Ww@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9txdhgYF63eL7VMpc3gmnvCz=gnxLW=HwTRNHNU8geU5Ww@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2023-07-14-1
X-PR-Tracked-Commit-Id: 38d88d5e97c9032ebeca092b9372209f2ca92cdf
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3a97a2993e7e7392292323fefc46d79bf9633e44
Message-Id: <168935828668.1072.11622789745511450148.pr-tracker-bot@kernel.org>
Date: Fri, 14 Jul 2023 18:11:26 +0000
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

The pull request you sent on Fri, 14 Jul 2023 14:39:37 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-07-14-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3a97a2993e7e7392292323fefc46d79bf9633e44

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
