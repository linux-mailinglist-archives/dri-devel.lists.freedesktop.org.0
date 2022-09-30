Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD3B5F0ED8
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 17:30:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3D7310ED59;
	Fri, 30 Sep 2022 15:30:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4142510ED63
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 15:30:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0C8A2623A1;
 Fri, 30 Sep 2022 15:30:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6F326C4347C;
 Fri, 30 Sep 2022 15:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664551809;
 bh=3U+zD0NogFFEBtBK6OA+s07y+MxGQredjvYdIsStyUk=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=G6+IXjSnbBEdEgXcqxL3VwFDZ/k+P3DlHZ/nFnqhpZlt1yj6Sm/MIT0SNr9tl+mBt
 72gBH+5C+WiDx6t3ZA3qXxzdywboHePmlPZc+z9eM/bFhBR/SyhSm3Ru3xcAYFXUnE
 /7EgPZIO9RNloKKjG8sN+nGLU+ft2ULZvfesOjTl3bq3fD4/kla3QIIarDCXTnwgHS
 IcRRYHBez4kXGxS68+qC8Sb8mdMCn5zPAnxGeC3pYejTJ7IL32qcKsNQ51uf3MRB6s
 vBi6Ejve378MNbE1x0BM4wmQDArPc6WNhvnnGoJj7OZuLzFdAX8GinjRRxN3SAGgRw
 9/zfei/eK/D4w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 4706BC395DA; Fri, 30 Sep 2022 15:30:09 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.0 final
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txBybqG30QMLH-fyovjw_m7eiFyE6rBr9Q-=rMb_sak3A@mail.gmail.com>
References: <CAPM=9txBybqG30QMLH-fyovjw_m7eiFyE6rBr9Q-=rMb_sak3A@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9txBybqG30QMLH-fyovjw_m7eiFyE6rBr9Q-=rMb_sak3A@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2022-09-30-1
X-PR-Tracked-Commit-Id: 6643b3836f3908c4f77883b2fae72451e85cf3ca
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5a77386984b513ebfb2700e70dac44509fc81aa9
Message-Id: <166455180926.5414.1822419434608003632.pr-tracker-bot@kernel.org>
Date: Fri, 30 Sep 2022 15:30:09 +0000
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

The pull request you sent on Fri, 30 Sep 2022 10:12:45 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-09-30-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5a77386984b513ebfb2700e70dac44509fc81aa9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
