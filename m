Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D039A45B4
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 20:22:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3530910E383;
	Fri, 18 Oct 2024 18:22:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kenaPXZS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCDDA10E383
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 18:22:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 600065C3D72;
 Fri, 18 Oct 2024 18:22:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F8C9C4CEC3;
 Fri, 18 Oct 2024 18:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729275728;
 bh=s+bgolo34tH6sENSucwrWV78GxVY30I0uO5gO3vy+kU=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=kenaPXZSO8nkGSPtgIy4jiJOsoe3OxOmfr+rY75ff+1UOJzzHfrFjv+a0+LCbF8Zz
 3f9w0DlNh5YV3NBskPio1IW0FY/5rZQDy9B6h53Oy8GfPkhfKgz5X6QxjshQYLbG+E
 8sGqRbyRwpoV11pYeficmV03z2/Jw4qE/g605KxNJrnzcOonvw/+F3PffdRK0jQHWP
 xZfQFEtST5wX1Mi9lq/wLJZf6r4cICzpfZey7bo2OwVw/y3CLpwXKyTZJZspILBhKB
 msA6JmRk88XZ4bwDhSxm/vRAC6YIFj7wJ4/ruTKqmm6ja6Vs9Eh2nQpGiuFce+zHdR
 QcFPOzFlSePqg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 341093805CC0; Fri, 18 Oct 2024 18:22:15 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.12-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9ty_pQme=1c-KkA0yAR-X1PiUMqf8JiUnsCdGSOuM3fdpA@mail.gmail.com>
References: <CAPM=9ty_pQme=1c-KkA0yAR-X1PiUMqf8JiUnsCdGSOuM3fdpA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9ty_pQme=1c-KkA0yAR-X1PiUMqf8JiUnsCdGSOuM3fdpA@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2024-10-18
X-PR-Tracked-Commit-Id: 83f000784844cb9d4669ef1a3366479db3197b33
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5d97dde4d5f751858390b557729a1a12210024c1
Message-Id: <172927573370.3196569.11915116378841687780.pr-tracker-bot@kernel.org>
Date: Fri, 18 Oct 2024 18:22:13 +0000
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

The pull request you sent on Fri, 18 Oct 2024 15:53:18 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-10-18

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5d97dde4d5f751858390b557729a1a12210024c1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
