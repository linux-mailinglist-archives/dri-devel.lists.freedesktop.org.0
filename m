Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B56E7D8F04
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 08:57:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1944710E932;
	Fri, 27 Oct 2023 06:56:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E68110E932
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 06:56:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 899706333D;
 Fri, 27 Oct 2023 06:56:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 379B9C433C7;
 Fri, 27 Oct 2023 06:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698389816;
 bh=0gosqyGzFdtDcW5z3eCx+auM0NLPCI4r/8Um4p07iw4=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=O2VlZ9BF2dldfSVV6GD8aQ/XN/TR1Oe+EjTcvxJRZiyNHH0t4ao4KTFIftllj+3wz
 1/fmBHf+LT3yoMXomYBez1QHG7pD2IMqGEY/pZEsTHXzm6g46+3IBU083TIoC2LgR3
 Ty1E+PNQG9N4UJ8KZZqmG8klRb7o7FFT9eqM2WSGjfjCzx8RlkfKVyCcUB6WvslkRn
 2u2x+IfWBm+alH3QivxZT+ddXIA+Puix6HgP92ATyrEU8ycEntp8Ww7zixHTO33oqz
 q1TYeiQ1hy8ocXEeB72bp7erGZWOWBx6rf990WUOjQqSMexkT7quDh2wdyIZkkqlx9
 RaUay61ypFACw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 2297AE4CC0F; Fri, 27 Oct 2023 06:56:56 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.6 final
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyx-mqoKY77QsHSD1kEnn1dbg9yERCNn76wVY1Jw0+z_w@mail.gmail.com>
References: <CAPM=9tyx-mqoKY77QsHSD1kEnn1dbg9yERCNn76wVY1Jw0+z_w@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tyx-mqoKY77QsHSD1kEnn1dbg9yERCNn76wVY1Jw0+z_w@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2023-10-27
X-PR-Tracked-Commit-Id: 44117828ed5c129a8146585e81262c0025daa50f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 750b95887e567848ac2c851dae47922cac6db946
Message-Id: <169838981613.1621.4050256394293077454.pr-tracker-bot@kernel.org>
Date: Fri, 27 Oct 2023 06:56:56 +0000
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

The pull request you sent on Fri, 27 Oct 2023 16:15:45 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-10-27

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/750b95887e567848ac2c851dae47922cac6db946

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
