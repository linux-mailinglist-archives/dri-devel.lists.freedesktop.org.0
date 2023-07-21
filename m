Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C69EE75D0AC
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 19:28:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B76810E04B;
	Fri, 21 Jul 2023 17:28:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C7FB10E04B
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 17:28:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 02FAF61D65;
 Fri, 21 Jul 2023 17:28:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 60A02C433C7;
 Fri, 21 Jul 2023 17:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689960528;
 bh=Yf0poGwvKsIfg9YkJVyqU9cd+0ne0lqHZui61odSa7k=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=jxJjm/D20Tnqh5xEgiNu0Y14YjjQC18tq2nMQoQmb8dmTyy02SpESTQnh0jyQwX9B
 dyITV7IWx+7yr4rnQIkOE7XIKSlytqGPdyBlDrbhtm4iWifBempdY4+aiN9Zi8IoRc
 4vrmx2OnSm7KzUSwjAZJa0dqndmexS1DFJaa70iKilTdteqQJN8BTAKaIxgl9x4JUJ
 E/oufOarnYMXVSiKpKZPbT/1jS4wdR4o2H4/QUefU7gSXgLK/6NbodYOR8/KjHyGp/
 XCLlvEX1GjMZx2pnjcsFFfTZUOQWQKaBb6K8I6a7bkRCQvs6XALj3cv92yQBk6YZo5
 nKsPFzvCWwJ+w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 4CD3EC595C1; Fri, 21 Jul 2023 17:28:48 +0000 (UTC)
Subject: Re: [GIT PULL] fbdev fixes and cleanups for v6.5-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZLqSYylyXm2C+aOV@ls3530>
References: <ZLqSYylyXm2C+aOV@ls3530>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <ZLqSYylyXm2C+aOV@ls3530>
X-PR-Tracked-Remote: http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git
 tags/fbdev-for-6.5-rc3
X-PR-Tracked-Commit-Id: e8812acb5bf724f2fc23a500e590c776ebda7b0a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 55c225fbd8532a1bac6fd93c5085031650083a4a
Message-Id: <168996052829.13720.8455854435320544971.pr-tracker-bot@kernel.org>
Date: Fri, 21 Jul 2023 17:28:48 +0000
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
Cc: linux-fbdev@vger.kernel.org, Martin Kaiser <martin@kaiser.cx>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pull request you sent on Fri, 21 Jul 2023 16:12:51 +0200:

> http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.5-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/55c225fbd8532a1bac6fd93c5085031650083a4a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
