Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF70799F66
	for <lists+dri-devel@lfdr.de>; Sun, 10 Sep 2023 21:05:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E26210E085;
	Sun, 10 Sep 2023 19:05:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62A6710E085
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Sep 2023 19:05:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BA7C0B80D21;
 Sun, 10 Sep 2023 19:05:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 845E7C433C9;
 Sun, 10 Sep 2023 19:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694372740;
 bh=e2VfS+VM1Yjs30GuO4xzHmKbmrdadnTgCc6OqHEAktM=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=CRaWgQctHMG7FmWkNVwZDlc5b2vS3nnbxBlx+Tpv1VGX+30c9I1fySEdjMGPd+wYK
 dDrCfFi96lAl78GXvkwv88y4zfb10ltprrGLmEA2ihIsSvBJdo07DRFbefEujLAjNu
 4PutVdsD/j3HvornvPWMUw+d2tiE2bFmIBR2qtt1I7gm+uYAzP0g+Usa5AUmhSpcwT
 fhqMn3SMGIE4pMaKkd4HL7j5xUi4UihdNLB33Lmeh+09dpyQOKGksKy2G0U0eRjJ9X
 mHVZIKmVTH7IrOw0x3Rza7YIjJPKiE2yCDOrV09kNQN/o2Zd9a9a1PUeP0oxiBcm/a
 43Qb1zqeyzaOQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 71AA2C04E27; Sun, 10 Sep 2023 19:05:40 +0000 (UTC)
Subject: Re: [git pull] drm CI integration
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tz=gx2_zrQ2XD8JNwW1dg6b+Byr5FgYAAq+2f29rydcgg@mail.gmail.com>
References: <CAPM=9tz=gx2_zrQ2XD8JNwW1dg6b+Byr5FgYAAq+2f29rydcgg@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tz=gx2_zrQ2XD8JNwW1dg6b+Byr5FgYAAq+2f29rydcgg@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/topic/drm-ci-2023-08-31-1
X-PR-Tracked-Commit-Id: ad6bfe1b66a5c146ec236847eca7af4c8806d666
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1548b060d6f32a00a2f7e2c11328205fb66fc4fa
Message-Id: <169437274045.21112.1273555026847076265.pr-tracker-bot@kernel.org>
Date: Sun, 10 Sep 2023 19:05:40 +0000
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

The pull request you sent on Thu, 31 Aug 2023 11:00:20 +1000:

> git://anongit.freedesktop.org/drm/drm tags/topic/drm-ci-2023-08-31-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1548b060d6f32a00a2f7e2c11328205fb66fc4fa

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
