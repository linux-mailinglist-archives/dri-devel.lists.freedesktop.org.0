Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D805E7FB0
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 18:26:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 251AC10E5A1;
	Fri, 23 Sep 2022 16:26:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51FEB10E5A5
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 16:26:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7402FB8243C;
 Fri, 23 Sep 2022 16:25:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 25AD3C433D7;
 Fri, 23 Sep 2022 16:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663950358;
 bh=PYQ0r3updAVAisQqG8/x5P4WqIu5SH6tZv+x7Rv3mhA=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=or8d4OqXvAijgVVcAKWrRORZ/wxb/qU5JMeKVUWgOJuql3Qxg8VVYEG5lXCtK4Jix
 vYyn13jp4j4L8h+oEiHVfv3EfHiuqLun8DO+yWLf6GTDpFqPTd+q3vjs1NMb6EL8fr
 n9T9K3I4eocant0qSZqIvZbi5AU5yoDwq+K0Fe2fV7DyqkcbIM0ffv3YEKKL1HUrt6
 bTvp+2C0kA5Xvf2jGoerm7/sm7cngX3o9kW0lrK3qV85L7JKRN+YVA6hq17xcD+Pr1
 KbiAAvWU7k0KkgdnV5SUz5IirRvuYluT9ouTqtbTOkMarNNaKavlDLQMEyuhCOPAYk
 zXzG5k+LyZPLg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 13643E4D03B; Fri, 23 Sep 2022 16:25:58 +0000 (UTC)
Subject: Re: [git pull] drm fixes for v6.0-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twg497wBCc4cMSevtSL9B1BEE_M6MO-t-B3uiZMb9NUvg@mail.gmail.com>
References: <CAPM=9twg497wBCc4cMSevtSL9B1BEE_M6MO-t-B3uiZMb9NUvg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9twg497wBCc4cMSevtSL9B1BEE_M6MO-t-B3uiZMb9NUvg@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2022-09-23-1
X-PR-Tracked-Commit-Id: 8288206c27856f6f56d35aacf3a48ee923e1d3e2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 22565ae784134282e03912023456151a61db479c
Message-Id: <166395035807.8411.10782887649451640740.pr-tracker-bot@kernel.org>
Date: Fri, 23 Sep 2022 16:25:58 +0000
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

The pull request you sent on Fri, 23 Sep 2022 16:08:19 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-09-23-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/22565ae784134282e03912023456151a61db479c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
