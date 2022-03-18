Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 576264DE1E5
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 20:39:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2271910E151;
	Fri, 18 Mar 2022 19:39:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 254D810E151
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 19:39:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 50530CE2BEE;
 Fri, 18 Mar 2022 19:39:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7F27DC340E8;
 Fri, 18 Mar 2022 19:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647632339;
 bh=uh4hShwgimRuZULyyXwWuyWdR1TFqdAV7+3Gl594/s0=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=MH9Ww7rnpeyohJeF0KLdTD9iUM1SNVIy1FmHcVObFdFW/w6HU1p+pV9QzhSGM1Uyf
 k6cNgocBGLeSJoVL7kfmNOzpDzkTvJ9b76uFKlLzK0haEhNjiOd2gRae+QfvQlob3o
 +6xaFHElfWVY0cFxSD8ckjFbfYmfGyueXBmWSv3Ox6Ir2RVMuYjYIKFxtteoHHiLbu
 Qu6Z92n6orJzsSdb39dLiZL/VucpAfPtKEEyrkKS3DZl66UiIFYilLF2Q1Z3hcpUH8
 fBren1V6+CNWR4i7NTjpkSm3ac1eVY9TpRhK/KUhxh7HGSFX3vvAkUU91QHlXuS6C+
 uwnjUs7twtcMg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 6DDA1E6D402; Fri, 18 Mar 2022 19:38:59 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.17-final
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twzN9ybw1N=n6JWNQgUd9UNXBxis+PguKagt8DSbW=y6Q@mail.gmail.com>
References: <CAPM=9twzN9ybw1N=n6JWNQgUd9UNXBxis+PguKagt8DSbW=y6Q@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9twzN9ybw1N=n6JWNQgUd9UNXBxis+PguKagt8DSbW=y6Q@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2022-03-18
X-PR-Tracked-Commit-Id: ca5a5761ac542691a6b3520b6c5c047cf63b4b8d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cced5148a1303a2ec57d04a7745a560821b45280
Message-Id: <164763233944.31275.5322423816376845710.pr-tracker-bot@kernel.org>
Date: Fri, 18 Mar 2022 19:38:59 +0000
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

The pull request you sent on Fri, 18 Mar 2022 13:50:16 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-03-18

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cced5148a1303a2ec57d04a7745a560821b45280

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
