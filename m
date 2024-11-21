Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 848849D5641
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 00:40:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25FF410E186;
	Thu, 21 Nov 2024 23:40:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PWaz3sWP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6887C10E186
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 23:40:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BFA62A40AF5;
 Thu, 21 Nov 2024 23:38:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCBB2C4CECC;
 Thu, 21 Nov 2024 23:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732232413;
 bh=OEI1zGoC5H5yrTBGrw3wlLOg/qNXlU2yPu+78SxDS20=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=PWaz3sWPZ8xqrlss4Bz/o7MimK5PueTD3VrFbhqd6TJI5yY1dNRHvll4+4tu4Fri4
 RRqBXQlQJKC7FantAeUp2VzGq0wwX5Xnk/P9giYRuzXWiVew7xW1VNcglJQCCWXwlc
 befJKGZww6zQpMeDqPCuNPmvb7lhtccD+wA1ivpsLTrZJGIS4FmgvlvVnSZ9LYa3On
 QRzk2TmOo9vt8DqyJ2qs9rN5BlXXDjMKZQ7ieKdknFxLSHRvXFZTXTvIG+XeLLtlpN
 Xv6kc6pWhYjzjn4uym4fWiFaDpiq1hk3csTCU4bmJPUKtPMc/217dvtn0WDKsPdO7c
 x5jj1rReLNY3A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EB3E33809A01; Thu, 21 Nov 2024 23:40:26 +0000 (UTC)
Subject: Re: [git pull] drm for 6.13-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txbfH8vf-YjwTXEYL729a6r2eeLBxCJc3MSD-t5jXVA-w@mail.gmail.com>
References: <CAPM=9txbfH8vf-YjwTXEYL729a6r2eeLBxCJc3MSD-t5jXVA-w@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9txbfH8vf-YjwTXEYL729a6r2eeLBxCJc3MSD-t5jXVA-w@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-next-2024-11-21
X-PR-Tracked-Commit-Id: a163b895077861598be48c1cf7f4a88413c28b22
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 28eb75e178d389d325f1666e422bc13bbbb9804c
Message-Id: <173223242577.2158732.9039191642689505816.pr-tracker-bot@kernel.org>
Date: Thu, 21 Nov 2024 23:40:25 +0000
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

The pull request you sent on Thu, 21 Nov 2024 10:25:45 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2024-11-21

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/28eb75e178d389d325f1666e422bc13bbbb9804c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
