Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 882627F7DA9
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 19:26:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DEF210E36E;
	Fri, 24 Nov 2023 18:26:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38A1710E36E
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 18:26:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 86DF9CE2806;
 Fri, 24 Nov 2023 18:26:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2CE95C433C9;
 Fri, 24 Nov 2023 18:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700850381;
 bh=+a17ORrYB958IpB4yDfi5dd5LZPIqWUCcXi520YmShw=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=aGyY7j3DqFh0SGT5m+nLArDi9DPFMAdvwoWiYzS0DRIIwwwNT/r+6vSWPUk4pehm5
 LuH/S1hWfxk4hv0WPB37dXJwaCJqHzutY5vQoBLlgvwKPxu9tHXhtdSRhpTDjqrY4m
 pqQjaCVuS9DXtx4y/B9dRLfIcqj7twCc7hFNT72hC8tYcYmmYfaae2C7D10BoqBvhD
 Gbt2mz1Y61gellOJDazwH+NS7mYHC5Tj1JenECcNIwAcmgjTe2t7zZ77gNk90Eqtgu
 JdbP+QJaLvp3BC6el8wo+5k4Q1DZu5A3gk3RhqhSE9Ny+sbA1HW0eO899QoP1CLAd5
 XffETUWguXurw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 19576EAA95E; Fri, 24 Nov 2023 18:26:21 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.7-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txezDxgPxV4UJ-RPVxuAqO4k2kdDj-oUAyFdP+CztJPzg@mail.gmail.com>
References: <CAPM=9txezDxgPxV4UJ-RPVxuAqO4k2kdDj-oUAyFdP+CztJPzg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9txezDxgPxV4UJ-RPVxuAqO4k2kdDj-oUAyFdP+CztJPzg@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2023-11-24
X-PR-Tracked-Commit-Id: b3ca8a08d8ed0dc8a9e236d9294efd58554a7b05
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: afa0f6ee000abd220a8160f0375b5b8d3e4284f2
Message-Id: <170085038109.12986.1037268827572530527.pr-tracker-bot@kernel.org>
Date: Fri, 24 Nov 2023 18:26:21 +0000
To: Dave Airlie <airlied@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pull request you sent on Fri, 24 Nov 2023 11:38:52 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-11-24

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/afa0f6ee000abd220a8160f0375b5b8d3e4284f2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
