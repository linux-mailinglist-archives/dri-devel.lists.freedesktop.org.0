Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3BB5F59F8
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 20:40:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 795E010E743;
	Wed,  5 Oct 2022 18:40:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7AEE10E743
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Oct 2022 18:40:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F11036178A;
 Wed,  5 Oct 2022 18:40:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 656BCC433C1;
 Wed,  5 Oct 2022 18:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664995220;
 bh=HgpKWF8vasqcuJiwBTGamknDt+lexB7aNSeSMWW4YSE=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=jm0g1McyuUhu0WpcP0LMLMQ49vYVN8ePm/yrwKHIgYLc2mcMMX7ugAsSqdRTeMM0W
 eRZQHIZdCJBwHkl6KJU7EvxomaBosVJgAkV135i/aT7R4rzKbY3naIv5yoP+29JYR4
 r3E5bYXKuLs2c6wagjjAscvKc4U5F4RnDtog/qchxildrfwSweslfaNLZDDduMulO1
 e8DDhIvzT6wkG1+IQ7wT/LeHsAqUsk5ugerWjtT2ofn+HxNse6vBXMXzYTvp/kq/R6
 AEOA4y+OVsn9eacy8dfhzQCqyfgBwj7q5+SvYMXKfEdeB5mv14OROr5qRhhKG5kNES
 b/vHeLQk/spmA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 53F03E21EC2; Wed,  5 Oct 2022 18:40:20 +0000 (UTC)
Subject: Re: [git pull] drm for 6.1-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzs4n8dDQ_XVVPS_5jrBgsNkhDQvf-B_XmUg+EG_M2i4Q@mail.gmail.com>
References: <CAPM=9tzs4n8dDQ_XVVPS_5jrBgsNkhDQvf-B_XmUg+EG_M2i4Q@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tzs4n8dDQ_XVVPS_5jrBgsNkhDQvf-B_XmUg+EG_M2i4Q@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-next-2022-10-05
X-PR-Tracked-Commit-Id: 65898687cf7392c372ea8d04a88617e2cb794465
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7e6739b9336e61fe23ca4e2c8d1fda8f19f979bf
Message-Id: <166499522033.1673.14368473301311468393.pr-tracker-bot@kernel.org>
Date: Wed, 05 Oct 2022 18:40:20 +0000
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

The pull request you sent on Wed, 5 Oct 2022 13:41:47 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-next-2022-10-05

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7e6739b9336e61fe23ca4e2c8d1fda8f19f979bf

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
