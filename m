Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DCBB1E113
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 05:59:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DACDF10E1A1;
	Fri,  8 Aug 2025 03:59:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FV6DHNXl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B283610E1A1
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Aug 2025 03:59:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 658C945C42;
 Fri,  8 Aug 2025 03:59:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BEEEC4CEF9;
 Fri,  8 Aug 2025 03:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754625577;
 bh=dDGVzNI0/8rXzUldWHO1T8JVe4m2KDTBNlVV4OVdgA4=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=FV6DHNXl6fB1wSdGM6tWfrPY6KwDxxSRgq7LR+Bni06E1CkAI5W90Oap7C+5R5A6s
 oBXwHVk7Il0MMQ4SXpI7aKPiklbS5H6QogYmfRHSwuY8Mm0XLrh7tlZt5kppdIQKnn
 m+R4OTeB9szzjVB0MoRImSlvQu0hGshUEyWIGzBnXG8KzVuMfX/4MdbHDzk6s2K6Or
 VTYvKFlVsaOgqzpzjaJWjDrbAFxeL63voAqaQrJsDLaYJHGHRyi5Priun1YyIfFbN2
 vpq9oE8SDdHPWK1aTf3bVx1LhdZMeJNOeBjUmeEkAiEi/mj4PavtMuVW1PHjHzL/ra
 VBYpGMdkyQvaw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EAECC383BF4E; Fri,  8 Aug 2025 03:59:51 +0000 (UTC)
Subject: Re: [GIT PULL] fbdev last fixes for v6.17-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <aJSMS8PhMMe0NL63@p100>
References: <aJSMS8PhMMe0NL63@p100>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aJSMS8PhMMe0NL63@p100>
X-PR-Tracked-Remote: http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git
 tags/fbdev-for-6.17-rc1-2
X-PR-Tracked-Commit-Id: e4fc307d8e24f122402907ebf585248cad52841d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2939a792c47e55fda4ae5b7f9ff47e34ddcef61a
Message-Id: <175462559058.3795225.6138069126738275835.pr-tracker-bot@kernel.org>
Date: Fri, 08 Aug 2025 03:59:50 +0000
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

The pull request you sent on Thu, 7 Aug 2025 13:21:47 +0200:

> http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.17-rc1-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2939a792c47e55fda4ae5b7f9ff47e34ddcef61a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
