Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CAB946216
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2024 18:53:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3C8110E0EE;
	Fri,  2 Aug 2024 16:53:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fS2QhEBX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB59810E0EE
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2024 16:53:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E6F4362AFC;
 Fri,  2 Aug 2024 16:53:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B745AC4AF0A;
 Fri,  2 Aug 2024 16:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722617592;
 bh=8Dg4bJ72oqnQWu5tlfNzixvGk6LmkB0QrVhR6jU1j+A=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=fS2QhEBXQ7E33MeL/Xto2O82bHsyjsVJ1W1Lnxn0pUekTKCG2CYdtRI6O9SkC9wvA
 ohDqbFN7Q/0muE6ltGo28og8T+WfId5OUqtke/GW8dr4yYGEAqpzENg93PnYql6ngI
 X29ACVbEiasO/4sdeEHTPdTsrs90k5Xe2/3DD6Ri2KlIOTsM9ENco01a/ysQljs02s
 oy/X6OAFyIpTPc5xvOSHlP5NNzGiWBtZOOfrnwlnJ8rTzwCPMRpXS0C46pVInlF+26
 2LNjvO2s9hXprU4LpFeT5Yn7OkBBUXN5W5R8ndVq+LsSKJW2GQyG+i63kmzhDkTff+
 9HQB7lh/weCkg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 ADB92D0C60A; Fri,  2 Aug 2024 16:53:12 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.11-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tw0tAEd9LQuK-ANW501UATMrCDJvyAube9N_umUBBWFDQ@mail.gmail.com>
References: <CAPM=9tw0tAEd9LQuK-ANW501UATMrCDJvyAube9N_umUBBWFDQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tw0tAEd9LQuK-ANW501UATMrCDJvyAube9N_umUBBWFDQ@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2024-08-02
X-PR-Tracked-Commit-Id: 27ce65f65258cf2f2855162cbeef59659a81fac4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 29b4a6996c244f0d360537d6a4a0996468372c17
Message-Id: <172261759270.28369.7704885635755720689.pr-tracker-bot@kernel.org>
Date: Fri, 02 Aug 2024 16:53:12 +0000
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

The pull request you sent on Fri, 2 Aug 2024 15:08:04 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-08-02

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/29b4a6996c244f0d360537d6a4a0996468372c17

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
