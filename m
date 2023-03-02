Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E606A8D3F
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 00:50:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8D5110E320;
	Thu,  2 Mar 2023 23:50:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16BAB10E320
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Mar 2023 23:50:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 166B5CE1F28;
 Thu,  2 Mar 2023 23:50:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 83DC6C433D2;
 Thu,  2 Mar 2023 23:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677801012;
 bh=aHhYJZbcos5zGl2kR1zfyCTztXHPxNW1QtvM2Qw43Zk=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=KEnc3lOPNb1Ccmup8TbAnHV4VNSW+eHvMZWP+HKjPxs+fR60FuV1bCgzzWihEK/gT
 0YBIXSHS+T/jekVoz2vfrCX/qk/S7s2R3r9YE32BeQ9x2O+oQ13uywYnfENlxbk9CW
 huGQwLTZyAZXbiAkpXsKh6yo/tD2fHzvi+srnJ/2w6wVL0V5LoyXxFtcU32z5x0fpl
 kHLxwV0OLa6xezmU72fLVzHynfSTJDCqvzaGzkjEeiTvAARVvgvU/2iaufR3TAQg6m
 +LkmT2Qgq1eD4Oop0BEU3oJiOEukKmIHe0o8PKSAQLRY7juVAtzN3hARTy0i7LXx1W
 nuSgSVLpc47eA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 6C2DDC43161; Thu,  2 Mar 2023 23:50:12 +0000 (UTC)
Subject: Re: [git pull] drm-next-fixes for 6.3-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzkY1=9Lv4sejpcHTNbMcZWNgzYY6UdPFX4TZcU5g20Rw@mail.gmail.com>
References: <CAPM=9tzkY1=9Lv4sejpcHTNbMcZWNgzYY6UdPFX4TZcU5g20Rw@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tzkY1=9Lv4sejpcHTNbMcZWNgzYY6UdPFX4TZcU5g20Rw@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-next-2023-03-03-1
X-PR-Tracked-Commit-Id: 54ceb92724a8cf5294c284d5e9f770fc763cdab2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2eb29d59ddf02e39774abfb60b2030b0b7e27c1f
Message-Id: <167780101243.2106.12305433771137679724.pr-tracker-bot@kernel.org>
Date: Thu, 02 Mar 2023 23:50:12 +0000
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

The pull request you sent on Fri, 3 Mar 2023 09:07:58 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-next-2023-03-03-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2eb29d59ddf02e39774abfb60b2030b0b7e27c1f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
