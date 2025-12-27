Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD7CCDFF6F
	for <lists+dri-devel@lfdr.de>; Sat, 27 Dec 2025 17:47:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A73A810E6DC;
	Sat, 27 Dec 2025 16:47:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eZn02g+0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E54310E6DC
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 16:47:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 559E66001D;
 Sat, 27 Dec 2025 16:47:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B555FC4CEF1;
 Sat, 27 Dec 2025 16:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766854034;
 bh=feVrxW2D14GG8nmYGLYiEk+ba8PDHUjwIxcnY7ZzeIc=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=eZn02g+09vGBBQvKZaL0RP23YRi5GS7WywpFIlE+rxiPqNoMs+40HJ9N3RakU5VsQ
 p8kfYta+QPmHfbj77MUNyS9JcFKPdh4Ij/vyDm1OAQVXLryTlfmSW6oAEmanfoBxL4
 XpJb9cYKtbFIJJ17HLSZatMymAGbQzjKtSejx9+iKsYEWOV28FuBx5LvNa3uNoN4VM
 LUyXAB4eu5YgkY6GQKpPxY3PP29GHlrRvfVhzw0p6pKPXxVEGdJrVNoW56Y7V9FZKH
 F0DXP2zp8ly7xsWVNc9jtZQ7vJ4qco/mJVLzS5JgXFNr844n6XkyodpTNeLOzbj0ij
 YUsC7TMbDGmHA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 B5D043AAA77D; Sat, 27 Dec 2025 16:43:59 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.19-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyGDTYxiidazi2j26BbGpoFmw1R8FHs1BZ26qkGcAiTKw@mail.gmail.com>
References: <CAPM=9tyGDTYxiidazi2j26BbGpoFmw1R8FHs1BZ26qkGcAiTKw@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tyGDTYxiidazi2j26BbGpoFmw1R8FHs1BZ26qkGcAiTKw@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2025-12-27
X-PR-Tracked-Commit-Id: 479e25d88d1681e04cac708501180db606aecd1e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0d362c7fa165106b4facafb23906108a9db4206a
Message-Id: <176685383831.2174632.8580527009113147653.pr-tracker-bot@kernel.org>
Date: Sat, 27 Dec 2025 16:43:58 +0000
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

The pull request you sent on Sat, 27 Dec 2025 16:31:45 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-12-27

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0d362c7fa165106b4facafb23906108a9db4206a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
