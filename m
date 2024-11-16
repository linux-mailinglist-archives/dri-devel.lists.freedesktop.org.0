Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEEA9D016B
	for <lists+dri-devel@lfdr.de>; Sun, 17 Nov 2024 00:16:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD7F010E210;
	Sat, 16 Nov 2024 23:16:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nHm/s9hc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33CBC10E210
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Nov 2024 23:16:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 206915C55C6;
 Sat, 16 Nov 2024 23:15:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB66BC4CEC3;
 Sat, 16 Nov 2024 23:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731799002;
 bh=GbXpcyHhxgIfnOWa2TB1qAot2k4wdumjWPKSJ3Z5kzo=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=nHm/s9hcdURejgY+zqItv57mhsvGsmGybLI5HsgUo4BSgrlNiOrmmRZ63g/8Duocb
 CfnpHVp8AluReUkwWNx4fFZyxCgUZXyPGcP0y5Rq2/tWAhGdIwusTnpQuxId92Q53W
 1GhlbVBAVCddHrSbs3F0OX9ERspiRCjlMl7TCOsnizjUDRK9BGE/+c9ANVsx4ZgNNk
 RPmtWuxxtxDlkQp/xduB5b7Bl4WS2LqRUYf5ugxgilnf30KrofU0D/WmOADSR37Uun
 zjBP2OGqaWcHZuA+8sphu92QT+wKB3F4IAvf4TEoE094ox4mUW0AijK5WrRdQMZjSB
 Y2OjIRmah1nqg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33E4B3809A80; Sat, 16 Nov 2024 23:16:54 +0000 (UTC)
Subject: Re: [git pull] drm amdgpu regression fix for 6.12-rc8
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twfZ5B1NqByVsvHO38MGQ+ZfTEz6xmtZXQarHvKgg3gLA@mail.gmail.com>
References: <CAPM=9twfZ5B1NqByVsvHO38MGQ+ZfTEz6xmtZXQarHvKgg3gLA@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9twfZ5B1NqByVsvHO38MGQ+ZfTEz6xmtZXQarHvKgg3gLA@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2024-11-17
X-PR-Tracked-Commit-Id: f48ab0a39f12fd83fae13bf81152531565cd5e75
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e06bc45bef9aca52c6bdcb56aa6d392d99516ac3
Message-Id: <173179901270.3014796.14579671165827628624.pr-tracker-bot@kernel.org>
Date: Sat, 16 Nov 2024 23:16:52 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>,
 Alex Deucher <alexdeucher@gmail.com>,
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

The pull request you sent on Sun, 17 Nov 2024 08:17:17 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-11-17

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e06bc45bef9aca52c6bdcb56aa6d392d99516ac3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
