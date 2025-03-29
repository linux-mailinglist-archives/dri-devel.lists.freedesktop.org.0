Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C67A753C8
	for <lists+dri-devel@lfdr.de>; Sat, 29 Mar 2025 02:01:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A275E10EAD1;
	Sat, 29 Mar 2025 01:01:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ian7LHjc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFB2A10EAD1
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Mar 2025 01:01:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CB57B5C53F0;
 Sat, 29 Mar 2025 00:59:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 741F7C4CEE4;
 Sat, 29 Mar 2025 01:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743210077;
 bh=zw+LY6l7DGQu0Ui9wLy7jSsru+ssJuH1+yqnJNVzNsQ=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=Ian7LHjchiQU2FO23/UrVO8/IMy/kOLW5DkWyvt6R1OQVx+oHaHmyvNuXSmNVbXWU
 DpLIp4cVAOYn7tMM3wAAI0OMUUfbYCENbJlrTbJ0CNMHPSviPnPfec9dOfxSa7YyZm
 3qN7NFH+Xn4wsy+RTBXDLOWRWCZXl3YrSD/CT8J4+1Nu4a80N5GWK1WYgvGXUJIbok
 dWVpddOd+OdFqom/JAVFoLnQ0RErE7oOFGQN1GMKlIyRd7n8r3h7YjTerpZejU4UjZ
 6YkPH5CnFlnf7wMDm6CJ66A+9uhRVR9wCq8Xbt8fnuoYiPihG64dRwn7z+GNUvEFA7
 hirjCGQhaQxTQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 340433805D89; Sat, 29 Mar 2025 01:01:55 +0000 (UTC)
Subject: Re: [git pull] drm for 6.15-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyx=edsZ3ajuAUAv4vjfa=WNEzobqAsYbBTjCfLbuEeFQ@mail.gmail.com>
References: <CAPM=9tyx=edsZ3ajuAUAv4vjfa=WNEzobqAsYbBTjCfLbuEeFQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tyx=edsZ3ajuAUAv4vjfa=WNEzobqAsYbBTjCfLbuEeFQ@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-next-2025-03-28
X-PR-Tracked-Commit-Id: cf05922d63e2ae6a9b1b52ff5236a44c3b29f78c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0c86b42439b6c11d758b3392a21117934fef00c1
Message-Id: <174321011387.3019715.1646591159826097779.pr-tracker-bot@kernel.org>
Date: Sat, 29 Mar 2025 01:01:53 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, simona.vetter@ffwll.ch,
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

The pull request you sent on Fri, 28 Mar 2025 12:53:20 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2025-03-28

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0c86b42439b6c11d758b3392a21117934fef00c1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
