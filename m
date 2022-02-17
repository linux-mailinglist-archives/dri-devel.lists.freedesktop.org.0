Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A3D4BABC2
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 22:34:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BD0B10E353;
	Thu, 17 Feb 2022 21:34:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A59410E353
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 21:34:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0302360ADF;
 Thu, 17 Feb 2022 21:34:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 66AA0C340E8;
 Thu, 17 Feb 2022 21:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645133688;
 bh=qbafOEf/uBHmpli3QQAfd8aj1cX2r3aA252P+JKq++Q=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=EmQu1pH8GOKz+XJk5++vIXOPg6J2QabIfw1e1IaLn00uGkp0rW0tjuqYbXmCtujA7
 Roku1ZWYkkvwAcPF+k+06MQ+2QYcWfsCPXulcqAzzxWRBPXn+sVupVALG0ovNTb34t
 FKx7g7m6vq64ExnUm/Aqr5QnBWWnCDzDgf8QYY+QFEC3K2k5f/4cCUjsTEz3xh81j0
 aOV9pfFLaZrmmtPd8B/kbulsqbe2iumOqmsYonPoow4kq24ziiP4EkwP2QKmOh+RSq
 feVvQ9TQyKbe+v6roZZFvmghsp7E36FnTCVGDxpcM5gKcuT/gj4IqMTcziTPtDv8o4
 1chMWOhWVxacA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 55967E6D446; Thu, 17 Feb 2022 21:34:48 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.17-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txai3TyGC3KHjkjLi6UMC-vKRoPJ8p+UpNKXy6Km=1jNQ@mail.gmail.com>
References: <CAPM=9txai3TyGC3KHjkjLi6UMC-vKRoPJ8p+UpNKXy6Km=1jNQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9txai3TyGC3KHjkjLi6UMC-vKRoPJ8p+UpNKXy6Km=1jNQ@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2022-02-18
X-PR-Tracked-Commit-Id: 5666b610194705587807a1078753eadc007b9d79
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b3d971ec25346d6890e9e8f05b63f758cfcef8c5
Message-Id: <164513368834.29727.9550946484573068640.pr-tracker-bot@kernel.org>
Date: Thu, 17 Feb 2022 21:34:48 +0000
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

The pull request you sent on Fri, 18 Feb 2022 06:02:24 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-02-18

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b3d971ec25346d6890e9e8f05b63f758cfcef8c5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
