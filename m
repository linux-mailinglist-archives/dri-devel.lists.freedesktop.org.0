Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 424D1B0AA4F
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 20:50:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E043810E191;
	Fri, 18 Jul 2025 18:49:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IuU7hOwB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3C6910E010
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 18:49:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id AA24C601F5;
 Fri, 18 Jul 2025 18:49:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E21FC4CEF5;
 Fri, 18 Jul 2025 18:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752864596;
 bh=o9UxKVKF+g8ocslLE6so2+50W4IAxe3qqqybLYzVeSk=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=IuU7hOwBDeOmulZ20BYLfVL4ai244HEWvWG1veSZNYzHQqUqzjM4kSgW2CPRav3i/
 eGGEAt6wpG1PtUA5qE+/fUBPbYpascAxuHvkzkg7RhoXVl0+MFD/g7MEXGjuLFbX0i
 8bkh1PTI8pi9JpxfF439AeqCt2YkDou6z/Q8Bic5meB0zJFA6psijEoiV9uV78vT98
 v2TraBZKclxhlwP4u9DKhvMYOiKl+UFOuLQgXfxSazleHxDMG3jfdvocTcM3M1GxSM
 FaeEor4Hyt4L0gcYO+Mx8dyEeZu4VDjrHanrdVydd/dq2kxv03l6OE1HIVCuoDNzGn
 ysZ4W5M2bn0iw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70CF8383BF4E; Fri, 18 Jul 2025 18:50:17 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.16-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzJPpV89V934YdOO=i1gEVwx9NOMV+w8+hqRgDLk+6L+A@mail.gmail.com>
References: <CAPM=9tzJPpV89V934YdOO=i1gEVwx9NOMV+w8+hqRgDLk+6L+A@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tzJPpV89V934YdOO=i1gEVwx9NOMV+w8+hqRgDLk+6L+A@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2025-07-18-1
X-PR-Tracked-Commit-Id: 4d33ed640ffc06734271cebda5ac2e3b5a79f453
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c460535a6d6182dcb00773132a8c384c1f9b5408
Message-Id: <175286461638.2758816.12877251994317780459.pr-tracker-bot@kernel.org>
Date: Fri, 18 Jul 2025 18:50:16 +0000
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

The pull request you sent on Fri, 18 Jul 2025 20:33:49 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-07-18-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c460535a6d6182dcb00773132a8c384c1f9b5408

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
