Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7F5C41E72
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 23:57:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1FF210E034;
	Fri,  7 Nov 2025 22:57:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KjgqxTS/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5C8810E034
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 22:57:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 72ED44343F;
 Fri,  7 Nov 2025 22:57:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52413C19421;
 Fri,  7 Nov 2025 22:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762556239;
 bh=QiWpK66BtccNnuurPeLD8mbkDu/D6l+ThPoZpGRxry0=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=KjgqxTS/lbinLY/83TgHjcPy62Z98hKCiJqiper3tMlyFxJ9GHxocqP9x8ivyJr5O
 LHh7HLoxclRIZjM5H67Wxv400YkvjkUuQenj2PvXZ6zPmdRneyumiqP72gQGJc2lr+
 835Mjxfn6xy/765PfdupsN41Olt4mZdOglL3EYvSgt3hHXlqN5cRX9HzdGLcBI8xcT
 I9NcupuWr0cX5vKGw0lw3ALlcxVdXwN6fzI1YNqholiMuAgsgb6wYhRDdl59AeJhHk
 a2uLIKxAClz84JBtQ6evdedjbUF4UtQFHUbOjQLsKJ8Yy4aMMH6aSBraopzPRPS5pQ
 MKnawifjNBZJA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 AE4483A40FC8; Fri,  7 Nov 2025 22:56:52 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.18-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tx60Q0o7v1hK-GJ_iKs7J0dVgQENM44T=gM_KWZXoA4YA@mail.gmail.com>
References: <CAPM=9tx60Q0o7v1hK-GJ_iKs7J0dVgQENM44T=gM_KWZXoA4YA@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tx60Q0o7v1hK-GJ_iKs7J0dVgQENM44T=gM_KWZXoA4YA@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2025-11-08
X-PR-Tracked-Commit-Id: d439acbbfb9a982f152c5f806b4592431a80c4fd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e811c33b1f137be26a20444b79db8cbc1fca1c89
Message-Id: <176255621119.1183149.9411551911217772637.pr-tracker-bot@kernel.org>
Date: Fri, 07 Nov 2025 22:56:51 +0000
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

The pull request you sent on Sat, 8 Nov 2025 08:08:39 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-11-08

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e811c33b1f137be26a20444b79db8cbc1fca1c89

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
