Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EA88C2BFC
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 23:39:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B466F10E1E1;
	Fri, 10 May 2024 21:39:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mg/MUTOD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4A0010E0ED
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 21:39:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7A0E6CE1EFA;
 Fri, 10 May 2024 21:39:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B34CBC32781;
 Fri, 10 May 2024 21:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715377154;
 bh=JAgo/kCzjYOr+03CJubu4G+6gTUVGg0w6nMVy9R0Ho8=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=mg/MUTODtTBT4c1uDbudAadKDt8WBGRe87HANmUpO6JmBwNYfX7HsMomnmLgi/Fmr
 s8kC4B8mG6EzFa0cT6OKbutuizVzNRm3wM32/k87Idw+reBzvf+gY1UMjiffEqs31d
 g29ea+Q2cuKH8B4bvvtzNUNQySZca8lqM7iZkPOi1D/605u6ehzyeybYGR/MdOUyMP
 7ze5PYrpn/r0NYfPxSOLimI3pb5gn62u5YU+xzusOU6/7jJmelDVVPUxD4f/7lJCyc
 AQb/50U6jQxqIToz1q3ISPUu8U45xdp2h7TYH8L7AfIzImR832UFVvj4jcg49ZDhhx
 ONAjD70gUsmSg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 A98F9E7C112; Fri, 10 May 2024 21:39:14 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.9 final
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzZ8edq4gpxJpube9EOAVDFXr-n7Hwh9qwZ=_aBP34esA@mail.gmail.com>
References: <CAPM=9tzZ8edq4gpxJpube9EOAVDFXr-n7Hwh9qwZ=_aBP34esA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tzZ8edq4gpxJpube9EOAVDFXr-n7Hwh9qwZ=_aBP34esA@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2024-05-11
X-PR-Tracked-Commit-Id: a222a6470d7eea91193946e8162066fa88da64c2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cf87f46fd34d6c19283d9625a7822f20d90b64a4
Message-Id: <171537715468.8717.9971362074870569846.pr-tracker-bot@kernel.org>
Date: Fri, 10 May 2024 21:39:14 +0000
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

The pull request you sent on Sat, 11 May 2024 07:18:11 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-05-11

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cf87f46fd34d6c19283d9625a7822f20d90b64a4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
