Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB805B3F47
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 21:14:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D6F10EDC3;
	Fri,  9 Sep 2022 19:13:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AE5010EDC3
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 19:13:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3C84BB82346;
 Fri,  9 Sep 2022 19:13:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D3B56C433D6;
 Fri,  9 Sep 2022 19:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662750830;
 bh=FqLsEtmp4qNB7hsKabFO8hHLfj8X7kjPagvBhPx/4zM=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=GUTFSGJL5xXVvWS6klGhMMkvpv25NYNMAJDp9WfJ10E7zK9IghLnkJWKfRgDLk4Ff
 g+WDh2oQMmABVfwNEXOLSrMu6+1gmAjpoMx18JJ0qXvW1fddLrSKw1ss5OnsqCICIx
 sA7X6FceSU5zAxEmtVWqeuxyJiIcDEHlREGi01YyhwhoVHPPpMCag+H1j41+GGR1bi
 j2XjlSmSRtNDHnHIHbbEkd43ZDNlllB7DPOo1VsxCwEW37qA3fTr9Mw7DHqYiGd3O6
 SQ/TQdnhNn4HTXDmZoQ0Ni4zPXizWzrQxtHb8zz87EPsQ+bZ6p7cjADiAld4UpPKP5
 uzpLykuECTZ8Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 C1C96E1CABD; Fri,  9 Sep 2022 19:13:50 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.0-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tydpsi2=fujRgT4B2CcOgY1EQ7WmVUNtcZ+1jUjoDbK9Q@mail.gmail.com>
References: <CAPM=9tydpsi2=fujRgT4B2CcOgY1EQ7WmVUNtcZ+1jUjoDbK9Q@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tydpsi2=fujRgT4B2CcOgY1EQ7WmVUNtcZ+1jUjoDbK9Q@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2022-09-10
X-PR-Tracked-Commit-Id: 2edb79a5fb303dff577d6a0c7d571c3bab1d1455
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b7e00d6f55015f6995f41c60a5367f1065d37622
Message-Id: <166275083078.6812.9128951338015630364.pr-tracker-bot@kernel.org>
Date: Fri, 09 Sep 2022 19:13:50 +0000
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

The pull request you sent on Sat, 10 Sep 2022 01:57:22 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-09-10

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b7e00d6f55015f6995f41c60a5367f1065d37622

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
