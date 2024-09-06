Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2339A96FBDC
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 21:12:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A716A10EAE6;
	Fri,  6 Sep 2024 19:12:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="t/Cw9wh9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7201D10EAE6
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 19:12:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 15B3BA444E1;
 Fri,  6 Sep 2024 19:12:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12025C4CEC4;
 Fri,  6 Sep 2024 19:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725649949;
 bh=M/aJVCPnr0oafrkzunsaolMDGtXhUZ0zx+ax1AH9tYM=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=t/Cw9wh9DPx7sC/kwA9QO8ttT+LDQuy8ZCdY0zCATCK7eF/iT5/CiCY5/0rOwWaa2
 X2QhLXG43mXf8C6mxPM+UDPt39B08LMy41bIamabSBvFwEp5KW9Nje3DSXnxIbjzdZ
 NMMGReiDnq0Hk3ql9XCOKW2P7u/pNDt7Ktt6oMwRVX5Egv3NCivGBgHYKZEVQ7dAnL
 Vd4Qd/iDaqiZKqDMEtOe8B9lBmjfWXqHFvBQ4J7zG44Bw2KlWCa6Nb/Pz1THnCd5rD
 Eh1IMwQ1hFYHPML4D+PMLxvdYxLEmU2MYWZtLYnADi+B7TfyJuf1GcieqHthCyKHkN
 c+fQf8BgTz1WQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33E053806644; Fri,  6 Sep 2024 19:12:31 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.11-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twtq1CjWbeNnVKRaquctv6GHYSixXofFbprS4Dk5iBkGg@mail.gmail.com>
References: <CAPM=9twtq1CjWbeNnVKRaquctv6GHYSixXofFbprS4Dk5iBkGg@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9twtq1CjWbeNnVKRaquctv6GHYSixXofFbprS4Dk5iBkGg@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2024-09-06
X-PR-Tracked-Commit-Id: 141bb6bc73cf45e8b742d6fafa6734b6d5f82b77
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ea462f0fa438381e0d420f94193c075e2a114894
Message-Id: <172564994987.2497610.13706982466704345355.pr-tracker-bot@kernel.org>
Date: Fri, 06 Sep 2024 19:12:29 +0000
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

The pull request you sent on Fri, 6 Sep 2024 14:42:24 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-09-06

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ea462f0fa438381e0d420f94193c075e2a114894

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
