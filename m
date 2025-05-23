Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F12EAAC2BBF
	for <lists+dri-devel@lfdr.de>; Sat, 24 May 2025 00:34:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B85B110E0F9;
	Fri, 23 May 2025 22:34:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CfE5OUlo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3378210E0F9
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 22:34:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id EA50E4A13E;
 Fri, 23 May 2025 22:34:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C605AC4CEE9;
 Fri, 23 May 2025 22:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748039655;
 bh=4r3UIicXzL93rez55y7jxvtvvH1snU3EFIPqLhkQ+4U=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=CfE5OUlotypMdC7aZQESHIdfJoi09woAYw1GD/o36/g2FBvcBcj9iECmqCSaPk4Ki
 D7DlyMVqvi4hAHK9bRBaGiEDQrjIWQnllCQ6+76QsevdSFWcRlK2/whzBJL4UgiFsn
 dkmFVen+Dr5QznR9vthM3X9pcKV/yoBKAx0lLVWY3WLwrWrA42bmmJO0W5duKiXWqm
 /gIKwk1U3MkgyXEKBA809PO+leXZUuMDz2HKLndPwlgnT6cP7QcLzdNWPNqM1Ey2aw
 YEe7IMhzpH2bQ3zzKGoa2Do42gty2cE+OB0AgSROGERemjjAAk2/lvh8W81s8LrfqZ
 JW1+PBcy/P6cA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 3416D380DBEB; Fri, 23 May 2025 22:34:52 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.15-rc8/final
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twqWSXu3sU+f7Z5WvnZhppvg2G4NkDkSRL8y02k2p+EoA@mail.gmail.com>
References: <CAPM=9twqWSXu3sU+f7Z5WvnZhppvg2G4NkDkSRL8y02k2p+EoA@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9twqWSXu3sU+f7Z5WvnZhppvg2G4NkDkSRL8y02k2p+EoA@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2025-05-24
X-PR-Tracked-Commit-Id: fe1e5a1f2d1c2d4385a414dacca0e5275c0af281
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4856ebd997159f198e3177e515bda01143727463
Message-Id: <174803969072.3749917.5235088097409453205.pr-tracker-bot@kernel.org>
Date: Fri, 23 May 2025 22:34:50 +0000
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

The pull request you sent on Sat, 24 May 2025 08:15:22 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-05-24

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4856ebd997159f198e3177e515bda01143727463

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
