Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB80E8AB3B9
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 18:49:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B0BB10EA7A;
	Fri, 19 Apr 2024 16:49:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FyrLprQk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F135410FB7D
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 16:49:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E40B9CE1B6F;
 Fri, 19 Apr 2024 16:49:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 21FACC4AF68;
 Fri, 19 Apr 2024 16:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713545384;
 bh=EbhycsX6zJEnIO8RZ9g+UJnYdP7P7PgHJIdmfWoOo2o=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=FyrLprQksI/p4pxC/5y+WiVU39hJVFkmPg1LJ0K2p8oU1xTeQ/O6yn0BpvP7KXnLf
 X8K6rVyQHh30pufZ6HzvoEDRyuyw0s5BIDidyfqHmCCuf+9boI7WyoaIJPDveMljyA
 nazXLPaVFeT6OgQpEDPaLLVIkb6kc9sMT+xa2Xbm3/cQcFuimZ/rmHEUAS88JD7CyL
 pE17tDkdlRQ+jGKiOxYep4S4riOFLMmaIM1ntNyjGl/8j6o1HRkmCJ/wZ2I2tiXtTB
 ynMRzucU28tX29uA+7MWp7PHg6Yxwysp5iYvNAgZ2rGrXOIRpuTq3ucKO0T9pq64fb
 /M9niJ+sdHa9w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 16DE9C43616; Fri, 19 Apr 2024 16:49:44 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.9-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyKSyw-hDGcGSHom+C0iiagDbgrX=1oxv08jV+KRL=m8w@mail.gmail.com>
References: <CAPM=9tyKSyw-hDGcGSHom+C0iiagDbgrX=1oxv08jV+KRL=m8w@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tyKSyw-hDGcGSHom+C0iiagDbgrX=1oxv08jV+KRL=m8w@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2024-04-19
X-PR-Tracked-Commit-Id: 52c8b6e1c007b93d35058508fbe1ec80a1d9ca39
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ce944f3f97cf1bc813003ea2f3bf2abefa87dbd7
Message-Id: <171354538408.26173.17984370586544920365.pr-tracker-bot@kernel.org>
Date: Fri, 19 Apr 2024 16:49:44 +0000
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

The pull request you sent on Fri, 19 Apr 2024 10:53:05 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-04-19

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ce944f3f97cf1bc813003ea2f3bf2abefa87dbd7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
