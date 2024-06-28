Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BBC91B3E6
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 02:36:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2617C10EBA0;
	Fri, 28 Jun 2024 00:35:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="L1EyKDYB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C5DA10EBA0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 00:35:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 490BC62057;
 Fri, 28 Jun 2024 00:35:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2FA2CC4AF16;
 Fri, 28 Jun 2024 00:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719534955;
 bh=6WmSWzyoePpAtPyiL0jaKQMsJSvJ/JRaQmhBARYK//o=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=L1EyKDYBiN63QpudecV4RKDFOrB70P00DVDmhPLp7HiYVYLUUlrjzx7v9+4D+CgnG
 ZQ1jF9Pyjb0PkKsMx5tZzCGVk/0OnugxJiZoiqamviDNSb5m4Esr51b4kfxjYhW8co
 e0TgYrEYLOvNB4uqMycK7EVtmOq+0JezJGNQR6pOXLovglTzzsswSkV0uzUH152QHO
 9XyjXF9g68DyzWxPMMPwCQVZy+XilHNNuIhGQFlpPBA5vflWyTuhGsuKXFyaIIR1mg
 XUjxNePIClsi7CM410HbHj/YJB0pRq4ptVv+0mBjxCY/yrMU/l4x+CE/ymJy0swEev
 R9DdQrFzJ1CuQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 26268C433A2; Fri, 28 Jun 2024 00:35:55 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.10-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txzYPEzGHDvNBJb_WXfbktOSy0Y8odZGTRGpqJ00kPgRA@mail.gmail.com>
References: <CAPM=9txzYPEzGHDvNBJb_WXfbktOSy0Y8odZGTRGpqJ00kPgRA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9txzYPEzGHDvNBJb_WXfbktOSy0Y8odZGTRGpqJ00kPgRA@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2024-06-28
X-PR-Tracked-Commit-Id: 4f2a129b33a2054e62273edd5a051c34c08d96e9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1c52cf5e79d30ac996f34b64284f2c317004d641
Message-Id: <171953495514.15056.3571550818018104295.pr-tracker-bot@kernel.org>
Date: Fri, 28 Jun 2024 00:35:55 +0000
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

The pull request you sent on Fri, 28 Jun 2024 09:58:07 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-06-28

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1c52cf5e79d30ac996f34b64284f2c317004d641

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
