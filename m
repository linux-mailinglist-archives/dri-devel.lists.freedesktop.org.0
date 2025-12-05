Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9375FCA6080
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 04:49:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A2BF10E247;
	Fri,  5 Dec 2025 03:48:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="H6cjAEgY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3829210E247
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 03:48:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1E6A260204;
 Fri,  5 Dec 2025 03:48:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2461C4CEF1;
 Fri,  5 Dec 2025 03:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764906531;
 bh=qzyTcJopicMOcdDi6lT/SMCcMArz2wntcEJw9Zd71us=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=H6cjAEgYnU30F4RSwJur3O+K/FcWDyXzbIf8EHMA1RW1gYKhFF+gcN4E+w+bCUXoz
 hHzGSp0p257rGbQcT8FoqZib6PAhbHdqRGzark99e0q/Ts9LQbhZrEGOndrbQHsHQt
 MqPVGOXUeoMMV2udfBGawc8LCgAsBkvtiQOAz7Fl++vwyMa5o1/nZIzcXkTz7VaDs+
 T64SR7tf/iLUSUcB3Hj8otvVAk9YCuWKhKQjYUkqjllA8+bsUVl8LTN32jozWhdQqx
 v32uCfUApRQYpDWYnRkM3A2V4fwJaTiIpSPPOdVa38PORdq19FqGOXvEu6td1nkEvJ
 2MdoUaGjzmQvA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 F2BA73AA9A89; Fri,  5 Dec 2025 03:45:50 +0000 (UTC)
Subject: Re: [git pull] drm next part 2 for 6.19-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzSsXFDmudyA4UWEDTXp0mBaS+XSUWTZhxK49Bm1MREbg@mail.gmail.com>
References: <CAPM=9tzSsXFDmudyA4UWEDTXp0mBaS+XSUWTZhxK49Bm1MREbg@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tzSsXFDmudyA4UWEDTXp0mBaS+XSUWTZhxK49Bm1MREbg@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-next-2025-12-05
X-PR-Tracked-Commit-Id: c7685d11108acb387e44e3d81194d0d8959eaa44
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: deb879faa9d2f327ac5c079d9d1a1747b79260e3
Message-Id: <176490634959.1091160.5299978894700798946.pr-tracker-bot@kernel.org>
Date: Fri, 05 Dec 2025 03:45:49 +0000
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

The pull request you sent on Fri, 5 Dec 2025 11:15:30 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2025-12-05

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/deb879faa9d2f327ac5c079d9d1a1747b79260e3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
