Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A22F3A148A0
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 04:56:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 511FA10E2C0;
	Fri, 17 Jan 2025 03:56:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sM7obF+2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 124AA10E2C0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 03:56:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1B753A4252A;
 Fri, 17 Jan 2025 03:54:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E473C4CEE0;
 Fri, 17 Jan 2025 03:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737086195;
 bh=DnYitmdJTFamxR4ulW9Ife4mwqGv7x8+2v0mENAfRVc=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=sM7obF+2TfSG+W6xYoupSZhFQgNpPrVfbLdodqjNf9Uo2q4wVq7IuRVmkgb3nOZ2D
 H5g1paEszt5uTQmcx8+2H9BCI61hbCjJQoeHhGSoXLil4flMda3y4S0fKwmG1mq7MB
 BFVKFMvEk2kDP9H5p3B5Po7cJylhC+pX8AvyfAMfKNHrboFktHm6wOTaoWaM0kwApw
 CrDpTpGiNURCpZmDOE+SkrXAULU8gVsIxsiL4SdI5JAm4n0FZy8MoGp3+khHc/zwrw
 qcD1RM5pKxjHUA3mR31HfgWIcK0umoyOiDnUL4B0j5x6iTexMKoKgWpcrSrWW8OHa1
 VvcK07U8PLUhA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EB268380AA63; Fri, 17 Jan 2025 03:56:59 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.13-rc8
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzJTHBMwvNBH3s4Y4Oqt1o-Dcn4oGmk-ne_CrtbfQDv2g@mail.gmail.com>
References: <CAPM=9tzJTHBMwvNBH3s4Y4Oqt1o-Dcn4oGmk-ne_CrtbfQDv2g@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tzJTHBMwvNBH3s4Y4Oqt1o-Dcn4oGmk-ne_CrtbfQDv2g@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2025-01-17
X-PR-Tracked-Commit-Id: 9b1c673a1648cc3501a3b7719db2bec931cf00f7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9bffa1ad25b8b3b95d8f463e5c24dabe3c87d54d
Message-Id: <173708621857.1678450.15927369011373669241.pr-tracker-bot@kernel.org>
Date: Fri, 17 Jan 2025 03:56:58 +0000
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

The pull request you sent on Fri, 17 Jan 2025 12:55:50 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-01-17

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9bffa1ad25b8b3b95d8f463e5c24dabe3c87d54d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
