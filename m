Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C338366993C
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 14:58:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFFA110E101;
	Fri, 13 Jan 2023 13:58:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C50910E101
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 13:58:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 562A861DFA;
 Fri, 13 Jan 2023 13:58:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 28623C433EF;
 Fri, 13 Jan 2023 13:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673618308;
 bh=4qfWw3Ez9GnDaJKDGYjaXMIltwVLJnzFcdlV4QOV+FI=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=Un1rcuHSpv+eNXJAjWe+uhCvJqiJ9boP/lfhwG+vPXvvN0qwK1tmDD1VzcYuVH2WW
 Arr/uAKaejjnn1p/JE3iFN2uEl9bMXJweZu4lbPFI7c970fpEDmwGCCSgCm0v7Oyjx
 cWRhXfM1OCo3M4oW3YddFPWOlPH8Oq4/qqNyWJhmvUjWq9bEm6lk6pn1Wwh/iCzAhM
 ihwZnLxbZrJXn6lO5Az125MYlmeocne2xgZ3sI+cSWdyeKI6nzHIGY8h/yZx8eFp7W
 HOlLtGp4YpslV9hPXR4eKiWVgQYBEgPt7QoBro9vid6/PBI0bVU0ewj3XoR6IP5C+R
 3YShO3wedzVBg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 14EC2C395C7; Fri, 13 Jan 2023 13:58:28 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.2-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyS7pXX12Ks+b=iSbUAdfLW=U-uGKo4SkKz6yGiCsusNg@mail.gmail.com>
References: <CAPM=9tyS7pXX12Ks+b=iSbUAdfLW=U-uGKo4SkKz6yGiCsusNg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tyS7pXX12Ks+b=iSbUAdfLW=U-uGKo4SkKz6yGiCsusNg@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2023-01-13
X-PR-Tracked-Commit-Id: e695bc7e542358978434c8489a5a164d2bbefae8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ff5ebafd51ecc01014f1db510299eede60faf22a
Message-Id: <167361830808.16011.4014386693041843367.pr-tracker-bot@kernel.org>
Date: Fri, 13 Jan 2023 13:58:28 +0000
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

The pull request you sent on Fri, 13 Jan 2023 15:15:17 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-01-13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ff5ebafd51ecc01014f1db510299eede60faf22a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
