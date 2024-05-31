Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F4F8D6CE8
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jun 2024 01:40:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 796C710E24B;
	Fri, 31 May 2024 23:40:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pJVyl1lw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91C4110E154
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 23:40:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 45B6062E6D;
 Fri, 31 May 2024 23:40:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EE222C4AF09;
 Fri, 31 May 2024 23:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717198817;
 bh=1KlMNONzxAK2P1ijtWrLwDEe0sUk3kWuIs8qOS8MZhE=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=pJVyl1lw9ZSDMTHq7UNqzcpQYWxmQKC0nPA9OLJX/Mn7ZeniVrvuhc7FQmzPVHqNc
 rIdEg+WgbWkqRPo1qzth8iT7K0rELmIujPr0MBv+gLDxFd782O3QNogTeRjs6Vzryp
 p0eSqgOl5fEs7T0jqzTWvUZ85G8sQNXc+0WbhIX+7PopBluDP6BhELVWWvFtP2U7U6
 w+TeS14wVJzbFkTHSH+UkbGyAPo9K9ClAuBDrhAbQdvzAs/uJzm73Esc7tUgqu4wLp
 hlqndHZw0rwZ2aM/6LmPgnKk/TMGoTNbdwvS05WuVGs1iesktbMt4HMm32okeulDg8
 VpEr5ZYXO5Eug==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 E3D11C4361B; Fri, 31 May 2024 23:40:16 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.10-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzbuJuE=aW-A9Uwst-VuqJwXHR0Ez6Ov-OMxTvDEVjsMA@mail.gmail.com>
References: <CAPM=9tzbuJuE=aW-A9Uwst-VuqJwXHR0Ez6Ov-OMxTvDEVjsMA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tzbuJuE=aW-A9Uwst-VuqJwXHR0Ez6Ov-OMxTvDEVjsMA@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2024-06-01
X-PR-Tracked-Commit-Id: a2ce3f7752bfbb47e659574fc2e1e6942bca3c29
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cc8ed4d0a8486c7472cd72ec3c19957e509dc68c
Message-Id: <171719881692.1891.16468497625005432196.pr-tracker-bot@kernel.org>
Date: Fri, 31 May 2024 23:40:16 +0000
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

The pull request you sent on Sat, 1 Jun 2024 06:46:21 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-06-01

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cc8ed4d0a8486c7472cd72ec3c19957e509dc68c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
