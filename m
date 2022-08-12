Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E291591369
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 18:03:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4D2A1139CD;
	Fri, 12 Aug 2022 16:03:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 789C212ADA8
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 16:02:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 08CAC6156E;
 Fri, 12 Aug 2022 16:02:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6973AC433C1;
 Fri, 12 Aug 2022 16:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660320175;
 bh=c9VEOid5DDE/WL3sElJO8zjpQ5Tmuti7h1tUGtY3StU=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=FZ5EtTLRvKOiqZ9qVbhKNIt23NFQXLq/R93i83T3bmoP7pmxPhWfrvaESXN2ZNm1R
 lCaDWSiKpBaqtIKsvcvFGW6SwmSVwAhLqHJxXf5UIJbGu/Tr/UZZ/kP2TvPvPwFVBu
 GdEnPbr8QECBNLBt0eZntS6FeXxPSCZn7/DUD/c735mVH3eKaeKWIdiv1GoGsMkwPX
 jvshWnOJHL9utQuMmwdytG1reIK8+eaA5t8H3U8GH4JnwykZZ2htw6eKnQtaoV/njI
 riBJ1pSeeg5CzpkwDoMVgqvCSepRJLmYkKroXeXwzwmDJYUgcqnXXRhX08d71mswsA
 gJ2YWl6pkj6zQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 55E01C43141; Fri, 12 Aug 2022 16:02:55 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.0-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twZGrzg6pXcHQkaPfCScrE-DMh5PC1UnRULbtv1eC6vdA@mail.gmail.com>
References: <CAPM=9twZGrzg6pXcHQkaPfCScrE-DMh5PC1UnRULbtv1eC6vdA@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9twZGrzg6pXcHQkaPfCScrE-DMh5PC1UnRULbtv1eC6vdA@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-next-2022-08-12-1
X-PR-Tracked-Commit-Id: 36fa1cb56ac5189c78dacbbb14d452d0c44b86c0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7ce2aa6d7fe121e243e1c8a8093911fecdf1c88e
Message-Id: <166032017534.8665.14144126004018597978.pr-tracker-bot@kernel.org>
Date: Fri, 12 Aug 2022 16:02:55 +0000
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

The pull request you sent on Fri, 12 Aug 2022 06:09:44 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-next-2022-08-12-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7ce2aa6d7fe121e243e1c8a8093911fecdf1c88e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
