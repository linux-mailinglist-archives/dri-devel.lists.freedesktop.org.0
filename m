Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B466A2031C
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 02:56:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFACF10E327;
	Tue, 28 Jan 2025 01:56:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LlhjU5hQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB47E10E327
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 01:56:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D358F5C5424;
 Tue, 28 Jan 2025 01:56:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5119C4CED2;
 Tue, 28 Jan 2025 01:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738029400;
 bh=onFnsLmOc1dUfEvnQMB2FVOpaG6HBwV5JAJ4XV3BGEs=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=LlhjU5hQyP6mF2gJ9qCa33VKpRWgzLigWicUx/32hA64e6wKZo/F+/LyQ9WRFMOHT
 KDRBCESZsmcoFLCz+iBVRAuBE54Bo8j3+VUOrdCEVbvhsMHLQFHWTHeeGEUBxy/dqi
 eOFExQmPXpABYLVAADXQiF9vcx4iSoqd0znV02LM6NY267VvO9/sLvIBA+6YAU2gMZ
 72LyWU/m7UvwrlN+Gpoi5ITdOeAgPuDoOWvo0tC2M7wJtTFkAA0eWEPhDgR7vXQO7I
 SHfIqVr7/bJAMYrtkxtyJ8HTDbIGO31cCeLcMZhcGtggp0XEvsE5XKPCFgi55mwUwE
 yRuFb2XuhygQQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 72A9F380AA63; Tue, 28 Jan 2025 01:57:07 +0000 (UTC)
Subject: Re: [PULL] drm-next 6.14 merge window fixes part 1
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z5eLVhmes6xfA3zu@phenom.ffwll.local>
References: <Z5eLVhmes6xfA3zu@phenom.ffwll.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z5eLVhmes6xfA3zu@phenom.ffwll.local>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-next-2025-01-27
X-PR-Tracked-Commit-Id: 64179a1416e1420a34226ab3beb5f84710953d16
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7d6e5b525827c69b6d24716fa3e407441edfcf09
Message-Id: <173802942606.3293641.16881358787270038908.pr-tracker-bot@kernel.org>
Date: Tue, 28 Jan 2025 01:57:06 +0000
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Dave Airlie <airlied@gmail.com>
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

The pull request you sent on Mon, 27 Jan 2025 14:34:14 +0100:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2025-01-27

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7d6e5b525827c69b6d24716fa3e407441edfcf09

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
