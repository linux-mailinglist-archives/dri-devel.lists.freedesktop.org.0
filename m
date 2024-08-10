Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E901594DAB7
	for <lists+dri-devel@lfdr.de>; Sat, 10 Aug 2024 06:31:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DF4C10E110;
	Sat, 10 Aug 2024 04:31:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="p79bkFBT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47F1410E110
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Aug 2024 04:31:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CBD4BCE0D4E;
 Sat, 10 Aug 2024 04:31:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05136C32781;
 Sat, 10 Aug 2024 04:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723264300;
 bh=FP0SLnbmxR3QxUwdq67ysAoCwxNoq4kFizOJyy1fu7s=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=p79bkFBTIEvHYcDsCMRnZy7VYeG0cj0oxo72uUa0Ut7cUj2qvEyIBeHJN4B0wc2AU
 65JLNIqBw2xBlrDf1hLYpL7Z76VRU/S/It+3xkLjgvkYHUrS1JK/FCHosFUFrEOEfI
 Zu0nsFr9klWwsJKVnNb6pKHZ7OgxHmdLAh7XmHpTG8/2QcO6qgMAYOOJpKOAkGJWA8
 5FP75d1cwjr3xa+06krOLXxuntXZ8OEGrnxpQm9wJiwPkRknVUsatKKyjGN/bZ5l6B
 QuzxaNU8VmNQx1FVEEkvZCGMVQOibl8vxbVOGmvKmY3+PpBoUq49ersem5tGCjBb2d
 XsuJQVizPJwCQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33D8D382333F; Sat, 10 Aug 2024 04:31:40 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.11-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txFVKQ-E5rPvgUJSo_ypt4uWW4dCyozsb_A5HD8Ldc5zQ@mail.gmail.com>
References: <CAPM=9txFVKQ-E5rPvgUJSo_ypt4uWW4dCyozsb_A5HD8Ldc5zQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9txFVKQ-E5rPvgUJSo_ypt4uWW4dCyozsb_A5HD8Ldc5zQ@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2024-08-10
X-PR-Tracked-Commit-Id: 06f5b920d1d0b686d794426264dc39aa8582db14
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 15833fea97c1fdb3b34fceefa4b51177dd57e18f
Message-Id: <172326429872.4136681.1164713458856473491.pr-tracker-bot@kernel.org>
Date: Sat, 10 Aug 2024 04:31:38 +0000
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

The pull request you sent on Sat, 10 Aug 2024 06:00:08 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-08-10

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/15833fea97c1fdb3b34fceefa4b51177dd57e18f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
