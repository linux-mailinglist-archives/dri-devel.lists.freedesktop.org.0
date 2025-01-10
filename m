Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 287F1A09C96
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 21:43:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DCDD10E116;
	Fri, 10 Jan 2025 20:43:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QdHnmQb1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69C3F10E116
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 20:43:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E7811A4294C;
 Fri, 10 Jan 2025 20:42:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AF80C4CED6;
 Fri, 10 Jan 2025 20:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736541834;
 bh=/DACwWgb873aA/azyiBD+AxeE2hwRqMmx7LTCbK6/E8=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=QdHnmQb1ECWl9Xmmp5veElGAVUp3SNNUqb+qApgH98z6vhXtSHFNiL5lXE3Urty21
 YnvLy221/OkKsRl814ESBZuDdbvzLo0Ck533UEh7141azweRqinDWVm+wSL9IZzYXs
 07zUyd5tSREK8eBZ0an483HRmfhkWF2dQMfILgM0Ck8gqcjGYkaqsfrOAMcq3uHgIN
 0cUlcbptUA36rLSyO1gdD6KTPFUCvcrcPmkmFF9MgzOQNcKZvSIAi6Jp6yWF+7Bcve
 ArPODl5oo52Fue19axcbGelAdCAzw0XuuGT4izqxNEzyoq1H7gzCZ+96DvGoe3R9tZ
 d1+8EYRo/XrZQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 34558380AA57; Fri, 10 Jan 2025 20:44:17 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.13-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twk2XVFSgSqQy_PTQZagPJ0V-G6jpgoFcLnCUvzu_0Y8Q@mail.gmail.com>
References: <CAPM=9twk2XVFSgSqQy_PTQZagPJ0V-G6jpgoFcLnCUvzu_0Y8Q@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9twk2XVFSgSqQy_PTQZagPJ0V-G6jpgoFcLnCUvzu_0Y8Q@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2025-01-11
X-PR-Tracked-Commit-Id: fddb4fd91a955636baa451fe82ad0266f55c7ede
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e0daef7de1acecdb64c1fa31abc06529abb98710
Message-Id: <173654185582.2198702.11766501321220145110.pr-tracker-bot@kernel.org>
Date: Fri, 10 Jan 2025 20:44:15 +0000
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

The pull request you sent on Sat, 11 Jan 2025 06:28:19 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-01-11

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e0daef7de1acecdb64c1fa31abc06529abb98710

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
