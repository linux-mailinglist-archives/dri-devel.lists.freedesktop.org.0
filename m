Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E2F52F8D4
	for <lists+dri-devel@lfdr.de>; Sat, 21 May 2022 07:09:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B2F911AA93;
	Sat, 21 May 2022 05:09:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 733A711AA93
 for <dri-devel@lists.freedesktop.org>; Sat, 21 May 2022 05:09:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E50CA60BB7;
 Sat, 21 May 2022 05:09:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56D84C385A9;
 Sat, 21 May 2022 05:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653109762;
 bh=Y/duMEZQWKwWljVJyfmGYB+GWYEmH4NazXwvgZBADBI=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=I/PcQ8xYLL1YSsfjbNM/JqktkWqzwvF74wDLQrZ48wS9gBzljqWB6Jej83P74Dt4u
 IEfmyfVEnhCaDJy9hEsi7YbMzwG+a5hfI80qsDDl2kRWHIpguJ/GItbhZZ9ZpKrlgr
 NydhPoPS41otdhphIcUBHevC3Jydh09b96JUI/6TKnzXYJ9+AFOpD9w71MMSeYjaZR
 vzMWf3cfx/U9NHknWl6454I8O2odLBtf012fmWgcJuI18PIARVc0ZUqVJlqc/YvVC0
 cWOZ1K2gqkWlgLLCORxPVTnNtALbRTYLQgiwliEaUlTFyx4GIlAtiiwZfFuYqyPGYm
 glypLeds8tIJQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 434B1F0392C; Sat, 21 May 2022 05:09:22 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.18 final
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzncFLvW9htq+=r=BRT=2AiU58MEpvO0JikaBoUy3Kebw@mail.gmail.com>
References: <CAPM=9tzncFLvW9htq+=r=BRT=2AiU58MEpvO0JikaBoUy3Kebw@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tzncFLvW9htq+=r=BRT=2AiU58MEpvO0JikaBoUy3Kebw@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2022-05-21
X-PR-Tracked-Commit-Id: 64eea6805ecf7092a113bdb4cb73860430d39de6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 93413c849f1fd2ad294320c6eb140b95bf153b8a
Message-Id: <165310976226.23518.16768758842208912431.pr-tracker-bot@kernel.org>
Date: Sat, 21 May 2022 05:09:22 +0000
To: Dave Airlie <airlied@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pull request you sent on Sat, 21 May 2022 06:24:38 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-05-21

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/93413c849f1fd2ad294320c6eb140b95bf153b8a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
