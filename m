Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CE44F8D47
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 07:38:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0501D10F624;
	Fri,  8 Apr 2022 05:38:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FDCD10EF56
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 05:38:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D84FDB8298B;
 Fri,  8 Apr 2022 05:38:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8719DC385A3;
 Fri,  8 Apr 2022 05:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649396313;
 bh=4VwFY/1dGrKNVVe0C1muo8ohXdUHOioA8pasVOe2NLU=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=SIag0LzbJITvSskJYSUuM+Hcj9G++x+fWXivJbjLh9jNyueu90fn07GNZ2909RvTx
 GWbD0WoHCKAcsiaLKp13CKrEP9SDqBeCyoKWmSWjEZbrGtiVXi8GVk704GxzjHO0SP
 DCPEP4OvfYVpWJQFZZ1jm2pQ+x8kOMIcllx0NUdIn81jXHBmKjW83yMEFJ798oyAQp
 AxAZ9mDJ0OFy2kfI5KU+xrIO85V32WAQggAKr99qPTWojMBXjucWPsmV+YqWgAYNdN
 9FHgAnjg2z81TeEgyyImfobuEV4boom+y1i0pAOiO5r5dTYUYXa+CEGOeCqVFAp05B
 Zq8DdOd2vsTyw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 745D2E6D402; Fri,  8 Apr 2022 05:38:33 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.18-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tx5F2iOY6S4o2Rjk3uZG_M5Tso+=j3_gyQk-p3vj8tqew@mail.gmail.com>
References: <CAPM=9tx5F2iOY6S4o2Rjk3uZG_M5Tso+=j3_gyQk-p3vj8tqew@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tx5F2iOY6S4o2Rjk3uZG_M5Tso+=j3_gyQk-p3vj8tqew@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2022-04-08
X-PR-Tracked-Commit-Id: 88711fa9a14f6f473f4a7645155ca51386e36c21
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1831fed559732b132aef0ea8261ac77e73f7eadf
Message-Id: <164939631346.5614.12089109522962019963.pr-tracker-bot@kernel.org>
Date: Fri, 08 Apr 2022 05:38:33 +0000
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

The pull request you sent on Fri, 8 Apr 2022 10:19:47 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-04-08

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1831fed559732b132aef0ea8261ac77e73f7eadf

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
