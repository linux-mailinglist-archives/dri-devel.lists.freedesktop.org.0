Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A31E5BAF25
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 16:22:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D45510ED57;
	Fri, 16 Sep 2022 14:21:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A2110ED58
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 14:21:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5698262C30;
 Fri, 16 Sep 2022 14:21:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BB32DC433C1;
 Fri, 16 Sep 2022 14:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663338098;
 bh=OkZsYIFm8r+CVjhNh4iD+n+C1mV11Nw2PVDKGEgN1A0=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=FDdn32YCwybr7G099m7GqVYhv2TvMIekYNh37w+D66N0U8quO49IZ/KAONSJ6e2WD
 yjhBD4LgxfC+IV1XqPKacz8l63mMh7bIKnJGQQbDoEyEUMcODVqVx0vGi+h40ql719
 qlPcPlqpT2lQBCTU1mHgMwfoNpARLm8ejVUQQTn+oecGj74dg5+x3Lidv3hhcUev42
 nF0VZjGvotCq45949/z/FObjLZ1G3DmRtlDq+kwYOlPymKIBFPl+TCMdxX/3OPLNYO
 K8GZa6MDrE5Knuq+tIyw7O9uuZG0YTushy7dUcZJ9AtcdDHOUkUTFm6uTvjhGNidqw
 bqzjOsZxOBefQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 A6D96C59A58; Fri, 16 Sep 2022 14:21:38 +0000 (UTC)
Subject: Re: [git pull] drm fixes for v6.0-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzoEUdzdhUsjh8jsuSta3Nv7zkH1-H7g4Oyi4_07zkO2w@mail.gmail.com>
References: <CAPM=9tzoEUdzdhUsjh8jsuSta3Nv7zkH1-H7g4Oyi4_07zkO2w@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tzoEUdzdhUsjh8jsuSta3Nv7zkH1-H7g4Oyi4_07zkO2w@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2022-09-16
X-PR-Tracked-Commit-Id: 25100377a21ad40dae8be5a3ed361b87acec1479
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5763d7f29652f94bdfc9dab87888f79ba6bb6c34
Message-Id: <166333809867.10979.14401799560428594488.pr-tracker-bot@kernel.org>
Date: Fri, 16 Sep 2022 14:21:38 +0000
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

The pull request you sent on Fri, 16 Sep 2022 18:28:58 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-09-16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5763d7f29652f94bdfc9dab87888f79ba6bb6c34

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
