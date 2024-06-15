Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3BF9095C8
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2024 05:01:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF5D610E2C6;
	Sat, 15 Jun 2024 03:01:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lHrK/AVy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C254D10E2C6
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2024 03:01:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id ADFBC62111;
 Sat, 15 Jun 2024 03:01:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7FCF1C4AF1C;
 Sat, 15 Jun 2024 03:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718420478;
 bh=2WxBplAAQ71N5XwRDn4LeaKrS1hGSIRuVcFtwLE/t64=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=lHrK/AVyZJ393mFOPLHQgtbSJ6YeT+BwLAqw02mRmZMFUbeR0o8zBTlZ54URet/U+
 fg5/sEAQjIYwzXWN5Sxaa0dIbdjPQMMfZV/FZ/cjHF00OfFkOU6LEVTKSb/gHWYhHk
 DkN41Kw/xh5NKm0V67LUr5C6VWUhk6pGnAH11UWnUcqGmA6duX1UFHCpLFrTwVVY6N
 ZonnHypJaxu/dBD/fQL7XxiuS57Yws38aDzKMrywi5v3M9q5sZK1H727LMBxhZj4XV
 RlmVw10lJ7SaA/UcDQGAqdfrZnDRqRkiOdKKOcw+mPGX1y58nAcGL6uKWuvEsdGQFE
 Y38jt1ye632Jg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 7527CC4332D; Sat, 15 Jun 2024 03:01:18 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.10-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tw_3xzMPo46mPYfkPpnxy8jgeBy1Q5Ep1pH8Ws2BdA87g@mail.gmail.com>
References: <CAPM=9tw_3xzMPo46mPYfkPpnxy8jgeBy1Q5Ep1pH8Ws2BdA87g@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tw_3xzMPo46mPYfkPpnxy8jgeBy1Q5Ep1pH8Ws2BdA87g@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2024-06-15
X-PR-Tracked-Commit-Id: 9f0a86492ac4de4d1db718986a91833fdc914a54
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d4332da0f2b5cccf2b195035a3f30fce7c1bb7a7
Message-Id: <171842047847.4182.809836259225642221.pr-tracker-bot@kernel.org>
Date: Sat, 15 Jun 2024 03:01:18 +0000
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

The pull request you sent on Sat, 15 Jun 2024 08:05:44 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-06-15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d4332da0f2b5cccf2b195035a3f30fce7c1bb7a7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
