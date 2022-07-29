Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B67C6584A3B
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 05:37:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88C3F10E486;
	Fri, 29 Jul 2022 03:37:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 541C510E136
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jul 2022 03:37:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AEB0461E1B;
 Fri, 29 Jul 2022 03:37:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1D1BEC433D6;
 Fri, 29 Jul 2022 03:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659065854;
 bh=9mcUUg5lmuACGthaun+7+p+qT7sMOwljbBFVfcsaj+o=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=dkjcWeaRfHdg3UDbnV/TDsjdjAPiKyXeDcQEf3rYd1lOSBheySxpw+IYn5t+bm3Px
 pE7t5RJreDKPYYAUVmPa6V964ElXyGMePl7HPy+2W2hWrA00dOr09150ez1WcmDEXR
 zgEGB3ZtBZiOYzBt2JzAdzGBn9B6qoA2Tb3jMT3SrexkSzAmk/dfdUrPgErLYH88N3
 BcPkLqiwUSIXKLpNnTklNtbr8ayJmkXstGnW1mclDqJxKUs5rKxUoZqWz3YmPSfrOU
 SbAIAsXsZFR2bMWCFmo3twJ3s5Z4mxYzpAcw84FG+wzyOnesMCIo7T17QS+U+lY6A7
 70/WKIgPA6/lw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 07180C43140; Fri, 29 Jul 2022 03:37:34 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.19 final
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txsRyEJWjrTsha6wkqcdTM5MmTqRVns5b9eQCaQAwJpNg@mail.gmail.com>
References: <CAPM=9txsRyEJWjrTsha6wkqcdTM5MmTqRVns5b9eQCaQAwJpNg@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9txsRyEJWjrTsha6wkqcdTM5MmTqRVns5b9eQCaQAwJpNg@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2022-07-29
X-PR-Tracked-Commit-Id: f16a2f593d0095e82e6b7f9d776f869c8ab45952
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6e2c0490769ef8a95b61304389116ccc85c53e12
Message-Id: <165906585402.27318.8863200340585582598.pr-tracker-bot@kernel.org>
Date: Fri, 29 Jul 2022 03:37:34 +0000
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

The pull request you sent on Fri, 29 Jul 2022 13:31:03 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-07-29

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6e2c0490769ef8a95b61304389116ccc85c53e12

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
