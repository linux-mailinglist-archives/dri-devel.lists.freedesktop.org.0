Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1357E1220
	for <lists+dri-devel@lfdr.de>; Sun,  5 Nov 2023 04:02:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DCAE10E23E;
	Sun,  5 Nov 2023 03:02:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8439510E23E
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Nov 2023 03:02:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C8A63CE092E;
 Sun,  5 Nov 2023 03:02:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0FD95C433C8;
 Sun,  5 Nov 2023 03:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699153328;
 bh=TSvU0HlnHN4BZ8JsoKM745jTn0wr3/QtfdZevo17IuQ=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=nIARKTvlLDp/ejiNM2wGmTp3kpCZeivIcn0nLNdcsJjRK8TC5bW5QrJ9mzSuMAmHQ
 ZOkF4bLb44SEQ0DxrgC2oPIhTjSJvsqAB5hkUyPkOJKREHvbw4A+sBfkHJuLRWIv5k
 is+g7Jwm5aW2vtKGIMxaQOvHc4Raa5kcWxPdHsvcw8zk9lSbAg92gPowpOiGUMoUuH
 aE06KXEDBfIa2LCnevpdjXhe4cDO0/JYZEWZpfnQ97aVsgzV5dl46sWIMsuSferZuJ
 BgECv8UZLNnQxzwvl571qSkpca2JBD9gAITAKjYqrIwOBRib+9mckf3PAYr8G3QGox
 t4IiHvqbJJEyA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 F3E6DEAB08A; Sun,  5 Nov 2023 03:02:07 +0000 (UTC)
Subject: Re: [git pull] drm nouveau support for GSP firmware - optional
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txa=48madkU8QgcVzmU9EBvThNM_dU-1meEhtrsgF8iPA@mail.gmail.com>
References: <CAPM=9txa=48madkU8QgcVzmU9EBvThNM_dU-1meEhtrsgF8iPA@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9txa=48madkU8QgcVzmU9EBvThNM_dU-1meEhtrsgF8iPA@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/topic/nvidia-gsp-2023-11-03
X-PR-Tracked-Commit-Id: 8d55b0a940bb10592ffaad68d14314823ddf4cdf
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e70703890b2586bc3567365d391c260d23fb7a94
Message-Id: <169915332799.2133.5360232430115040415.pr-tracker-bot@kernel.org>
Date: Sun, 05 Nov 2023 03:02:07 +0000
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

The pull request you sent on Fri, 3 Nov 2023 13:16:45 +1000:

> git://anongit.freedesktop.org/drm/drm tags/topic/nvidia-gsp-2023-11-03

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e70703890b2586bc3567365d391c260d23fb7a94

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
