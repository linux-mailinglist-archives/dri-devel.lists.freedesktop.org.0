Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3BA638FA2
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 19:22:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8658310E78B;
	Fri, 25 Nov 2022 18:22:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5742410E78B
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 18:22:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A867460A2A;
 Fri, 25 Nov 2022 18:22:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 15AB1C433C1;
 Fri, 25 Nov 2022 18:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669400562;
 bh=6w4M3pvKm4f+OLKwdsL0n93aqF6ac5znqPkGKCtQK60=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=F3EVEZjaSC4t2ZgM1cGbW4jUuyIksc5XQmseBZERcn6Q6x4sZYZML11qBva37iyKz
 +n3+mgF1jLV99lnwxsA3rq8JP0y/LEVzbgQcx/lSSdfJlnnzA2JBiiojsH0p4lN9i7
 5GAOV6X641GZKObwBACafMPcF84RbwbuYyJyMi/Eq8MOv87MdwQYEjr21JrOoFDh+j
 4lHaoSbDpNZxdQlSPvW0NIJHUDRcz3iB4W0bBPL6yAcjbuh6opd/oPW0yJ6Rd2miki
 +27XlKMZ93DfF87TIPnJXUQUQd4Kwbp56anzfgEoQDzNOAA5qYhivrs1STvwcUE79w
 UAesn+sWSxd8w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 032A3C395EC; Fri, 25 Nov 2022 18:22:42 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.1-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tw-YJEmJFE0FaOa0SvjsPj=TW4rqD1RJBgsw_JzWu1vZw@mail.gmail.com>
References: <CAPM=9tw-YJEmJFE0FaOa0SvjsPj=TW4rqD1RJBgsw_JzWu1vZw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tw-YJEmJFE0FaOa0SvjsPj=TW4rqD1RJBgsw_JzWu1vZw@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2022-11-25
X-PR-Tracked-Commit-Id: e57702069b26b8601a33fdc0c9bbe40c6bb9c72f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6fe0e074e76985c7be3eaa7a8fd51401a8999cae
Message-Id: <166940056200.17840.14471258872833551269.pr-tracker-bot@kernel.org>
Date: Fri, 25 Nov 2022 18:22:42 +0000
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

The pull request you sent on Fri, 25 Nov 2022 13:47:02 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-11-25

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6fe0e074e76985c7be3eaa7a8fd51401a8999cae

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
