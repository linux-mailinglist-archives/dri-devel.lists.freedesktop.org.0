Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD58C9351F2
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 20:52:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7C1A10EAB9;
	Thu, 18 Jul 2024 18:52:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="P3zuyns0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE2710EAB9
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 18:52:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CF67A61BBA;
 Thu, 18 Jul 2024 18:52:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6F71EC116B1;
 Thu, 18 Jul 2024 18:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721328756;
 bh=eLYytie5OavnSK9/S/M2BFFGHyOeAhdS3/+1va2/wAk=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=P3zuyns0aDScdwrMYXul8/JmoujKRydt3d8TV3m8Vdiu7ZR8reeLcWo9ir66gOvGx
 XHez0vKztLoTPX5Bqoh1z5OCyjRXAEL9E2DrH9cFh5w5qH1DkYosVftXihbwNxhPrl
 jwHcE9aCXWYTRoU0vx4ok3b1ggsP5o+w4mCfDL7teNyt8qUba8X6U2HDFnZGDUz83o
 SorghyCRCHYhyQlQKosIWCLotINhNOJNqqDvMv4gL+r5qIgQm4Bi3lrr2PyeBf5B1o
 JHAo2jDsEKNbVy/CQlz5Oxqq5UKXN0LJbo3Icm96tdKU85XKpW4IOI6MBWKTpmEIOd
 gIYMtk3jprTkQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 5A466C433E9; Thu, 18 Jul 2024 18:52:36 +0000 (UTC)
Subject: Re: [GIT PULL] fbdev fixes and cleanups for v6.11-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <Zpk7E3ZBlh2UdXy2@carbonx1>
References: <Zpk7E3ZBlh2UdXy2@carbonx1>
X-PR-Tracked-List-Id: <linux-fbdev.vger.kernel.org>
X-PR-Tracked-Message-Id: <Zpk7E3ZBlh2UdXy2@carbonx1>
X-PR-Tracked-Remote: http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git
 tags/fbdev-for-6.11-rc1
X-PR-Tracked-Commit-Id: 8b5ea9029b03efda74292c57e0377a98ed0b7434
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cb273eb7c8390c70a484db6c79a797e377db09b5
Message-Id: <172132875636.1632.11308126601806645460.pr-tracker-bot@kernel.org>
Date: Thu, 18 Jul 2024 18:52:36 +0000
To: Helge Deller <deller@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
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

The pull request you sent on Thu, 18 Jul 2024 17:56:03 +0200:

> http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.11-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cb273eb7c8390c70a484db6c79a797e377db09b5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
