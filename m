Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7F0526D83
	for <lists+dri-devel@lfdr.de>; Sat, 14 May 2022 01:24:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CC4110ED8E;
	Fri, 13 May 2022 23:24:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 966B310EACA
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 23:24:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0EF06B830E3;
 Fri, 13 May 2022 23:24:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C994EC34100;
 Fri, 13 May 2022 23:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652484240;
 bh=/Lm84RWJelOTdP3T+xr4jDgjzowFvn2nQI1gg4nVsks=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=nmTHGRGz/zbFfZCJ8I9grLj/UkEUxPcD1mGINh+ezpFevEmw7JZuzRY0LlLyOIumQ
 saFLmhWXrafd4LIYT5aYj59Zu7WzNYSTA7rw2CPhUGa2Mxi4TVAG6/3IB9IILhsvEf
 mGmqiGxQS9b4ELYwhnEIiJ6aZDMxaHXXiQUJZq0U+ko1C0Amn+YT/aN+2f1isYbqoG
 s24VJiSJEYwfnV8OaqF0JB1JoA1EY9PCLUYRD8PUqbalpr4Ru89yrGOMbG6GNikCQs
 vMDDlVSIWp60+SRJ5//4x8thNKEx6FGSg8IvB2laq2oz3Dw9VVLdfxGPTJKA/rP2gp
 /Gp+b70kOTShA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 B39FFF0389D; Fri, 13 May 2022 23:24:00 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.18-rc7 (follow up)
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txpYhzyZtd60LEuBYYN+AVyeEQ8=h43bK=ZY8QCQpY5mg@mail.gmail.com>
References: <CAPM=9txpYhzyZtd60LEuBYYN+AVyeEQ8=h43bK=ZY8QCQpY5mg@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9txpYhzyZtd60LEuBYYN+AVyeEQ8=h43bK=ZY8QCQpY5mg@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2022-05-14
X-PR-Tracked-Commit-Id: eb7bac3973d209e5227d1783676362ee5a8a7127
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ec7f49619d8ee13e108740c82f942cd401b989e9
Message-Id: <165248424072.28273.15365436534682035448.pr-tracker-bot@kernel.org>
Date: Fri, 13 May 2022 23:24:00 +0000
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

The pull request you sent on Sat, 14 May 2022 08:56:01 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-05-14

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ec7f49619d8ee13e108740c82f942cd401b989e9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
