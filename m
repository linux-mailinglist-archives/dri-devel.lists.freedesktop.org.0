Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB0C7C7D33
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 07:51:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0389D10E59F;
	Fri, 13 Oct 2023 05:50:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22B1010E59F
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 05:50:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 60CA4B82781;
 Fri, 13 Oct 2023 05:50:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BA28BC433C7;
 Fri, 13 Oct 2023 05:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697176254;
 bh=OISlfEAwEbvJoELnfX5DkuXhX7txLnKPZdwnb/+v7+M=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=r8bgPv+npN8k9huYXof5H5aEzWJ+/RWkd5KGbrZVv62EKzPeYfuK6Oyn2xwoTI+OK
 kPPJmKc+dpWS0tk+K1PkXmQ+vfv/OzluqUrgFOH7e6bcEtNDWropDU+nqFU+lIBWCQ
 h7RCa9H0GJi2xzWsHcsfDCaw3xsfsRz2JcLbXpIPuXTY2G+2KFHUpIF5CMbvZy/6Ky
 m2STJFOxkc9XkoRBELBXA8jCkO++DkNGaFawK1nZ3DOVByds3Rrjy7NQ3jF5Rz0kJ8
 ZXrGjygoGfU/qavsBOxKwxwgryipo86duLEdYMXYRByaJcADtC+Tiwn+8qpvBRNAcP
 cyDk5YqFKcM2g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 A806EC595C3; Fri, 13 Oct 2023 05:50:54 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.6-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyejWiiT5gzqGxCTkp5P6Xk1c9=Gbart2LS1K_YgCis+w@mail.gmail.com>
References: <CAPM=9tyejWiiT5gzqGxCTkp5P6Xk1c9=Gbart2LS1K_YgCis+w@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tyejWiiT5gzqGxCTkp5P6Xk1c9=Gbart2LS1K_YgCis+w@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2023-10-13
X-PR-Tracked-Commit-Id: 30873697b83743eda54d66ea9a3ea83554f8a535
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 10a6e5feccb877c3c75ad11d27942ad52c24815f
Message-Id: <169717625467.1627.8568251109952249019.pr-tracker-bot@kernel.org>
Date: Fri, 13 Oct 2023 05:50:54 +0000
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

The pull request you sent on Fri, 13 Oct 2023 14:24:48 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-10-13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/10a6e5feccb877c3c75ad11d27942ad52c24815f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
