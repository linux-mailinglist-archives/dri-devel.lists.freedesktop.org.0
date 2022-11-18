Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBB762FFB0
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 23:04:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B23E10E7DF;
	Fri, 18 Nov 2022 22:04:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5BC810E7DF
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 22:04:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 07ADEB82529;
 Fri, 18 Nov 2022 22:04:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AF485C433C1;
 Fri, 18 Nov 2022 22:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668809086;
 bh=6+mpPfvH3CFJbPiRSoqOLPeyKyWOLD8oFXh5W07iSc8=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=HscW2Rjxabl/xOxjSWSWAIo5BTnFuqsgks27Y40vuY4UTDCjFBSlO4LmhQInICYEY
 //Bdi+CUfOMDdzhdu080HWRZIdHhVTQ29i+CIJgyRbcbyBdEpDqJYoWCtZ4zfKVHck
 22pph04Aou/hueGbiLPp/Zy74sLMmm2Man9EdMX+MTvVKgOzW/qNd1wX1q3NtM3ILZ
 Cy6s6VrF2CrfCkNXZOzsAGgTxowUfowli2HutOrUe1+0kotUeXp+49Hhc4s7KDeS8n
 WZCvcxEZe+DuVK/dynmYvTb5QK6ejJ3fefDW0MufCUMhCT5rdAmOHiQRNI16AtAM3A
 FPf7DamJvbR2w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 9C2F4E270F6; Fri, 18 Nov 2022 22:04:46 +0000 (UTC)
Subject: Re: [git pull] drm fixes for v6.1-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tynM8qvm96FV9Z7+EO1u6p8zMiqG9JyaDqqPtzowx3nfA@mail.gmail.com>
References: <CAPM=9tynM8qvm96FV9Z7+EO1u6p8zMiqG9JyaDqqPtzowx3nfA@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tynM8qvm96FV9Z7+EO1u6p8zMiqG9JyaDqqPtzowx3nfA@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2022-11-19
X-PR-Tracked-Commit-Id: b1010b93fe9074f965ebf86e0e382a8a7a71500d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b5bf1d8a23a683d56be574a934a8296912efc758
Message-Id: <166880908663.32251.5726882483287027993.pr-tracker-bot@kernel.org>
Date: Fri, 18 Nov 2022 22:04:46 +0000
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

The pull request you sent on Sat, 19 Nov 2022 06:35:47 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-11-19

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b5bf1d8a23a683d56be574a934a8296912efc758

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
