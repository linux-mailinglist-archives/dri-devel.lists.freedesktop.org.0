Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05087495AF1
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 08:38:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC7C110E91C;
	Fri, 21 Jan 2022 07:38:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D082510E916
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 07:38:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4AA32617BE;
 Fri, 21 Jan 2022 07:38:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B5D71C340E1;
 Fri, 21 Jan 2022 07:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642750685;
 bh=cu8yP/MBtS11Wc1W4fcSVxxGWFJQhLMBKgmZnOYDnME=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=cx+22p4CYADZE3fFAkl5pCeyf2Jhd/VJRrBwYzswOAsD0CjKe7aGpJvqxmMsDvGvM
 zvnP1bn+MYlTEfU2bitRE1h80hSJLoZG07EMnRLzJb8MrhDwzKxdDDGIMYt0WiTUvR
 l0b01UaOGhWgji2cXWcZmgkp/oMhsTKMhltqst3VxVt05gRgzyOgnnn6n2K5BWH7nB
 aVXRTaBUWpk0GxkZMPbNkEqeq/laUGnK62OdMdir9mU81xDdNbFDZuiG8PvZwJBB9Q
 dgFAag3OjvSsF0WndeS9t0hMl4lckDUG5It//3wYcNCGbkozfry2hEMwzQXPlJ9XzJ
 pC4HOtmU1B+Sg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 A5F6EF6079A; Fri, 21 Jan 2022 07:38:05 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.17-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txt8OsBJJBzCYXMgMC8T=yKTWz9MYA3osB93EqMk5vBGg@mail.gmail.com>
References: <CAPM=9txt8OsBJJBzCYXMgMC8T=yKTWz9MYA3osB93EqMk5vBGg@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9txt8OsBJJBzCYXMgMC8T=yKTWz9MYA3osB93EqMk5vBGg@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-next-2022-01-21
X-PR-Tracked-Commit-Id: ccf34586758cf00c0934e48f6ef6d688f01d7b19
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c2c94b3b187dc92b2002809f489e0f24a41e91bc
Message-Id: <164275068567.15932.9086052433373467631.pr-tracker-bot@kernel.org>
Date: Fri, 21 Jan 2022 07:38:05 +0000
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

The pull request you sent on Fri, 21 Jan 2022 10:17:05 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-next-2022-01-21

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c2c94b3b187dc92b2002809f489e0f24a41e91bc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
