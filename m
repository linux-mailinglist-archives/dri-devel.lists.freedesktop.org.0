Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D414D825BF3
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 21:47:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51A7710E676;
	Fri,  5 Jan 2024 20:47:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E396910E676
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 20:47:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 445DDCE1147;
 Fri,  5 Jan 2024 20:47:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 80860C433C8;
 Fri,  5 Jan 2024 20:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704487650;
 bh=xxRdBa4wSIPvUpG9DdRO0UWptRYS9fBz/+hAX42MCyE=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=ITVW1Y55zddKhSG84Z+lGP0B5TFShdE0YIh4JBi3pMo14s5+UyN4qiGp7xcK2o5IT
 up4XqqOTPOjRUblm5S+P+joKxGu1rPSq6t9XcvGVM25pyHYoo0dN+C1fUvr29bk294
 uySERpKNwjwP7zGqpH/VcqSEtCJOh4uGZ4qG4IyTsX9MGi62EbnlYku4CIufKYSMQb
 +WOmBJsUtoP4E3LcGMFiJGtGqavCJRL5SiLKKLd4jrMwHko1zodFgIlQVBIggBkHIE
 loRQ/LPdZqCTp3dEoRB/dG2Jc2u+wnu8il8otKonj5WOESKSuvsqkhA2uX2IR6kNd2
 GOedIaUn3iiRg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 6DA02DCB6D8; Fri,  5 Jan 2024 20:47:30 +0000 (UTC)
Subject: Re: [git pull] drm fixes (part2) for 6.7 final
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txH-Rag6weAFHx_VgozGmLd4RinHCOzpGbyVsLT7qpcfA@mail.gmail.com>
References: <CAPM=9txH-Rag6weAFHx_VgozGmLd4RinHCOzpGbyVsLT7qpcfA@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9txH-Rag6weAFHx_VgozGmLd4RinHCOzpGbyVsLT7qpcfA@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2024-01-05
X-PR-Tracked-Commit-Id: eb284f4b37817d2038fdfe1a9d51769730ab7b5f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2b5bd1498da5537e3d130b3862bccdd9aedd6c84
Message-Id: <170448765044.28812.6115533026297300477.pr-tracker-bot@kernel.org>
Date: Fri, 05 Jan 2024 20:47:30 +0000
To: Dave Airlie <airlied@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pull request you sent on Fri, 5 Jan 2024 13:31:53 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2024-01-05

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2b5bd1498da5537e3d130b3862bccdd9aedd6c84

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
