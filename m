Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB4889E0EF
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 19:01:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11E47112E2D;
	Tue,  9 Apr 2024 17:01:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="faIIQoRI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64C05112E2E
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 17:01:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AB22660F0F;
 Tue,  9 Apr 2024 17:01:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 506CFC433C7;
 Tue,  9 Apr 2024 17:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712682066;
 bh=zkfEmDXLMJHk1BR2ziIl//FuBOqoV+3WVkeQldg5bOA=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=faIIQoRI74JerS0dTL3g2jeqt9cWCJvt75BREWksBvB0NA0GQCg9WQxAXBTC0VyKp
 oGn4YckMJBjQ4Ex1B48m2BeFOBNYMvUb84OEXjs+SiAlbFPGsOw0pL93tdL3kRhtJn
 1d16+sjZFxvVxR+iY+IS5a7HGrD5QsKB6nEJMmVk+uQVR1/TqMOF5xMYdfsNun8PwK
 RP4nDfkWTRq5Qa+Je5k7GTHW6DbXYjh/zD4r1t8Xd1IBWb1i42RRxyUk0/Bf0snUcs
 vR4IOWKKxRuRjyGtg/J8Yj5ctlJAESPXCgfBPORx/9HYlGjKVxaqN5zSeycFbjo8V1
 z0g+7EMZt+FOQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 449C9D6030D; Tue,  9 Apr 2024 17:01:06 +0000 (UTC)
Subject: Re: [git pull] drm urgent fix for 6.9-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tysq6sxv-HRUf4+AoAoC0YA_s0tUz6ujms0FcxrgtOUdQ@mail.gmail.com>
References: <CAPM=9tysq6sxv-HRUf4+AoAoC0YA_s0tUz6ujms0FcxrgtOUdQ@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tysq6sxv-HRUf4+AoAoC0YA_s0tUz6ujms0FcxrgtOUdQ@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2024-04-09
X-PR-Tracked-Commit-Id: 718c4fb221dbeff9072810841b949413c5ffc345
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2c71fdf02a95b3dd425b42f28fd47fb2b1d22702
Message-Id: <171268206626.20201.11838545735612957768.pr-tracker-bot@kernel.org>
Date: Tue, 09 Apr 2024 17:01:06 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
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

The pull request you sent on Tue, 9 Apr 2024 13:29:41 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-04-09

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2c71fdf02a95b3dd425b42f28fd47fb2b1d22702

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
