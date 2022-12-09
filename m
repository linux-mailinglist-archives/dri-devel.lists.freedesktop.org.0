Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C05647B47
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 02:21:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B07E310E219;
	Fri,  9 Dec 2022 01:21:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 958E810E213
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Dec 2022 01:21:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BECACB826E7;
 Fri,  9 Dec 2022 01:21:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7094CC433EF;
 Fri,  9 Dec 2022 01:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670548897;
 bh=hvvz030LUj8lnPdEvrt0f17NiCOxoToxxAv2Fj/QkNs=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=DSAybl0z7NAMf1IXKy8nTSKcxXGMYu5/G0OTiaFA0EiVFyIO41e1kq2ncwN1zjlKq
 meXCbOquarGHwJSSz3MEasofu3eIFfXTzPaZlOI7nZ0koRTimsJMxaxsJsf3RWtJUv
 Nufsq394K/5TFkVnllW3n5ew14B3K0XzwedEXAH85WN2LfvuxehH+oAFLL3tgdnRbC
 7qwNTXYeDrPeGSIZ4ArLq66TZ11umPRlNn0Ey5Nls4y5M5ri551P7Gf4g/kSbLEvzz
 o8SsMVpr5gp1XjBt4g6hiGyrMsffq/Hqu6RT4wxnyky8ToraBq1UOaB8fo4FrIwTeH
 12cRztA1UgqiQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 5D5D9C433D7; Fri,  9 Dec 2022 01:21:37 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.1 final
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tztpF=EZ04jLii6DFiLQdm6s0QhXvosFyggDHikfLLteg@mail.gmail.com>
References: <CAPM=9tztpF=EZ04jLii6DFiLQdm6s0QhXvosFyggDHikfLLteg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tztpF=EZ04jLii6DFiLQdm6s0QhXvosFyggDHikfLLteg@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2022-12-09
X-PR-Tracked-Commit-Id: c4252650a8c4770b669398fe7270ed8c94fc0eba
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0d1409e4ff08aa4a9a254d3f723410db32aa7552
Message-Id: <167054889737.30977.17442092268066095579.pr-tracker-bot@kernel.org>
Date: Fri, 09 Dec 2022 01:21:37 +0000
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

The pull request you sent on Fri, 9 Dec 2022 10:51:00 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-12-09

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0d1409e4ff08aa4a9a254d3f723410db32aa7552

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
