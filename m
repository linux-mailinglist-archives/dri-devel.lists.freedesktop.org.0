Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0499F780591
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 07:18:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE20210E444;
	Fri, 18 Aug 2023 05:18:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9784610E444
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 05:18:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0DA9967931;
 Fri, 18 Aug 2023 05:18:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 77399C433C9;
 Fri, 18 Aug 2023 05:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692335901;
 bh=Wzeqo346ORd+82hsYic/LXIlDoFPY/a8ndi52rdPnPY=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=Mls5yUE5dbEaV/16j+LbBqZrTcIbQcN2MuLlnD/gmrHBuvOAJ1Ns8tWEN1RAu0tmr
 SZ/87l4DuhN2jV/VI4mpEtQQk66f8HN19T4ULIlHOS5k4A3cc/4VatREw4ub/VyvYA
 kaw757mdp3kWojDaAurXuPCR9ITUKcvqiDfiThnWHlbgoF4+dxtWFXFZA+q5oBcxd6
 8VnDHcpq4WtUJ3ibOuJgCF+HHMkJnr3PuXu6TFXWyoYNTadtHX+ctErC8DuffRT5K/
 8UJUDzKVdRIyaDOCr1taEBSnH9uAR29rcdho1pr+gcGQ7AUKCZOBd3L6xnBKDQo0aR
 Q3pk6CmM1p+NA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 64853E93B34; Fri, 18 Aug 2023 05:18:21 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.5-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txN=kOYfE1a4VDrLWz+fvGuhXDuzDo7AK3-DuOEJoO41Q@mail.gmail.com>
References: <CAPM=9txN=kOYfE1a4VDrLWz+fvGuhXDuzDo7AK3-DuOEJoO41Q@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9txN=kOYfE1a4VDrLWz+fvGuhXDuzDo7AK3-DuOEJoO41Q@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2023-08-18-1
X-PR-Tracked-Commit-Id: c611589b4259ed63b9b77be6872b1ce07ec0ac16
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1ada9c07407d66679967fe5c2cbb7eda2e0addbf
Message-Id: <169233590140.13368.7714490052708786460.pr-tracker-bot@kernel.org>
Date: Fri, 18 Aug 2023 05:18:21 +0000
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

The pull request you sent on Fri, 18 Aug 2023 07:36:16 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-08-18-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1ada9c07407d66679967fe5c2cbb7eda2e0addbf

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
