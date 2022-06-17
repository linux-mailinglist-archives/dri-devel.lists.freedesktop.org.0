Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B052554F051
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 06:44:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 453FD11AD7D;
	Fri, 17 Jun 2022 04:44:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97B8611AD7D
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 04:44:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A134B61DEB;
 Fri, 17 Jun 2022 04:44:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 16A9EC3411B;
 Fri, 17 Jun 2022 04:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655441052;
 bh=7s9DpTvHeOxDSPMsQJSfiVg3fwACOC+KfYrtWEplkAg=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=Yq/GRo2POpBsoJqWcr8cPFxIblNW2GJPEHnmxndUSjtw7KAzUscEFofBOFCXJWwak
 Ws68Lb3lRght5pC6yDpnONDx0R6QvoCZTfRn+JVYWadRyfPGIUUxICmP+vqlYkR3ip
 WL1FHI6LlArs88PJfM6Fpoy2obo5vvGs57QzG5C2IgOqNlPBZpS5XBSTsahUQiwTqs
 63hh/vU1ASo4ae5GotPswqIjZtzaqo29yuRywFHeO2YYsZwwnijh5S9bvfr1MrNHMm
 nZgR6O0U5Jgle4QGNa8S+D5V2OUPO07RhhK6AmKueDeuMh2fHPjPq3KvnVmtmGz5j1
 Qcc7czb6b/2Qw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 03A49E6D466; Fri, 17 Jun 2022 04:44:12 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.19-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twTA=AXfjj=eq558KLmE_TfmkoRsm6Sm5MUB0zCZ174Wg@mail.gmail.com>
References: <CAPM=9twTA=AXfjj=eq558KLmE_TfmkoRsm6Sm5MUB0zCZ174Wg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9twTA=AXfjj=eq558KLmE_TfmkoRsm6Sm5MUB0zCZ174Wg@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2022-06-17
X-PR-Tracked-Commit-Id: 65cf7c02cfc7c36a3e86f3da5818dabc32c270ff
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 47700948a4abb4a5ae13ef943ff682a7f327547a
Message-Id: <165544105200.26112.4731974293198817958.pr-tracker-bot@kernel.org>
Date: Fri, 17 Jun 2022 04:44:12 +0000
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

The pull request you sent on Fri, 17 Jun 2022 14:13:41 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-06-17

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/47700948a4abb4a5ae13ef943ff682a7f327547a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
