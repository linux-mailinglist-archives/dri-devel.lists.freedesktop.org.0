Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4064D706D
	for <lists+dri-devel@lfdr.de>; Sat, 12 Mar 2022 19:43:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF00910E096;
	Sat, 12 Mar 2022 18:43:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A95ED10E096
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Mar 2022 18:43:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 94D6A61167;
 Sat, 12 Mar 2022 18:43:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 09EBCC340EB;
 Sat, 12 Mar 2022 18:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647110614;
 bh=SOEtNXca/Xag3RtSB9diIP6WIHevhXQY97WA683OjJs=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=X0LocuaKjNUxM/g7b1eZkZB3B91HhGe14MAHhvyhbxViQ6LKaIjxZgTDBrvZMTTpO
 Twjsgk1VpIpDHnS1RPFWH1wSAyv6sq6GSgMRIWFFBMV1dPOr5BLVI9BzArv5nQJaec
 qrvhhtPr+BOKCv1YVD0TcHV8hWQCRi6reIBCkN3oGQBDe0df/JsnWrcIdwsVtOh8Df
 +9n8edZFb4PXjHCsuA0OyrTferrvxLmkHCo+RcxCSsjYqMPkF4ZVGzB5vhxnGdpjyJ
 XwSmybUCyAO02jcD4GdMP8NoKa+B3C147eBLAAw9U98NPfDoHssuHqb5pT0xUO2Lpg
 3hQak5r7goy5Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 EA498E73C2D; Sat, 12 Mar 2022 18:43:33 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.17-rc8 (kconfig fix)
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyAqzcvaba2OffVt_EEP_1tQc3UV6h1J92An0uKOF1TJA@mail.gmail.com>
References: <CAPM=9tyAqzcvaba2OffVt_EEP_1tQc3UV6h1J92An0uKOF1TJA@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tyAqzcvaba2OffVt_EEP_1tQc3UV6h1J92An0uKOF1TJA@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2022-03-12
X-PR-Tracked-Commit-Id: 3755d35ee1d2454b20b8a1e20d790e56201678a4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1518a4f636b39718788c81154420d7abc62fd839
Message-Id: <164711061395.14941.8983804138437798191.pr-tracker-bot@kernel.org>
Date: Sat, 12 Mar 2022 18:43:33 +0000
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, regressions@leemhuis.info,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pull request you sent on Sat, 12 Mar 2022 17:45:38 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-03-12

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1518a4f636b39718788c81154420d7abc62fd839

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
