Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF437A490DA
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 06:21:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E75A10E18B;
	Fri, 28 Feb 2025 05:21:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="q5uBmvJ3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C00DE10E18B
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 05:21:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 140C55C5D4B;
 Fri, 28 Feb 2025 05:19:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A20BC4CED6;
 Fri, 28 Feb 2025 05:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740720086;
 bh=IiO6bqvHvrlwdns6n7FZHG/SXwx+AjPzl/gQzbxXnnU=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=q5uBmvJ3Y83djE9Wfivnxqk2ynyzI4Xxwr+5NwVdbpRrOk+S3xHKNvPm2LuA1wA6O
 rU0fMxv0gOa7Uc2P6nus3o6cM5v0ZRnyhaUncUt8hWACkCIqV4ldwPzGF2T2e67kpu
 IV/vk57Rw8SvYG8wWogG6WfFNGrCzrhgFg6IpE3C8QyLD4vk7oTEFx0G/ghyszszoy
 EsAk3oVw9j2sfbBBcU5iyGHTm3Wh5QcpUP7vPrhUVAjfQI3/3qzvxDvsopMJzKw8lM
 uM1OsedaRh5ILf0f18oAsCyLJzAI5QeHKXKqZNlPrir+Qk8mAV5V+mxMw9Z0rUIJ+K
 n5WFu1+5jXjdA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EB185380CFEC; Fri, 28 Feb 2025 05:21:59 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.14-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzCwv8Uhq9BzwMJ_rQoxEBAEFDQzcFJms=cmD9Njrd3hw@mail.gmail.com>
References: <CAPM=9tzCwv8Uhq9BzwMJ_rQoxEBAEFDQzcFJms=cmD9Njrd3hw@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tzCwv8Uhq9BzwMJ_rQoxEBAEFDQzcFJms=cmD9Njrd3hw@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2025-02-28
X-PR-Tracked-Commit-Id: 6a5884f200693eeffac4b008faf1e8bdf1c92af5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 76544811c850a1f4c055aa182b513b7a843868ea
Message-Id: <174072011849.1692901.9839987485498147780.pr-tracker-bot@kernel.org>
Date: Fri, 28 Feb 2025 05:21:58 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>,
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

The pull request you sent on Fri, 28 Feb 2025 13:10:16 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-02-28

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/76544811c850a1f4c055aa182b513b7a843868ea

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
