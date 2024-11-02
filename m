Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4920B9B9C0F
	for <lists+dri-devel@lfdr.de>; Sat,  2 Nov 2024 02:47:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C98610E064;
	Sat,  2 Nov 2024 01:47:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Al14Axyz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C9610E064
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Nov 2024 01:47:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 348D75C5B28;
 Sat,  2 Nov 2024 01:46:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CACE0C4CECD;
 Sat,  2 Nov 2024 01:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730512040;
 bh=Bp1/UbuDjuiR1QJB1pHBQZNzQn+ZOVzQbMloTSuOYhE=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=Al14AxyzKxWz0YLPaVxzPtecZ523z+fmxBek2GLE6jRKo1tEUdkufzORJ0qHiCHl8
 j1uEdO4AvhSz6TZomugX3Ly6vM0Y6jgzqjgkF5wJ0lqhE/R8FQaN5rXYDTIVSmZJZx
 aWn6O0RQx3jMXpgeqJwT9pyNCnatmStIMfJDBC42KuKWK5oX58by5NLIEcKUJ1qTUN
 37x9jEGLU5hsp9p9lnxyyf0u2OnK0qZLSC5yPJXuW7t+SUZaQ0PCKPTZDBJSyhKgi9
 DRyefyHHxQhQrjk+OETGI8KqLJkUeMtCI7PCQMYIS+3kvySypT715XQVd0WA0bZlWa
 TpyvlpkKoZn2g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33D003AB8A90; Sat,  2 Nov 2024 01:47:30 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.12-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tywoHB87EmV5CYripW2A2gVBg2dMTM-+gv_xbxOK3EQ=Q@mail.gmail.com>
References: <CAPM=9tywoHB87EmV5CYripW2A2gVBg2dMTM-+gv_xbxOK3EQ=Q@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tywoHB87EmV5CYripW2A2gVBg2dMTM-+gv_xbxOK3EQ=Q@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2024-11-02
X-PR-Tracked-Commit-Id: f99c7cca2f712d11a67148cfbe463fdefeb82dc5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 269ce3bd62e8ad83dadc80a2f755a799697ca4a3
Message-Id: <173051204870.2889628.13489806884825759621.pr-tracker-bot@kernel.org>
Date: Sat, 02 Nov 2024 01:47:28 +0000
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

The pull request you sent on Sat, 2 Nov 2024 05:04:48 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-11-02

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/269ce3bd62e8ad83dadc80a2f755a799697ca4a3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
