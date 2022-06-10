Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 489C0546C45
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 20:26:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78A7D11211F;
	Fri, 10 Jun 2022 18:26:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60BF911211F
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 18:26:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A434D621E1;
 Fri, 10 Jun 2022 18:26:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 165C1C36AFF;
 Fri, 10 Jun 2022 18:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654885571;
 bh=3WsdQ9MZeGRpq7g8IeXKwV4u6dfHtsVvJ+Q5bT4AQtU=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=QipYXy1U1TpF9veEYhWES1aLME0ADEVux+xeYLKKt4xL1T/F7uqQc/reqqVuKYL9o
 pvITzpV8B8kRQndJ0tNrO4y655doYXCDSnKl3yFYwqj7hjlNy6EBMoEz+OcGfWuJ7X
 4pQbKUGZiq9SQ++MWlV9E0qC9dK/5xs28XjQI1Ypvr+CbqAe6MgQZKNz6PRQzWZnzu
 dBthE7CMDqavO4SvRM06rN1D+5Jfr5yrIaay/+fgSnu8yeVZGPMIhzSes7L1lkZPko
 d4B0g2ImlY+w/ne+lzeEF0uEauO9cyPYQdOWsHwwyXIdJNOpMij33qL20Ff/pLpt8e
 vLlid7MywTybQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 046FEE737EA; Fri, 10 Jun 2022 18:26:11 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.19-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txaEX1q3FxV3nZQemunXKsbtNhmW9BKGh4UNs3uaCmz_Q@mail.gmail.com>
References: <CAPM=9txaEX1q3FxV3nZQemunXKsbtNhmW9BKGh4UNs3uaCmz_Q@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9txaEX1q3FxV3nZQemunXKsbtNhmW9BKGh4UNs3uaCmz_Q@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2022-06-10
X-PR-Tracked-Commit-Id: 1f192b9e8d8a5c619b33a868fb1af063af65ce5d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8dd77d44795d708f5f4f783b81c5197c5b994d74
Message-Id: <165488557101.32117.7853124034928994612.pr-tracker-bot@kernel.org>
Date: Fri, 10 Jun 2022 18:26:11 +0000
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

The pull request you sent on Fri, 10 Jun 2022 16:00:24 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-06-10

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8dd77d44795d708f5f4f783b81c5197c5b994d74

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
