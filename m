Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1840D6F0C70
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 21:20:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7FFF10E051;
	Thu, 27 Apr 2023 19:20:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C06DD10E051
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 19:20:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CEB5C63F5B;
 Thu, 27 Apr 2023 19:20:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3B6BCC4339C;
 Thu, 27 Apr 2023 19:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682623209;
 bh=llgbZY8QBJvHc8W2Po9uvZOLTiJ4fKPIqNmux7EuE1s=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=YCi6mS0OhIwH4k9UkAahoZK4W8wdx++nhRLE6B7O3ieP7h7NGLFiLUaJGZhKAAl3r
 T091CcW5jHGYWV8vUwiVSbCRNx/37Gfrz6iOPNTsumwGOjNIC67SuQmzinKFjju0rd
 TH/MZ9oTgxMuMpGWbRYDQwRKmZFG0/T1E3eLPpqJhyODkDprELypAPPpYy4QDL13Sa
 5MbWyt15ylxSI7RRHNnIa5s/f2DF2bwVDfVeHYaCt1jMlddFR8uBb6Z/SYUgpKTTl4
 efClEsVzpeThAv4R4dyPUHhNB5pmSkkmY6Vg0wyS1fSCKIoPoQ+qvxcDuYaBORf/C+
 ORBWj5E6yHKWA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 1AAD8C43158; Thu, 27 Apr 2023 19:20:09 +0000 (UTC)
Subject: Re: [GIT PULL] fbdev fixes and updates for v6.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZElwB2/zlXli1QwA@ls3530>
References: <ZElwB2/zlXli1QwA@ls3530>
X-PR-Tracked-List-Id: <linux-fbdev.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZElwB2/zlXli1QwA@ls3530>
X-PR-Tracked-Remote: http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git
 tags/fbdev-for-6.4-rc1
X-PR-Tracked-Commit-Id: 60ed3cd85b95184936bce70ed7f9e76a6a54a5e1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 725a345b2ee3c24f9ac2078eb73667e22a1b7214
Message-Id: <168262320910.21394.8747899965112171337.pr-tracker-bot@kernel.org>
Date: Thu, 27 Apr 2023 19:20:09 +0000
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

The pull request you sent on Wed, 26 Apr 2023 20:40:07 +0200:

> http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.4-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/725a345b2ee3c24f9ac2078eb73667e22a1b7214

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
