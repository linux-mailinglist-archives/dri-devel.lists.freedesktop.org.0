Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EC3BCE94D
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 23:09:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A4AA10E10E;
	Fri, 10 Oct 2025 21:09:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AU+7G6z4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5C6D10E10E
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 21:09:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AB726435C0;
 Fri, 10 Oct 2025 21:09:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F4CCC4CEF5;
 Fri, 10 Oct 2025 21:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760130580;
 bh=zDupfuPZlmxliVGys9b7iXmLHMvnwVmLabeZFUVqcpY=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=AU+7G6z4WrLUr2ThW2TTJFYMTaPQhmnx10DKKmBlptcBFXJq8oEpmoPYld/HOyxJd
 1MMwQAdy0Iyxdap2OGxDaXkSzOVlqea6IXJVxL7jPRYCuOrqgACYiW3OEAeSgCp/GG
 jp1ZjBVe5tWKD1dUW9JmQMv186kvElIM3sFtPghfn+MJNU6fiIpaNM86cBm4dpGPFT
 YWyMSvOtnj13GmjNClaR7KwHqZIcmY4dkPxYjMHa6voiVu1EYKkLgzHJhAv31hKLo6
 UITOo1MVpx3o2IcFVOsFLLf7yd026wGVyRGShtAkxcyTG/SuOlUhiHNMWZu/n3KDx9
 3bHVDgXlZS9mA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33BB13809A07; Fri, 10 Oct 2025 21:09:29 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.18-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tx8Hiozxaf+0WkOH3GrXKhCr_ccqVtd1v7WkP_V9DmeJQ@mail.gmail.com>
References: <CAPM=9tx8Hiozxaf+0WkOH3GrXKhCr_ccqVtd1v7WkP_V9DmeJQ@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tx8Hiozxaf+0WkOH3GrXKhCr_ccqVtd1v7WkP_V9DmeJQ@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2025-10-11
X-PR-Tracked-Commit-Id: 5ca5f00a167cdd28bcfeeae6ddd370b13ac00a2a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1e5d41b981bc550f41b198706e259a45686f3b5a
Message-Id: <176013056782.1128757.6763550721097758946.pr-tracker-bot@kernel.org>
Date: Fri, 10 Oct 2025 21:09:27 +0000
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

The pull request you sent on Sat, 11 Oct 2025 06:22:34 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-10-11

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1e5d41b981bc550f41b198706e259a45686f3b5a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
