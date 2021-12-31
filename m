Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D50482193
	for <lists+dri-devel@lfdr.de>; Fri, 31 Dec 2021 03:32:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9938810E179;
	Fri, 31 Dec 2021 02:32:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2F1E10E179
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Dec 2021 02:32:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A24F261782;
 Fri, 31 Dec 2021 02:32:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 750A0C36AED;
 Fri, 31 Dec 2021 02:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640917937;
 bh=W3/zFG0+BwVpcdmtt5kBBkH7TTioI2eHdohrq8pnTLQ=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=C4dRtstCDxtn1ntX5fw8mB6zwCcwqUlDEvVVRx7Y237SmkLX6pa+/64MTjAH8AqCI
 OjUF2Q6ZoodqRqSLSYVQjJnkjrKJWChWG6WmaJui4T7XOnc2Lu6pk4II9T3iCWJk/2
 OcdZ9mi1Z4w4oeCZxgVTq80swSjXq+cxLifiP5JvjH1j3D6fniZJaDR1yR8fa13qsC
 Ftiy44HO/rxrVNtweBX6A9u/Pz8XXM+D+G/oOLeca1oewOIXmuHkvVIEXMvgnP5Jue
 /67CQlL3TkLDeZL1LJRLbti9bTbXCFCDArlJn1037o9dgYR7ao9z3fq537y2kaNHzf
 PU7Zr1xP1dxqg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 5FD45C395E3; Fri, 31 Dec 2021 02:32:17 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.16-rc8
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyK28tROtoYmE-Li2P5JL92GHcXFcXmWFi+z1m1AU6yqw@mail.gmail.com>
References: <CAPM=9tyK28tROtoYmE-Li2P5JL92GHcXFcXmWFi+z1m1AU6yqw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tyK28tROtoYmE-Li2P5JL92GHcXFcXmWFi+z1m1AU6yqw@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2021-12-31
X-PR-Tracked-Commit-Id: ce9b333c73a5a8707f2f446a837a6ca743ddcffd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4f3d93c6eaff6b84e43b63e0d7a119c5920e1020
Message-Id: <164091793738.21027.8664024446891515270.pr-tracker-bot@kernel.org>
Date: Fri, 31 Dec 2021 02:32:17 +0000
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pull request you sent on Fri, 31 Dec 2021 12:20:04 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-12-31

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4f3d93c6eaff6b84e43b63e0d7a119c5920e1020

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
