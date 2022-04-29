Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F177514029
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 03:17:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A59810E7F8;
	Fri, 29 Apr 2022 01:17:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B38110E7F8
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 01:17:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 385ACB831C1;
 Fri, 29 Apr 2022 01:17:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EB69BC385AA;
 Fri, 29 Apr 2022 01:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651195047;
 bh=+1+Pa7/k7iU0K7EVW6U9WrMKZNxIwirWlYL+7ZzpGFw=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=MEaERdWJtyUY9Ry/GAT/NWc7Hl1ALBWWdfAxOX7uo52BuN74XDT5sYVofNBOWg5ZV
 KFSuP6pyVOfuWsO4+7Rze0m2a7hoqZGQyUpJjLbqR4EDcdP0a778vIpA6BFfGlXbz9
 1zeJpexlr08dLs4vhUk7dTSuC78fVCJjV8O0NRuExlgGbhIwcI8Fcq+IMULavQ/VQB
 0pLIYO9E1ijKAYUcCScobvSkHAxhD9cL1nCjWFklr+ttHT5UeEaLlh6eG8YfpLJxi8
 uqCTHrYiu3k/b0m/7fWBB5biD4lpYFceCrsyqYD68vhJr4/LtxS9+/iP913tqCcCMR
 hxs/vMnBqabQA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 D72B7E8DD85; Fri, 29 Apr 2022 01:17:26 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.18-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tydvfoBFBAY_Vba2vX=26ePwBZumRxnKWA7Lj5+G+tr5g@mail.gmail.com>
References: <CAPM=9tydvfoBFBAY_Vba2vX=26ePwBZumRxnKWA7Lj5+G+tr5g@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tydvfoBFBAY_Vba2vX=26ePwBZumRxnKWA7Lj5+G+tr5g@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2022-04-29
X-PR-Tracked-Commit-Id: 9d9f720733b7e8d11e4cc53b53f461b117dab839
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 38d741cb70b30741c0e802cbed7bd9cf4fd15fa4
Message-Id: <165119504687.10581.12524472299040777629.pr-tracker-bot@kernel.org>
Date: Fri, 29 Apr 2022 01:17:26 +0000
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

The pull request you sent on Fri, 29 Apr 2022 10:50:25 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-04-29

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/38d741cb70b30741c0e802cbed7bd9cf4fd15fa4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
