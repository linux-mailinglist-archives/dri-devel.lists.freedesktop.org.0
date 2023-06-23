Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A6173C4F1
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jun 2023 01:53:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 055A810E6DB;
	Fri, 23 Jun 2023 23:53:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 983CF10E6DF
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 23:53:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9192260B54;
 Fri, 23 Jun 2023 23:53:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 000C7C433C0;
 Fri, 23 Jun 2023 23:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687564400;
 bh=SmwX2lvlvOqVnsPOlGLSrN6eUGPiFK4K57Y8Ozrdyc0=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=L3Q4ynSaRiy/fKVOKx4D22zpI50bdUKvDKFRoFmuOk1qunAyhBOGHPeeGZM1f305n
 ioGFKIxALXLrkr7FtJvzVLX+WWuKGttravABCtg8QmZDxE5HLlu3wJOhJbNmV0DINk
 cCY1Eu+xnl71Kg9U9iVhpt+QpuQhvpwn4sbGJnebbXQ0ArZ9bjytCjYywiFeheG1p2
 vkso01BPF3hnqqPsfaRHP1Jzyj0RZ7tpQmp0kB/ShXGaZvFfKdWdka7kwVyLQGIl53
 ejBDL13JWWhWTMMDNNSKZnjveokt5fxM94iCafXMq5ufYn5jOyX7FPyQNUwlcp7itl
 wBB0NyfPAFkbQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 E130DC43143; Fri, 23 Jun 2023 23:53:19 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.4 final
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twXadK-V1qttzJV3ks8hZu7jY3Nswzw6EgGADnJZF2+fA@mail.gmail.com>
References: <CAPM=9twXadK-V1qttzJV3ks8hZu7jY3Nswzw6EgGADnJZF2+fA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9twXadK-V1qttzJV3ks8hZu7jY3Nswzw6EgGADnJZF2+fA@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2023-06-23
X-PR-Tracked-Commit-Id: 9bd9be5cbaf8a8faa175ef4fba04a5623281debe
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a92b7d26c743b9dc06d520f863d624e94978a1d9
Message-Id: <168756439991.22934.17275483142069134469.pr-tracker-bot@kernel.org>
Date: Fri, 23 Jun 2023 23:53:19 +0000
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

The pull request you sent on Fri, 23 Jun 2023 16:48:56 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-06-23

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a92b7d26c743b9dc06d520f863d624e94978a1d9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
