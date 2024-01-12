Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6FA82C5F8
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 20:40:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B3B510EB7D;
	Fri, 12 Jan 2024 19:40:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D31910EB7D
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 19:40:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id A9433B81ED5;
 Fri, 12 Jan 2024 19:40:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0897AC433F1;
 Fri, 12 Jan 2024 19:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705088418;
 bh=n2qpSfzBdeIj4whO8TofAHanTFZG3WGJUxhBb7hd9eI=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=bI90ViK9XO50sRYA7pMqEYsCW9fJ56BuRp4KFtj/Ton0Tc3AEsHtAdiwPlDUR7g0N
 IexpAjdHpoIlOXpxGiSERiHAVfj+gVnhMDIx6FbFr0fZuaycZ9T/pDttNwZFKBF1E5
 d76EWobV1z9kMuRjW7GsgQHd/mvunKr0LpM5pqMOkl9qRXZymOl1FppSIcPO4MfstL
 lYlYfTr4JpMBwxIvp/OqAfEZBnS1xJVYZ+4FSe9KHo/2u/GchQCr8RdMoWWnAeD+Iq
 yOjd1lhJqLWJtqJFYdi4BnUlipcr6ZKnbkBpGSzdFWmRwOIID8bBtouCnOLqaRqKVF
 al6H5bnpZmeHw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 E0A8DD8C984; Fri, 12 Jan 2024 19:40:17 +0000 (UTC)
Subject: Re: [git pull] drm for 6.8
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twKBmO2Svky-zeP+KS8qWHFj9zrgeBqW9y__tUwcAYZhw@mail.gmail.com>
References: <CAPM=9twKBmO2Svky-zeP+KS8qWHFj9zrgeBqW9y__tUwcAYZhw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9twKBmO2Svky-zeP+KS8qWHFj9zrgeBqW9y__tUwcAYZhw@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-next-2024-01-10
X-PR-Tracked-Commit-Id: b76c01f1d950425924ee1c1377760de3c024ef78
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cf65598d5909acf5e7b7dc9e21786e386356bc81
Message-Id: <170508841787.32272.8044456543001426203.pr-tracker-bot@kernel.org>
Date: Fri, 12 Jan 2024 19:40:17 +0000
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

The pull request you sent on Thu, 11 Jan 2024 05:49:21 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-next-2024-01-10

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cf65598d5909acf5e7b7dc9e21786e386356bc81

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
