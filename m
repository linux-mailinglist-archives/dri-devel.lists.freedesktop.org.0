Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB35978827
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 20:51:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D85BC10ED6E;
	Fri, 13 Sep 2024 18:51:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Az5LxWqD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7C4610ED6E
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 18:51:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 09A87A403DA;
 Fri, 13 Sep 2024 18:51:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62283C4CEC0;
 Fri, 13 Sep 2024 18:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726253475;
 bh=4YpPWB3DrvexELciLj/6YL7To3ZQj/lSw2oGyiLNbHI=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=Az5LxWqDSJ5Wv7Fl3WDRbAHaaaK69qTSlot+id0vKNGRU577y+LOHX9PYHDtshSIz
 UFmevInY4LsGnK+Vn6ulg+6+yw1qIPz9dr3GaqPLqTfRvMET2VMgOPvnK/kZKkWC+s
 NVXdViLmOyV5VV2EjoEzwjMHzI2lLg6hZ5axskWfD6XPbYk8t8YcUd95f8MATkWRq+
 mqAhp+TuxsMUk4wHRPLsx2zSk9QcYc/cS3jZgh2zSjPf+ps+QM1Pq0T8hVtPXqboPZ
 QiIhUzHAUo1PZzct48RgjVo6KOS7gwfnNOQi6yEc6HmzhNl/hVyFRfezJSYYds8trK
 cS+rfBkIiRuVw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EB0FE3806656; Fri, 13 Sep 2024 18:51:17 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.11-rc8
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyi5A8t9bfCC3gtbG18Ai9cPS0bLrFVL_eJ1N1UyT4uBg@mail.gmail.com>
References: <CAPM=9tyi5A8t9bfCC3gtbG18Ai9cPS0bLrFVL_eJ1N1UyT4uBg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tyi5A8t9bfCC3gtbG18Ai9cPS0bLrFVL_eJ1N1UyT4uBg@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2024-09-13
X-PR-Tracked-Commit-Id: 135be1dc46c64c454f2828dbb7f239d035f47180
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 46040ea8a6a58e5645d91ffa3ead7ed8fd633d56
Message-Id: <172625347659.2331887.6281602361918395805.pr-tracker-bot@kernel.org>
Date: Fri, 13 Sep 2024 18:51:16 +0000
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

The pull request you sent on Fri, 13 Sep 2024 16:46:14 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-09-13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/46040ea8a6a58e5645d91ffa3ead7ed8fd633d56

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
