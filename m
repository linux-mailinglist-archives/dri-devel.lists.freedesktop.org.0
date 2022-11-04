Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 008CD61A31F
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 22:17:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F358910E889;
	Fri,  4 Nov 2022 21:17:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1995010E856
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 21:17:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 98935617C6;
 Fri,  4 Nov 2022 21:17:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0CE94C433C1;
 Fri,  4 Nov 2022 21:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667596666;
 bh=fnk5t4Yuj75KWDEUfyMXDF8Aw8hOS9widc+P/CP1qSA=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=C8WUiXgCCvUsH/EXcrIhTeK4WJzplTY17Gq/WafAtXsovJeAElhalPd8u0m98NQza
 CXZPfGgUYN3sL2PIz6ND+goDVmFvxqMJUlOmhl8Zi+KVTrogrJnZz4PGAzC010XXc7
 6C3Uxul2ur0Qlng7yajB92sf7ExlZ7Ztef7yx7AtTBCigY/F+kqTHTlWj1Ho1Uc7em
 jVG7scPiZeLDUFqyqJf1OTvOjPE9xBWnpUHZmSkEk0gGIgTwYTOlNTWLyNoORoOIF6
 pazETlU7Shbr1n2Ve8Re8vXfBQGD4NMbW0kkjCzpZ5sWoptkqbLKOS/vXBR3F7WCCS
 XBiOQi4GKY/wQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 F0554E270FB; Fri,  4 Nov 2022 21:17:45 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.1-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9ty0XRutgBy8fg13q-h-jm3uKQ+x1XyoT_6UcT5i+5uN9A@mail.gmail.com>
References: <CAPM=9ty0XRutgBy8fg13q-h-jm3uKQ+x1XyoT_6UcT5i+5uN9A@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9ty0XRutgBy8fg13q-h-jm3uKQ+x1XyoT_6UcT5i+5uN9A@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2022-11-04-1
X-PR-Tracked-Commit-Id: 6295f1d8b4503ad8a18519b781dd2d1fe5e88c52
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fde25beb382b7dd6f2eab8022ab017cbdfaa3ff6
Message-Id: <166759666598.9521.9955542501930086653.pr-tracker-bot@kernel.org>
Date: Fri, 04 Nov 2022 21:17:45 +0000
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

The pull request you sent on Fri, 4 Nov 2022 13:21:02 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-11-04-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fde25beb382b7dd6f2eab8022ab017cbdfaa3ff6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
