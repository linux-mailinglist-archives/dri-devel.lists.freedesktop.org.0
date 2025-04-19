Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A25CFA944CD
	for <lists+dri-devel@lfdr.de>; Sat, 19 Apr 2025 19:21:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87BD110E0E4;
	Sat, 19 Apr 2025 17:21:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EJpNUOUo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BD6110E0E4
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Apr 2025 17:21:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CE24660007;
 Sat, 19 Apr 2025 17:21:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35190C4CEE7;
 Sat, 19 Apr 2025 17:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745083301;
 bh=Z9b6C72ckExhwVX2kMbn8zXvqTNAJi3qKlqGjjuGK4c=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=EJpNUOUoH3/HZeL2YBGg4XZdvpHWbk+rt+fPLdlWBu4W6elmdVii/cJDIE+MQuLhh
 b22ACJb8aedco35HxIX8bQxG9qk13aJayIcv3eAoblsVAlQjCqO9P+8gxTITNwJ16F
 3v12Yh0rTWifTDvpo7QAYYBRbugp9ZvGFtg/nhE4sWeiQSbFdZE2dfuXvWtkv3tXph
 D/DNA607Ji5BICvxrJu8kKR/L95/firKYg1m9VXTykK0zrkVSDzaIxMJAP+8PgN96F
 XhqT0QPv/iMnAsxsg7XHMhEfGp8rctrF7VGhDdthLRgXuk2+YHpCy3kZsg2IMPu71k
 xZg3fEiBvRUJQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADFC03806642; Sat, 19 Apr 2025 17:22:20 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.15-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tz_TQb0KRXAzverESVSPD1Ap5D=oZhab4tvYJ-XrwN0cQ@mail.gmail.com>
References: <CAPM=9tz_TQb0KRXAzverESVSPD1Ap5D=oZhab4tvYJ-XrwN0cQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tz_TQb0KRXAzverESVSPD1Ap5D=oZhab4tvYJ-XrwN0cQ@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2025-04-19
X-PR-Tracked-Commit-Id: 0467145fab3b3a7a1efd221722310fe32329b3da
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 51c7960b87f465d01ea8d8ff174e81dd69f3b2b4
Message-Id: <174508333921.507729.8223981949363052199.pr-tracker-bot@kernel.org>
Date: Sat, 19 Apr 2025 17:22:19 +0000
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

The pull request you sent on Sat, 19 Apr 2025 15:19:47 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-04-19

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/51c7960b87f465d01ea8d8ff174e81dd69f3b2b4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
