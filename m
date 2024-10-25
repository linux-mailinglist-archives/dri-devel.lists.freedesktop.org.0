Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07ABF9B0CBB
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 20:10:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0C0710EB6E;
	Fri, 25 Oct 2024 18:10:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YJTDFFy5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B919110EB6E
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 18:10:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 01B6C5C5F06;
 Fri, 25 Oct 2024 18:10:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2726C4CEE3;
 Fri, 25 Oct 2024 18:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729879851;
 bh=9YqkEUoj54yXUqtteZibHJrZaqhqHVfUqNeyVn1kJMk=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=YJTDFFy5hEXWcZwOT05o/Nlve/WNxHONYsNKlsmnadOTTjCtXTe5EZJ97DFnEg1KK
 O6s5d7OqmoPH93N7f3ui38hgBpau7W9DnnBH2nqxlnCIIcjRkxuI/j8NxLUn+AbidO
 GIyYWcVrQ+xCKEM1hczLDP1TXso5B4VZrfE//VwQUg5c2qkoAaEr/PpIxDGINKoiJ4
 G28OBH7lepHESlt0JeXAHyP5hKS4F9HswX6mt3nVhRXQ+RahltJq7y/cabhizwNA2I
 AoNA5uZ5i7MICcb31qocRzeLZmwDUoAMg+NRs6AaG59id+6giTbTJjz4K6RMBCMXgx
 3AzNKo0NSP2sg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EB35C3809A8A; Fri, 25 Oct 2024 18:10:59 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.12-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txMNPAbbfxvD+0ouRGY5nojRvu6n+cPc=hjNwQzzj6gtA@mail.gmail.com>
References: <CAPM=9txMNPAbbfxvD+0ouRGY5nojRvu6n+cPc=hjNwQzzj6gtA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9txMNPAbbfxvD+0ouRGY5nojRvu6n+cPc=hjNwQzzj6gtA@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2024-10-25
X-PR-Tracked-Commit-Id: 4d95a12beba146b0ca2de59c7ce905bc0aadfd0c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fd143856b094b1798318d6816f37ea7380668c4c
Message-Id: <172987985859.2995179.17746356893549475517.pr-tracker-bot@kernel.org>
Date: Fri, 25 Oct 2024 18:10:58 +0000
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

The pull request you sent on Fri, 25 Oct 2024 17:10:25 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-10-25

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fd143856b094b1798318d6816f37ea7380668c4c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
