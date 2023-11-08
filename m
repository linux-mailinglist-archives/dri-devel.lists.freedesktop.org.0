Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B36E7E4E92
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 02:28:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC55110E03B;
	Wed,  8 Nov 2023 01:28:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E59210E03B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 01:28:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id E041CB81A68;
 Wed,  8 Nov 2023 01:28:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 42F6CC433C7;
 Wed,  8 Nov 2023 01:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699406908;
 bh=uqSDgApUYNMEl1+GhHw3mliJvThrroTYJx+WAibua6A=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=jQaBUEJzR50gabyuV5HBOdvXOIpsRM9UaJeXS0030i7GVTL/HsiCXzpUCHrjz0bVq
 hOuzJs58mKd07h8FpNto+rnMGtqGE/bebUeHKObYyAoY7hOJTYfy+c6rTlDDZ1AG5k
 ZmgdNVZzCfavMifGBXtOdRXNZYAslLiiu0rCeqBsgj4ct5X5wgxcEAilN4eCRqeObM
 pYFo/OGT7Y8p9X3lWLZ2vsB4UIz3c+qdlGjZU5/8+hxbzbXpPfCrhFKEBvAF9PbNcY
 axkEWvlvnUhtfdIX5pyP7wsNM2QqpWfjaGEfDLCJEZWUWZjsgoPQ4c1PJWnVp00NYy
 kFZqdZIOQXClw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 30DF8C395FC; Wed,  8 Nov 2023 01:28:28 +0000 (UTC)
Subject: Re: [git pull] drm next + fixes for 6.7-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twtAbAqnZKRTk9tKLXpJeU6azx+TM4Ep3yJHQJtCFvK7Q@mail.gmail.com>
References: <CAPM=9twtAbAqnZKRTk9tKLXpJeU6azx+TM4Ep3yJHQJtCFvK7Q@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9twtAbAqnZKRTk9tKLXpJeU6azx+TM4Ep3yJHQJtCFvK7Q@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-next-2023-11-07
X-PR-Tracked-Commit-Id: 9ccde17d46554dbb2757c427f2cdf67688701f96
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 25b6377007ebe1c3ede773fd6979f613386db000
Message-Id: <169940690819.31371.12586938536152172995.pr-tracker-bot@kernel.org>
Date: Wed, 08 Nov 2023 01:28:28 +0000
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

The pull request you sent on Tue, 7 Nov 2023 12:03:00 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-next-2023-11-07

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/25b6377007ebe1c3ede773fd6979f613386db000

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
