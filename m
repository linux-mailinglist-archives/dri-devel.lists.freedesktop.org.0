Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81978CEF1B4
	for <lists+dri-devel@lfdr.de>; Fri, 02 Jan 2026 18:57:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4814D10E15A;
	Fri,  2 Jan 2026 17:57:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qpTykdSq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C65510E15A
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jan 2026 17:57:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C197A40BD3;
 Fri,  2 Jan 2026 17:57:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0E22C116B1;
 Fri,  2 Jan 2026 17:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767376632;
 bh=ZL0BVFbkGQTQiuISy9RF0v9gX4HbOcOU76GGKi0G8yc=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=qpTykdSqRGvCFiwE0bm/nGPGXcEEo0No5GyF2vvWlMFaQkniLywd1AQ5D0HrlhMqI
 DqYcLseMsJziNKi5Qp4VHwB5o8DfCeAOaeJp5CK0qBjy8ED7ELqCB6Nkj+vhPIxuIe
 pA5oMilb2YORV+mvJBq3KbdrrnCQX00FfCkXdaXgMG7gyQzZh2yPoVomdcFKZq74K1
 ERoliVZxTQ0YGcyp2n+B6AJhE5G0/q8qxL94W4xr/SKYHNWEBzKwtiMvOlUijM+nP2
 B4U/UVl5rPGzRZOX3xyuWI7iuQymPxyITmmddpQhVPreeAKf09ea+pSoV5/9cMNu17
 zFNvY+oF7Vp+w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 F2F4A380A960; Fri,  2 Jan 2026 17:53:53 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.19-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twCgpe-QbTaFR0JZ4hMAv8pmGe5wQn2wevGR4HSGQ99XQ@mail.gmail.com>
References: <CAPM=9twCgpe-QbTaFR0JZ4hMAv8pmGe5wQn2wevGR4HSGQ99XQ@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9twCgpe-QbTaFR0JZ4hMAv8pmGe5wQn2wevGR4HSGQ99XQ@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2026-01-02
X-PR-Tracked-Commit-Id: 7be19f9327d9a015ff97f97381e3bec163cd93cb
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9b043680446067358913edc2e9dd71bf8ffae208
Message-Id: <176737643259.3971834.1181030089214732103.pr-tracker-bot@kernel.org>
Date: Fri, 02 Jan 2026 17:53:52 +0000
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

The pull request you sent on Fri, 2 Jan 2026 13:57:34 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2026-01-02

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9b043680446067358913edc2e9dd71bf8ffae208

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
