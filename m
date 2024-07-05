Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22105928DD4
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 21:38:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FFD710E2CF;
	Fri,  5 Jul 2024 19:38:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WnPBd/qO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3376510E2CF
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 19:38:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 10D1ECE3ECC;
 Fri,  5 Jul 2024 19:37:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AB77BC4AF0D;
 Fri,  5 Jul 2024 19:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720208278;
 bh=QmxDXWhbURXuUWtYMT4oPszmHDCN/dLT/1LFJprLC70=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=WnPBd/qO4nDYm50JaSwcxylUIq+VZkgRSQHLTerfcuwK+3GkK+l8YmS45v9ps9nBt
 PT9QkBCi1gY6njfJFzO4rSSF++FF4+WvnI0vDlR1l/V3FcTOXtFvTZtIDLLOuMHGl0
 lzH2j4xCpwekjBXEnyLCqT4l3Lpy4yySrgMEDEAijqhhR6Z7IN4NVM2IpLr7qTPbXC
 D20jX7Zd9Y25/xaq8nQsY0WICp60+SWeJgEBX3dBb+quRYLRK2DLbsOktQmqLxpAB1
 6dndrt1i/ZIVHmn+Inxw1g3DIsFvTlUgrPrjuHnP6jfMkZGvL/DexjCHGPfv9SU/qu
 DTFSiesyOwHmQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 A0479C43446; Fri,  5 Jul 2024 19:37:58 +0000 (UTC)
Subject: Re: [PULL] drm-fixes for v6.10
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZogN3gNPBVb29Vgl@phenom.ffwll.local>
References: <ZogN3gNPBVb29Vgl@phenom.ffwll.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZogN3gNPBVb29Vgl@phenom.ffwll.local>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2024-07-05
X-PR-Tracked-Commit-Id: 3c6f5afd91cfacba9f43fd388f2d88c85195ae32
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: dd9d7390b2de008448eb3328d4a0504c76c74572
Message-Id: <172020827865.9250.17848296938618641540.pr-tracker-bot@kernel.org>
Date: Fri, 05 Jul 2024 19:37:58 +0000
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Dave Airlie <airlied@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
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

The pull request you sent on Fri, 5 Jul 2024 17:14:38 +0200:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-07-05

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/dd9d7390b2de008448eb3328d4a0504c76c74572

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
