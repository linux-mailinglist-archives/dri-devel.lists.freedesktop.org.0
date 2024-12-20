Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFA09F9A40
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 20:19:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7A4310F048;
	Fri, 20 Dec 2024 19:19:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NJXOODgG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8849210F048
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 19:19:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A98C45C6939;
 Fri, 20 Dec 2024 19:19:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58113C4CECD;
 Fri, 20 Dec 2024 19:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734722383;
 bh=BRagEPPiFLCINmZyGIKUO/y8BK2sOE42lS5bpDxdchw=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=NJXOODgGj4TdtLGXGt98acn/hfbKIPuovPGajvpxBM37QOKRQm0c5pGTmo5XPkOkO
 eJ2MyV8HuvTwXkmXOkXF4TwrTOYkBW3/sGGe4y7EFbvPsE9epPQwLGKkVtvEx8F37K
 NNJ5rT1fzDkiCndUBCCN+0eaGuOY/WIEfcDD8E1/ais1m7/5/6YvvyIzJOxrrmutRM
 tuyUyTaszt3bg1NciNvnefHcBkAONncdLVcyb08UW5ByZY1Fy1clUcqK5cJ5wESR8e
 6frX1kaS5YRYGe2HdLcCrpOZKMBiDhN33bNPcydDSSXeScjOmMb5ZOQCjX2p/MwYim
 LVl9kvv/8Wptw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 795503806656; Fri, 20 Dec 2024 19:20:02 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.13-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txFoA3pnkbvW-bNUGRss8H1kvYvKvx0a=mR53tiXVm=FA@mail.gmail.com>
References: <CAPM=9txFoA3pnkbvW-bNUGRss8H1kvYvKvx0a=mR53tiXVm=FA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9txFoA3pnkbvW-bNUGRss8H1kvYvKvx0a=mR53tiXVm=FA@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2024-12-20
X-PR-Tracked-Commit-Id: e639fb046b8150625c1b96bf6f02a18f11ef1760
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: af215c980c1fbf1ca01675b128b0dd194745b880
Message-Id: <173472240142.2997869.4231088585154360487.pr-tracker-bot@kernel.org>
Date: Fri, 20 Dec 2024 19:20:01 +0000
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

The pull request you sent on Fri, 20 Dec 2024 16:33:22 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-12-20

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/af215c980c1fbf1ca01675b128b0dd194745b880

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
