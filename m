Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D001B0FECC
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 04:34:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8816510E867;
	Thu, 24 Jul 2025 02:34:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="A7vpVD0N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DE7810E1B9
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 02:34:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 02D80A55DAE;
 Thu, 24 Jul 2025 02:34:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8722C4CEE7;
 Thu, 24 Jul 2025 02:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753324450;
 bh=XGPGL9OVy6dFXMESf6ZLlfVJaLRxBfn/cwkkzq8+YCY=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=A7vpVD0Ns7OU9l03FyWnFtMUvLjdgEvyve74IpPhc7/SQ6T5EREyoinSAHKmNiH2t
 cQqfxT8YUxhbipSm4A8yVamEtK4HNbED2HY1kaGL3g35KrNGYe4dvZhkeSP2AFIO62
 y/L4rKIdYGbvSOOArFEt2xg8Egi1rU+nyrK4JPAB5ltin6B20RpGnOecY3fsvq/SHI
 iH6hrE09JnTibeH1zSBWMp4mKSaU8BO6uu9eqA61M6Dl6+UKGjIBWzbKNkvMvqaNKB
 VgI11x3x92lXtVpdlvA/65QrKyBfJl0XhdiXIHTqIJA90DMQN2TgWv9+gaXMSlOlKx
 cD/EddqWe2P/w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 E7118383BF4E; Thu, 24 Jul 2025 02:34:29 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.16-rc8/final (resend in txt for sure)
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twUCJj4X-2jf0VG5+A2YN9Gk8hjOAhJ2hxq4SdgZfvtMA@mail.gmail.com>
References: <CAPM=9twUCJj4X-2jf0VG5+A2YN9Gk8hjOAhJ2hxq4SdgZfvtMA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9twUCJj4X-2jf0VG5+A2YN9Gk8hjOAhJ2hxq4SdgZfvtMA@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2025-07-24
X-PR-Tracked-Commit-Id: 337666c522b9eca36deabf4133f7b2279155b69f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 25fae0b93d1d7ddb25958bcb90c3c0e5e0e202bd
Message-Id: <175332446845.1852750.8580468393012759936.pr-tracker-bot@kernel.org>
Date: Thu, 24 Jul 2025 02:34:28 +0000
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

The pull request you sent on Thu, 24 Jul 2025 10:40:08 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-07-24

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/25fae0b93d1d7ddb25958bcb90c3c0e5e0e202bd

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
