Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 471F8A7CC2A
	for <lists+dri-devel@lfdr.de>; Sun,  6 Apr 2025 00:49:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA3B710E09A;
	Sat,  5 Apr 2025 22:49:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ott8o31f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C27A710E09A
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Apr 2025 22:49:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id ADC7E61120;
 Sat,  5 Apr 2025 22:49:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F837C4CEE4;
 Sat,  5 Apr 2025 22:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743893382;
 bh=3yMB43Y7pNug+fgO8Nt6qPlcJPM+dBJhYXtjrXqWu3U=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=ott8o31fRHCuNI82KbRlOX+dDtTcVmTp3Dx99Qk/YurlsC2TH7o49sFvCTy/6QSp8
 RBl4wIRLdhO+EM4Z0Mks1CxSIEPBjNIx7VdgaFzAIj57i21IX7MIIdk4dP2GRsixNQ
 6Gsrn6bCZoTgNJCieoKBuqS9Sk6uvzYH1xKNxy7FBTmIPfWQAZhHhWDd3Y6ImrpbZ2
 XVZjou5GUhtF83REf9QgXcfePeLj6+FWa0eMyrQBU1MxJ0ARGpJS08Jzd5gcZGMKNM
 i6R1zqDyZAErtW6j4jZ6vq0DpoBdHrTJigkRb6uWfQlLl28WShIAfXne0QcckLwNU6
 gHZIQmMZqMx/g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 AE3B3380CEE3; Sat,  5 Apr 2025 22:50:20 +0000 (UTC)
Subject: Re: Fwd: [git pull] drm fixes for 6.15-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tw5SBS_P1oX+ySAhNx-M_NeO4RzK249i6vtwSU0V4mbDA@mail.gmail.com>
References: <CAPM=9twD=Epq278=nVGxMU4veeEpznYLnr_PVQ9WqvdnxZac_w@mail.gmail.com>
 <CAPM=9tw5SBS_P1oX+ySAhNx-M_NeO4RzK249i6vtwSU0V4mbDA@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tw5SBS_P1oX+ySAhNx-M_NeO4RzK249i6vtwSU0V4mbDA@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-next-2025-04-05
X-PR-Tracked-Commit-Id: e2cb28ea3e01cb25095d1a341459901363dc39e9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 758e4c86a159bdd67a8ef60ea118ddb8b2043714
Message-Id: <174389341915.3729461.8371380037090772284.pr-tracker-bot@kernel.org>
Date: Sat, 05 Apr 2025 22:50:19 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Simona Vetter <simona@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>,
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

The pull request you sent on Sun, 6 Apr 2025 07:51:03 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2025-04-05

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/758e4c86a159bdd67a8ef60ea118ddb8b2043714

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
