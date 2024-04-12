Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 139F38A3333
	for <lists+dri-devel@lfdr.de>; Fri, 12 Apr 2024 18:08:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79FB210E13F;
	Fri, 12 Apr 2024 16:08:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BHz4dGyU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 223B710F772
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Apr 2024 16:08:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A463C60ACF;
 Fri, 12 Apr 2024 16:08:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4872DC113CC;
 Fri, 12 Apr 2024 16:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712938113;
 bh=8qkYX1O+0T1AeF5thKpWU1Y7WZ6HUyboKnu0kADCcBM=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=BHz4dGyUObmKYA17DhdSbHejDT2JPm61fRnUyW48Gzevl7yEzKNZf27ssfZU9v04P
 ewNwUjZo/Fp+Ae/qakbA5pTvRB45Y2bXaIu4U1U+BnlEvyaD5Q3fuSFi2qr2sEzOvJ
 JCs9OluRtiKYCJKZ3ZF6XCiQh5xqG8A8x1wYOnz4HdoNXLdo3G6g3FpMsopE3op0Yt
 UKarNBIvm16Uie1PvEgSDIpI3okZHR9qp07+D3BKIWWW5nTPPycLcgVaXjEAiRDzQA
 eBUHJQl7GuoWPVutcNbYv0fcFWBloUo5JxRDmPysgU/VYTsMpSWtqF+6801w9ZrICR
 AgVyubK3jgSjA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 3FE9DDF7857; Fri, 12 Apr 2024 16:08:33 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.9-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txv4MKXFj67mKAV8BZ_uyW2cVz9rUioHfSAsCPVQYgkxQ@mail.gmail.com>
References: <CAPM=9txv4MKXFj67mKAV8BZ_uyW2cVz9rUioHfSAsCPVQYgkxQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9txv4MKXFj67mKAV8BZ_uyW2cVz9rUioHfSAsCPVQYgkxQ@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2024-04-12
X-PR-Tracked-Commit-Id: 3b0daecfeac0103aba8b293df07a0cbaf8b43f29
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d1c13e80049d927c88021e3180d5103f2e6f55c4
Message-Id: <171293811325.2506.4766258602336377769.pr-tracker-bot@kernel.org>
Date: Fri, 12 Apr 2024 16:08:33 +0000
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

The pull request you sent on Fri, 12 Apr 2024 11:34:33 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-04-12

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d1c13e80049d927c88021e3180d5103f2e6f55c4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
