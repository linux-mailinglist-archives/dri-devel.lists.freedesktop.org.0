Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C728158BC2D
	for <lists+dri-devel@lfdr.de>; Sun,  7 Aug 2022 19:58:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C62F10EAFC;
	Sun,  7 Aug 2022 17:58:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18850891CA
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Aug 2022 17:57:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7A329B80DBD;
 Sun,  7 Aug 2022 17:57:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 13950C433D6;
 Sun,  7 Aug 2022 17:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659895070;
 bh=IiojY1fohh7qBhT3uB0IQOBvuLHX5CnT1CnOH98VRGg=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=Oa1ipcZVbiagIvlXyV9zskHwkvblLCbHxO+YHq2mHpsUw5MBabnTr+eE5v3ZjC89s
 nQk1RqTsNAGD2oT+hgmsEAKeXcFCb6299GgZ7zu8sD3xJulSbnkB8G9bjdsKXQSsGi
 m10SDM8HPqJt5u3nBH05Y3W9mW5g5+DyWZDxbnXFX8U56Bydt+QP5weqjp20/N6caN
 7ScmE5ofxGdfhkEonGYFl7sqHP3hoHYq14X0XYBR+++SxHomWzDZrqVHWsr6/mTvlj
 I/k1+rNh4b2UkD+kZ9TUyoXrNHyOC7pBV3fLP3Blzjr8HPWhQ4ncYR2CNWA390CRXd
 pHb+RnzNUt1PQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 029B2C43142; Sun,  7 Aug 2022 17:57:50 +0000 (UTC)
Subject: Re: [GIT PULL] fbdev updates & fixes for v5.20-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <Yu7J2Yj6UyAiE2Ne@ls3530>
References: <Yu7J2Yj6UyAiE2Ne@ls3530>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Yu7J2Yj6UyAiE2Ne@ls3530>
X-PR-Tracked-Remote: http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git
 tags/for-5.20/fbdev-1
X-PR-Tracked-Commit-Id: 6ba592fa014f21f35a8ee8da4ca7b95a018f13e8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b5a8466d37d30cfcc8015789f4a3f0c44b6c7bc6
Message-Id: <165989507000.6057.14562247245315787705.pr-tracker-bot@kernel.org>
Date: Sun, 07 Aug 2022 17:57:50 +0000
To: Helge Deller <deller@gmx.de>
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
Cc: linux-fbdev@vger.kernel.org, Zheyu Ma <zheyuma97@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Uwe =?iso-8859-15?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pull request you sent on Sat, 6 Aug 2022 22:06:49 +0200:

> http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/for-5.20/fbdev-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b5a8466d37d30cfcc8015789f4a3f0c44b6c7bc6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
