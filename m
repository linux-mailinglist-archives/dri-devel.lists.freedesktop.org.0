Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3BBA9DC5E
	for <lists+dri-devel@lfdr.de>; Sat, 26 Apr 2025 19:05:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6DA010E023;
	Sat, 26 Apr 2025 17:05:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ATWfkJB4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0FEF10E023
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Apr 2025 17:05:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5D086A4ADC6;
 Sat, 26 Apr 2025 16:59:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFBBCC4CEE2;
 Sat, 26 Apr 2025 17:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745687106;
 bh=bmB4LNaG9qJ93DN1uHQ2PlYyTGX66NmUX7nCJlCeUnQ=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=ATWfkJB4QqO7tVeeW0lmkzxSGgYEjUs/9FB0YOMC7aQQjwJ1a1uAH1Fh0zzeMe2Ni
 JuEh4zelNZv5v1HOvP+rrXRC6U7WIya1CspNAhVsWHUJMAEGg90vja83XMeSnuJd5O
 U7fGaMfxSNngZBLz5AyzggUmZ+A1Q46Dh5sdEaTLhLLYPu9H9NmBMh0UyDdYBfha1g
 DKcfSlpAYYo9A28DTipJo01XsDbRLpCOaiZuaQawBoLEyCrolIhBFj1pwMErRKNMK/
 zC+QL2Ten0JQOSJpJTC9uCKCrKIHsfp+vvJNQ2lF4ykx74kMSJeRpa0UFeKv9BngFI
 gr/m1z66KazBQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EB05F38111CC; Sat, 26 Apr 2025 17:05:45 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.15-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twNOWYCQ6vXZqUAu8G=oxGrKUvcTYz-SL6Jc=4+8ivVew@mail.gmail.com>
References: <CAPM=9twNOWYCQ6vXZqUAu8G=oxGrKUvcTYz-SL6Jc=4+8ivVew@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9twNOWYCQ6vXZqUAu8G=oxGrKUvcTYz-SL6Jc=4+8ivVew@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2025-04-26
X-PR-Tracked-Commit-Id: 250130d2daaa0a828bafbd6ad58479a645029e82
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fa573aefdf9bc6e4a903551d381ddcbd60f37943
Message-Id: <174568714456.4031081.785120233885422966.pr-tracker-bot@kernel.org>
Date: Sat, 26 Apr 2025 17:05:44 +0000
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

The pull request you sent on Sat, 26 Apr 2025 09:12:11 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-04-26

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fa573aefdf9bc6e4a903551d381ddcbd60f37943

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
