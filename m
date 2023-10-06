Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C87D67BBB88
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 17:15:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80A1910E51E;
	Fri,  6 Oct 2023 15:15:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F44410E520
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 15:15:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 22B99CE2887;
 Fri,  6 Oct 2023 15:15:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6E6B4C433C8;
 Fri,  6 Oct 2023 15:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696605328;
 bh=IzVQJZrCJgH70+xhHD7kCJcQBfkWMJtOB72gyYxLlh8=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=HMsHH9uSh5t2/QpphmCCwBVeoT1sy6GzToxBR4FHcSnrdIodtbD/aUWXFO8R5TQT/
 SnXgiV8CRIREVIPqU+CrI9c+MkMyvt7zBcMgHtFCbkXx98rwalW7nzfH002rMcFhW9
 yXUKZCNNcMFJQKNvOSY8GI8liW//bx0zbdFL5N/4aUjKfhgJJSryeGhrB+S9R5LhqM
 ARM9KBpmqsbNFhzOV5RIbrHsQYgjjH1XPduDxR44G4ZZAOzaeahcoMQ3uBBYX+RYgl
 Oz9oeneqx9Qdbn1EXiG4QUgbruhcV9WL39x+Gh10xnxwaDONVLe34x/8QHEcOevGZj
 DdMyuCBqx+EBw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 5C01DC41671; Fri,  6 Oct 2023 15:15:28 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.6-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txQG3XyUMBvFf5pj8ng0sKekGMw5A7nhU_eMN5ubkVGcA@mail.gmail.com>
References: <CAPM=9txQG3XyUMBvFf5pj8ng0sKekGMw5A7nhU_eMN5ubkVGcA@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9txQG3XyUMBvFf5pj8ng0sKekGMw5A7nhU_eMN5ubkVGcA@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2023-10-06
X-PR-Tracked-Commit-Id: 67f35a41d3748b7bab8787d20b50cf33fafa2ae0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4940c1543b4381a4895072489b4de7b6145694f5
Message-Id: <169660532837.6239.2392760731761854818.pr-tracker-bot@kernel.org>
Date: Fri, 06 Oct 2023 15:15:28 +0000
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

The pull request you sent on Fri, 6 Oct 2023 14:58:38 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-10-06

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4940c1543b4381a4895072489b4de7b6145694f5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
