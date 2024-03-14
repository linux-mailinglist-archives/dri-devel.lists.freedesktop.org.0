Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2973887B63B
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 02:58:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66B9710F113;
	Thu, 14 Mar 2024 01:58:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IQ6Q5+LR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3077D10F113
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 01:58:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3F293615B2;
 Thu, 14 Mar 2024 01:58:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DD95EC433F1;
 Thu, 14 Mar 2024 01:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710381518;
 bh=i/dPWeOPGxBQUNL9blN/rJhePMxL9A/Deg1YVr3iEq0=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=IQ6Q5+LRJhHj/fIMlfJDd/yHXNIEmyE7Y8rbrNG5gUHF30Exb3srWFBLW4JvS+NK6
 jAH2uDVMtpb485CgUV3CX68NBVsiB6tOoy7IuXD3v5vyOLZUMtCtE0JD2KoB2vNTTt
 jpD67MgPm0mCV7IOoAhf5QI51cZzBhCz8MhvI04msEgTPdeBN25RapoJXOaOkVz1DY
 lhaMnyF1EewdJMyUJ/NlkFHGOK2e4BT1Fr1AHowsPJuWo8Txp1QCTScWsE5afC6K/3
 3UGZ3jPNhGlnzX71tDPI6rLdzUHv0CVphGp4ttPLwcMdXRudOM8ldrIyjpZRdRc6OH
 Mrbrxm1o6R3jA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 C9C41D9505F; Thu, 14 Mar 2024 01:58:38 +0000 (UTC)
Subject: Re: [git pull] drm for 6.9-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twR+WnE3GGqyeh1cuGVmpADPTwDPK10625RP--rLrqkxA@mail.gmail.com>
References: <CAPM=9twR+WnE3GGqyeh1cuGVmpADPTwDPK10625RP--rLrqkxA@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9twR+WnE3GGqyeh1cuGVmpADPTwDPK10625RP--rLrqkxA@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-next-2024-03-13
X-PR-Tracked-Commit-Id: 119b225f01e4d3ce974cd3b4d982c76a380c796d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 480e035fc4c714fb5536e64ab9db04fedc89e910
Message-Id: <171038151881.20141.4101433012400911589.pr-tracker-bot@kernel.org>
Date: Thu, 14 Mar 2024 01:58:38 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pull request you sent on Wed, 13 Mar 2024 14:06:52 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2024-03-13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/480e035fc4c714fb5536e64ab9db04fedc89e910

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
