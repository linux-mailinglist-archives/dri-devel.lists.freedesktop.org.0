Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A620878E18A
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 23:40:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6368B10E0F2;
	Wed, 30 Aug 2023 21:40:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B5F310E0F2
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 21:40:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 629C264209;
 Wed, 30 Aug 2023 21:40:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C7C17C433C7;
 Wed, 30 Aug 2023 21:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693431646;
 bh=2YqB2pheC0MTEY+s9TZ1CUVqBOPY3yxPNIM6CbS6sgI=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=RsV8EKSx4Niu1BJnyTQgQVoHwXERGczOEMTzRH12eE3UycVT4kuVfVeKyrIPFWG0M
 ap8UZ5CzemaIFQ68x9rqxyDbl1DR4VBYQT8zyJxzNQ6F+k6JLvrw1B6JP1nCLkWgzk
 LpT94FmA/PyT8YKnR/tXWp6NZxpJFVs1MtkUCOPMRXzV+DKzJI1g9UeKhf4rQKEIcg
 G1pK9y1AbZJvueglGOyAO2DmFADQYwZxEvNrX+2pxFQjZrPkREs0Eah6FBa0WlApJD
 nHhC66hUCZLCOIBZlICDqAY2gSH9KukiNflwBq46xsf5OwDWEKVPb4zw/yFsVZZj6t
 n10fLvKzwTwVg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 B43E7C64457; Wed, 30 Aug 2023 21:40:46 +0000 (UTC)
Subject: Re: [git pull] drm for 6.6-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tw+0kKGEnCnCTmv8soNA_Kh13DoGs-G-TF7d_kOXWzaGw@mail.gmail.com>
References: <CAPM=9tw+0kKGEnCnCTmv8soNA_Kh13DoGs-G-TF7d_kOXWzaGw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tw+0kKGEnCnCTmv8soNA_Kh13DoGs-G-TF7d_kOXWzaGw@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-next-2023-08-30
X-PR-Tracked-Commit-Id: 3698a75f5a98d0a6599e2878ab25d30a82dd836a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 461f35f014466c4e26dca6be0f431f57297df3f2
Message-Id: <169343164671.19418.11925741247385922668.pr-tracker-bot@kernel.org>
Date: Wed, 30 Aug 2023 21:40:46 +0000
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

The pull request you sent on Wed, 30 Aug 2023 11:03:03 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-next-2023-08-30

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/461f35f014466c4e26dca6be0f431f57297df3f2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
