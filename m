Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86951A35597
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 05:09:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97CCA10E473;
	Fri, 14 Feb 2025 04:09:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="duB0EWOq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 072AD10E473
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 04:09:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 850A15C4671;
 Fri, 14 Feb 2025 04:09:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BDC8C4CEDF;
 Fri, 14 Feb 2025 04:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739506188;
 bh=k1HtaViSWdj5Ew70nPWbSAiNehFJrH6pENr0/QKgMlQ=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=duB0EWOqyLohznJHnEWh8IjZy9aBwpRzvc5ofiZCNzk5BjfDfm4hmPRJNaWrfKx0O
 exZ18XaqN3uJSlN16uVgZ0fV/zF/mz0Mz4b0BlLheZyHY+XcfsUfIbUK3hlPbsTPsZ
 Zn+yYjFmpwjxdSsDdVKJx0qQiGbWDgZadE6ZpAgkMSW2APpRCodqvDeXL9GFyX2jno
 rixfHajirFH5rg/5WoTT5uxAo1MRzaRvjH2Ev9R1QqNLeMPHd9+AYlvscdV4uvkOAb
 301IhKIectbysuQJKa0uDdwXzMQPgNc83RRz8fDKoub9+x5UII8/fKJLP8IwQ6UiyV
 GxVYXJX+K1bdw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 34551380CEF8; Fri, 14 Feb 2025 04:10:19 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.14-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txeA4G80xej2orc-_y1=cEBaxY2Hw-48v0sw485UjuWyQ@mail.gmail.com>
References: <CAPM=9txeA4G80xej2orc-_y1=cEBaxY2Hw-48v0sw485UjuWyQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9txeA4G80xej2orc-_y1=cEBaxY2Hw-48v0sw485UjuWyQ@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2025-02-14
X-PR-Tracked-Commit-Id: 04485cc34868892a823b909c6d5468ba21b63569
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 128c8f96eb8638c060cd3532dc394d046ce64fe1
Message-Id: <173950621795.1492982.7917084634100432792.pr-tracker-bot@kernel.org>
Date: Fri, 14 Feb 2025 04:10:17 +0000
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

The pull request you sent on Fri, 14 Feb 2025 13:34:04 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-02-14

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/128c8f96eb8638c060cd3532dc394d046ce64fe1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
