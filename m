Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEC8742BE3
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jun 2023 20:30:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 338D310E056;
	Thu, 29 Jun 2023 18:30:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADB6810E056
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 18:30:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 140B3615C7;
 Thu, 29 Jun 2023 18:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7B8CBC433C9;
 Thu, 29 Jun 2023 18:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688063414;
 bh=7AMAzZkTDD0v68H78v4XpBGrzsiMSbyWZ99TYUrueYo=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=Oqm5mxPHai9cch1B6QhGuDO0b77K2s9WG4gLwYTo2E07/W0Me1+s2VTHJh0RvkMDB
 zj+QS4lbQlSVUqgVki7q+aYrhw5W6TrenqWpX8vjKKWBJ/gWy756mYSypJSlSCS0Rv
 uFBbsHiAm32zGhb7dlQlD2UOWv/Gk01G1k6b425V+Tij2P7/+4mw3hCeSuQtvBdftL
 E799Akp2FiDgBO3RtaSCwk3mGSbzgtg4LEwHquz0+IBG9wrLqms3QAZbj0bAUieniS
 DPPFzdalFUesE0cbVZ6+pTQOQbMskVxJIURrYJ6zkNAUZnqpS0fIMOEdBpKT4s+cxK
 86zI14rC0F4Ww==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 69574C43158; Thu, 29 Jun 2023 18:30:14 +0000 (UTC)
Subject: Re: [git pull] drm for 6.5-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twGy8jVci0iPwdFUpePVPf6bxmyGbTT8HxwKqdsqFCjQA@mail.gmail.com>
References: <CAPM=9twGy8jVci0iPwdFUpePVPf6bxmyGbTT8HxwKqdsqFCjQA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9twGy8jVci0iPwdFUpePVPf6bxmyGbTT8HxwKqdsqFCjQA@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-next-2023-06-29
X-PR-Tracked-Commit-Id: 5ff2977b19769fd24b0cfbe7cbe4d5114b6106af
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1b722407a13b7f8658d2e26917791f32805980a2
Message-Id: <168806341442.20934.10739563985655216922.pr-tracker-bot@kernel.org>
Date: Thu, 29 Jun 2023 18:30:14 +0000
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

The pull request you sent on Thu, 29 Jun 2023 11:28:02 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-next-2023-06-29

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1b722407a13b7f8658d2e26917791f32805980a2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
