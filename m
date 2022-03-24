Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2574E6B41
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 00:38:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05C4810E5DF;
	Thu, 24 Mar 2022 23:38:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6630F10E5DF
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 23:38:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DB0D860B49;
 Thu, 24 Mar 2022 23:38:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 46039C340EC;
 Thu, 24 Mar 2022 23:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648165120;
 bh=mScaLpR8zwsSQHZCdjC3pAla7NlmmDY7f2p4l1ohMS8=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=WyHpfOb6GlEJDpwNGdNAPayYsSdLNPH8GaO16q0Cwpgpw5qKhfeIMHtcPDP+OrXS6
 ysb0IPbwRyIBrrZmZVhnSxwBRtwXE5JS8rman9hz8v4jLayxWeZPYrqDUZtaOfWE67
 1tQSCGpa75OhqNRVSwAZx0kfM+03Qa/q2bsws8To85eZwLTfP6fzn0HbuMkikYr1t1
 BqWHc22+31RVBwIY8DAAH5wUHkV2ALzdNaGFzek6sGLZDOHIrLa5ytKEKEpUR2SfuS
 7V3cdRJRiqpqCwM+5U9vxWByoiG41T1ApH1AlMKc1IE/iHjImtndZVTHbrXgWB03VG
 67AQXDnn0zTgg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 32F45E7BB0B; Thu, 24 Mar 2022 23:38:40 +0000 (UTC)
Subject: Re: [git pull] drm for 5.18-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tytg5jd_i3z3C5Y1dii2-cgO11Gjgvaq8qoWn3CGfCreg@mail.gmail.com>
References: <CAPM=9tytg5jd_i3z3C5Y1dii2-cgO11Gjgvaq8qoWn3CGfCreg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tytg5jd_i3z3C5Y1dii2-cgO11Gjgvaq8qoWn3CGfCreg@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-next-2022-03-24
X-PR-Tracked-Commit-Id: c6e90a1c660874736bd09c1fec6312b4b4c2ff7b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b14ffae378aa1db993e62b01392e70d1e585fb23
Message-Id: <164816512020.13472.6357726227995995877.pr-tracker-bot@kernel.org>
Date: Thu, 24 Mar 2022 23:38:40 +0000
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

The pull request you sent on Thu, 24 Mar 2022 12:30:02 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-next-2022-03-24

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b14ffae378aa1db993e62b01392e70d1e585fb23

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
