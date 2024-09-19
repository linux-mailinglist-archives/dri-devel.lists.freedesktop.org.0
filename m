Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0230397C699
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 11:10:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E6110E6B2;
	Thu, 19 Sep 2024 09:10:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fOwodeeA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20FDD10E6A7
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2024 09:10:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4830EA43B9D;
 Thu, 19 Sep 2024 09:10:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9D57C4CEC5;
 Thu, 19 Sep 2024 09:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726737011;
 bh=aPj/d/4bg4JcV7FUscYipxQyjHqi+ST42baM/NxI0F4=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=fOwodeeAeuEui/UYDEY17ZfQ6Bs6LtDuBmu08iUwspE+SKSefeJL8sOpg12pbaQhC
 Y34hi2rvRS9Re4dhONuFaidiaLOL3qoy25Pcjal8QZ8PU0zllHXX87m8Mh2XiTgOxB
 RXuEg4yacLux9xFYbiOQUGQ/eygQ23cPwFKJoU+raqMAf7D5vgK/HhNHIE3DaLV6kf
 cyPB8MG8iTNdq3t3KKArBgBHY0xt2xSs6ygPuYNFormwA2dJamFsvuvFXoZNY/rnVw
 2XOMFTySRsSu6y/pEsmjcPH6hkTy2htmH/AwRLcEz7bsd8hCdMe6pdBNHN5cv+0BOU
 nMgi3WCspmItQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ECFBA3809A81; Thu, 19 Sep 2024 09:10:14 +0000 (UTC)
Subject: Re: [git pull] drm for 6.12-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txujwc-GoV6qB1DpKjbDi-8uDcJLnJFSY4OBgPu=ZAVBw@mail.gmail.com>
References: <CAPM=9txujwc-GoV6qB1DpKjbDi-8uDcJLnJFSY4OBgPu=ZAVBw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9txujwc-GoV6qB1DpKjbDi-8uDcJLnJFSY4OBgPu=ZAVBw@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-next-2024-09-19
X-PR-Tracked-Commit-Id: ae2c6d8b3b88c176dff92028941a4023f1b4cb91
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: de848da12f752170c2ebe114804a985314fd5a6a
Message-Id: <172673701376.1425468.11289340107634023074.pr-tracker-bot@kernel.org>
Date: Thu, 19 Sep 2024 09:10:13 +0000
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

The pull request you sent on Thu, 19 Sep 2024 17:48:14 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2024-09-19

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/de848da12f752170c2ebe114804a985314fd5a6a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
