Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 433EC6EEB07
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 01:40:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 035AF10E2DD;
	Tue, 25 Apr 2023 23:40:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DB4F10E2DD
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 23:40:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 20FBD6322A;
 Tue, 25 Apr 2023 23:40:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 85623C4339C;
 Tue, 25 Apr 2023 23:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682466004;
 bh=qPJx8ZN4x8kU/qF0Od1/2a/2gkZq1+OIYG7LIP6jFy4=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=cf/OCsgqtu8fPpzmxWGxgLDeXiviRat1X6dIWklxkuw+EdgHmn/lqJyz/R+rvRqAY
 Znm3HcxinkYSPP+4LKu3rNKxHv0sVv1ep+64MTSlOPmgtSr4A8vnxJ5M4yCuf2h9UE
 xUWvstHNiV0kO5BjeZEG5QCasyBB9F93IlP9+dLY6OHQkVvPZ3czcld+TEi/seFnml
 TNiB8O0h8wx8n0N6t7ZjzxUn4XEoS8hJqVukkexlQEVorBTHt5a3iC8qzPiZI3alk0
 JzmXgUpEPh0doblVEgWWOREeJ5LkVnzigDWQNroHlMbvSqoagFdgKYB1x/LTEZSfPa
 BndL/WF4rYW8Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 6C5DEE5FFC9; Tue, 25 Apr 2023 23:40:04 +0000 (UTC)
Subject: Re: [git pull] drm for 6.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txgxnFundgAa9LrveUVUU9_8A1RK8-hy+3pg7tDMJmSPQ@mail.gmail.com>
References: <CAPM=9txgxnFundgAa9LrveUVUU9_8A1RK8-hy+3pg7tDMJmSPQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9txgxnFundgAa9LrveUVUU9_8A1RK8-hy+3pg7tDMJmSPQ@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-next-2023-04-24
X-PR-Tracked-Commit-Id: 289af45508ca890585f329376d16e08f41f75bd5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c8cc58e289ed3b5bc50258f52776cf3dfa3bad66
Message-Id: <168246600441.4872.8908465628713097973.pr-tracker-bot@kernel.org>
Date: Tue, 25 Apr 2023 23:40:04 +0000
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

The pull request you sent on Mon, 24 Apr 2023 15:41:41 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-next-2023-04-24

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c8cc58e289ed3b5bc50258f52776cf3dfa3bad66

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
