Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 817B76553D5
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 20:23:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D79B510E1D2;
	Fri, 23 Dec 2022 19:23:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFB9910E1D2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Dec 2022 19:23:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CCB45B8210B;
 Fri, 23 Dec 2022 19:23:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7815FC433D2;
 Fri, 23 Dec 2022 19:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671823382;
 bh=Fxi2sOZjJhlKYb3m1ljiNiWIqh7FzU2mEUav2fKJ3pU=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=uRFFv3ANvv/4O6evGlCV1NMtOJgZhfh5wpv6eFpu0QJB7Df7dfBoY7GZLHw6N10hU
 8L+ChDKOFMin5wb8draTHpKEj4GnM3rfpSDb8OL+MZTzvnJY4KqviTPxyDIJ++artT
 yvTksPewMeeWNRMxP7Fy9+nB4DqubGyJauXHb6IKAyIytaGsLifv9hfIqFpFKDxSQd
 T4ym2naoJCXhOtwTI0D1piMaPxCyjnpu4L5vkcs65v29r5aqWS7rw9xBkpaAxnZsGL
 /j5URBMYKNYllVMKMFtlMO3bdE0zod9M7PfRWpjcwRMxGMh8WydvZsrqe9ZhVYStsv
 EpZF20iiiy8Sg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 66F64C43159; Fri, 23 Dec 2022 19:23:02 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.2-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tye2Py9FXHP5qcNnb2BEa0yWNe4KDdfh5Vxpr2YMDwDeA@mail.gmail.com>
References: <CAPM=9tye2Py9FXHP5qcNnb2BEa0yWNe4KDdfh5Vxpr2YMDwDeA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tye2Py9FXHP5qcNnb2BEa0yWNe4KDdfh5Vxpr2YMDwDeA@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-next-2022-12-23
X-PR-Tracked-Commit-Id: fe8f5b2f7bec504021b395d24f7efca415d21e2b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 55c7d6a91d42ad98cbfb10da077ce8bb7084dc0e
Message-Id: <167182338241.13713.3615144832427178391.pr-tracker-bot@kernel.org>
Date: Fri, 23 Dec 2022 19:23:02 +0000
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

The pull request you sent on Fri, 23 Dec 2022 14:02:33 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-next-2022-12-23

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/55c7d6a91d42ad98cbfb10da077ce8bb7084dc0e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
