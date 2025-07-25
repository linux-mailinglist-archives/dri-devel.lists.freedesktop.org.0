Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9868DB125B7
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 22:40:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C6AD10EA18;
	Fri, 25 Jul 2025 20:40:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WXHRBHFS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DC8610EA18
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 20:40:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id ACD855C591F;
 Fri, 25 Jul 2025 20:40:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B928C4CEE7;
 Fri, 25 Jul 2025 20:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753476050;
 bh=4ZyJMM3NsGdOvy5p2SRm2Vl9kymKPsHut7W9aDuZrlQ=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=WXHRBHFSdHvprnITozVMz70DJaYF4P7xQI1NECB1CtN1oLsu5QOZPC3dqZkMml4Tj
 YDzxlvlOaiNlQwRskxcmVX+DW02MRmT0p3TyR51EpUzlOM4DVFm0P618GMlp5alB/p
 /xSSNOw5Y/4nWGL+SxYoCFJgUPeaKup/X7p9KrUJy0a1md485oWTDz+Y5vMTg70ieo
 nblIR2WFT0v7x7s2irJBtHpkzTGe3QSXv2JvlkUWg9UZ+MTNgMH5wTPBorlQle9m/Z
 4+v/sHBs6uZb9Vgucrvj1bbOGg5cc7Nzn1eQFqQ0N0/WijYpuPWEfhOonzPnR8Mwlv
 E02HOxPkdTIeQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EB2EB383BF5B; Fri, 25 Jul 2025 20:41:08 +0000 (UTC)
Subject: Re: [git pull] drm fixes (part two) for 6.16-rc8/final
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tx6TmT-qQO+MDV5GXCbUbTASh2Ly=eLMJb5+rB6MyJWVA@mail.gmail.com>
References: <CAPM=9tx6TmT-qQO+MDV5GXCbUbTASh2Ly=eLMJb5+rB6MyJWVA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tx6TmT-qQO+MDV5GXCbUbTASh2Ly=eLMJb5+rB6MyJWVA@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2025-07-26
X-PR-Tracked-Commit-Id: 14e8f8e74dc137ff9f1dfb2781784ceb19497ee5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5f33ebd2018ced2600b3fad2f8e2052498eb4072
Message-Id: <175347606759.3262906.14193704908675661072.pr-tracker-bot@kernel.org>
Date: Fri, 25 Jul 2025 20:41:07 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Simona Vetter <simona@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pull request you sent on Sat, 26 Jul 2025 06:32:20 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-07-26

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5f33ebd2018ced2600b3fad2f8e2052498eb4072

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
