Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0032B68A228
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 19:45:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00E1810E86D;
	Fri,  3 Feb 2023 18:45:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0636810E86D
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Feb 2023 18:45:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 32DB461FC6;
 Fri,  3 Feb 2023 18:45:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 93B11C433D2;
 Fri,  3 Feb 2023 18:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675449914;
 bh=FUdAYc/wLQqgbIh1DygyDvBybdfWGuo79gGEZS/KRes=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=gZcuZ+YmxUOrSehH0kBnWLpmTMrUgFK5owSUXYkx8yR8zrxpHTkpPEM46pnOt4uPb
 g4Ye8NLRlSfrWigQwUimUfGXw1LZrZ1bC0mb2zGjDhz5xd3n2SS1KJPTfVLY09qsMF
 8Y+vu6A9qE5pHYKTMNMU7HX1uGzAxOYtTmC0bI0xpQNc9UCl5Mm3eThVaj9TuKXdvn
 kpv+onWP+a6GkxBr3XH867BtqXjCgT38tKgzH4ASvgoRcBmzulnuG3O84loJeKJ2P3
 JKn9nGjwoFOQmOJc4qe7pkFwRibo4E8b8sA02Z7mK7rtN5+fhb2Dl672DfifV75vPC
 dYMyuHSLza2Qg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 82BFFE21ED0; Fri,  3 Feb 2023 18:45:14 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.2-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyO4mgZr-r-sSJnNUOzVV53RSeC0BGSULwD=ebJ4WTYZg@mail.gmail.com>
References: <CAPM=9tyO4mgZr-r-sSJnNUOzVV53RSeC0BGSULwD=ebJ4WTYZg@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tyO4mgZr-r-sSJnNUOzVV53RSeC0BGSULwD=ebJ4WTYZg@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2023-02-03
X-PR-Tracked-Commit-Id: f1a9e82a1203802df3c917dd7ab1b5a5ded55793
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bffede38f82c27cf5e203a2c659fcc9b581dd7b8
Message-Id: <167544991452.32203.14831659985883182703.pr-tracker-bot@kernel.org>
Date: Fri, 03 Feb 2023 18:45:14 +0000
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

The pull request you sent on Fri, 3 Feb 2023 13:59:18 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-02-03

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bffede38f82c27cf5e203a2c659fcc9b581dd7b8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
