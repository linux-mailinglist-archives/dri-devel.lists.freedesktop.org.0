Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4C85627AE
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 02:24:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C22A10E049;
	Fri,  1 Jul 2022 00:24:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32BF610E049
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 00:24:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3FF8861F60;
 Fri,  1 Jul 2022 00:24:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A01DEC34115;
 Fri,  1 Jul 2022 00:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656635078;
 bh=o1vMaH73izzkhhJF9DTB1crEovwGoPeGwIoVDHdeCx8=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=fLm5eJ62pAUwhRjYft/NmqGTT954phT3+GPi8n3QjlCRNzf+BrUqsaAEoby9tTR5R
 zKumFS0af8FhwIhFk7hLRcOZyZ1C/A6wKVGGES6bon15Y6Ain8HucgqLN9HXcTW9Y+
 uSPYnBv2zqHZCK8H9xug4NG1sHImMpC6x8GO8up0MvpiHAPyB3KOw/63GvfCPLHYkf
 +qjQqAQAgQRq2DH3RN27KS79b1cdWnRqTCOrxCVP9rVybJXgRKoCX85nGCAn5+cWYU
 pVeVWn2zEJeFgWhgfZbya5+9YI6eJWZlxu29p+UDBizoGiZ47RLMDbJAACVpFFIWvi
 TPLGlNxSPtKjg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 8A769E49BBA; Fri,  1 Jul 2022 00:24:38 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.19-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twfRe7w=z0ZQwBw7u6QiDQUWbXi+AZO4wE=MCzNK+RByA@mail.gmail.com>
References: <CAPM=9twfRe7w=z0ZQwBw7u6QiDQUWbXi+AZO4wE=MCzNK+RByA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9twfRe7w=z0ZQwBw7u6QiDQUWbXi+AZO4wE=MCzNK+RByA@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2022-07-01
X-PR-Tracked-Commit-Id: b8f0009bc9edf9186b20ae2a9e442ef0af93040e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a175eca0f3d747599f1fdfac04cc9195b71ec996
Message-Id: <165663507855.16741.3880143189300433242.pr-tracker-bot@kernel.org>
Date: Fri, 01 Jul 2022 00:24:38 +0000
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

The pull request you sent on Fri, 1 Jul 2022 09:50:09 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-07-01

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a175eca0f3d747599f1fdfac04cc9195b71ec996

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
