Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5592AA85213
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 05:36:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 087AF10E159;
	Fri, 11 Apr 2025 03:36:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="r3QaSu6J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F41A10E159
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 03:36:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E438968456;
 Fri, 11 Apr 2025 03:36:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D134C4CEE2;
 Fri, 11 Apr 2025 03:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744342584;
 bh=J9wUBWpoTpULzhSLt5V4MGz/YlVsN9rmHe8+QS8TfIs=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=r3QaSu6J/c83EVvoqopvoxbq4aA4Q5lfZFwcTCqUSelp9o9WYPotOqHdH3KAfg3mH
 V+Ncqkr6LILYEuXZ3biOZ7i5c/x9DiCCuybC19kshlv3LMpXnKN4auBM4c+KtCJZfX
 2nLn3fk9YGXjLf1kJq3bh3UXpQ79qhxl99uclVNjP/LYwOhxYtEzaSBlF0cv5OvyNX
 /JPHAv8w8BPoKGvWcm42PsUcPKldWXhrWnIvNRz0xKYJsT9OLfQfhUC6fzC0vIkwIr
 joiGOAdtsFTACc9FKZ3/mC7MinSJprdmn9I/aEJE3gB/f5tXndgLDhmKmSjOLCtBhb
 q2WniLBeUv0yA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33E61380CEF4; Fri, 11 Apr 2025 03:37:03 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.15-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzvTUFpUeme8Aom4734ycaAK1b1gJFnjH3hHmg756UMGg@mail.gmail.com>
References: <CAPM=9tzvTUFpUeme8Aom4734ycaAK1b1gJFnjH3hHmg756UMGg@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tzvTUFpUeme8Aom4734ycaAK1b1gJFnjH3hHmg756UMGg@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2025-04-11-1
X-PR-Tracked-Commit-Id: 485442c6a523de1d293350e039a9d9df9c08704c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 900241a5cc15e6e0709a012051cc72d224cd6a6e
Message-Id: <174434262168.3947740.5175447386950205073.pr-tracker-bot@kernel.org>
Date: Fri, 11 Apr 2025 03:37:01 +0000
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

The pull request you sent on Fri, 11 Apr 2025 12:58:55 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-04-11-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/900241a5cc15e6e0709a012051cc72d224cd6a6e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
