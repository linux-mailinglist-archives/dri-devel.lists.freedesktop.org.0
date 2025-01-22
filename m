Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F75EA18903
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 01:39:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44CB310E64C;
	Wed, 22 Jan 2025 00:39:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ClqUZfYM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B477F10E64C
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 00:39:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2EA8B5C016D;
 Wed, 22 Jan 2025 00:39:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C7D7C4CEE1;
 Wed, 22 Jan 2025 00:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737506384;
 bh=h2CxdLX0TO4ReX0AXaRhql5JkMmgrCRuKuuYXzx13KE=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=ClqUZfYMN6ROfmbSznQGM8o+MHaZuW3XoD2y/KTW8pP/09Rnzq2WxqVGIVEzJJkh8
 0dNCNQTPmDlTs1GCfZsk5ov70HtaNEsW+y6nQJY2zYCfZCZ3b33Jc9tKDbCiop4zqR
 QmXcvy8owIcov4eucuWbY8Kv2Zk3JAAijXqjX8V2OtYxn537ywkjqpXy3kPHLHG+e3
 FcuUgLZVCdPHYecmmvVi1Bl9s2k1IdS37VEkXh6kgBJrMDlLkE8yUiWCEbBRFPyPuR
 1eWC+29dAp9mV85sLoQbPCvsqSgBp5nYnE6ovOM9I3TNO17udwhO2sBp6ydWsn/YAI
 r4wCE+zGHsHfg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 D8F59380AA76; Wed, 22 Jan 2025 00:40:09 +0000 (UTC)
Subject: Re: [git pull] drm for 6.14-rc1 (sending early due to holidays)
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tw+ySbm80B=zHVhodMFoS_fqNw_v4yVURCv3cc9ukvYYg@mail.gmail.com>
References: <CAPM=9tw+ySbm80B=zHVhodMFoS_fqNw_v4yVURCv3cc9ukvYYg@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tw+ySbm80B=zHVhodMFoS_fqNw_v4yVURCv3cc9ukvYYg@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-next-2025-01-17
X-PR-Tracked-Commit-Id: 951a6bf30667307e7901aac5e74e50dadd5ccfc7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 96c84703f1cf6ea43617f9565166681cd71df104
Message-Id: <173750640881.168001.6290341865029203534.pr-tracker-bot@kernel.org>
Date: Wed, 22 Jan 2025 00:40:08 +0000
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

The pull request you sent on Fri, 17 Jan 2025 15:22:44 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2025-01-17

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/96c84703f1cf6ea43617f9565166681cd71df104

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
