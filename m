Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A8A833580
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jan 2024 18:30:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C322810E316;
	Sat, 20 Jan 2024 17:30:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC85C10E30E
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jan 2024 17:30:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 40C0FCE139C;
 Sat, 20 Jan 2024 17:29:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 782DDC433C7;
 Sat, 20 Jan 2024 17:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705771790;
 bh=CUVk+zvlKaq1O4Ki4Rprf7ShZwa75EhBTLogXcul3tc=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=LezmrqdDi/7t2PSgB9Vr5Y63PKP30KUzHGDqNYcyo23Sn3UGGyYYkFzDvHqj91FOv
 3vYRU9EQCurJZHO0aHsUkx3EjZj209yafaX0iyUJ0daLEb6E3SH7rsq9uHj/oazcIm
 9i+QKebOOmdQB3qXOxaxBt7Za4DYFx1rsRamWrrdogzYl0Rb/FK6fp7BdpOG/rqKwZ
 lSUNPwyi7t+VRSjdKPMzt/h2eUVjenwqq73NryqYF4uW8B3guQhDoiR0oAqwCDofcB
 hrZsMVT+UJe2Ey0OH7Kq4Ixwq56XTUVaBZr88eOkZgk9s0U0PkDLfdW5keYOB6eTij
 XoZtm2VsHZ32A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 68032D8C970; Sat, 20 Jan 2024 17:29:50 +0000 (UTC)
Subject: Re: [GIT PULL] One fbdev regression fix for v6.8-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZasTWVn1lzY6oVym@carbonx1>
References: <ZasTWVn1lzY6oVym@carbonx1>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZasTWVn1lzY6oVym@carbonx1>
X-PR-Tracked-Remote: http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git
 tags/fbdev-for-6.8-rc1-2
X-PR-Tracked-Commit-Id: 2bebc3cd48701607e38e8258ab9692de9b1a718b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b1737ad4406a35f20eaae0e8079cc6ca6447e83a
Message-Id: <170577179041.28838.7145451632158218731.pr-tracker-bot@kernel.org>
Date: Sat, 20 Jan 2024 17:29:50 +0000
To: Helge Deller <deller@kernel.org>
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pull request you sent on Sat, 20 Jan 2024 01:27:05 +0100:

> http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.8-rc1-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b1737ad4406a35f20eaae0e8079cc6ca6447e83a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
