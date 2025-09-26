Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 626F8BA51E1
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 22:44:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E43910E07F;
	Fri, 26 Sep 2025 20:44:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eLxWj8bV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49E2710E07F
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 20:44:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D272E43ED0;
 Fri, 26 Sep 2025 20:44:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFF26C4CEF4;
 Fri, 26 Sep 2025 20:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758919469;
 bh=yMXCYBu2uR9Wdd5R1KiWjC7koriOwDZK4xIgrlEkXoU=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=eLxWj8bVOfhhQpMNgGE6qBOaWlO7uDsT+AwFe2DY2gXlLu7TT9cgjk+vpwV6/iGLH
 LpDCDkrzrNGgOyJizV5obM1LrGhguTD49MYJoeAvlNVUZsChqpvisU+hMSMHJu6c1S
 gOE3xE5pTM1QJ17vzcnvCnziKAAmS6lvQZGLmQoKYcxgOcrqP0GPX09oFNJa3d4hlL
 vHGsY/q0h4usS5NHablNA8z2GxRI4/2FjDtpuvhJmEJ22L14mBYQeYHL6srzosu2Rg
 lglrKY95x+4jQTXYzTps+Vhjd8pZAaF/hyYcmV1J5y0ZH3xLyJCEW5MZJ+PP7B2H57
 e5nwrF2KImR9g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33E1139D0C3F; Fri, 26 Sep 2025 20:44:26 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.17-rc8/final
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyfHf9jLv36vvc9=sRt0OWk-jTVq8n8uRJvu2O5a9X5bg@mail.gmail.com>
References: <CAPM=9tyfHf9jLv36vvc9=sRt0OWk-jTVq8n8uRJvu2O5a9X5bg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tyfHf9jLv36vvc9=sRt0OWk-jTVq8n8uRJvu2O5a9X5bg@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2025-09-26
X-PR-Tracked-Commit-Id: ec73e5984e01bfdf92234eaf5a2c3e54aa67f2aa
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3170244bc5cfe2a93d105aa57ff7e04ab19f78fc
Message-Id: <175891946472.51956.6955163847374952399.pr-tracker-bot@kernel.org>
Date: Fri, 26 Sep 2025 20:44:24 +0000
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

The pull request you sent on Fri, 26 Sep 2025 14:22:14 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-09-26

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3170244bc5cfe2a93d105aa57ff7e04ab19f78fc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
