Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB0B8017C3
	for <lists+dri-devel@lfdr.de>; Sat,  2 Dec 2023 00:30:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66C8910E98D;
	Fri,  1 Dec 2023 23:30:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3F4010E97D
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 23:30:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id F05E5B84967;
 Fri,  1 Dec 2023 23:30:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D2665C433C7;
 Fri,  1 Dec 2023 23:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701473403;
 bh=FEVQqzRQjVDb3BZwYSlTNyijAY1czZPIVLQNFGOOrRc=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=ZA8H9M/ZLbT2u3y5NGR0LIZD++antpE4QyGESY+Lc1sB4dFSzMa+wYb6vrTSHeLmR
 XVbg1NmYUtQqVi5SF+UWBx9X80tnk77n4x2tFITtj8i0vFAsqqChuOydmMVxfe3Uls
 G561Pgy1cH8Ywp+Z6/U4tMabPi3eQvz/jbLljLjDdL77/v7G5xVha8qhDLxDUirgjf
 grBba6qnJ2W9197AobjH7rZ0o139dfbJIsUa+kMDeSV1VXjFq+6yu+QjU/qOtoXb49
 BOSRYldHuVp80hNm+QfU9PZHpepKJpw24tKqawcKr4oCLqFN0meBnqssZngwIgXySK
 RhwtIgvM2TxBw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 BD6D6E1F668; Fri,  1 Dec 2023 23:30:03 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.7-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txF5xvm3uRK0jiW-Zzg+wA7q0+ee-nx2NexJC1LM_6g4Q@mail.gmail.com>
References: <CAPM=9txF5xvm3uRK0jiW-Zzg+wA7q0+ee-nx2NexJC1LM_6g4Q@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9txF5xvm3uRK0jiW-Zzg+wA7q0+ee-nx2NexJC1LM_6g4Q@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2023-12-01
X-PR-Tracked-Commit-Id: 908f60642441cb4f9f0e1eb576e63b0011d318b9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b1e51588aa50287c3d33e14969d47ccdd403ad80
Message-Id: <170147340375.22043.13530253237002470318.pr-tracker-bot@kernel.org>
Date: Fri, 01 Dec 2023 23:30:03 +0000
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

The pull request you sent on Fri, 1 Dec 2023 16:41:39 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-12-01

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b1e51588aa50287c3d33e14969d47ccdd403ad80

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
