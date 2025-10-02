Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9989BBB5104
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 22:00:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCE1B10E39B;
	Thu,  2 Oct 2025 20:00:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QLbi3D50";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4732E10E39B
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 20:00:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DECF545A16;
 Thu,  2 Oct 2025 20:00:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1C35C4CEFC;
 Thu,  2 Oct 2025 20:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759435233;
 bh=+Y5IIrpmo8Fop2P4afHswp2lIG67bi2gEJ1E3lktmkY=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=QLbi3D50KkFIdW52bhk1Fiv3BjUWj3vO6y0I2r4oR+RLOAkTuCpNKaFxgvf0OxHao
 ZaLmaRVR+6Wb+pXNl1btidcQJo0JqmXwOKl6liX7pcruIbZkoufxWyjlj87OJkPiQX
 cHGT+mDJBHzHUvjQoeE+I3CPtnGEzp6JjCDYEL/O7QhuJwgw+6JieOuZYSDQuGs1aL
 PUGb46AQhZxI25dL9NZ1gMCamRHypPW8u88RxwASAXyMVtIGNUgf4aqbLpbwkA3Fu1
 /TGBgikHG7rn/eOJT+9O3JhT8e2p4U1D7utDxWRcC+R5gJ8YH3dBy1ntqP59D3TqYw
 ACSmwcXBmlD3w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 DFD9539D0C1B; Thu,  2 Oct 2025 20:00:26 +0000 (UTC)
Subject: Re: [git pull] drm for 6.18-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzYUBfz+YmifRDgdBsuTL=FpBxQVfxu23it48kGRzJNPQ@mail.gmail.com>
References: <CAPM=9tzYUBfz+YmifRDgdBsuTL=FpBxQVfxu23it48kGRzJNPQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tzYUBfz+YmifRDgdBsuTL=FpBxQVfxu23it48kGRzJNPQ@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-next-2025-10-01
X-PR-Tracked-Commit-Id: b2ec5ca9d5c2c019e2316f7ba447596d1dcd8fde
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 58809f614e0e3f4e12b489bddf680bfeb31c0a20
Message-Id: <175943522561.3413181.16158883363310747898.pr-tracker-bot@kernel.org>
Date: Thu, 02 Oct 2025 20:00:25 +0000
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

The pull request you sent on Wed, 1 Oct 2025 14:06:07 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2025-10-01

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/58809f614e0e3f4e12b489bddf680bfeb31c0a20

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
