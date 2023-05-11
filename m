Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5806FFC7C
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 00:04:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBE5710E06E;
	Thu, 11 May 2023 22:04:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E5DC10E06E
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 22:04:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8541E65171;
 Thu, 11 May 2023 22:04:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9F38C433D2;
 Thu, 11 May 2023 22:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683842653;
 bh=roCpE77mYTPg6wVYVSb34/80+JaQyDZdyzb20akFYl4=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=OzRCOv9TIAgJjUSoN92Bv8PdOQtN6DrO6Sb5wlzS4ifoVETco8VpLwbcPii8gGAtV
 123G96MOouPvkAH23AzJt2Magf6rtkFh7OkdG/teLZoup2taws5uknET1knqluOsNy
 uHpVHKUBeirMbL6//g2v9HCWtT/eGHQewfP/n+RoG2/J+WEPzdMkDm6koGkcEqNtmk
 YI+6mTZ4CpwDfJ0jeVIsOQ03SMe4IkwTY9yqyNjk5WUbQBvui3LpKPXbHKyxKHeSUM
 H7xZc/Stdxx8OF/nUJwAmRkbwBB1nM5+U4HwNweE9zJk/confUFuU+Wd3Wtz+8vTZy
 bgThKPEB4znaA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 D931EE26D4C; Thu, 11 May 2023 22:04:12 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.4-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzcHVOZNJf__haKP-=f+tZ2_=AokYjWUikF02yv46XuAg@mail.gmail.com>
References: <CAPM=9tzcHVOZNJf__haKP-=f+tZ2_=AokYjWUikF02yv46XuAg@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tzcHVOZNJf__haKP-=f+tZ2_=AokYjWUikF02yv46XuAg@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2023-05-12
X-PR-Tracked-Commit-Id: d8843eebbbd15b78c6a7745717b3705eca923b0f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cc3c44c9fda264c6d401be04e95449a57c1231c6
Message-Id: <168384265288.22863.5222300484930093267.pr-tracker-bot@kernel.org>
Date: Thu, 11 May 2023 22:04:12 +0000
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

The pull request you sent on Fri, 12 May 2023 06:59:57 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-05-12

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cc3c44c9fda264c6d401be04e95449a57c1231c6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
