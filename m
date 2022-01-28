Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AA549F4CE
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 09:02:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1957810FD4D;
	Fri, 28 Jan 2022 08:01:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B31C10FD4D
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 08:01:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2DBE7B824E9;
 Fri, 28 Jan 2022 08:01:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F049EC340E0;
 Fri, 28 Jan 2022 08:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643356914;
 bh=nl1eGDwMTMMkir1GYqGcf6tchvwpZeLAzNQjS/KSTq4=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=fWr4plAsTe+Ds0KCOCHmWgPg5gd8IXt2MlLoz0aHqWZAczaa66+vt3CmmmOQKtmJT
 /WX9viUK6/wvw3yEO2dhMU3qnFIoiiXuQInFjuQ1/a748xSclz0uOcYJMhrTRw1fIk
 BHncsUEEqKQEU1naGW2rh6CISeR6raUTtajcF+ntoh6xFJt0vAKKDuR6nhjTbQyjT3
 QEuz0id8Fa4+JWj6RZOL7GtwJl0Hh4d34+bnvQGwPebBR+KMhbfsw9peDPeqwRmJW5
 y5+bvYMq+MWYt7t/fJ1DznYtkz83RUzDiAdiIN+93R/ZIzRm9Tg6HshffJnUPvD0Db
 jGMMqps4+Qtbg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 DF4B2F6079F; Fri, 28 Jan 2022 08:01:53 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.17-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tweQ-RgLm5oewCYqVzRuiQ6cSQrb2yzVYP_537V67pdDQ@mail.gmail.com>
References: <CAPM=9tweQ-RgLm5oewCYqVzRuiQ6cSQrb2yzVYP_537V67pdDQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tweQ-RgLm5oewCYqVzRuiQ6cSQrb2yzVYP_537V67pdDQ@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2022-01-28
X-PR-Tracked-Commit-Id: db5aa1497d02e7770e40dd0d1bfcb4ea0b0d3906
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 82b550fa99f2c73636ca3f84900117c3c3272ef7
Message-Id: <164335691390.26371.215928861142953065.pr-tracker-bot@kernel.org>
Date: Fri, 28 Jan 2022 08:01:53 +0000
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

The pull request you sent on Fri, 28 Jan 2022 15:46:35 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-01-28

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/82b550fa99f2c73636ca3f84900117c3c3272ef7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
