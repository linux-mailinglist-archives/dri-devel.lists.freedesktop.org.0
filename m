Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A39BCB2889A
	for <lists+dri-devel@lfdr.de>; Sat, 16 Aug 2025 01:03:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEBDE10E297;
	Fri, 15 Aug 2025 23:03:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bWBORuT0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5036E10E297
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 23:03:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DD0384530B;
 Fri, 15 Aug 2025 23:03:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD0B3C4CEEB;
 Fri, 15 Aug 2025 23:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755298996;
 bh=rKJD0WJwPXnV0TpKTnu/O7uPaB/YcI0O6XgrOSvYRM0=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=bWBORuT0wzYYsnIo5OS0OskLiayu+atKmtYVXmCY1P+Kaq17kpLFmAFrYQz4b/6nT
 T35ut8ywhyZBGxdQalQtguwN51HjsQmagMz53fFpbYKGT/FPHUlqIe/xKO7Wi0qwYP
 qNFNC64F+JfI2ahzF9fxkOqPHavduUKKK1IerVExlKO8tGlRYDZzBjZxBnv2hJDa3K
 EjImdjHYewtdmspika4DQ8BR143WcYkjDmFxspKKqCQaqSArbN5hJbKOy9OpGOm+iS
 UpS8AMu6fCFC5si2iUfIBOiBd/BRYIr3XZw0pYsKin9H8NTIxm5aflX8ZIEWDQ35Qb
 rsHqpy/l1O9KQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EB08539D0C3D; Fri, 15 Aug 2025 23:03:28 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.17-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyB2nWb_L8DvXFQ3PUo516j2Z6UW9-t3d9o0yBM7TzBuw@mail.gmail.com>
References: <CAPM=9tyB2nWb_L8DvXFQ3PUo516j2Z6UW9-t3d9o0yBM7TzBuw@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tyB2nWb_L8DvXFQ3PUo516j2Z6UW9-t3d9o0yBM7TzBuw@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2025-08-16
X-PR-Tracked-Commit-Id: 00062ea01d35eaca34d561e5c76cd988dc8c3b83
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: dfd4b508c8c6106083698a0dd5e35aecc7c48725
Message-Id: <175529900745.1301055.17572234635565155628.pr-tracker-bot@kernel.org>
Date: Fri, 15 Aug 2025 23:03:27 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Simona Vetter <simona@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>,
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

The pull request you sent on Sat, 16 Aug 2025 07:24:32 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-08-16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/dfd4b508c8c6106083698a0dd5e35aecc7c48725

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
