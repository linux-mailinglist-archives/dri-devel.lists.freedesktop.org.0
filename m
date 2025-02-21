Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7871EA401F3
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 22:17:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEFF510EB38;
	Fri, 21 Feb 2025 21:17:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kOpUdbxI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5792310EB38
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 21:17:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 855885C1373;
 Fri, 21 Feb 2025 21:16:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42386C4CED6;
 Fri, 21 Feb 2025 21:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740172630;
 bh=Xn0fGoRkRkQzY1Hf4frI885YXwmrhNF4WvVBPf8Qr7w=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=kOpUdbxIC8MN3AYiCh0cBib8u5mlJuxha8GCbV98OTlP3ieEn2xfPKJa72nCI9CCP
 veO+QAclSWxHLAuMcJKr+TlEwpJ4taG+UAhIPsc/uuuTNQG51axmkHBfN3B5hKy5LS
 gzNF84Bz2dmOgU+4u4NLEkUW3zF8Wk2Bb5HPdH5DJGBNab4ibrtOVKr36OnEcokqc6
 7uwP951mGUfTTr3CFvaMmkjYjMe60qEs/H+4mDLpNzPDy1PZFbGP8A95XymBlmPZgy
 P2gJ8lZ6BxXVPVeRuKp2fl4fDJBbjZ6KFxuzSFY4RG6l9kG/8hDuDv4nw8w6gYkhUM
 geagQd9R1zLkw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 71B27380CEEC; Fri, 21 Feb 2025 21:17:42 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.14-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyHJiMrF8nxXe=mhn0i5N1v-7RHh2TZfoz8BoUBBnuxzw@mail.gmail.com>
References: <CAPM=9tyHJiMrF8nxXe=mhn0i5N1v-7RHh2TZfoz8BoUBBnuxzw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tyHJiMrF8nxXe=mhn0i5N1v-7RHh2TZfoz8BoUBBnuxzw@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2025-02-22
X-PR-Tracked-Commit-Id: 9a1cd7d6df5d708ef244f93715855c8e54d79448
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3ef7acec975bde28ab9cef92af76be8fc2ce684d
Message-Id: <174017266103.2208482.3473913192510497252.pr-tracker-bot@kernel.org>
Date: Fri, 21 Feb 2025 21:17:41 +0000
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

The pull request you sent on Sat, 22 Feb 2025 06:51:33 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-02-22

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3ef7acec975bde28ab9cef92af76be8fc2ce684d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
