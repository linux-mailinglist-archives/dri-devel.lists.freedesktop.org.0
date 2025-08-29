Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D50D5B3C0F5
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 18:39:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BF5E10E094;
	Fri, 29 Aug 2025 16:39:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kr7gRBz4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CC8F10E094
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 16:39:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 811D7601BA;
 Fri, 29 Aug 2025 16:39:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38A69C4CEF0;
 Fri, 29 Aug 2025 16:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756485576;
 bh=Kc8e+V5hgu76KlkxtggRd2VXkgJ/MzmndljvanrhbVk=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=kr7gRBz4QdkFWNJywMJUF/dyIPlGE1wK+yqDSJfviqOJn1i3P8mut7A2GKgE/qXKh
 45tdScQBfPW0vpbyuiCk2qiq67KoGTZBAFUgd10XHHieLvLlpY2ImeR5wEEYG8LsMx
 570fAhZjlmjKCzkrNeS0cil7uDQoL0Q5IvfRTp4KMi///ndmF4GwfYvQVZ4C22Go4T
 /XUReUKaR0kOG3D74KhGYhrsiuazTJZyCx8F+JdARUezviRnk/8+Lqt2rB9+DcfPju
 ewTw05fKDeA/txKXmiBGb0TpZ1jANfeUwSFFlGCcBRLPWhvmX2U358nA5Y/WgSVn6j
 98AdRxwikfWJw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33C8E383BF75; Fri, 29 Aug 2025 16:39:44 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.16-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txr3jRk-+wk5J-raoWgYmeo5QRwBp0uCzLj67omDB13YQ@mail.gmail.com>
References: <CAPM=9txr3jRk-+wk5J-raoWgYmeo5QRwBp0uCzLj67omDB13YQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9txr3jRk-+wk5J-raoWgYmeo5QRwBp0uCzLj67omDB13YQ@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2025-08-29
X-PR-Tracked-Commit-Id: 42d2abbfa8c40299e047a9b3e5578fdd309dd2ff
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 18ee2b9b7bd4e2346e467101c973d62300c8ba85
Message-Id: <175648558291.2275621.226431442088147559.pr-tracker-bot@kernel.org>
Date: Fri, 29 Aug 2025 16:39:42 +0000
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

The pull request you sent on Fri, 29 Aug 2025 12:54:44 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-08-29

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/18ee2b9b7bd4e2346e467101c973d62300c8ba85

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
