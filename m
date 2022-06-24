Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B521255A0ED
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 20:48:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77F4210E91D;
	Fri, 24 Jun 2022 18:48:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3EB410E91D
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 18:48:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9413E620CE;
 Fri, 24 Jun 2022 18:48:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 05D25C34114;
 Fri, 24 Jun 2022 18:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656096497;
 bh=3J1w5tK6mjwxtr7LiECijv8nqY+fXNQVZHq8x2fidVg=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=tI5vTNH/NjOSZF9IeJJBWnjxI5HuJW14jbTVbG/fNrPINlkkWaYTMZ2i1AXRU735O
 wRYLVZSYSOt1pZ3tiRhV54/lQfkv4XgKrZ9/eCAwRfCi9vvKILkV1yLQuotJEMGdEh
 udjAcHdPR5qyOcVwTHNcOM56AGogLHl1mkPfYZglf4vIpczZGvsDf9r4JpnzfnXK+i
 X/gMaxXZlFAM+V4pgJM6m+iG+lRjGqzjVOOSJ8CkBw+EJeMbNqxcfjiUmuNZ3GEsqe
 OsVeHTO6l2+7nWordRAPGO0bG0J7SSxYqn3xPOf62X1Y/e7tkUfsS1mUoGuG2KiZQi
 hv4m72zJk8o/g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 E834BE574DA; Fri, 24 Jun 2022 18:48:16 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.19-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyLoZOkc56K2auFtdjhuUxP=Xwj41evB053YZrHyQNSxg@mail.gmail.com>
References: <CAPM=9tyLoZOkc56K2auFtdjhuUxP=Xwj41evB053YZrHyQNSxg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tyLoZOkc56K2auFtdjhuUxP=Xwj41evB053YZrHyQNSxg@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2022-06-24
X-PR-Tracked-Commit-Id: 1e9124df8be0a43e4e9a10c5d1140d6ca8e50132
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 38bc4ac431684498126f9baa3a530e5a132f0173
Message-Id: <165609649694.29080.3941150132522080119.pr-tracker-bot@kernel.org>
Date: Fri, 24 Jun 2022 18:48:16 +0000
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

The pull request you sent on Fri, 24 Jun 2022 15:55:38 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-06-24

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/38bc4ac431684498126f9baa3a530e5a132f0173

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
