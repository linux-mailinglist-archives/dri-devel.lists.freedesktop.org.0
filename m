Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F2864BDDC
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 21:20:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADD0410E345;
	Tue, 13 Dec 2022 20:20:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B62210E346
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 20:20:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C154A6153A;
 Tue, 13 Dec 2022 20:20:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3477BC43398;
 Tue, 13 Dec 2022 20:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670962805;
 bh=FIFYxRafz/IoKAee6YwLUlifVFEA8reoXarVh2nr+1U=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=nyxMQcPibklqnByu8vJmjftZ2He9bPhSKA9QhsNbdXLpik9LN/Clpgtpm6HjM0++l
 NykS96YZq8Pwv42oJjG2ufEI3eqxzBGU+tNWyS4qHdsW5YJIzr8oPtslBunSZOZTFb
 kimpAwcPWQOnEQR6Ov56XCCGcHi6fD2qKTus8GDd7Sut/WaDtzoKc0bGh7BnyNNZNQ
 q2fgVF5QkZ1a76uk77v8ZpmIrxBmE2q1u7ihUP5emn3Lr20bNLfxY6Vz9ma/ERaQXz
 ec4rnqyBKU5kbd0w+b/4fD5ulgH+ZF+EOyNbIgsBCtZz4PxU8v71P7ReZqsYRfIw+Z
 ZIanav6DnwmUQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 229F2C41612; Tue, 13 Dec 2022 20:20:05 +0000 (UTC)
Subject: Re: [git pull] drm for 6.2-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txGCMqyriq_xiwgFCUBa-PpHvSuRQuptAHusHcjpH+zqA@mail.gmail.com>
References: <CAPM=9txGCMqyriq_xiwgFCUBa-PpHvSuRQuptAHusHcjpH+zqA@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9txGCMqyriq_xiwgFCUBa-PpHvSuRQuptAHusHcjpH+zqA@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-next-2022-12-13
X-PR-Tracked-Commit-Id: 66efff515a6500d4b4976fbab3bee8b92a1137fb
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a594533df0f6ca391da003f43d53b336a2d23ffa
Message-Id: <167096280511.13378.2856917258516541935.pr-tracker-bot@kernel.org>
Date: Tue, 13 Dec 2022 20:20:05 +0000
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, "Koenig, 
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pull request you sent on Tue, 13 Dec 2022 12:56:25 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-next-2022-12-13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a594533df0f6ca391da003f43d53b336a2d23ffa

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
