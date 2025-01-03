Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EACA010E9
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jan 2025 00:22:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFD9E10E96E;
	Fri,  3 Jan 2025 23:22:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cWOR7xoD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7557710E96E
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2025 23:22:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 49BCEA41187;
 Fri,  3 Jan 2025 23:20:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16BACC4CEDD;
 Fri,  3 Jan 2025 23:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735946521;
 bh=DcWbJvm7z4iilxv2y8NHT6nBqRdF7gbPsXHDhiJq5kM=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=cWOR7xoD+xTC5glsDJjPomvCAA1pInYE788aykFQJXqytgp7rbxxEk525+QbqZAeG
 MROwGPjEq/da9++HkL6jwRSjpmQ8BssLoQrq20Rsxy30Cx2J7/HyrJ2SU5E023hGCf
 MroAPF/Q31kAxCbVPB5xhUYmmGd7/3qAcroeotUeH0RpUmK/pO2LXG/jcL3SFyrjd0
 dfvKjlLf0F4m8MmAiru4oxwXdgOq+nzLym4FtkG/hw0/q/ok7lBqjsvK1fh945xgI+
 EeA7JFr/bNKHDv1l14LbvFG63MANW90v//X4a+nZk1X1ckMnVHBLU9qIlv7qRJqet8
 uooRsULOYOXLA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EAD63380A974; Fri,  3 Jan 2025 23:22:22 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.13-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txCCxGcVViTTntsp+9tp-gBLTh3znhVJgc+DD9hsz+bGQ@mail.gmail.com>
References: <CAPM=9txCCxGcVViTTntsp+9tp-gBLTh3znhVJgc+DD9hsz+bGQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9txCCxGcVViTTntsp+9tp-gBLTh3znhVJgc+DD9hsz+bGQ@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2025-01-03
X-PR-Tracked-Commit-Id: 273b3eb600713a5e71c64b8b403b355dc580f167
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 92c3bb3d2e89ab35072248b08008c508f714f070
Message-Id: <173594654138.2324745.9817654737431674454.pr-tracker-bot@kernel.org>
Date: Fri, 03 Jan 2025 23:22:21 +0000
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

The pull request you sent on Fri, 3 Jan 2025 12:09:54 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-01-03

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/92c3bb3d2e89ab35072248b08008c508f714f070

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
