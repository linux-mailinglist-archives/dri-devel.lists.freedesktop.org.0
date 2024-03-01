Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCA486EA2B
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 21:17:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 267F810EAC0;
	Fri,  1 Mar 2024 20:17:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Z6Ycz0EI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BEAB10EAC0
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Mar 2024 20:17:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2AD6261BD2;
 Fri,  1 Mar 2024 20:17:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 025E3C43390;
 Fri,  1 Mar 2024 20:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709324245;
 bh=Kj/kYldBRmVKDR5v5fTZ7Yo+eiuB4GvJWSOHxUMC8O0=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=Z6Ycz0EILJ8Vqb7pMG7y2RuILnVwXhGfEFGJ9h2U53K+RH9K75HETs1K6dm3OI6Ru
 7oOJcu2hjAInQh9/3ooAJdGr0H9fgSnni6p+voP5FpaGXpHc0Z2fI+iEXfJGk9ZKIu
 VnmfmCjlf1VBy9QnTy42D/11V36IaBFC6ftpE2Esomua5nqpPuzdfTjkuQurCsD4XR
 OuJhDEOQbbCIzO3FVD55H9SgdoBdmZcI5/WvQgN2oz7Vv6JUeUbtzhuTMLHYiQ08Ly
 pdy8r16VgeMsSruK/7rZXD5FtPVWrdsMBOnlFcfNjsI0p9AHnXu2Vp2vwXTfTgJwGU
 06z0mfOOORJIA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 E3B57C595C4; Fri,  1 Mar 2024 20:17:24 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.8-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyc=L_69XMch05z=R+Kw2BC-jRCgnYMXMRtUN+RkCW=2w@mail.gmail.com>
References: <CAPM=9tyc=L_69XMch05z=R+Kw2BC-jRCgnYMXMRtUN+RkCW=2w@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tyc=L_69XMch05z=R+Kw2BC-jRCgnYMXMRtUN+RkCW=2w@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2024-03-01
X-PR-Tracked-Commit-Id: f6ecfdad359a01c7fd8a3bcfde3ef0acdf107e6e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7187ea0978bb4226873b55a065b5dcdda7530b9f
Message-Id: <170932424492.25962.2304478243242740471.pr-tracker-bot@kernel.org>
Date: Fri, 01 Mar 2024 20:17:24 +0000
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

The pull request you sent on Fri, 1 Mar 2024 15:41:03 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-03-01

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7187ea0978bb4226873b55a065b5dcdda7530b9f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
