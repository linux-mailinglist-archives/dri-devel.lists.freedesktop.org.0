Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E2CAEC47A
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jun 2025 05:28:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFA4510E004;
	Sat, 28 Jun 2025 03:28:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="m+VZ3aCe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 052AA10E004
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 03:28:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D25BB60052;
 Sat, 28 Jun 2025 03:27:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86429C4CEE3;
 Sat, 28 Jun 2025 03:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751081277;
 bh=yZkMuMNgz2W3Jj5uAWkrAjOssfmfYf0vHHTK7Tli594=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=m+VZ3aCeYgEon3GFD36ok8Bs6wAuE1a+kGs0HvEpUPR38PNM7S7HjL/9joK3e1Kxq
 K9wEsw85HGQFy4uRw9HHfLuQA57TuU/b0QnkW3u67pqGXFH4Vca5qoXq9w83l3Guz1
 rbB/1TybCtdK6wOHGrknEbKlPjz7RGx4Psw9/gyhiwtBb7e6vxWSbeFup3Rh8swhm9
 PxqR/u/sK8ZraoAysa/CKc58YV/ib0pu+4c2yJT/XXvBkCth8PsMr9XT4/9BUdEpEq
 LKO0PQ7ZQPz/fwUrfk4UUpyvjuNhoYxlC19mwTehoOavO8Tf4k9sJ7eEkCZVUlyP/7
 2rD6a54GyBtbQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADE0238111CE; Sat, 28 Jun 2025 03:28:24 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.16-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzQhY_VeMkfYO8ZsUYdOrL9bAofZVUHKckjP2zPj_5Q2g@mail.gmail.com>
References: <CAPM=9tzQhY_VeMkfYO8ZsUYdOrL9bAofZVUHKckjP2zPj_5Q2g@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tzQhY_VeMkfYO8ZsUYdOrL9bAofZVUHKckjP2zPj_5Q2g@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2025-06-28
X-PR-Tracked-Commit-Id: 9fbceb37c95939182e1409211447a1d3f3db9274
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7abdafd2343ab199367c8243d6a5f06a9aa6976b
Message-Id: <175108130337.2124567.16052817178780470142.pr-tracker-bot@kernel.org>
Date: Sat, 28 Jun 2025 03:28:23 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>,
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

The pull request you sent on Sat, 28 Jun 2025 07:05:56 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-06-28

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7abdafd2343ab199367c8243d6a5f06a9aa6976b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
