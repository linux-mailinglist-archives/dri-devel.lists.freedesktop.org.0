Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDF476759A
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 20:39:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAB5610E773;
	Fri, 28 Jul 2023 18:39:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBBA910E76E
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 18:39:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3B302621DE;
 Fri, 28 Jul 2023 18:39:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A0ACBC433C8;
 Fri, 28 Jul 2023 18:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690569566;
 bh=ADG46cY+cROEucJsffbJcdaqD8LPvm3wsKqFrJvr6gE=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=DgY2gVqToGX6X0nujoqsilfJ37A+XJEdDsMNjnPgI7XqcoSUwpWTM6Sl6+w5oOgy5
 MQTGFHvNk+HewcSwUdxkHL06f4Ly+t+14npAfBizEvcgu9MjEMFhDrhYzQU0yg4zVr
 Pj/kMqKVHmots/AiRPR89g4EPmMrTe71Y+7nmGhixfpKKHTOPY07w+IzvRm0sfS3gK
 TvZ1vvLtZVDai+kwdLnKXxwCpTnRjrlLO8D1Iqr8ql5p30QCLCmsYnprKoES1vAR2V
 ke4hg1zahst6RNeT8x7d11JZfX3IAsYK5/32l3WTZHVh5vEbrlxwOJydJJolqktCYr
 /hM2Kq9ywE7Yw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 8CED8C43169; Fri, 28 Jul 2023 18:39:26 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.5-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twwk0C6kGQXFZdvEhxnLe7DhnwN8doj_yA3a9S3hs7c1w@mail.gmail.com>
References: <CAPM=9twwk0C6kGQXFZdvEhxnLe7DhnwN8doj_yA3a9S3hs7c1w@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9twwk0C6kGQXFZdvEhxnLe7DhnwN8doj_yA3a9S3hs7c1w@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2023-07-28
X-PR-Tracked-Commit-Id: 9a767faa9477ef2a5fee6a0c9d69587b95a885df
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 17bf3df9af08c5e87c07a92b811b7f9f8034a32c
Message-Id: <169056956657.21363.10709736526382075646.pr-tracker-bot@kernel.org>
Date: Fri, 28 Jul 2023 18:39:26 +0000
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

The pull request you sent on Fri, 28 Jul 2023 12:20:10 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-07-28

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/17bf3df9af08c5e87c07a92b811b7f9f8034a32c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
