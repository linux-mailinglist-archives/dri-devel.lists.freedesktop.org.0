Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D249C69A4EF
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 05:38:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A85ED10E088;
	Fri, 17 Feb 2023 04:38:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9A4E10E088
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 04:38:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1508C612CA;
 Fri, 17 Feb 2023 04:38:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7A529C433D2;
 Fri, 17 Feb 2023 04:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676608716;
 bh=lBD+ZV+x7RW/eX53Icvx7ILkWEuCoGjpdQs2LC4GIJE=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=DEvc2+ldxoY1eRm4xROZ/tl8JAOTaeExbBxAhinMVOIoBiSh5mtJGwb/K0LSQMoBr
 OiyjoKf0Y1oViAJ77gASHQqdb6uoGsgE0T00du8EgHIH0Dx3x8ff4OgHR5as11f3K9
 Ebp0eiUZORVwpluSX9DW6lRxq5QTPdtY1xL18F8irU95Bq6r6ixi9J4cb+9IOS95ce
 E2URsqVMbUb4JKnzKErUaTahzl+hhyz/wz/q+xR0oL6avSHMcoBtOOGY9Syr/pH3Ko
 eQXDvkCxi29YAe/8XXUs+l7jCxOK8WiItWgz3lhjhAz8H4Niy1Rne6sSv01cn8riIL
 0x/EzPKnxBlCA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 651A4C1614B; Fri, 17 Feb 2023 04:38:36 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.2 final
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyvvUJiuADGfPznEKCNBmwGzPEKE7Oob_9BduxE6Od4TQ@mail.gmail.com>
References: <CAPM=9tyvvUJiuADGfPznEKCNBmwGzPEKE7Oob_9BduxE6Od4TQ@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tyvvUJiuADGfPznEKCNBmwGzPEKE7Oob_9BduxE6Od4TQ@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2023-02-17
X-PR-Tracked-Commit-Id: f7597e3c58eeb9ce534993f53c982f2e91e6dd4d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ec35307e18ba8174e2a3f701956059f6a36f22fb
Message-Id: <167660871639.4329.3467322456999511365.pr-tracker-bot@kernel.org>
Date: Fri, 17 Feb 2023 04:38:36 +0000
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

The pull request you sent on Fri, 17 Feb 2023 12:16:34 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-02-17

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ec35307e18ba8174e2a3f701956059f6a36f22fb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
