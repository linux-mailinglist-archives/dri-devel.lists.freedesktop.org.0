Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3757A282B
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 22:34:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC3D310E67C;
	Fri, 15 Sep 2023 20:34:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 165A110E67C
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 20:34:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 647E4CE2D79;
 Fri, 15 Sep 2023 20:34:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A47B7C433C8;
 Fri, 15 Sep 2023 20:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694810064;
 bh=v2cKYQF57ebTGy3AcWzmBogroLUPUTDEab9RJsVy71Y=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=Fzi9CLEKTCGE6eRBP+0gG86+vs15o4HsXv0hixIlUfNaTmUUVEf0OfAnKNqWy/I4f
 rKcQj2f4CO/4WciJ9skR9hcjMJhB53yjFODxP18FPxNm/Cn3d+ynz7v8+pZr35oIa5
 4ZTKctZDy5C+7WEww3qTPgh7FLLA4mgBGiQP7ZTbI1BxrTGUNrsLxHoxwFh9tgEDkb
 G86Cqkt+5CbhlydEpmGHH3di4tzW/o2B3XcM+8z3zJaguEZj1pAkQ2mLCmzfOSsaeV
 WDN7GDs3gBnerlFxXN6A0eWWyd0V/G4MV9tFqPBqJCSPlsAj2+jamZH19glAU2WZlq
 a364cQjwbsUiA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 93604E26881; Fri, 15 Sep 2023 20:34:24 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.6-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tx4M13E1G_a2CsE0W_48g-n4=HDpsiWoHnE_raBaLQoxA@mail.gmail.com>
References: <CAPM=9tx4M13E1G_a2CsE0W_48g-n4=HDpsiWoHnE_raBaLQoxA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tx4M13E1G_a2CsE0W_48g-n4=HDpsiWoHnE_raBaLQoxA@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2023-09-15
X-PR-Tracked-Commit-Id: c3c9acb8b2466ddf7f00fc11e2efb736b5252172
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9608c7b729e29c177525006711966ae0fd399b11
Message-Id: <169481006459.17233.14873885417378522669.pr-tracker-bot@kernel.org>
Date: Fri, 15 Sep 2023 20:34:24 +0000
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

The pull request you sent on Fri, 15 Sep 2023 12:57:50 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-09-15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9608c7b729e29c177525006711966ae0fd399b11

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
