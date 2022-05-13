Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A79652687B
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 19:29:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13A5E10E937;
	Fri, 13 May 2022 17:29:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7453010E937
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 17:29:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E4D9C62113;
 Fri, 13 May 2022 17:29:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 52246C34100;
 Fri, 13 May 2022 17:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652462992;
 bh=B8CGDN7y6M1auE45HI99CT59aTPOWfRlXkGTTSNilxw=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=Xqt6wock41uKVJbawsUyxIG8YmxYwfbVfFxYR4R0cgoptHCFZuol19uPFqI3wAZiI
 IONzsE7fY7K1k8RSguL6x8MjNH99zjE0ONDAkbdagCD70jv43SnoLaut0ABPpjc//E
 J9+ZCTqzB1ub8sATFOuj0QbpaIOGXROiAbOF1OvpLy+Hd0nReVpZsPBynzsoMUnkQ4
 312Hrn9Cded6Q/mTwyJ9Lh2BEMt9VKXWR+Ewrob6C84Gt1KGZlQ+YgYnsUYY+fkBgb
 StUbm5gnkmJZvww0HCx4KANZOZp4pN7xw3qmvtYaFxd5Qpwe/xlNCFFceA/fr3Py3y
 2ZkT67ibMZaeA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 3E0A7F03934; Fri, 13 May 2022 17:29:52 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.18-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twJK9u=8+8UMtTRvxe4yUkSQBcOLa_gzB+Me3W=qoOv4A@mail.gmail.com>
References: <CAPM=9twJK9u=8+8UMtTRvxe4yUkSQBcOLa_gzB+Me3W=qoOv4A@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9twJK9u=8+8UMtTRvxe4yUkSQBcOLa_gzB+Me3W=qoOv4A@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2022-05-13
X-PR-Tracked-Commit-Id: 5005e9814698f47c5a3698fcc56c9f5e6f1d4644
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 10b4b67ab58248636723af181734b9574be05ade
Message-Id: <165246299224.14811.8056452477762273863.pr-tracker-bot@kernel.org>
Date: Fri, 13 May 2022 17:29:52 +0000
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

The pull request you sent on Fri, 13 May 2022 15:07:55 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-05-13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/10b4b67ab58248636723af181734b9574be05ade

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
