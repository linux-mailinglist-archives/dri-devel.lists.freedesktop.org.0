Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCF78BB0E8
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 18:29:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D1F10F9D1;
	Fri,  3 May 2024 16:29:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ujCkvaqo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F12810F9D1
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 16:29:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C7252CE176F;
 Fri,  3 May 2024 16:29:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 00370C32789;
 Fri,  3 May 2024 16:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714753776;
 bh=WGfLyEbMff9klV6cWZVBg70AvLSeYQq3HexgKbnHaeY=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=ujCkvaqoL5g6839Wdyu1uFcihgyjyNN0C6fuv/QKobeCNSAh2R955gaDNrOmr3mC4
 LTUtXZk9Mt5uDzW8HWjkvQ2thfa5k1dvviJ1zspejOls5/jfcPOmSFiFR0GW3clOv5
 AKrBIJo2Jj5SW+TDQfnb1oPhsDQod0JJ946zKJvn7YBiuzQynoUcAJ3sOy+tO0VR91
 nH1p4TJjn7LAHc+92M8aA6hzOIRBuDeIQc6FNOY91NADAX4Tsa+13apRtVIPMIjAQF
 IS8gWrfUJrlFrUpzp/9hmRfuN2ceCFZiOlahl9iCy0f3TFzz0zmyDMxZrsJb1PY47v
 EtutTOxrUGf9Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 EAC5FC433A2; Fri,  3 May 2024 16:29:35 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.9-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9ty6LzXnyr5J1RrR8xRdiRcooTkoPuq9m108mUEsF7R98g@mail.gmail.com>
References: <CAPM=9ty6LzXnyr5J1RrR8xRdiRcooTkoPuq9m108mUEsF7R98g@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9ty6LzXnyr5J1RrR8xRdiRcooTkoPuq9m108mUEsF7R98g@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2024-05-03
X-PR-Tracked-Commit-Id: 09e10499ee6a5a89fc352f25881276398a49596a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b5a66609a643443e2b14773dcc784496ee1e5457
Message-Id: <171475377595.10066.13436030257937843822.pr-tracker-bot@kernel.org>
Date: Fri, 03 May 2024 16:29:35 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pull request you sent on Fri, 3 May 2024 13:52:43 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-05-03

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b5a66609a643443e2b14773dcc784496ee1e5457

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
