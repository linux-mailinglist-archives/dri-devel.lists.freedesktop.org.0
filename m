Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1F09CF46A
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 19:59:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D339410E0C4;
	Fri, 15 Nov 2024 18:59:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="G9g54Qma";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84D0610E0C4
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 18:59:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 959E6A419AD;
 Fri, 15 Nov 2024 18:57:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 315A0C4CECF;
 Fri, 15 Nov 2024 18:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731697140;
 bh=08qx2vorwQoE+dyyKyA2lthxHsKd312kYHHidqKZcXQ=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=G9g54QmaWmxtcy1cw1m8eqcEoJ3GfnQfuOsJkYuQYOSZFVg4eXckMBWqFZnTRLNJb
 IwAwiwVGPEjO51fMdTSRJLJiOVRLI0EDun9DYdVdq7ROyVVmFlCzPzB8iMY9WQRKB6
 LCgDmOq5PeAAdlzOFC1cYwMOD3I828MwMcEEWV+d2HFT/MhhddUTdKAAhNUUhywTcS
 ALO0eBfa9R0p8KuZXtFf/gy2Tzo18gSsSAeo7wsQoAYY/avbsEiPUxQX8cgEHV7WGJ
 jph0pAmq9S/rxWzf+m3hkHpFV9So/NcgEPK9hFOYvVdwzpRljsXvSV0FQmDPs9zrSW
 mZo7tUExmv2fw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 34EBB3809A80; Fri, 15 Nov 2024 18:59:12 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.12-rc8
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyjNNXJ-UZryHaGhapXqhPHB=SWH5v0tR_BF3iZOL873g@mail.gmail.com>
References: <CAPM=9tyjNNXJ-UZryHaGhapXqhPHB=SWH5v0tR_BF3iZOL873g@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tyjNNXJ-UZryHaGhapXqhPHB=SWH5v0tR_BF3iZOL873g@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2024-11-16
X-PR-Tracked-Commit-Id: 21c1c6c7d732c2f6f4c5ffc77e103aa3ae8bff1d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f868cd2517763c66783c6000b29d97f0b966b311
Message-Id: <173169715083.2685462.9543357655578271455.pr-tracker-bot@kernel.org>
Date: Fri, 15 Nov 2024 18:59:10 +0000
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

The pull request you sent on Sat, 16 Nov 2024 04:43:28 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-11-16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f868cd2517763c66783c6000b29d97f0b966b311

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
