Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 162E585839F
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 18:11:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB59210E89D;
	Fri, 16 Feb 2024 17:11:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ErzP6j4Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F092C10E89D
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 17:11:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7719D6202A;
 Fri, 16 Feb 2024 17:11:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4DCB5C43399;
 Fri, 16 Feb 2024 17:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708103470;
 bh=uXYroRBM3zKlllC3fgNbck6ay/pQdsmZ9GYmNQQ2tqw=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=ErzP6j4Yv/Sl2fozzRk9QEHmpoaal+Oo24kBnBe7I5y4s82jISH8xkhXjg4lN6EB9
 KhgHBgfyotB4itCSJ3cNHVyOEmdeE1kdFTnP3SOOedohCnpHhmuHKhYAtEl9ofrEi9
 DztOoxdCPqlS9MAU2WKqId+fLLt1y0vlD2bMz/gniSMhElbl8KI71Lq0W3we/vXFmP
 EbyazbCH0kmGx+2r/aPH5+OIZ2Jv2Ko5Tn4yiUeQSwJTU37Bf5mZlpXIr8nAgQS6Q8
 VzVFOw8m0g3EkOw8kC/q18oT4/HIGXmIeeUaXYH3SzsJrJwDNEEz8an2TBes/+Zuwz
 AiA9WhikgAymA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 376E4D8C97F; Fri, 16 Feb 2024 17:11:10 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.8-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tz=LsdsWYZ0hG3Zuw_pLTsV-7wBh7C3hUmAcY9fcJf_ww@mail.gmail.com>
References: <CAPM=9tz=LsdsWYZ0hG3Zuw_pLTsV-7wBh7C3hUmAcY9fcJf_ww@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tz=LsdsWYZ0hG3Zuw_pLTsV-7wBh7C3hUmAcY9fcJf_ww@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2024-02-16
X-PR-Tracked-Commit-Id: ea69f782d0e37d9658d4b7df241661e651c43af5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ca6a62f9fe23713ea2b58a256a1ab27b9cc5a05a
Message-Id: <170810347022.29072.8651832318733133310.pr-tracker-bot@kernel.org>
Date: Fri, 16 Feb 2024 17:11:10 +0000
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

The pull request you sent on Fri, 16 Feb 2024 17:20:39 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2024-02-16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ca6a62f9fe23713ea2b58a256a1ab27b9cc5a05a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
