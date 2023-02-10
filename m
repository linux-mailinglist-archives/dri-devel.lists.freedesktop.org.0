Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A4B691668
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 02:56:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2591610EC2C;
	Fri, 10 Feb 2023 01:56:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D72F910E125
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 01:56:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8393CB823B5;
 Fri, 10 Feb 2023 01:56:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4EB12C433EF;
 Fri, 10 Feb 2023 01:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675994191;
 bh=bcPjDfvMzZA5oOJEPAtNUf5zODbvzRsKlND8PjAokts=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=HYTN0Eanl+9O43bhKlTx0pD0AILjvlfN6DAKxyredarvbBtFnuNrUvZAhNlhiJ5fS
 w8bACoVO5kVN2cvcR7m8seSv/taHXzZjNr0p8T5QJB/WKzwKABFEyUcr8uZfWPw5Il
 m2vHAh4pqp2bKRjSsZlRKb+ED6NW3f8hJNTwnP3R2W6Yzii3g+rlQNAxz/mVXR1yYF
 Jzd2CQPLtumkNQVvkUU+I8J6O5EIPd8hcTgYQwmou2JwWegJFzAYNOUUv6FW8AWDRr
 5SgzTRCZHuL2bY9S1u5vSk0/aA+TNdnHxoKjGwkj1xmalOWrJA4lbt5olMqJmRoDFy
 YJJ38vMNgAPfQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 3E784E21ECB; Fri, 10 Feb 2023 01:56:31 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.2-rc8
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyEJyxto-DDoerhGFxZWG8-M3xOsAfDhKfgAy8yARhvOA@mail.gmail.com>
References: <CAPM=9tyEJyxto-DDoerhGFxZWG8-M3xOsAfDhKfgAy8yARhvOA@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tyEJyxto-DDoerhGFxZWG8-M3xOsAfDhKfgAy8yARhvOA@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2023-02-10
X-PR-Tracked-Commit-Id: 777c1e01cb7e1947765fb0c3b9b71dab18e53e46
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 38c1e0c65865426676123cc9a127526fa02bcac6
Message-Id: <167599419124.18539.12388719795658212182.pr-tracker-bot@kernel.org>
Date: Fri, 10 Feb 2023 01:56:31 +0000
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

The pull request you sent on Fri, 10 Feb 2023 11:19:51 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-02-10

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/38c1e0c65865426676123cc9a127526fa02bcac6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
