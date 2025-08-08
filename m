Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9105B1E114
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 05:59:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 369DF10E8C5;
	Fri,  8 Aug 2025 03:59:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RJX95aIK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B17910E8C5
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Aug 2025 03:59:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 432CA45D34;
 Fri,  8 Aug 2025 03:59:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 265ACC4CEF0;
 Fri,  8 Aug 2025 03:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754625582;
 bh=L1kQNAcrEiTkhHM59UBygYJRSCCClLOHT+KdApx6+8g=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=RJX95aIKujn4G2BM+XglZAYnZBCc4oWbqnWDm7+E+9fl3gD/MUb/wqiFz5bW7/NuV
 di2KB3FPWYL5OJt8mHlGjmd2iZI5SFRU/DX9GC1qDnM9EwqSCVgLmO5/uAAUldjosL
 90w3ceUqq03zvI8L/rbfaGQRO6thAIggfG6GvM42c3GW7nzwdNkmZA6Cu9fOwSyL5s
 C0zTcqsUvtX5cwAM7sDktRpEWZ5tknN5H7GZPN6JWmjlLsp/XMVi/shK0GHe7nQKPC
 lBNS7cyaszO6J6stjIzm97hgpsp8tlBbenCP5Q4AHoMbua+tsS6cUfwgOAWYmQs7rm
 gbUXokrX2byeQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADCED383BF4E; Fri,  8 Aug 2025 03:59:56 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.17-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzJAoCXiwvR6tpSv5QctkKu+JAbKZBEbM+M+z+fZOkAOw@mail.gmail.com>
References: <CAPM=9tzJAoCXiwvR6tpSv5QctkKu+JAbKZBEbM+M+z+fZOkAOw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tzJAoCXiwvR6tpSv5QctkKu+JAbKZBEbM+M+z+fZOkAOw@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-next-2025-08-08
X-PR-Tracked-Commit-Id: 64c627519474e687b876e6e50cc28ece16d10564
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ffe8ac927d935d7d4a0bd9ac94afd705df79982b
Message-Id: <175462559517.3795225.5128155180686267196.pr-tracker-bot@kernel.org>
Date: Fri, 08 Aug 2025 03:59:55 +0000
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

The pull request you sent on Fri, 8 Aug 2025 10:16:27 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2025-08-08

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ffe8ac927d935d7d4a0bd9ac94afd705df79982b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
