Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0A44AA139
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 21:34:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41CCE10E48D;
	Fri,  4 Feb 2022 20:34:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4696C10E48D
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Feb 2022 20:34:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DCFE1B838EE;
 Fri,  4 Feb 2022 20:34:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 73CE9C36AE2;
 Fri,  4 Feb 2022 20:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644006879;
 bh=GaSLwahtdKoDtXHOlXEmD10iIBifIuPkqMOLZblWmJo=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=Fqf8qpPn+Kriv2NPX6eGPU/gj2Q+jcyCrMPdO8/vHXGr6IFpsFrWEajabyrWLV8gU
 bNMOM1vAHOHCILhf4IJ9fPVkoSGFL1hKYnbSSrbH0kw2xFG4Yq6IgVh3uBKvVqwweG
 zqNWvGWcihmOOl47uegoAfTSDoSx6SwY0prtjXmpx3Kqs51nMInVrPVSGTIjC8jQni
 ic67xvh55mM+ZdPDDXeYaJeRJ6uCuESL2smMv4RE9xRe8HoWWRwURd87PjayeLwG3X
 j4tS+Z4yi1yAG53qXHNOMJuOTmOiifJ7uw2DQUAbOmJ9CI61g6534lKgItM1qN+EV6
 zSCiPsGkO45Ww==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 63CBEC6D4EA; Fri,  4 Feb 2022 20:34:39 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.17-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tx9Ag9zPenB48F0qCZ1B8gxF0vtRG5-h3We_2QW_z+pxg@mail.gmail.com>
References: <CAPM=9tx9Ag9zPenB48F0qCZ1B8gxF0vtRG5-h3We_2QW_z+pxg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tx9Ag9zPenB48F0qCZ1B8gxF0vtRG5-h3We_2QW_z+pxg@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2022-02-04
X-PR-Tracked-Commit-Id: 9ca3d3cd0857523c95ab8cdbb6cfe47b8f90e309
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 31462d9e47cf6e2cb10a69c833b5e081fff7086d
Message-Id: <164400687940.31755.15517374825699094199.pr-tracker-bot@kernel.org>
Date: Fri, 04 Feb 2022 20:34:39 +0000
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

The pull request you sent on Fri, 4 Feb 2022 16:09:15 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-02-04

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/31462d9e47cf6e2cb10a69c833b5e081fff7086d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
