Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7034380AD32
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 20:38:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D5AE10EB0C;
	Fri,  8 Dec 2023 19:38:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 613DA10EB0B
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 19:38:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 708CCB82BBF;
 Fri,  8 Dec 2023 19:38:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C6C8EC433C7;
 Fri,  8 Dec 2023 19:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702064303;
 bh=pfhHhbxigocqyMNuNVPN29KxhpZWLOu1W6TsIC+kwfw=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=kB/43SuchKg3T4TURy0NS9BAJHMgJgSWKxRqf3pK/37Fbho5j6BwjfD/t5SdfG2KP
 5GZrr/2v72lz0R5ysK009INFNSgH++J21Ncx5MVM2BxlVaV+mKkHw8kRZBzL9WoHwQ
 T+xzSVLj0r7EVTjv3pvYNL3K0ASTTT0Hr85R04DYETg2c3mhmikqyQeXCeMQi6cFcf
 qXTV/LnLpWAUBIw9qt1DkaOoVzJbQ46JaS9SNSsP9hhjk40mTn2qktp7DuywAvwNwN
 tJH7HkWkjL4McMo14eTzCgjCe0a99656VHyz5UK0Usy7Vq5R2dz7b4PSLn2LguwolZ
 jPEL6PXqdBfhQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 B436ADD4F1E; Fri,  8 Dec 2023 19:38:23 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.7-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tw7vc_BOsPH0xAwFvx_ZCQyZ24ofp3pUt1MQe9QA_U5Mg@mail.gmail.com>
References: <CAPM=9tw7vc_BOsPH0xAwFvx_ZCQyZ24ofp3pUt1MQe9QA_U5Mg@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tw7vc_BOsPH0xAwFvx_ZCQyZ24ofp3pUt1MQe9QA_U5Mg@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2023-12-08
X-PR-Tracked-Commit-Id: b7b5a56acec819bb8dcd03c687e97a091b29d28f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 38bafa65b1260cb774cfc0c9a3ddf82d3c563e10
Message-Id: <170206430372.311.5094699771321399720.pr-tracker-bot@kernel.org>
Date: Fri, 08 Dec 2023 19:38:23 +0000
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

The pull request you sent on Fri, 8 Dec 2023 14:54:20 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-12-08

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/38bafa65b1260cb774cfc0c9a3ddf82d3c563e10

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
