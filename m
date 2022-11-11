Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D03A6260CA
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 19:03:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E38F10E0BF;
	Fri, 11 Nov 2022 18:03:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15FFA10E040
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 18:03:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 46F3AB82694;
 Fri, 11 Nov 2022 18:03:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E8D48C433C1;
 Fri, 11 Nov 2022 18:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668189783;
 bh=eDxpYGXZz7q+HMfN0lo9h0m7cnwd8+zf86z4MHZD8j0=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=uptBZ5axr4ri2+huVdH6vqBDO3OkfKma3Bj9wsLMNCTKGzuQyVsENY4Cy4C8QSmZX
 1YOQkmyL4cHgtVcQ7o0lLHC3fhMl3KumTTlHlBcI0gXvl54/35FCPtO32XupmiHgui
 /dZDFMJZq/PKJ0yhLNVBjx+qQcl5lR5bBCbMnRut8e56/U6VqdmajRxMjMWzXrd7Ov
 CxTDF24/96r82m3l27JMfEww9KcJ0zjc2nIASk6LG/d+hrxRCxYRWXSSAytfZzwW2y
 jc9zXnNvEn7Hbt3HsGYr05EaIpJliMeRhZSVUdycNQ/NaXp91NHgoF/Da67qnEzvcu
 tNC4fLLyAiSlA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 DA364C395FE; Fri, 11 Nov 2022 18:03:02 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.1-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tz0wieno61nXib1N+P2KKERh6HO947d6rEYiBZMccr4Lg@mail.gmail.com>
References: <CAPM=9tz0wieno61nXib1N+P2KKERh6HO947d6rEYiBZMccr4Lg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tz0wieno61nXib1N+P2KKERh6HO947d6rEYiBZMccr4Lg@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2022-11-11
X-PR-Tracked-Commit-Id: b7ffd9d9ee13de2c5ad88046a5149de4cfb2a74b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fd979ca691715891a979ce12d1a485b108af74d3
Message-Id: <166818978288.15878.9908916054430327359.pr-tracker-bot@kernel.org>
Date: Fri, 11 Nov 2022 18:03:02 +0000
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

The pull request you sent on Fri, 11 Nov 2022 12:18:21 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-11-11

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fd979ca691715891a979ce12d1a485b108af74d3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
