Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F0188653D
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 03:42:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE16410E99F;
	Fri, 22 Mar 2024 02:41:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AlKCjA6N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13FC810E99F
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 02:41:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0A80A6135B;
 Fri, 22 Mar 2024 02:41:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A9FDEC433C7;
 Fri, 22 Mar 2024 02:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711075313;
 bh=fXO2SgdhlURZb/EYs9Mpm72mFyCGNJlDezX1lbUrMsI=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=AlKCjA6NaWF8sZxVqRg2QlJchyZzx9/8sfelfjUWNKJ9EuP+0iYinBBY4KAsz55gP
 iiseMl3RS86uB9NKzf4FqHuqGtBETwbet8mKRk6CWobWHJmKVKuA9EEiyleK0frVSy
 BjkfqB25eOHOOIYWEiybPJlfsU96bQc5y7Q9YS0vk6Q4dh0k/Nsu6B6NnWt+q1g+ul
 UTh4ctSZpVHG7fJFexOnHZbBOKM0IPuzGc37rA6fCZnb2L/+6l1/iBY7PhAO0WGMgN
 374tlg5/vJ0Vy0Fmq4OxSDgCZYwX8mt8jmklpU0JwMEb+EfPDsCvUL09TeFfa9IjlB
 Xchcf+gaTpSlw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 A17F0D95060; Fri, 22 Mar 2024 02:41:53 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.9-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzRFvT=3VK85c4Bgwd15Wcj3PaCLMXvPr3ynzHAFsvqJw@mail.gmail.com>
References: <CAPM=9tzRFvT=3VK85c4Bgwd15Wcj3PaCLMXvPr3ynzHAFsvqJw@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tzRFvT=3VK85c4Bgwd15Wcj3PaCLMXvPr3ynzHAFsvqJw@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-next-2024-03-22
X-PR-Tracked-Commit-Id: cafd86cbdc607eadc28a008cddacd78f0894c628
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7ee04901215b3cab8fa35aa5bf4692d7aa312e36
Message-Id: <171107531365.27086.71817879676337456.pr-tracker-bot@kernel.org>
Date: Fri, 22 Mar 2024 02:41:53 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pull request you sent on Fri, 22 Mar 2024 11:34:13 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2024-03-22

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7ee04901215b3cab8fa35aa5bf4692d7aa312e36

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
