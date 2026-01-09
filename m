Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2946D0B554
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 17:43:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E13C10E90F;
	Fri,  9 Jan 2026 16:43:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EE8F/aye";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A88F10E90E
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 16:43:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 65C4460122;
 Fri,  9 Jan 2026 16:43:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D5F0C4CEF1;
 Fri,  9 Jan 2026 16:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767977013;
 bh=t1waYCGCH27PCqnP7/Z2P42EX/uNefo//msX7RKvY4M=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=EE8F/ayeCYd7B81L7julOEdjOwIwBMmjH/c9w8bNPBzNAFb4IU3eJk5/kOuQSlqDw
 mK7ssmSl6VNkZF09AnmYbbOcfomS/ngOTTu5tIdPfxuKt22I14kPuJpi0OqLrHraoY
 OaupAlzmrKzAEfqXPAbSOm9MXr7hIcIHKlKwiEt1zpmzIYyoxpez15enSlrEe7Jr9P
 AEp7ordyX7Ys80+O/Yy+8joQqf6ISCFDyXYQ4IV5CDS/Ca/v9DXr1h36N7dG5T70lL
 u6mns1Rx4auPGToLwrp/8zbccfrZeedJLeARZZhtCYEpANG4QY82PO3SkW+oMx/RdD
 zxfc3+oPJtlZw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 3D3D03AA9AA0; Fri,  9 Jan 2026 16:40:10 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.19-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txCYhhEQYMtR-Wborgso86tnPpBv-M=6+v8QVO3Sx197g@mail.gmail.com>
References: <CAPM=9txCYhhEQYMtR-Wborgso86tnPpBv-M=6+v8QVO3Sx197g@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9txCYhhEQYMtR-Wborgso86tnPpBv-M=6+v8QVO3Sx197g@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2026-01-09
X-PR-Tracked-Commit-Id: f6eac56d6bf2026437b606a69aff903941282f9a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cbd4480cfac54dd4e9f7fb9ac2e0226ea38fecbb
Message-Id: <176797680889.323012.15873134835529680.pr-tracker-bot@kernel.org>
Date: Fri, 09 Jan 2026 16:40:08 +0000
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

The pull request you sent on Fri, 9 Jan 2026 15:50:17 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2026-01-09

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cbd4480cfac54dd4e9f7fb9ac2e0226ea38fecbb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
