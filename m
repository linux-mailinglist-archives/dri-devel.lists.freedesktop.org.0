Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF80C50CC86
	for <lists+dri-devel@lfdr.de>; Sat, 23 Apr 2022 19:11:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AF9010FB15;
	Sat, 23 Apr 2022 17:11:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D05010EAB9
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Apr 2022 17:11:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9C2BAB80CC7;
 Sat, 23 Apr 2022 17:11:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4D09DC385A5;
 Sat, 23 Apr 2022 17:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650733898;
 bh=BEIhSaLoyuMAsQK+4th4GzEl8ioJYx86+V4nH2YKdTE=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=gK70RYrTOVUkTUqiy3TuqLuj8/xvQNE7xWvyBOqtDMQrqRpCdnHET/D+ZHB7an7kn
 bxeORvLLvSUq5QCYUzmiqsuuxuGBT83LPPGoWBTAs8c9TO0vNc+NLhC0OZEhwTRjwg
 YR4US4rUZVlyANRo/zccl0df1v74+xDVE7nRPUlGapO7ZhhIT4YuU5VdyX2h7ClNuA
 eu5Zv1jPE64aMinYVZ84G3AniKnIqGYlvYiL7irQcNIXJ6VcDQhA5ReaxTKcZSGYve
 EQHn4Lqhk24woQGtylXyM2w7hP/lrkbScz0SChywNqER0/oGFHiVzF0elTtOdKj59N
 5emlfCoEt7DmA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 39D55E7399D; Sat, 23 Apr 2022 17:11:38 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.18-rc4 (part 2)
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tx4wRuT7J7ZxVeqQNWYdti8=_x3aPURRFPX1qrjWAw09A@mail.gmail.com>
References: <CAPM=9tx4wRuT7J7ZxVeqQNWYdti8=_x3aPURRFPX1qrjWAw09A@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tx4wRuT7J7ZxVeqQNWYdti8=_x3aPURRFPX1qrjWAw09A@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2022-04-23
X-PR-Tracked-Commit-Id: c18a2a280c073f70569a91ef0d7434d12e66e200
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 13bc32bad7059d6c5671e9d037e6e3ed001cc0f4
Message-Id: <165073389823.30714.6861894637109276355.pr-tracker-bot@kernel.org>
Date: Sat, 23 Apr 2022 17:11:38 +0000
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

The pull request you sent on Sat, 23 Apr 2022 15:18:43 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-04-23

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/13bc32bad7059d6c5671e9d037e6e3ed001cc0f4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
