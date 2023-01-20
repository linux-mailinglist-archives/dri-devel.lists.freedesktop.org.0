Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C88D675CF9
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 19:47:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AD1C10EAEB;
	Fri, 20 Jan 2023 18:46:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7791410EAEB
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 18:46:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1298FB8293F;
 Fri, 20 Jan 2023 18:46:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B19C7C433D2;
 Fri, 20 Jan 2023 18:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674240413;
 bh=+3yI2nk3cf1PMiPEAwNlJ8wvoNP2evOlEbDiXir0H6s=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=KlBA6i2gkcVtCwxu8twdTQnL07JLNFjSfgLAm1F2yCmIPZXO8eYFR50zpZPIwQOlJ
 49OzoAnYbtYVMY5gKdPfzgr8uM9wzigXGWcd0c78ROJ6qcQg3PXpr992cQF81H6CJ5
 XjE6XZvcO/cvxolrUqOetvR5ea7uZQY0iS1AkZlOCi6US1hR9csAxEGeCo2ms2Go7Y
 N8iqj5yGZmNQwTHe/pfCiuQk0o6kBhmOiCj2q3eV6uMOtdaRLgJ81Iote9FXBjhNcR
 zBm6CH2uNhT9J6kmENxCCAI3rsE7QjbQJtR10GJkeQX3AR/n6dWrLovzQ7SbQXMKu7
 4u3/nWNO8UBWg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 A00C9E54D2B; Fri, 20 Jan 2023 18:46:53 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.2-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyh=fnWEUfE_Y5mMVwxgHEUCpev6pXyOQsxG+NpeEVQgA@mail.gmail.com>
References: <CAPM=9tyh=fnWEUfE_Y5mMVwxgHEUCpev6pXyOQsxG+NpeEVQgA@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tyh=fnWEUfE_Y5mMVwxgHEUCpev6pXyOQsxG+NpeEVQgA@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2023-01-20
X-PR-Tracked-Commit-Id: 3f30a6e67ce49c0068f8058893326db46b6db11f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ff83fec8179e392be2f472f0a9ec3da8f6d529c6
Message-Id: <167424041365.21297.9755516045782199117.pr-tracker-bot@kernel.org>
Date: Fri, 20 Jan 2023 18:46:53 +0000
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

The pull request you sent on Fri, 20 Jan 2023 12:52:59 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-01-20

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ff83fec8179e392be2f472f0a9ec3da8f6d529c6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
