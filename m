Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B740861BF3
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 19:44:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8747610EC97;
	Fri, 23 Feb 2024 18:44:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JskIj9bT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D80D410EC7A
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 18:44:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0AC666163F;
 Fri, 23 Feb 2024 18:44:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BA1CFC43390;
 Fri, 23 Feb 2024 18:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708713839;
 bh=xwhC1q2OH8q1Wg/lJNrUdbwYB/T54zVwQfjfRqupRAQ=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=JskIj9bTq7wzw+w5Kb6u9Jai2jg0GAmYPu2HB+zdoWeAAjtrfQQRrIj2p0Q9pAjoY
 KbfH4OPRWQ7o/82MjtQ+hwg34CsmMpgJmhzQ5ovLuCTMls9T7mGH7NlXCRH0tH8tdj
 vVxiXdcrERg0wQ5vkvSY6KoaOb7Pm5HCDkKvQW4ev7x+T7P6DsK53V8NjAz+08o7sJ
 DCGkqaZCtDcT28qOfdv1S8Dz5nFLY+BG0akJEO1n0RbZ1fTzFinhjlaIlDNoEXiSa7
 uiIEyWR5Aq2200YJCEyMJLJnpQkaI4TjYEJQsU7QO1ee/50IN78kdLaA7vP5lywjdZ
 y1SITRG7EKDDw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 A97CBC39563; Fri, 23 Feb 2024 18:43:59 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.8-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzmzFd8UsKbpvo0vMh08DmgKMNgOCVZ-T5KgfZHyw-4bw@mail.gmail.com>
References: <CAPM=9tzmzFd8UsKbpvo0vMh08DmgKMNgOCVZ-T5KgfZHyw-4bw@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tzmzFd8UsKbpvo0vMh08DmgKMNgOCVZ-T5KgfZHyw-4bw@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2024-02-23
X-PR-Tracked-Commit-Id: 72fa02fdf83306c52bc1eede28359e3fa32a151a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 06b7ef70b1f29de685ea80f0c1b8f0a0b0e16d18
Message-Id: <170871383969.26987.10729430010375333667.pr-tracker-bot@kernel.org>
Date: Fri, 23 Feb 2024 18:43:59 +0000
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

The pull request you sent on Fri, 23 Feb 2024 11:32:09 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2024-02-23

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/06b7ef70b1f29de685ea80f0c1b8f0a0b0e16d18

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
