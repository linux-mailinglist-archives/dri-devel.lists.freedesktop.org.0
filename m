Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C295F7BE7
	for <lists+dri-devel@lfdr.de>; Fri,  7 Oct 2022 19:00:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4980B10E033;
	Fri,  7 Oct 2022 17:00:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92EC510E033
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Oct 2022 17:00:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9273861DD0;
 Fri,  7 Oct 2022 17:00:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 039FFC43140;
 Fri,  7 Oct 2022 17:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665162008;
 bh=gPZECmgJMz08JvLHN9ONpfqaWyb/kC3PV9CF/nISA98=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=rUcQqg+nVAjo6ChozzbU8AYT7n6e5nr2eaXvz9BD6ap6swYiYnNFsrHKxGhHEo7Ak
 b95syK8oiTfGT/mYQlPqen8+TM2VGi50+ApjbxDxgs03TOjSzNHnswb+9BSCMMlDVg
 y8WujbolILlR9Aw80HfvVBsHx/EdCqWc/syn/j2hThN9b1AawkXc88MSAWk+kmNlhr
 5nDe/5SrdFHF6dzuBabaVfoVpN04lgdOqss3tF0DjioNULoAcEvfaO3oKL9M0M4N9v
 9BONSxE6Kr8lWdfZbwsWQ+KXYyvhT77YTeO6k+mmbi2EmrM8maOlO5vG14JiBVwgCt
 PLggRNrIc4Clw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 E5FDFE2A05D; Fri,  7 Oct 2022 17:00:07 +0000 (UTC)
Subject: Re: [git pull] drm regression fix
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzQnonp1KDSZ7ziUNdm8EfJX=VhmE9gA4L8wDO_AoYLuw@mail.gmail.com>
References: <CAPM=9tzQnonp1KDSZ7ziUNdm8EfJX=VhmE9gA4L8wDO_AoYLuw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tzQnonp1KDSZ7ziUNdm8EfJX=VhmE9gA4L8wDO_AoYLuw@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-next-2022-10-07-1
X-PR-Tracked-Commit-Id: bafaf67c42f4b547bf4fb329ac6dcb28b05de15e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9d84bb40bcb30a7fa16f33baa967aeb9953dda78
Message-Id: <166516200793.22254.6627873676763824408.pr-tracker-bot@kernel.org>
Date: Fri, 07 Oct 2022 17:00:07 +0000
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
 Linus Torvalds <torvalds@linux-foundation.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pull request you sent on Fri, 7 Oct 2022 13:03:25 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-next-2022-10-07-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9d84bb40bcb30a7fa16f33baa967aeb9953dda78

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
