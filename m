Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E51C501F04
	for <lists+dri-devel@lfdr.de>; Fri, 15 Apr 2022 01:26:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10D1710E832;
	Thu, 14 Apr 2022 23:25:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8BF810FC3B
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 23:25:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A811362111;
 Thu, 14 Apr 2022 23:25:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 192AFC385A1;
 Thu, 14 Apr 2022 23:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649978756;
 bh=zO0a7JQ4YMZAwt19rLoBWiio/HMoIOd+2+LLq7pctxQ=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=QU8slMHfn8f2VEp1RZq0ksJ+ywoq7MRvlApGZYSthx6z/cBLQ2Ko5C/Q399VSQkEU
 pFIjeBOW4rlDtss3Bl9whikwD3zuqqlfCqDKdGHBKXfP+kFlImreCLMcD5RdMUx+4B
 KsdyjmiQbqC99uHu0NuCe+gu3fPZTwDn6W6jvrtaIOWQHI8VyX2yzVvdXT26wSRQgb
 DqlSCrzfgBprGmiILCAli/cbvtKVZZLWR7aIui1dPVmhlGhlZ2t2Aeplx7CAqNmImK
 cHSTSRTSOIBbmZDogW2RQIuH0+8SYljkOUZL8sCX101AwjCcvyRCG/hub18hEmFb+p
 tTwPlqD5sjl4w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 05A8EE8DBD4; Thu, 14 Apr 2022 23:25:56 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.18-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzmeDfgQ3VhutQWLcgVhodHJhGmzrjMTB=yvXOhwnw0CA@mail.gmail.com>
References: <CAPM=9tzmeDfgQ3VhutQWLcgVhodHJhGmzrjMTB=yvXOhwnw0CA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tzmeDfgQ3VhutQWLcgVhodHJhGmzrjMTB=yvXOhwnw0CA@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2022-04-15
X-PR-Tracked-Commit-Id: 8e401ff5380a921c309d4c73cacf27b0bdb5f168
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 028192fea1de083f4f12bfb1eb7c4d7beb5c8ecd
Message-Id: <164997875601.7927.18422842675469296524.pr-tracker-bot@kernel.org>
Date: Thu, 14 Apr 2022 23:25:56 +0000
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

The pull request you sent on Fri, 15 Apr 2022 07:33:01 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-04-15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/028192fea1de083f4f12bfb1eb7c4d7beb5c8ecd

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
