Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D30790147
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 19:18:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0D0710E81A;
	Fri,  1 Sep 2023 17:18:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 303 seconds by postgrey-1.36 at gabe;
 Fri, 01 Sep 2023 17:18:29 UTC
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A993910E81A
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 17:18:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6237BB8229B;
 Fri,  1 Sep 2023 17:13:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 258F3C433C7;
 Fri,  1 Sep 2023 17:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693588404;
 bh=N2/a3REGr+5YfGAsMmxAlCQvBhXi+UPp3aTj6UBorhc=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=rfQJe02es/V+99UR/U+vWrwcUjYTjre5FKJCzz8T4xqmtgJPck9lp6vtgS9eJo1KS
 KmHb6mY7yQdO6R+r9txge6Bd59ns+YpDYJgWEkRhKKV13Up+F/C0MJ6tT5+Sb5ss7V
 LXGLKdqH/YISfOZippPVkowX+rgfN3inp4RPhkP0J4rakn5teiPYo8PxfgkXAipL1J
 UNpuyHkABETBlUNeIqS2XLKW4Sm2fBfBI+GHJOyU+o74CqWmrSMPwA3I+D+i7qGuIP
 s7kXInOlCMJ2kiXjhr4AJLyRekEJxkM+oFopqMLtgPAau+l8T9dMVLDIPDfyBcQqo5
 jNGTXbtTqN7cA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 1013EC595D2; Fri,  1 Sep 2023 17:13:24 +0000 (UTC)
Subject: Re: [GIT PULL] fbdev fixes and updates for v6.6-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZPGa9CmtieKVUUVF@ls3530>
References: <ZPGa9CmtieKVUUVF@ls3530>
X-PR-Tracked-List-Id: <linux-fbdev.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZPGa9CmtieKVUUVF@ls3530>
X-PR-Tracked-Remote: http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git
 tags/fbdev-for-6.6-rc1
X-PR-Tracked-Commit-Id: 4a9762aa358ee0e3deb6e759959f092a3cea86be
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b84acc11b1c9552c9ca3a099b1610a6018619332
Message-Id: <169358840405.6511.948963463688539187.pr-tracker-bot@kernel.org>
Date: Fri, 01 Sep 2023 17:13:24 +0000
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
Cc: linux-fbdev@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pull request you sent on Fri, 1 Sep 2023 10:04:04 +0200:

> http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.6-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b84acc11b1c9552c9ca3a099b1610a6018619332

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
