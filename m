Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9C1A55E1F
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 04:16:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29D3C10E088;
	Fri,  7 Mar 2025 03:16:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aU9wzVNK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 802A710E088
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 03:15:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0C1AEA45399;
 Fri,  7 Mar 2025 03:10:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49BF4C4CED1;
 Fri,  7 Mar 2025 03:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741317355;
 bh=7h+UBrEXQO1LvVxgZHM4+dtU9wb3eB3zIpexChTB3Y0=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=aU9wzVNKs+Bhrywc/6I2gt7f6BXz0gVWAPbsxqBJeZa3j3UdnMpRk8nny3m2xLb8I
 7Yonmu6dHp0jrL0CrrGXTfVdIlhJNlevZ75mYtVzfos3RP/wVENV69OeObsjypyLxP
 IQgbYa6wLSrNBI9fgcQbz33ZfJFW+xjjTHAqOxvU0r+pSxKoZG/EUv3XZT1YUNQAyg
 4IgQ9GiHgB15CkhBhDrSHP1MKs8OTmsVk4SoR6aOMr35LDtPC3B1NxJBLXDdEOMj1h
 fAIdRMDOLs/kQMX/XJUxubroCh+xtUCa7rEpGXKDrNDqKG8P3KarTBMM08L6+UgUDQ
 22FPQtLOnycVQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 DBD77380CFF6; Fri,  7 Mar 2025 03:16:29 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.14-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzHwhm74Z=itrPBz=yz=0VZOrcbnKs6u5LLQuwJrng5zw@mail.gmail.com>
References: <CAPM=9tzHwhm74Z=itrPBz=yz=0VZOrcbnKs6u5LLQuwJrng5zw@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tzHwhm74Z=itrPBz=yz=0VZOrcbnKs6u5LLQuwJrng5zw@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2025-03-07
X-PR-Tracked-Commit-Id: c8bc66206a44f389649af374f5301b2c3a71fff4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 28f587adb69957125241a8df359b68b134f3c4a1
Message-Id: <174131738857.1870846.6425521194522709127.pr-tracker-bot@kernel.org>
Date: Fri, 07 Mar 2025 03:16:28 +0000
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

The pull request you sent on Fri, 7 Mar 2025 10:13:09 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-03-07

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/28f587adb69957125241a8df359b68b134f3c4a1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
