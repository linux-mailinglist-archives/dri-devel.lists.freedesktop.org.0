Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E116F894F
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 21:12:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE05810E660;
	Fri,  5 May 2023 19:12:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC5C10E660
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 19:12:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 17D4363FB5;
 Fri,  5 May 2023 19:12:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7B732C433EF;
 Fri,  5 May 2023 19:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683313923;
 bh=/r9+H+5SNZPduayjN6ZBjQuCEtkKiLccWkjSpcnnB3s=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=I9e0ilCRNV4Qj70hjkOxesOAhu3TZRjdhdn+j0oAEITAzyZfvGduJVxFndDi3LZhy
 56cmDEzObazIF4qr6/g8adF2XxFjv9EGipOXYxqjPMiWT9EDxvZrXkMNxwv/zWhu4y
 A7T+pstrBx6DH47bnZtUgr8ef/KgznkdeC5hoGJtDGzeW+q6IXG1m31f2A01PMJvS0
 LZ56UO36YhIMgJPSRqrdYcI6LSZbLTlnF01urWreNiL4V4NwPvY5cSXa0vHtohrgP3
 0fTd/UMtFbxaTcb0+rT4Qk3BiRRWdYMK03WAu+q1INzAvEdbCn+7zPg46his5+SLcT
 JMjHXxAIYRTgA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 6A4FFC395FD; Fri,  5 May 2023 19:12:03 +0000 (UTC)
Subject: Re: [git pull] drm fixes part 2 for 6.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tx4RUsYmOH4vLcXQ4dyTxkBDO5WeEXabWX4hdDbUp3ghA@mail.gmail.com>
References: <CAPM=9tx4RUsYmOH4vLcXQ4dyTxkBDO5WeEXabWX4hdDbUp3ghA@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tx4RUsYmOH4vLcXQ4dyTxkBDO5WeEXabWX4hdDbUp3ghA@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-next-2023-05-05
X-PR-Tracked-Commit-Id: 1bef84af084e981550d9ecc3359baa22533d7b99
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 084f51d473cd566eab310d5da56fe7b68d0b10be
Message-Id: <168331392342.10509.11940586646872605215.pr-tracker-bot@kernel.org>
Date: Fri, 05 May 2023 19:12:03 +0000
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

The pull request you sent on Fri, 5 May 2023 13:10:28 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-next-2023-05-05

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/084f51d473cd566eab310d5da56fe7b68d0b10be

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
