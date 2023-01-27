Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BED667F062
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 22:27:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF82410E1BA;
	Fri, 27 Jan 2023 21:27:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 830DC10E1BA
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 21:27:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 028B2B821E7;
 Fri, 27 Jan 2023 21:27:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A47C1C433EF;
 Fri, 27 Jan 2023 21:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674854853;
 bh=0XGYMJnULZ4O9WgCJj1Dd0Kf1MOKMqUWf1OrafF40HE=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=ktoQsgzsJ9ztczCMSkHFtWUtlooAcCAXkQuhk6cby8A/fvGhUGbW/PdUMHcX4fbiy
 wwTnF12QAgOTHOxdJgunMgaBfVaU3STnpcE82JMIcW9gSUx3wTsMvGrYwyaehFkxFS
 T0N0BRlgBuZRwxupDdotGTCfFa3ynJga7fCkeL6k8j3nnMoo+RN/De5Li8gj0VswZV
 25NxoJ+FKfUER1rBAiDJQAJQOhB+dwQMvHXrl51txu4EzQEsuLUoXWsdzVsMzOGoaE
 g5Vl0TGAMkXX/rI8Fo1uW2oqzpPu/6YicXRLAyblPH84n/E6KFtSu0WWZ0SaU3BZHv
 IYlj3Bda8KZxA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 90E4CC39564; Fri, 27 Jan 2023 21:27:33 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.2-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzuu4xnx6T5v7sKsK+A5HEaPOc1ieMyzNSYQZGztJ=6Qw@mail.gmail.com>
References: <CAPM=9tzuu4xnx6T5v7sKsK+A5HEaPOc1ieMyzNSYQZGztJ=6Qw@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tzuu4xnx6T5v7sKsK+A5HEaPOc1ieMyzNSYQZGztJ=6Qw@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2023-01-27
X-PR-Tracked-Commit-Id: d23db89883962d9b4cb3ad03dfd02e525ed2cc03
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 76e26e3c6a49b368a6fd38e2da2b1b164470cc52
Message-Id: <167485485358.19779.8573236755688332118.pr-tracker-bot@kernel.org>
Date: Fri, 27 Jan 2023 21:27:33 +0000
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

The pull request you sent on Fri, 27 Jan 2023 15:22:36 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-01-27

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/76e26e3c6a49b368a6fd38e2da2b1b164470cc52

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
