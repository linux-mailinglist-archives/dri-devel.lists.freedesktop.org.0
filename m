Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D13912F49
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 23:17:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D23DC10E310;
	Fri, 21 Jun 2024 21:17:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="O3p6wp2O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F34910E310
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 21:17:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2A296625F1;
 Fri, 21 Jun 2024 21:17:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D3C0CC2BBFC;
 Fri, 21 Jun 2024 21:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719004629;
 bh=BD1C7XWZWXhO1/414bvlPN5f2q8+iAA4aSQQAnc/OfA=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=O3p6wp2OCP5li1gyDjIeQMJxcAnKy9bkapBYLck6JpfEo07ClOI4U+TrCdK6PZYdG
 obdSHg3/Szz6qg8mqgq/uBgS/lPySf+C6Ga12w4T5AfmWbfrlzG9ORvvgBie24Otkh
 rSoNLmwCGXoFyYH0vW/b2idKPDyLqsy0UE64U93BFEyO2rtiNoLEqoNGV+h6dUr8fk
 0h391dIWTMAH9KFeUJlvABAGYzzLjOJc/Ty096bhYaOGllIuOdWoS6ARN8TWEpMXzE
 y+8hlhRiu4Dw3eRH5zfYbroYZW/L3M0EPxLoSqTN/wjZ/MViR3/cf3RhH+/6E+MA+E
 PdHMwFlNjCt5w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 C8D71C4167D; Fri, 21 Jun 2024 21:17:09 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.10-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyhLY-=pyy=RU0kyTQmV=_cFujRQ0Z=KY+o8V6KxcA7Ew@mail.gmail.com>
References: <CAPM=9tyhLY-=pyy=RU0kyTQmV=_cFujRQ0Z=KY+o8V6KxcA7Ew@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tyhLY-=pyy=RU0kyTQmV=_cFujRQ0Z=KY+o8V6KxcA7Ew@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2024-06-22
X-PR-Tracked-Commit-Id: d1913b86f7351238106068785e9adc63d76d8790
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d6c941570680d4d11e5c7480c3bcbeff8d3860f9
Message-Id: <171900462981.11487.11294674151371155855.pr-tracker-bot@kernel.org>
Date: Fri, 21 Jun 2024 21:17:09 +0000
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

The pull request you sent on Sat, 22 Jun 2024 06:41:13 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-06-22

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d6c941570680d4d11e5c7480c3bcbeff8d3860f9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
