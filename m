Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CE8BCE94A
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 23:09:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53B3A10E09D;
	Fri, 10 Oct 2025 21:09:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZyKd20DV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21F7D10E10E
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 21:09:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B974142B8E;
 Fri, 10 Oct 2025 21:09:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97421C4CEF1;
 Fri, 10 Oct 2025 21:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760130578;
 bh=rcE19wNb8lc48A8On3yvSeYXRVxlo+xjt3Suhfju3bs=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=ZyKd20DVh3GYDyG0Nwe3Ufpb/bBYYoPnwTNuTsBskAKfO9X0Mlrhtf6LxntHp+tsQ
 8WJqbiu2T5xcJ0r7gsCRDRpGFzRqChV84RNfAXXSPU2OJP9TMwNYPqXc0XMCaEfdyc
 ds/U0ZUdP0bXNT3A3I7Bp/IF4l/gUfJNor/Hh9EOeOg9ABSdnk950cQZaN4njU2ZaL
 ce+oqVnLVDlnAuB0ppHvb1yoDAqUrb0koeP15uhDlYMWDh9PXQXrOMaKPxRGsaPSUl
 B53+fumIEap/mzkIgNQ7nejIJW78JGIzddz4GRooAlC8981svwKEFdWKD63UWjG4W7
 LOvgo8qWwfuTA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33D783809A07; Fri, 10 Oct 2025 21:09:27 +0000 (UTC)
Subject: Re: [git pull] drm next fixes for 6.18-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twb3XAAbMGo9QeQd8mMcGfz2WL6pocaHHEaQfGiAkSKWQ@mail.gmail.com>
References: <CAPM=9twb3XAAbMGo9QeQd8mMcGfz2WL6pocaHHEaQfGiAkSKWQ@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9twb3XAAbMGo9QeQd8mMcGfz2WL6pocaHHEaQfGiAkSKWQ@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-next-2025-10-11-1
X-PR-Tracked-Commit-Id: c4b6ddcf01f63a710c24a128d134d3fa51978d6c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 284fc30e66e602a5df58393860f67477d6a79339
Message-Id: <176013056572.1128757.18157070587858393918.pr-tracker-bot@kernel.org>
Date: Fri, 10 Oct 2025 21:09:25 +0000
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

The pull request you sent on Sat, 11 Oct 2025 06:16:19 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2025-10-11-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/284fc30e66e602a5df58393860f67477d6a79339

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
