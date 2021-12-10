Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4A0470B36
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 20:58:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F29310ECCC;
	Fri, 10 Dec 2021 19:58:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 503DF10ECCD
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Dec 2021 19:58:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 462D3B829D7;
 Fri, 10 Dec 2021 19:58:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 18769C341CA;
 Fri, 10 Dec 2021 19:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639166326;
 bh=fnNZwD/qJ/E4/7TN8VbxUfN5A4foEOaZ9nLOwDEkmYA=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=lwAlZxDJfSRgiustOkBE5GUoNcNz6kB68ZQUoLFeuU5OFDu682Pk4P601FFvi6nC6
 NJ/4PGB6Ny33ar4nRjCTPG7ZuA9FTgaZgOn1TT8df7eiE6H2J1G46CNUB8RL1OEkgN
 Z5oxZQO5tQPc5gImcV9duk7tYbzJTiAvzl5NYxq0FH0HY8iRtAqb11CC1yVSgBgl4d
 6PwQ3Vz9kW8AN4v5AB/08YvXr6zpvQDp7TtpMj+8zDa1vsfVKKIbeuFk4cqP4IfqlW
 GR22MQC6jNgQ/T4DTM4/kz4V+3vF1srrB+1D77RqOWicGMsOHhwE1RBxf8l/PMInip
 q9DfdZj77G+kw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 08D2660A39;
 Fri, 10 Dec 2021 19:58:46 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.16-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twm_TjmNrr7VELofghf58qpo=-1VmFf_pNr6tBNKZL-aw@mail.gmail.com>
References: <CAPM=9twm_TjmNrr7VELofghf58qpo=-1VmFf_pNr6tBNKZL-aw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9twm_TjmNrr7VELofghf58qpo=-1VmFf_pNr6tBNKZL-aw@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2021-12-10
X-PR-Tracked-Commit-Id: 675a095789a2663fe02fdebd6023e29d7f1f51ac
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9b302ffe4e8d7e62f3170aa0097ff979880ba61d
Message-Id: <163916632603.27955.13646553226998147096.pr-tracker-bot@kernel.org>
Date: Fri, 10 Dec 2021 19:58:46 +0000
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

The pull request you sent on Fri, 10 Dec 2021 14:28:53 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-12-10

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9b302ffe4e8d7e62f3170aa0097ff979880ba61d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
