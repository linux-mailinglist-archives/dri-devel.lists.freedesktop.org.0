Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E115954EDE
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 18:32:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A788C10E59F;
	Fri, 16 Aug 2024 16:32:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oRvGps54";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8602810E59F
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 16:32:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B6EFF6224C;
 Fri, 16 Aug 2024 16:32:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69ED1C32782;
 Fri, 16 Aug 2024 16:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723825959;
 bh=EPs0IqSoJTfi4M7WPh40SrWqMnzvWxfTqkGPO3jiRnQ=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=oRvGps54XkvBUTtCqz4PwCZl7oLA7IH9tpJBT1ADuMe0vfzfMDzpdpYzLAC1ik4LH
 vdgnHe0L1ZJMdePLzK2/n8meL4sxQp+mkj+HZwrHOctNNwhguboj/Rd48e9Li+z07E
 yK9Ei/NqA7mplB5BtmljWaXeKR7hW3ldvjS1Wf5G64EaiUN1OAJS4uFG0Ewv4OgaPD
 7Prugn9ntmc07Ghhjt8RJnAFo4bo8amyyX98BMktK++lzX2OJv1UzUO/RsXsOXeKiS
 fvLUjN0JkVjVtgSM1kyUyen5cdG+47lZndKxlixyUUMJ8aEbIIhIO9/Cu8Zyqt7EOL
 CyGgpb02IGRww==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EB42138231F8; Fri, 16 Aug 2024 16:32:39 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.11-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tx8NORNyjwOMapLrZwGEVxgVxYDmChmkLOwz1vyYUgoGw@mail.gmail.com>
References: <CAPM=9tx8NORNyjwOMapLrZwGEVxgVxYDmChmkLOwz1vyYUgoGw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tx8NORNyjwOMapLrZwGEVxgVxYDmChmkLOwz1vyYUgoGw@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2024-08-16
X-PR-Tracked-Commit-Id: fee9d135e2fd5963a7f466cd1ef2060731a1ab29
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 37b20e9a5810e132a21c54f858043b22671396dd
Message-Id: <172382595844.3569819.178240747837345650.pr-tracker-bot@kernel.org>
Date: Fri, 16 Aug 2024 16:32:38 +0000
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

The pull request you sent on Fri, 16 Aug 2024 14:09:28 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-08-16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/37b20e9a5810e132a21c54f858043b22671396dd

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
