Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E13EC6BEFD6
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 18:38:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A973410E3D8;
	Fri, 17 Mar 2023 17:38:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC3A710E3D8
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 17:38:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CA443B82669;
 Fri, 17 Mar 2023 17:38:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 699E1C433EF;
 Fri, 17 Mar 2023 17:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679074730;
 bh=Dbutxdfd0A1bvEpqs4wNgSHDpQrkwQ9Ec9HoUhD+vKw=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=RGBOwNjSAn1nkggvj+hc2CA7kQSaqPPbKefmRaQWzAfDAfWpRkrN2y0kAxD7Q8Uu6
 khrLxKLQLnC9ZD9TOkR0yJxodmDLBdMv91WLVl7HU6AdInsnU8UQ1z1GbPSH7oYVfK
 ico7XRrLIa7SAmAW2lAKzUfX/sjFsh28wEoBujlT/rUtxknjS70hV6KmpSLlGUIrHR
 Rt9fYoWteSsg/pWVS/i0QJGZTYMXySN1z5DabFR3Aq17vnoraSjCfqnOpwr/vmX/fr
 Bwu4y9ENjT2K38As0Cta1gA27Ucw6X3vCDi8526t0xTTDeQeXokT3SUjTTR6OCHPtW
 mr8k52WI2yvyg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 59546C43161; Fri, 17 Mar 2023 17:38:50 +0000 (UTC)
Subject: Re: [git pull] drm fixes for v6.3-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyVZZgr8S+Bfx6cyF2ied2btog7Y6FkDoteF+JFv__rgw@mail.gmail.com>
References: <CAPM=9tyVZZgr8S+Bfx6cyF2ied2btog7Y6FkDoteF+JFv__rgw@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tyVZZgr8S+Bfx6cyF2ied2btog7Y6FkDoteF+JFv__rgw@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2023-03-17
X-PR-Tracked-Commit-Id: c00133a9e87ea5324d0b883d801eb6656f26739b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2cf5a401c87178237c5b782c44578c26690a802b
Message-Id: <167907473036.9394.17253234522073737974.pr-tracker-bot@kernel.org>
Date: Fri, 17 Mar 2023 17:38:50 +0000
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

The pull request you sent on Fri, 17 Mar 2023 17:59:36 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-03-17

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2cf5a401c87178237c5b782c44578c26690a802b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
