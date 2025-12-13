Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE229CBA5B8
	for <lists+dri-devel@lfdr.de>; Sat, 13 Dec 2025 06:54:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6730D10E396;
	Sat, 13 Dec 2025 05:54:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="M4k8Z9Gv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5FEE10E396
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Dec 2025 05:54:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id ED17A600AA;
 Sat, 13 Dec 2025 05:54:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2E6EC116B1;
 Sat, 13 Dec 2025 05:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765605242;
 bh=7REU5e5VElU3A11juDr69iqQ0EMXa0Bde2GzOpwqHKM=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=M4k8Z9GvJLZAGaNVE8lam17R9xHcPOaYXsasaKPJUJopcRtWx+r/mE+PH+R5t669L
 oO2lLlqaixz7HpLg1KasN+Pj+CCpmYwhuFFhW8z/9Doi3i+caQF1pgnjS/zH+Ulrlt
 popauDYDtMl5cTKH9d3gq7Adh5zYhvPeNQ+unreKv913A1FNrFKsyjg7FhAIstxF/t
 bhQV0ui51ZRpbPnRZAu1ZfLRP5fjeFtfKrBUI9AWqqHrTwGdiFOoFJIEx+BZj7x8Dg
 89LMhol1fbqAe8C9YzVmhXFD6qxyviF71LSzQ8ELQaT9DwB6Y7gdmqZCNuiaZRZNBB
 uEqDWcM5NrNMg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 B5BF6380A954; Sat, 13 Dec 2025 05:50:56 +0000 (UTC)
Subject: Re: [git pull] drm next fixes for 6.19-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twB2eNZdfk2gZ1Tp1vnCKrsKNKz0s=3B3ZV_FFF66H0Eg@mail.gmail.com>
References: <CAPM=9twB2eNZdfk2gZ1Tp1vnCKrsKNKz0s=3B3ZV_FFF66H0Eg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9twB2eNZdfk2gZ1Tp1vnCKrsKNKz0s=3B3ZV_FFF66H0Eg@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-next-2025-12-13
X-PR-Tracked-Commit-Id: 37a1cefd4d4e0b3d12f140e8a265757444fa6957
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 237f1bbfe3d84a74ad8e6e207660bdb3e6d9a84d
Message-Id: <176560505540.2419555.16376058882367616424.pr-tracker-bot@kernel.org>
Date: Sat, 13 Dec 2025 05:50:55 +0000
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

The pull request you sent on Sat, 13 Dec 2025 12:14:45 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2025-12-13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/237f1bbfe3d84a74ad8e6e207660bdb3e6d9a84d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
