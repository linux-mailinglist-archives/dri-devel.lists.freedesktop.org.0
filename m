Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E41F93D7F4
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2024 20:07:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AFB510E162;
	Fri, 26 Jul 2024 18:07:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="V+fiVDrP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B0110E162
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2024 18:07:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 38D80604EF;
 Fri, 26 Jul 2024 18:07:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0AE2FC4AF07;
 Fri, 26 Jul 2024 18:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722017257;
 bh=ebZmOXvycukmY/MHS6iPe9rr58K6w0SMUrPZdFY/rew=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=V+fiVDrPntzWCVmuvVCj5co9wQq+kvTuV8+yGxCHalUpu9yDzc+aLlBcDrSX5QoUX
 YP/xPgpq67IcHxZxQomc7MLO25MURhsjDNfRF201357om+dWh8klRONbexjFsl1bcy
 rh/uZvsm2sbGUbyDRwwy5j0Kz1IzOIglAb20xDBbdSdpp4XgJ/vll0ZzDJqcGJfJ/f
 SGEhzXbDDbzCm6zB2AtrXLTve4g6KXnXDASfyMlkt2UuFs5ucLFbDPbDKu/HO4rnvT
 blXYbopgjVPGUfC97L/IBly52SU2iGR3aflRKYn1F6ivj+gv4mKbZrlWQ+DbE2He+b
 HaF2v4NdDg3Vg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 021BDC43443; Fri, 26 Jul 2024 18:07:37 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.11-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txAJoSXCOZHfjf2yObhi7tdQMxjXGggmujbjv1uLdZTew@mail.gmail.com>
References: <CAPM=9txAJoSXCOZHfjf2yObhi7tdQMxjXGggmujbjv1uLdZTew@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9txAJoSXCOZHfjf2yObhi7tdQMxjXGggmujbjv1uLdZTew@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-next-2024-07-26
X-PR-Tracked-Commit-Id: d4ef5d2b7ee0cbb5f2d864716140366a618400d6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0ba9b1551185a8b42003b708b6a9c25a9808701e
Message-Id: <172201725700.32235.5942224185755174399.pr-tracker-bot@kernel.org>
Date: Fri, 26 Jul 2024 18:07:37 +0000
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

The pull request you sent on Fri, 26 Jul 2024 14:00:29 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2024-07-26

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0ba9b1551185a8b42003b708b6a9c25a9808701e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
