Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F03847AE3
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 22:00:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A23510E0BD;
	Fri,  2 Feb 2024 21:00:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="S+d9jS/J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40A6510E0BD
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 21:00:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A9522CE2DDA;
 Fri,  2 Feb 2024 21:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6604C433C7;
 Fri,  2 Feb 2024 21:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706907616;
 bh=3z8ofmCzYvF8tXaXQSGvPhJt+e5NgjIcmMFgWYE3r04=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=S+d9jS/J1xlsU2aBhTHuTmp0NwpzOcSJpPoCe1P9f9CXhIoV4NJA3rv0GHeEb+DuR
 k72sIX/2AcvXmqRGW1jexPgvDSezBc/D+6TIH6NTfg74camxZGFfzKDvqzWApe5goQ
 E/6zPUCHI5Um73LcEavhYgOeOCGOiBHWe+KCymEE2ctl+X0AXTusBVRRy8H5KwFaxn
 eIchGSGeUq+ZB0GuLMoYRAusxufwWjsEaI1ch/1EvovrqmR6FMIGZQWxe4apRZPJAM
 iWQJsoiTBTFJnxa8WPrg+5xFOzofrqYF5nOQ0Gjeuv07DP8xROwHoccCFL65hEuwl3
 a177byKdxvdZg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 BA7B4D8C978; Fri,  2 Feb 2024 21:00:16 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.8-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyM-ERLs5LuMP_QOuJPtR6Yf4f_ON-0dHBd0B-fBVu-4w@mail.gmail.com>
References: <CAPM=9tyM-ERLs5LuMP_QOuJPtR6Yf4f_ON-0dHBd0B-fBVu-4w@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tyM-ERLs5LuMP_QOuJPtR6Yf4f_ON-0dHBd0B-fBVu-4w@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2024-02-03
X-PR-Tracked-Commit-Id: 39126abc5e20611579602f03b66627d7cd1422f0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9c2f0338bbd132a4b12b988004d796798609d297
Message-Id: <170690761674.8980.17837173192749581139.pr-tracker-bot@kernel.org>
Date: Fri, 02 Feb 2024 21:00:16 +0000
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

The pull request you sent on Sat, 3 Feb 2024 05:46:00 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2024-02-03

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9c2f0338bbd132a4b12b988004d796798609d297

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
