Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E682E4E7AE8
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 23:00:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F07B10E088;
	Fri, 25 Mar 2022 22:00:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 990D610E088
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 22:00:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EA2C960DE3;
 Fri, 25 Mar 2022 22:00:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5B450C2BBE4;
 Fri, 25 Mar 2022 22:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648245641;
 bh=4lwv51i7kdnJVIUkgE5H5qVu88oykl0a4+bTXHd5MQE=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=ZlSTxaALhW3K1mDIw6J4mpzyH/Z9q+4U0qiBJ2ISvQddet9/4/VJg5/ZN1pd+fmEB
 aSd+gPUsEi9nmArnydmprgck9CdjrrJN+yz90W8L3777DzqSsLg7kT5xIsaUm+rssN
 6czbJHOj/DPqwi0aHXw2zPDApOWkIZkuhHq0IgytdFFuO8YPI7YvSWOfVWk2YqhumU
 dyLGhkupAj53mTenEuvDlWvE6qBG5ppvXapKNWCAbo3wiL2VHG61nz4mzyhcYYtgXt
 +UX9WVfRjJgK5DbuZtxgpMLh0PQf1FkMQlSo+F0S9XsoPP8+EfDzUAULaXzzdU9924
 SCc4fLl004rhA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 48877E6BBCA; Fri, 25 Mar 2022 22:00:41 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.18-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9ty8CYpuQ05BjgB9_CBRUjiL5PMTF-irHRXKOWtOrgxxZA@mail.gmail.com>
References: <CAPM=9ty8CYpuQ05BjgB9_CBRUjiL5PMTF-irHRXKOWtOrgxxZA@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9ty8CYpuQ05BjgB9_CBRUjiL5PMTF-irHRXKOWtOrgxxZA@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-next-2022-03-25
X-PR-Tracked-Commit-Id: 2a81dba4b577099717cea86d429f053e85e74d96
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cb7cbaae7fd9cee64f19cdfd89d097d807b884f5
Message-Id: <164824564128.5018.4392403227348156976.pr-tracker-bot@kernel.org>
Date: Fri, 25 Mar 2022 22:00:41 +0000
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pull request you sent on Fri, 25 Mar 2022 12:13:20 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-next-2022-03-25

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cb7cbaae7fd9cee64f19cdfd89d097d807b884f5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
