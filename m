Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9491853D1C3
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 20:50:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9D291121EC;
	Fri,  3 Jun 2022 18:50:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A00E1121F7
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jun 2022 18:50:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 86A84B8214F;
 Fri,  3 Jun 2022 18:50:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3BC55C36AEA;
 Fri,  3 Jun 2022 18:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654282222;
 bh=Zt10z4FjMPTL/QPpCCL9bSLoVjTmhSjo1x+k4Dn70m4=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=k4mx9hguXeaYwA4iq2mZBMCOQ9iBUUFgM6hElUU2QEm+qbGpoLd3GtnEzR3G+zvcL
 1MMiqBkmiwmKoZpPSdeYSDDVxSrmr/O4Py06n4FxFbk/1Rz+rjEeV3cgC1j+JnC/E8
 /OcQ/DljYQjwao81wWTBgmkPe0IJA/txGC1SccjfiF4E/EPq4YCWfseXtsaKaWWZqj
 3mHvCnM0riZPa2HfucObuqkwObBcCI3EDWs5aex+/xhjJfBUW/1pjPlLqAke1n9Gc/
 e/N/F3L1IWJRWt16ndfnRrmavPzGK62rbrVL0N5eShxkEeOAedhAwAfSS/UTsYkNRm
 zmJS4n57k54ag==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 2868FF03953; Fri,  3 Jun 2022 18:50:22 +0000 (UTC)
Subject: Re: [git pull] drm for 5.19-rc1 part2/fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyz_Waptpxd82f8fLLeqt9pp8dOUCxjxA0YtaOs31r+Fw@mail.gmail.com>
References: <CAPM=9tyz_Waptpxd82f8fLLeqt9pp8dOUCxjxA0YtaOs31r+Fw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tyz_Waptpxd82f8fLLeqt9pp8dOUCxjxA0YtaOs31r+Fw@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-next-2022-06-03-1
X-PR-Tracked-Commit-Id: 404204340c0dc54e4b779737201044dcb231f0bf
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ab18b7b36a82b1900687c5718f7d46f0d8e77d86
Message-Id: <165428222216.10974.7011867113246739776.pr-tracker-bot@kernel.org>
Date: Fri, 03 Jun 2022 18:50:22 +0000
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

The pull request you sent on Fri, 3 Jun 2022 13:49:48 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-next-2022-06-03-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ab18b7b36a82b1900687c5718f7d46f0d8e77d86

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
