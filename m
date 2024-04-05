Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4080489A573
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 22:10:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65E6C10E89B;
	Fri,  5 Apr 2024 20:10:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pv85l6xo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E23A10E8CB
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 20:10:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CCDF16194D;
 Fri,  5 Apr 2024 20:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9C5CDC433C7;
 Fri,  5 Apr 2024 20:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712347819;
 bh=TRRyT0NzN4udDGntL9vR3p8/0PD8F5VMwB+mcKL5XXo=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=pv85l6xolEKkLwwh6Q7km6BiVIlZwylz+mrLY7bZgdNuJWw5s9BQxIQPp/JpK5W2D
 GS14U0lxK9vKwGn23QSCZeKV7Fq3z8hisuwJbJAeMUgGBAtemdP2m5kOfoldyF36Uh
 GH/QZy1Zn3h2IlDpE9ZMCh9I17ZHJfBgiT7wTTf6ReUkkjvXH9oKaJdUNMw9AK7Dev
 DPXggOKrPXU9WlCWKNVMs4CktBuAgp3Qh+1i6gX7yEO1O5S4ZWdIjw5eTWOt53EUi0
 XILz7hTFD0eE7LDD+bJ6da23wMZInjzYEREkeRgT1RLWCdcmyIlIHhiS70HhrechIA
 Zvy9v7yRB1uYA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 9264BD8A101; Fri,  5 Apr 2024 20:10:19 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.9-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzjcdJovUtZWWGG8=Qbv_T6csXfehWrrLr=Lxd0OCsCVA@mail.gmail.com>
References: <CAPM=9tzjcdJovUtZWWGG8=Qbv_T6csXfehWrrLr=Lxd0OCsCVA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tzjcdJovUtZWWGG8=Qbv_T6csXfehWrrLr=Lxd0OCsCVA@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2024-04-05
X-PR-Tracked-Commit-Id: 4c8595741b5dd3268d6710545461ee9a7bbde891
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 89103a164210f1c88caedf880ac9ab9576a1190d
Message-Id: <171234781959.2800.7077844484895239707.pr-tracker-bot@kernel.org>
Date: Fri, 05 Apr 2024 20:10:19 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
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

The pull request you sent on Fri, 5 Apr 2024 13:41:06 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-04-05

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/89103a164210f1c88caedf880ac9ab9576a1190d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
