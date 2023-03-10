Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F186B4E76
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 18:26:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDEAD10E2F9;
	Fri, 10 Mar 2023 17:26:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E09810E2F7
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 17:26:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9337061BFD;
 Fri, 10 Mar 2023 17:26:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 030E9C433D2;
 Fri, 10 Mar 2023 17:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678469177;
 bh=D8hlYlQut+dgaoSQAWmBVroQdnawtQm8CJEZA1ED3Lw=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=UBnb0Cj6aFInMsaqi9gpVnrWKSdRG2eJAMi/ATOHeU0vysHor7y8HtoEDtF/ig+oo
 WYRXGdMM0wslCkatwtfowFe1UH9bCU8J4L1XJPNgxmvwQU1DfZnOkVtucV4SXYuihP
 2qH9FD63ABA7m27ryxAjdjQ9LOZRHw0+d1N7VUjTNGx4VFhsud5Wcu1uRfv1gumEOq
 VpPBaXkFt+0t0kaZMnC9BYsmuo8xz3AdKFF56e3XVwByQhHk7qdkHTE00GSLAtE0/q
 PJuHdB3KZlc8s15FaqknZWWtjrNkBL4KpQ9AUHUsj3mt/f4pHyJngdFQOjBCdA4gua
 8EmXnCIo4kjDA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 E48F8E61B66; Fri, 10 Mar 2023 17:26:16 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.3-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tw4eFsBCha-h2FvM_ofXMcEJAEsoT_HqxZc9gWe20J+yA@mail.gmail.com>
References: <CAPM=9tw4eFsBCha-h2FvM_ofXMcEJAEsoT_HqxZc9gWe20J+yA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tw4eFsBCha-h2FvM_ofXMcEJAEsoT_HqxZc9gWe20J+yA@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2023-03-10
X-PR-Tracked-Commit-Id: 519b23310aa100073f0b58c39df120a486ed7f8e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b0d14d2aaf7d4b36b44f5a09955ebdf9eef4b0f8
Message-Id: <167846917693.3321.7060148506270613347.pr-tracker-bot@kernel.org>
Date: Fri, 10 Mar 2023 17:26:16 +0000
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

The pull request you sent on Fri, 10 Mar 2023 14:44:33 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-03-10

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b0d14d2aaf7d4b36b44f5a09955ebdf9eef4b0f8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
