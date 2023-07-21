Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE9E75BCDD
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 05:40:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69B3B10E616;
	Fri, 21 Jul 2023 03:40:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EAB810E613
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 03:40:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C5F3260DF5;
 Fri, 21 Jul 2023 03:40:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 332B9C433C8;
 Fri, 21 Jul 2023 03:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689910828;
 bh=Q51TPPWWwycteTmV51RjTNt/Z003CwT+pqLt6PhyHLg=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=g843LGc+x8nzdUGnvWhKDN5EED+oJkLq2K/Kbv7u8YKRVHoxCE2FciEtQwn48tS/p
 5QHKYze644GnrHc2oHQOjHjeo7mc/7aY8ssCV7mdQ2Sapkc0nlHkNHrMHAknPh13Nb
 YGKty8n9Si1tzZo+H3aLiJDQU/l4XMRq7mRmTf9n0W0HTydnOEPoiH3VBxQkhCXb7S
 tkhjWFxrYd0qFYi4Mu3kjSlQOzXFk5vVCeE0y0wePwKvJ/6ZShGatim43VQH8wxaWv
 EAZz/GAoS6LsLjbP6z6vXE81Y2YsBcYR4BuDRGao00i1J15U2XI0FyG1b3T8dQNgah
 VA78WtZWghbtg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 1F876C64458; Fri, 21 Jul 2023 03:40:28 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.5-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txWYVhy+bM9EMBDy3p=vqCE=E_yHPb6GRC_Zx-EN42RSg@mail.gmail.com>
References: <CAPM=9txWYVhy+bM9EMBDy3p=vqCE=E_yHPb6GRC_Zx-EN42RSg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9txWYVhy+bM9EMBDy3p=vqCE=E_yHPb6GRC_Zx-EN42RSg@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2023-07-21
X-PR-Tracked-Commit-Id: 28801cc85906ea62043e62c71def7f9daaf1c168
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f7e3a1bafdea735050dfde00523cf505dc7fd309
Message-Id: <168991082811.19113.7882791124688893958.pr-tracker-bot@kernel.org>
Date: Fri, 21 Jul 2023 03:40:28 +0000
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

The pull request you sent on Fri, 21 Jul 2023 13:14:05 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-07-21

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f7e3a1bafdea735050dfde00523cf505dc7fd309

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
