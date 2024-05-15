Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8FE8C6B64
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 19:20:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B12EE10E354;
	Wed, 15 May 2024 17:20:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GcpyKTRE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01BBF10E354
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 17:20:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5EC9760ACD;
 Wed, 15 May 2024 17:20:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 11947C116B1;
 Wed, 15 May 2024 17:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715793613;
 bh=evynaZF+OdsmiraBszgjNj6hgX4XcROF8T2Q9yrv3ds=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=GcpyKTRExXUD57W/csLHMlk4AGhEijnP+27w4WQJR7tz2emsnDW5BV+zMOwsvoVMG
 mvIQ7lUYTtp76Og/PumJYFICR8zqoYHM5jVmPyzHNgNy4+ENGmyCjqEo7EX6kTXSjM
 kRw9ouHmguxOYzWxgp+d04Bl3SYx/DzVzLVEuEFZ/eqlb1WUI4A92/RQ9gJaT9i7G2
 c7dEbSNmH0ro51Bdr5OBLxhRD/i54tRDkoKJ5LyhrfprgU5XJDlB0RXLO5PdybzyxH
 bi09YQ7OEMJzdvHUBTCqL31ozDMuqepV6l2Dv4w0m7sPJcjSEN3ZRtknPf5m1xvDcz
 I/Ch3QIDTpgog==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 08C2EC433A2; Wed, 15 May 2024 17:20:13 +0000 (UTC)
Subject: Re: [git pull] drm for 6.10-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tw-53PCvveRcdLUUQ+mjq2X2er5zp6n1KeE8Nu8x=VP2g@mail.gmail.com>
References: <CAPM=9tw-53PCvveRcdLUUQ+mjq2X2er5zp6n1KeE8Nu8x=VP2g@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tw-53PCvveRcdLUUQ+mjq2X2er5zp6n1KeE8Nu8x=VP2g@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-next-2024-05-15
X-PR-Tracked-Commit-Id: 275654c02f0ba09d409c36d71dc238e470741e30
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: db5d28c0bfe566908719bec8e25443aabecbb802
Message-Id: <171579361303.17791.11513989633899043227.pr-tracker-bot@kernel.org>
Date: Wed, 15 May 2024 17:20:13 +0000
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

The pull request you sent on Wed, 15 May 2024 16:20:56 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2024-05-15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/db5d28c0bfe566908719bec8e25443aabecbb802

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
