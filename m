Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E571CAF99BB
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 19:36:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD3CD10EA5E;
	Fri,  4 Jul 2025 17:36:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Seoniush";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 485CD10E360
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 17:36:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 051D15C5B63;
 Fri,  4 Jul 2025 17:36:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABEADC4CEE3;
 Fri,  4 Jul 2025 17:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751650576;
 bh=6U8AVqQF1oEFq8dfisoI5iei3Sjr8EueiUUxJ8j2il0=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=SeoniushYeFaSHlJhDe+Y2Mb453rTD0GtYlS6Bw1YQiDVpVaHyfvFivMEfcctx/ux
 KzQU969tSAYa5ptyqv7QDW3npm3hIwAaQWxBb2SlRkqmoBp8s821Ddtjf7ErIK2s7S
 ovJ0a+N+XeFW4jLU/ZMZgUfN3VMZ3JKDzmjHDSq6iEiMHdiZHI1EHz+3DsLGTfmDD6
 kPfE8aLWO1TNC/f0rOhy1A1Gs5eB0vNFxMLvDMx85I4cCA8iobeo1Qt6nGcA2VGQCG
 zD1hWaEguDjP5omnOiULw5InWWAZDH/FovUUH3CdfHutA5KWHDolFHMlQyYOPiyS6m
 Z+cwRfsrkkoDQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EAF03383BA01; Fri,  4 Jul 2025 17:36:41 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.16-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzrmRS9++MP_Y4ab95W71UxjFLzTd176Mok7akwdT2q+w@mail.gmail.com>
References: <CAPM=9tzrmRS9++MP_Y4ab95W71UxjFLzTd176Mok7akwdT2q+w@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tzrmRS9++MP_Y4ab95W71UxjFLzTd176Mok7akwdT2q+w@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2025-07-04
X-PR-Tracked-Commit-Id: da8d8e9001c6a3741e9bec26a6cdcfd75ecabc88
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 42bb9b630c4c6c0964cddca98d9d30aa992826de
Message-Id: <175165060062.2287194.7810170516144309790.pr-tracker-bot@kernel.org>
Date: Fri, 04 Jul 2025 17:36:40 +0000
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

The pull request you sent on Fri, 4 Jul 2025 11:01:24 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-07-04

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/42bb9b630c4c6c0964cddca98d9d30aa992826de

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
