Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0893550AE7A
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 05:23:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D34AC10FAF3;
	Fri, 22 Apr 2022 03:23:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9B8D10FAF7
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 03:23:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2E8446199B;
 Fri, 22 Apr 2022 03:23:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 854FBC385A7;
 Fri, 22 Apr 2022 03:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650597811;
 bh=O/viPJYPHRZIpmTuoEaBkacx7MMguY7hWUbhqksXnkw=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=qpXXyjfJ14mvXbLvLyq0qTyy6Lpg5nd5+Uklkec6LhqNaQQFoK6uRFWUoXPi3hmEx
 yIDfY1lDEpd+5boLProrbBQgWfphGoPfQ6qTkjMc+rszrxuVysTE/5/Wrkv0ofsL89
 GMhUv7UY5V804heZb/3dA3w4nz8Sx/6EvjQTLfg2NZDY9CgH5scmmTpJlhndIpcPjI
 OUUNnrrzzCA5/mP0Q3m7+P+T7q30TXv5ch7OQBVd/8VuhlT3GgKAXIBadDkDWmAhYB
 t1tK6NXvSQ+vNN5h6ofj2a12PROKt11zvbRzycFY4aRVkqfMAUTLqqvE4R+gmLlomz
 lVHraWmV3hkhg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 70CDAE8DBDA; Fri, 22 Apr 2022 03:23:31 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.18-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzQpOnBBNNYWDaJRBztOCVM-PmprHHWZnr2yLh2rb2Y8g@mail.gmail.com>
References: <CAPM=9tzQpOnBBNNYWDaJRBztOCVM-PmprHHWZnr2yLh2rb2Y8g@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tzQpOnBBNNYWDaJRBztOCVM-PmprHHWZnr2yLh2rb2Y8g@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2022-04-22
X-PR-Tracked-Commit-Id: 70da382e1c5b9b2049c10abfd4489a40c1b60df0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d569e86915b7f2f9795588591c8d5ea0b66481cb
Message-Id: <165059781145.714.9614384696896372863.pr-tracker-bot@kernel.org>
Date: Fri, 22 Apr 2022 03:23:31 +0000
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pull request you sent on Fri, 22 Apr 2022 12:56:18 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-04-22

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d569e86915b7f2f9795588591c8d5ea0b66481cb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
