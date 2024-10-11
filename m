Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D8899ACBC
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 21:34:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 661D110E056;
	Fri, 11 Oct 2024 19:34:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="s5pAlbG6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7744E10E0AB
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 19:34:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 64DD35C5FC3;
 Fri, 11 Oct 2024 19:33:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E6F2C4CEC3;
 Fri, 11 Oct 2024 19:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728675241;
 bh=YgCjjDO3uX4OroQ0xWe2A7Ve/fVrRQnGKrJmXP3HCSM=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=s5pAlbG63p7qvVDvj8tpwnJqfs0NBCYeR34bORp4z9AFKPcRXDZc6n/zSDQqKHVjS
 bhICE+otxroEFPAVZy+hH7il+N/sPclYZeGKhgaYplF1fiB89vvFqPi8Sr/Y+0xViG
 9sOwEXcmdP/+eYz1eiWyAFwGo7ifAsMvS6oVrmxti4r7opcAplXN7T2y+Xsvp8TaXm
 M/FuHrOtrQXXFinzV9EVDMdvEy0AtgWJderzFvvREW6dQI02fkRAWz4+pihDzt8u6/
 xtyc3tH9fcRu62kyl7hYsYPCdYRHGA7kmdD6D4meNikc7uiKaM0ucgJEaxrOgmMOAm
 J4RHTGAull+Gw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33CB338363FB; Fri, 11 Oct 2024 19:34:07 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.12-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyf6kxBxT7H9aPK8y8RDDu7Bx-mLEVPT1zWkapNaXKpcg@mail.gmail.com>
References: <CAPM=9tyf6kxBxT7H9aPK8y8RDDu7Bx-mLEVPT1zWkapNaXKpcg@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tyf6kxBxT7H9aPK8y8RDDu7Bx-mLEVPT1zWkapNaXKpcg@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2024-10-11
X-PR-Tracked-Commit-Id: ac44ff7cec33d5c2d4b72d52603552ec64c1a8bf
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: befcc89362383208f62b15887592758165459e3d
Message-Id: <172867524582.2975359.3347201287082078558.pr-tracker-bot@kernel.org>
Date: Fri, 11 Oct 2024 19:34:05 +0000
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

The pull request you sent on Fri, 11 Oct 2024 17:17:44 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-10-11

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/befcc89362383208f62b15887592758165459e3d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
