Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8938C4369A
	for <lists+dri-devel@lfdr.de>; Sun, 09 Nov 2025 01:08:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99D4E10E013;
	Sun,  9 Nov 2025 00:08:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uH+C+UfZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A1F910E013
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Nov 2025 00:08:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3AA13600AE;
 Sun,  9 Nov 2025 00:08:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBCBDC4CEF7;
 Sun,  9 Nov 2025 00:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762646928;
 bh=2zJu5ZBmInsPJLDEBVTUzUNPMHzWVJvDJqcnpEhgk9s=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=uH+C+UfZqV3R2+AYkKMnSEkwWB3L/TPPgCS/iq1Ueq+sYc/RmgnYsCaBEH71TUnSc
 lqsOKJwDZkfashyBxKCg8ScHGMCLFQH8n3AyxK2/YbCksL9votjRA62+ibeRlDlvnS
 spzMIVNWjcIyIRzZ3+DGzxnqPC+ZSFG8cWCIzsD5gUqaId9N0NA2Z2RVxloJ71phB9
 rAABTFRi/Ce/FOC26KSulbzEkZbtYg8wsygUSg2XutzuzYDYf23HuiVYLXzYvOxVjO
 xGRIBHVhzbNocsZiRFWBvG4uQMuo348f3cFMtyWO59o/1OImTSlmCXDiU2TcSPJawo
 CG6AEZaR7StuA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 AECCB3A40FD8; Sun,  9 Nov 2025 00:08:21 +0000 (UTC)
Subject: Re: [git pull] drm fixes urgent for 6.18-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twWJuOWLGVoMNdQhpu_5-diyLuHw+QhENenW_wGxu6GOQ@mail.gmail.com>
References: <CAPM=9twWJuOWLGVoMNdQhpu_5-diyLuHw+QhENenW_wGxu6GOQ@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9twWJuOWLGVoMNdQhpu_5-diyLuHw+QhENenW_wGxu6GOQ@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2025-11-09
X-PR-Tracked-Commit-Id: 411336159064c5e89e8b89d30c6855db4bb92814
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 439fc29dfd3b9c072dfff292d91cfa2f6cfb702b
Message-Id: <176264690030.1423288.11220520199599135537.pr-tracker-bot@kernel.org>
Date: Sun, 09 Nov 2025 00:08:20 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Simona Vetter <simona@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Timur Tabi <ttabi@nvidia.com>
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

The pull request you sent on Sun, 9 Nov 2025 08:44:40 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-11-09

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/439fc29dfd3b9c072dfff292d91cfa2f6cfb702b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
