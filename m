Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB7F4CDDCA
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 21:22:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8057D11370C;
	Fri,  4 Mar 2022 20:22:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B48B113709
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 20:22:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B258C61D09;
 Fri,  4 Mar 2022 20:22:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 20743C340EE;
 Fri,  4 Mar 2022 20:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646425321;
 bh=k7I20oRAc7QQlFOC75wm4+L8hQNSXc34k5IdGMa59vI=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=GLAltWoTCLlKjQgq2q+m6CWEZx9X8h11AdHj4Q77FaptZpUNKqR9NnmH8+lsUX3ZW
 9aze1BCy95RmZ89vY7tCvkGO9BsBJk+4l3fbcAhooH/TJMEPTQorkAmVEVi84NuIPG
 H7T9UY7Kyv1zujg1b4FKDFeIKHgYANuN59d07NCOCgPWnWVJRH3mYTe+LzAQfKxRVW
 tnM9RAWZ/Q5LL49CbwghK4qtDyb3PI2A7MLsFNuDq5cEFzhHdvZqDEM70WONoBiG8b
 2lMP+jIbwBlu1Ey1o/Z81lbVS3YWiV30sSGzB5NRdqVy5SoyqZYwGJUpCq8yUg9nwB
 q0Nv8fYzIdM7w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 07908E7BB18; Fri,  4 Mar 2022 20:22:01 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.17-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txdUAqhJOhz+09qtFLJNOThDMNQxLu6kV-v6o1bopXhNA@mail.gmail.com>
References: <CAPM=9txdUAqhJOhz+09qtFLJNOThDMNQxLu6kV-v6o1bopXhNA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9txdUAqhJOhz+09qtFLJNOThDMNQxLu6kV-v6o1bopXhNA@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2022-03-04
X-PR-Tracked-Commit-Id: 8fdb19679722a02fe21642d39710c701d2ed567a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c4fc118ae26f9d4e5885d151f9b0f96467a136da
Message-Id: <164642532102.24805.6722187428894435121.pr-tracker-bot@kernel.org>
Date: Fri, 04 Mar 2022 20:22:01 +0000
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

The pull request you sent on Fri, 4 Mar 2022 13:34:36 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-03-04

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c4fc118ae26f9d4e5885d151f9b0f96467a136da

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
