Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7169E79BC
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 21:05:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BED8D10F1AB;
	Fri,  6 Dec 2024 20:05:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="f6k5Q6yL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E21AD10F1AB
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 20:05:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 46F755C5E21;
 Fri,  6 Dec 2024 20:04:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5396C4CED1;
 Fri,  6 Dec 2024 20:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733515499;
 bh=192PVLdFXHBwIqSVPc7xAcnjVaYO9hyaFFPezdOqafQ=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=f6k5Q6yLn5M4pcybwwq0+5X2qzz2crUCteC45o29BQbpAbp9aZOxNv0lzXFE7/OlF
 ctrLCE75jN87XMdjuZy32W+BOAbo1ILCc+BXK9oh/5EtKKlvXzePLM8VAi65Bcshr2
 759HYmnH7SjnoVCn2Cm2SJPXPnQmbmPwY8NTaR50zHLnKDqwb4xhvIpWnATxQaVIAO
 HjEOEgq0O7n2q9qyXScWJL1GYmlA08wg5dsWwAsrDI2WynJoMZpzBmqJaei2Ra8p+G
 4GyZhTdAH435KyJL1Z3ZLvhtufJtUh62ra3X3g/Y+/6wpP0n2OhD6y0cZx3ZrywMnj
 RvvJmXCQ7Rmsg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EB111380A95C; Fri,  6 Dec 2024 20:05:15 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.13-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9typZWd9P_81asANhuE_F7a9j+k5auWhwwCn=xLDQ1mFdQ@mail.gmail.com>
References: <CAPM=9typZWd9P_81asANhuE_F7a9j+k5auWhwwCn=xLDQ1mFdQ@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9typZWd9P_81asANhuE_F7a9j+k5auWhwwCn=xLDQ1mFdQ@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2024-12-07
X-PR-Tracked-Commit-Id: 471f3a21addd4e5f170ab1364f11c3e4823e687d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9a6e8c7c3a024b9e9ec8fd6295c3159504263cb2
Message-Id: <173351551460.2778953.7274571387002474349.pr-tracker-bot@kernel.org>
Date: Fri, 06 Dec 2024 20:05:14 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>,
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

The pull request you sent on Sat, 7 Dec 2024 04:44:29 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-12-07

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9a6e8c7c3a024b9e9ec8fd6295c3159504263cb2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
