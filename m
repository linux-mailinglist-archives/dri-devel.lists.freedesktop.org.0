Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6B1876D15
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 23:28:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 365FF10F624;
	Fri,  8 Mar 2024 22:28:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="G5i0hI8R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BE2710F624
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Mar 2024 22:28:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1229760F95;
 Fri,  8 Mar 2024 22:28:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B10BCC433F1;
 Fri,  8 Mar 2024 22:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709936905;
 bh=r0RlwkZIdYJdCpEvDjJq8InKgNTycgDnFZkRru/ubwQ=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=G5i0hI8RjEDR/oh1ZOK+lwd5pgV+KzQ0kYTDbCcwUfIvOoHnuItUY2SNSeI37kakH
 3LVMUwJV/K/ODQHylzoaHV4jcdOHBLnai0apUu3G2RsiLiwnoWgys+Bd1ItniKX6BO
 c+lQFno2YlCFfR/Y2yTgyoOjzF6R695eNl+9CzBrVEAPLfr3QGNUTx6LtiKcK6G/ZO
 IpIo4eHhrIDBAuNweGefUn82fDueXEpkmb/7x/0YG16egk0AGrCPdpNwFLlSjemzVz
 6OaM3JflvvnAErszEzawHIyiZ+nvTGk03o2DmVxGkwqLbGQnM5S4ZdBb4jqi5SXS5f
 p/4A2NpFu58uA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 9D9E5C59A4C; Fri,  8 Mar 2024 22:28:25 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.8 final
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzTeAgY3rUR_KC8=q5MybJ5PDAyzXJyh0RUigR6_ccyZA@mail.gmail.com>
References: <CAPM=9tzTeAgY3rUR_KC8=q5MybJ5PDAyzXJyh0RUigR6_ccyZA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tzTeAgY3rUR_KC8=q5MybJ5PDAyzXJyh0RUigR6_ccyZA@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2024-03-08
X-PR-Tracked-Commit-Id: b7cc4ff787a572edf2c55caeffaa88cd801eb135
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e6fac3c1f3287735faf1b68e0068f64e6966618d
Message-Id: <170993690564.2485.2022006535317820472.pr-tracker-bot@kernel.org>
Date: Fri, 08 Mar 2024 22:28:25 +0000
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

The pull request you sent on Fri, 8 Mar 2024 13:52:40 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-03-08

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e6fac3c1f3287735faf1b68e0068f64e6966618d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
