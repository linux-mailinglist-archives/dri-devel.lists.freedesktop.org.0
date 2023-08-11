Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF7A7794FC
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 18:45:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8826710E6C5;
	Fri, 11 Aug 2023 16:45:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1D6B10E6C0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 16:45:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1C9CE676FA;
 Fri, 11 Aug 2023 16:45:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7E188C433C8;
 Fri, 11 Aug 2023 16:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691772304;
 bh=6YgnVkkMTRGCciCd8qtzfc5pyhffPOH2dKIoXa4Siu8=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=W0XxK50pkTetaDO9uoe3ix3ooC4C1XD1CkwkE9yGxbIAy1q6dz2viti/5QG0VwsIV
 UbkxqBhLnSI9aDu82LSVtOegySFl6VwPkVuW+85RNR5cufeF4J8CMX7OVcvkzz8gxJ
 k/7usdfH0O4ayLnlzZekM/0udET55qxdThHop43zFf5UIhOxX3IEZVWVbUP1+Ij/WO
 rZrF59jI7/X9pG74S4VtYzklGiiP+hRGyz3z6QzIXVUAHcaeOmk/p7Eq0XWFUwzUD8
 RsWHn1IZ+ij3gGDQMH/CsKr9UJAXt4/AxwFV8VYL0ISwGZaCg59Lzmvhn4/upGQuE7
 94/5myJ107mZQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 6A235C3274B; Fri, 11 Aug 2023 16:45:04 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.4-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9ty-3+S5X3638GR=DT_PmApzzXS3yHy-OdvnN0xiGvZJUA@mail.gmail.com>
References: <CAPM=9ty-3+S5X3638GR=DT_PmApzzXS3yHy-OdvnN0xiGvZJUA@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9ty-3+S5X3638GR=DT_PmApzzXS3yHy-OdvnN0xiGvZJUA@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2023-08-11
X-PR-Tracked-Commit-Id: fbe8ff726a1de82d87524f306b0f6491e13d7dfa
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9b1b1b74ddb236e7ccf6d11d4c0b642fbe0c66c6
Message-Id: <169177230442.3076.5259500963907324544.pr-tracker-bot@kernel.org>
Date: Fri, 11 Aug 2023 16:45:04 +0000
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

The pull request you sent on Fri, 11 Aug 2023 16:27:34 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-08-11

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9b1b1b74ddb236e7ccf6d11d4c0b642fbe0c66c6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
