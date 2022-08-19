Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6362059A2AA
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 18:50:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DB2210F493;
	Fri, 19 Aug 2022 16:50:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8188510F493
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 16:50:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 905CD6185D;
 Fri, 19 Aug 2022 16:50:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F09E7C433D7;
 Fri, 19 Aug 2022 16:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660927804;
 bh=cSdsWeqdGn8SEt2YjuZktKCzw5+88mf/N/Xl3/Z0VZk=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=XVHussIvfr70KNvuJZpFfEWjKagUGfrl+c4t4PD06Stknj3D9Sf/8mtyny94EW7P0
 T2yU2D0uSgEImm6POUQHrg710ozlkCSOhusU/4fK7hcJq9BhCW4cGYi7lepi1r7wIt
 Byg9+5/GzHXQ33vOfhALILMj7q0vAaDIyHpvdr9f4ehgBgQ1xeOBSNF/QWVTTxgVgt
 Vg6xmU0cWvqAz+R6Fq+xQlwT1MnIOkQhZp3N+7IDKN+SmNt6KBlI3RYp/U+jAnQdPc
 IkX5vGpgnMa3igsZhOEyWXPpa7Ff7pHbqwSwM/nE/w2yP++Z7yc9ee9WIKfki7UPHx
 Zvst11jXjseSw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 CADABE2A050; Fri, 19 Aug 2022 16:50:03 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.0-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tx=MmC2wezaYG7m0A71jdL=niFrFhcXxaS8Z5=6Rf88Qg@mail.gmail.com>
References: <CAPM=9tx=MmC2wezaYG7m0A71jdL=niFrFhcXxaS8Z5=6Rf88Qg@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tx=MmC2wezaYG7m0A71jdL=niFrFhcXxaS8Z5=6Rf88Qg@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2022-08-19
X-PR-Tracked-Commit-Id: b1fb6b87ed55ced458b322ea10cf0d0ab151e01b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: adb67b373a68b6ca4ea9225e248d726f0f5f0f8d
Message-Id: <166092780381.6323.6381660537952761302.pr-tracker-bot@kernel.org>
Date: Fri, 19 Aug 2022 16:50:03 +0000
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

The pull request you sent on Fri, 19 Aug 2022 14:05:45 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-08-19

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/adb67b373a68b6ca4ea9225e248d726f0f5f0f8d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
