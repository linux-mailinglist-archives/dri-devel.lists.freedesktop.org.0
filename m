Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4DAB5559D
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 19:49:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DCE610E021;
	Fri, 12 Sep 2025 17:49:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YuTtuv7J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02F6610E021
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 17:49:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id EA9E9601D3;
 Fri, 12 Sep 2025 17:49:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A57FC4CEF1;
 Fri, 12 Sep 2025 17:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757699349;
 bh=Y3N3CVC4GV5QWmVOOamNa1sfvGeVvIJ++ZM8Dzz0v1E=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=YuTtuv7JI7LY9pekHmj7epSB/l7uwiNNkjajCWALSFgVcYqqPWzE2EHmHLlGa0+Wr
 WFnc0LWJomc+0fJArBCpWaNZl5CJv7RJI5SiANx1VrOtuIbexxRHcYNdBJljHvvotl
 GdjOjN5SY9oXG65BuErbz520AXj6C92xh5JuZnXB6/X3QlHUC8igzkqGn2Kg5l1H38
 GhCPoXUN8TWWzP4xdg6ZvnquEjxjz5GN+B2x6Xr3TJs7Yim8/fv+ougfPMUOGPS9UW
 Qy8Vhji0g3hgh0+iZ4XjJ1hh3YREKT8JO/1FIl82KFmKA442ppAMMjYUqKSYwvOVvH
 hGn6CGuKCeJlA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33DD6383BF4E; Fri, 12 Sep 2025 17:49:13 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.17-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tw1QOZSBq+QhAbpyc9UvY7KYTfA+K=JQyo+_u+nBcTdGw@mail.gmail.com>
References: <CAPM=9tw1QOZSBq+QhAbpyc9UvY7KYTfA+K=JQyo+_u+nBcTdGw@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tw1QOZSBq+QhAbpyc9UvY7KYTfA+K=JQyo+_u+nBcTdGw@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2025-09-12
X-PR-Tracked-Commit-Id: 9a3f210737e958c3f45a4ce0d7f1ff330af3965f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 965c995c9a4b395471ff48790a0155ee986ca405
Message-Id: <175769935190.3023336.14398687217530924597.pr-tracker-bot@kernel.org>
Date: Fri, 12 Sep 2025 17:49:11 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pull request you sent on Fri, 12 Sep 2025 14:24:52 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-09-12

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/965c995c9a4b395471ff48790a0155ee986ca405

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
