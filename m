Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D5DB16AB0
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 05:11:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5077A10E23E;
	Thu, 31 Jul 2025 03:11:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EzvGT3Ph";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EAF710E23E
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 03:11:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B2404462B7;
 Thu, 31 Jul 2025 03:10:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91B64C4CEE7;
 Thu, 31 Jul 2025 03:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753931459;
 bh=6RxrTGqCY5kf0n8shybxSMp8qcnaSNwtZX+pZVq/O5k=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=EzvGT3Ph4DL1WPnJVh/EZqM/5CfQ17cMdPPba/vwVpd8FXsHWS69HImoVqjoNoWOO
 lfrwoFBr2sqaUYr8ef5gYwVzwyODMLP+2HBnHA4QF1E0Ox97pJhGu8DmKljPmW5DCb
 DDjTlZxSS/xRo0PVOtbvZLLD/lnmZD1ZH4ggpzX5cwpZuOKQ6L4Zo1fROphGg1lNm2
 8ku3RQGKyRjfCx3TX/jpp/Oe4fU4rCTy8OHSddcLJS9kpf4VlAD8kvtklkxxACFEVf
 DCLXsdq4wdNT13A8R4d9GynAGdtooVrsB+kaTVlzuSMTP13pdhoGj9KgR84FRKGRH9
 QyKhX9nd+O62Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 AE0B5383BF5F; Thu, 31 Jul 2025 03:11:16 +0000 (UTC)
Subject: Re: [git pull] drm for 6.17-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzVm80-v6_5nt6kko3nR+aQLZ7R98i419FV8f4-ayQWUw@mail.gmail.com>
References: <CAPM=9tzVm80-v6_5nt6kko3nR+aQLZ7R98i419FV8f4-ayQWUw@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tzVm80-v6_5nt6kko3nR+aQLZ7R98i419FV8f4-ayQWUw@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-next-2025-07-30
X-PR-Tracked-Commit-Id: 711fa2667d8b230ff31f1855d0f25e3263268d8a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 260f6f4fda93c8485c8037865c941b42b9cba5d2
Message-Id: <175393147528.2597948.6255690700279027909.pr-tracker-bot@kernel.org>
Date: Thu, 31 Jul 2025 03:11:15 +0000
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

The pull request you sent on Wed, 30 Jul 2025 07:05:51 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2025-07-30

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/260f6f4fda93c8485c8037865c941b42b9cba5d2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
