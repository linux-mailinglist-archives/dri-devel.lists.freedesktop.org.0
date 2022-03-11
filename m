Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC734D5A98
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 06:25:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91AC810E122;
	Fri, 11 Mar 2022 05:25:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91E1910E122
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 05:25:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C83BF619BC;
 Fri, 11 Mar 2022 05:25:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9B7A1C340EC;
 Fri, 11 Mar 2022 05:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646976332;
 bh=0OyS/c+CHHnjlxtkeX0bmgy1NsydLIwEYrKLjI6ygAg=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=VLYcdzlKpewDFvba/cnJmBltYv3k4gpA2kU0HYIEYwxg7JyDpmMBoqvXVflB2muv9
 4iDr/XNycH5rkHjp5ew60youXhyaCpZPGUqg2UyJ4KpT5A4PeOeVnb5ssc8/eLtWGw
 z1sf8vnZU0iM3UPBb0UPRtzmQI3JzHSXpnWtTVdFEXZ+wDJAjnl4pN1R8AI8jSiUxh
 OYH1+aYix2hfooItbgYb3jG+7OMdhMXlcswtxwCVXFNJ+ZRZ2hnJPmFUuOMU4F8xLS
 VeQ4TtwizUa+9BQChpsPxzXn6SlWGDJ1/wEYgSTQjJ2TQYSm+AxnLrXyxekSL5a4Ib
 Qb8vKveVIcmaQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 88A23E6D3DD; Fri, 11 Mar 2022 05:25:32 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.17-rc8/final
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txhThmkeKMjTVXGL+RYQDxBZv2c4syb_3V7WF=8sZhaHQ@mail.gmail.com>
References: <CAPM=9txhThmkeKMjTVXGL+RYQDxBZv2c4syb_3V7WF=8sZhaHQ@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9txhThmkeKMjTVXGL+RYQDxBZv2c4syb_3V7WF=8sZhaHQ@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2022-03-11
X-PR-Tracked-Commit-Id: 30eb13a26014ca640b5eb57b6d010114084d5c92
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 79b00034e9dcd2b065c1665c8b42f62b6b80a9be
Message-Id: <164697633255.9165.8919622792541567761.pr-tracker-bot@kernel.org>
Date: Fri, 11 Mar 2022 05:25:32 +0000
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

The pull request you sent on Fri, 11 Mar 2022 15:15:09 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-03-11

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/79b00034e9dcd2b065c1665c8b42f62b6b80a9be

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
