Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1354658967A
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 05:18:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0F9918A65C;
	Thu,  4 Aug 2022 03:18:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C6498ACB6
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 03:17:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7D8C7B823E1;
 Thu,  4 Aug 2022 03:17:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 41F3CC433D7;
 Thu,  4 Aug 2022 03:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659583075;
 bh=teA4AMmtGGE5tPWB7CsjfMwgkD+96W6hd/TD1ykoqyU=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=g+6H0+Xb+lYr1qbx/IP/bEUAotoLEDMt/GZxi4KiNcYiFfp7i8iUZ4QjWR1uwo4wI
 6ycf777I34sI5jwoLoKjpWPIXhzFk4q5kB7Z/upVnS8xQDOqVIP4v22g/CYAOz8N8T
 ZWCG6gxUK1DMWuQEOmZpbDUfhy1vsQrzp4ZWajU6PlBdUIC4NGpOXJ7ilyz9s4mHrT
 D07xtQFvjm9EvLpQB13KwL49gDnRJCeN7TxdubtG5sz7r4j60LAeY+H95fo8rSqNWk
 rOyzlyArQjKAdpvwd7JuQiToiE7DRE2mXDJsLZS9V+0djwLbtrQ7upzp1K3CTT8/MF
 5Lir8xEkzz45A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 31227C43142; Thu,  4 Aug 2022 03:17:55 +0000 (UTC)
Subject: Re: [git pull] drm for 5.20/6.0
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twFEv8AcRQG-WXg5owy_Xhxy3DqnvVCFHgtd4TYCcKWEQ@mail.gmail.com>
References: <CAPM=9twFEv8AcRQG-WXg5owy_Xhxy3DqnvVCFHgtd4TYCcKWEQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9twFEv8AcRQG-WXg5owy_Xhxy3DqnvVCFHgtd4TYCcKWEQ@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-next-2022-08-03
X-PR-Tracked-Commit-Id: 5493ee1919eae4f49d62276cf5986b7f7c7aa8f6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b44f2fd87919b5ae6e1756d4c7ba2cbba22238e1
Message-Id: <165958307519.6841.14174025933378032922.pr-tracker-bot@kernel.org>
Date: Thu, 04 Aug 2022 03:17:55 +0000
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

The pull request you sent on Wed, 3 Aug 2022 15:37:43 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-next-2022-08-03

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b44f2fd87919b5ae6e1756d4c7ba2cbba22238e1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
