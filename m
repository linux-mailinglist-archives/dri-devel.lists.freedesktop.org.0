Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4286411A3
	for <lists+dri-devel@lfdr.de>; Sat,  3 Dec 2022 00:45:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5190010E738;
	Fri,  2 Dec 2022 23:45:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F4DF10E738
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Dec 2022 23:45:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 93F7362440;
 Fri,  2 Dec 2022 23:45:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 07C9BC433D7;
 Fri,  2 Dec 2022 23:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670024735;
 bh=pNkJa/Qao5I+mbIzTeSKiP+j4La3PtgbIQs+Wmk91DA=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=mLtRedAue8IK9CQrY1TXCqnoG6xn198Wwff8Lh3LBSQ/G2TushWTec4Vb851xGdea
 Y+eDC+T35qQPxTF2xF/Ut8VrVLn+Qp55prRW035qBbQZX3m50d7Z/+a4rufAZrPwju
 aNRGvTGobQ3QWgLJm0YKb/9uHhaPAzS2e8uWlJae+qTV3lWLRdgvIwKu1aNBcHfCSd
 JGWZBhPSIn7JAD5mMLD1sZxLBymcruXngIwZw4KF3gEpbWxf6VO1EzgAaVtWjLx+ls
 8cm/PmkiW9iLyWGVHI6ij8UftIAm196YJwnREbJZMgtD8r8ZX2N02CChDE35rS8mCt
 RGZSrvIMLFfBQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 E969EC395F5; Fri,  2 Dec 2022 23:45:34 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.1-rc8
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzKpUGHMEw3aN43b+P3+WwAtZGia190JktnB163TvVjCw@mail.gmail.com>
References: <CAPM=9tzKpUGHMEw3aN43b+P3+WwAtZGia190JktnB163TvVjCw@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tzKpUGHMEw3aN43b+P3+WwAtZGia190JktnB163TvVjCw@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2022-12-02
X-PR-Tracked-Commit-Id: c082fbd687ad70a92e0a8be486a7555a66f03079
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c290db013742e98fe5b64073bc2dd8c8a2ac9e4c
Message-Id: <167002473494.10636.17514527635123501904.pr-tracker-bot@kernel.org>
Date: Fri, 02 Dec 2022 23:45:34 +0000
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

The pull request you sent on Fri, 2 Dec 2022 11:44:43 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-12-02

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c290db013742e98fe5b64073bc2dd8c8a2ac9e4c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
