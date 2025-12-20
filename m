Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C344CD375A
	for <lists+dri-devel@lfdr.de>; Sat, 20 Dec 2025 22:10:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6635D10E02F;
	Sat, 20 Dec 2025 21:10:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CZexVR7R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FF4810E02F
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 21:09:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1025760055;
 Sat, 20 Dec 2025 21:09:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9C80C4CEF5;
 Sat, 20 Dec 2025 21:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766264997;
 bh=QLdP78Q9SXbNqjizYcobHIzq5mHUs4/wLrvhOguPBqk=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=CZexVR7ReBEfpE3H0+mf1sBvkB7IAA+AqTqnjKf2VDekT+gYDebqokG7tYGmAhiJp
 0Nb5q3Plj+WY5riemcu0ueH/42fEVPMVf3S+PnPHF2uYBy8/vMioyZo2iEFu0qz8b0
 bcREFM0oxxaLJXoxFwYjud+d6VMHh5QeoNDVtYrbUWcJ3EjEGOaY/k7x8ZbNIFcp2k
 n2y4C3jYyvVO8Ko/bGmrGKrpuTl5qn8+D0XCZeypRAvMquHZKJHGzrDbzqq1lGYQPB
 hLEUj9T8FhZksk5uzS+3jYcpKLhA73107nrSJTU31NMraT/7okqfXUYJ8OUb2EhJFw
 eShBD/ZDrmqMQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 F417C3809A05; Sat, 20 Dec 2025 21:06:46 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.19-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tx7MZKWMgP1RhtHASS7-Fxz3eTPg1WLEgiYShuXoQ53fw@mail.gmail.com>
References: <CAPM=9tx7MZKWMgP1RhtHASS7-Fxz3eTPg1WLEgiYShuXoQ53fw@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tx7MZKWMgP1RhtHASS7-Fxz3eTPg1WLEgiYShuXoQ53fw@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2025-12-20
X-PR-Tracked-Commit-Id: f66ac60dee28d092bc6a3af33a04147bfcb6ba30
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a0bdd554a8214651717964e947c415cfac8114a2
Message-Id: <176626480552.138523.1373841235181873906.pr-tracker-bot@kernel.org>
Date: Sat, 20 Dec 2025 21:06:45 +0000
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

The pull request you sent on Sat, 20 Dec 2025 05:44:52 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-12-20

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a0bdd554a8214651717964e947c415cfac8114a2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
