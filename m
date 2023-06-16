Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C24733C25
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jun 2023 00:14:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD82E10E142;
	Fri, 16 Jun 2023 22:14:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E66510E142
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 22:14:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E886461129;
 Fri, 16 Jun 2023 22:14:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 565F4C433C9;
 Fri, 16 Jun 2023 22:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686953669;
 bh=hV/FvkB09pCNwQ9hBUvaaDuYdmbado/FaNsrPGvDNds=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=jzR7t5SPgUL0wzWO9mA322QKIHi+9q9kpAfyvo4SVJZD0Hm2xwci9QOtPlepplugT
 pWNnz1isN4LqzOUf8lahXlkHfMxv95TICnsEaeQ5eRrlH2jVoRu2vjyv1WRvzyacrE
 xrGnWhFD/z4q2btQpdTFDewb5lgXlPVUJLOT8sYTIT/PA5OGXw8P5JiCL1MwQkR3iA
 xwZMo0N6m63QE7oDqIHYBoI/BbfALU65PbTqh9vnuu/8Hu/MvTZjZvI9/YrtQm21K8
 NfbWH5YmmxN9DCIF2vB1D1+2JnAs3VjnOhpPsmcxEkCd1lWxVLgRBhyk//lPARXZm0
 TQscyWcMuVKAw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 42868C395E0; Fri, 16 Jun 2023 22:14:29 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.4-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txbkXVgrbDbqezqBVLVXdBx4+iwfJPTVWLzWuGtDsTT_w@mail.gmail.com>
References: <CAPM=9txbkXVgrbDbqezqBVLVXdBx4+iwfJPTVWLzWuGtDsTT_w@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9txbkXVgrbDbqezqBVLVXdBx4+iwfJPTVWLzWuGtDsTT_w@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2023-06-17
X-PR-Tracked-Commit-Id: 9930f518b6a82ff10a3d13e0cbde05cce04f5930
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1639fae5132bc8a904af28d97cea0bedb3af802e
Message-Id: <168695366926.15703.2415002187192615232.pr-tracker-bot@kernel.org>
Date: Fri, 16 Jun 2023 22:14:29 +0000
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

The pull request you sent on Sat, 17 Jun 2023 06:29:31 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-06-17

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1639fae5132bc8a904af28d97cea0bedb3af802e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
