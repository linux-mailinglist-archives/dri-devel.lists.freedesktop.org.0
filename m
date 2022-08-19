Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0459559A2AB
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 18:50:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 298B210F4A2;
	Fri, 19 Aug 2022 16:50:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C8B010F493
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 16:50:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 29D15B82844;
 Fri, 19 Aug 2022 16:50:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D75E5C433D6;
 Fri, 19 Aug 2022 16:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660927803;
 bh=cSdsWeqdGn8SEt2YjuZktKCzw5+88mf/N/Xl3/Z0VZk=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=HY4v0g5G8hlRyNS9TuCtCjZTHapTOAvqzHtIhUOz/ZNoj/b41On2tWelEgJZtodqJ
 yl/uc6JDYLmzIT/MyrF8NMjxPAcnj9Glu61hLEonjOM1dVXc2aFnKkTXzUAa3sF8m2
 lgWfztGPZ+rN+Prbo3cGXbjhVACqY3PORmaZFch4bee0rT7l2y9w8nTN1q4CQWztmy
 Pa+AGTwQm3ZV8HaXrruZH6SVM/0KpoQ8OjcKtgB+nt7lHycGmB1iJLoH4i6ZqRhb9D
 GvBBEqwz0HpiHcmF6Iolg1HlWZrJJ1ByCPra2a7BjgLzCc2SbeUXZ4PA4fBz90LI59
 Fv5nhUutsdI4Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 C3BC3C43142; Fri, 19 Aug 2022 16:50:03 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.0-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tx=MmC2wezaYG7m0A71jdL=niFrFhcXxaS8Z5=6Rf88Qg@mail.gmail.com>
References: <CAPM=9tx=MmC2wezaYG7m0A71jdL=niFrFhcXxaS8Z5=6Rf88Qg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tx=MmC2wezaYG7m0A71jdL=niFrFhcXxaS8Z5=6Rf88Qg@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2022-08-19
X-PR-Tracked-Commit-Id: b1fb6b87ed55ced458b322ea10cf0d0ab151e01b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: adb67b373a68b6ca4ea9225e248d726f0f5f0f8d
Message-Id: <166092780378.6250.14756136209870183584.pr-tracker-bot@kernel.org>
Date: Fri, 19 Aug 2022 16:50:03 +0000
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

The pull request you sent on Fri, 19 Aug 2022 14:05:45 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-08-19

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/adb67b373a68b6ca4ea9225e248d726f0f5f0f8d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
