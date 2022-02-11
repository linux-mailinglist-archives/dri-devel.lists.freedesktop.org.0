Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B624B2E26
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 21:05:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2252C10EB34;
	Fri, 11 Feb 2022 20:05:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B84E110EB34
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 20:05:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 433A761FD6;
 Fri, 11 Feb 2022 20:05:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AF9AFC340F1;
 Fri, 11 Feb 2022 20:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644609920;
 bh=kBI3mK87tFPw2qjgLo6XozAmUBtauzjU7K6ZBJI46C8=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=Qg1Z+x502LtLsiy1nDN0NC2MeSKhxM3vnVGShtNN6A6Uz6+2INih4oscu2sZX6AlV
 OCYjeGZqT93eRuewbXiZauIXjS4E+o7FZcyPVpEs8ETN/wH8UrR8ckqRB33LhsUadU
 V4oh9OsuNODZ0hdep9dDeuQEgtsz+02LlErht8lh8k1Rk+5ILya2HeB4ODUMFnc2Q2
 a4FBDcrkYSJO3B+/lIacXcEWQ7GQBPNvsNaGWE9UunKVHgPPvut28awriJpCPb8cnS
 40DszxB7VSoKVFAn6kuBVz+ze3IMSa1U/2OfY90gYaErIiv2EJ1/8k68bNq86oHQcT
 twbLfpEoVLh7w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 977A4E6BB38; Fri, 11 Feb 2022 20:05:20 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.17-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twGhyDpEsDEGQoYR2UXOp5xMAScivj8rWheh+q3ufzNjw@mail.gmail.com>
References: <CAPM=9twGhyDpEsDEGQoYR2UXOp5xMAScivj8rWheh+q3ufzNjw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9twGhyDpEsDEGQoYR2UXOp5xMAScivj8rWheh+q3ufzNjw@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2022-02-11
X-PR-Tracked-Commit-Id: 95e875bdb1862db178bf24fb703387ec3aa3a34a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c3ee3a9e4fa6b1d249b5abff2d4c7dab5a47d522
Message-Id: <164460992061.1412.8658412567709434075.pr-tracker-bot@kernel.org>
Date: Fri, 11 Feb 2022 20:05:20 +0000
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

The pull request you sent on Fri, 11 Feb 2022 13:46:47 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-02-11

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c3ee3a9e4fa6b1d249b5abff2d4c7dab5a47d522

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
