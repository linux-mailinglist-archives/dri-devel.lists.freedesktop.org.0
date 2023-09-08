Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F22F7980BB
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 04:55:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A295810E548;
	Fri,  8 Sep 2023 02:55:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45A4B10E548
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 02:55:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 78B73CE1B2F;
 Fri,  8 Sep 2023 02:55:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AEC50C433C8;
 Fri,  8 Sep 2023 02:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694141735;
 bh=2x4EIX8a2elX+igj7sK4WgjaaYP5CdkNUDpmldy92AE=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=cu5GcRy5TpOawF51dz8ECEISbkbK3XdEJf2KUL/Zc9wHU00FuM7SosIqPxlFb5V1t
 XTDLDSF2ralvm5nYyHb7X1mOXZydhIzNdg6NxpMDIDkZIxiTyzQqV5+/2sN8KH+U4i
 tjHj5K6DoZXdKNxVnSEGTr2RfARF0dIBzi6pf4kPD3EH+BXZqtmVIvuQHvF+PluRZW
 ozyTVC5cGgoeKp2HyOjMt0kyayEi69wnKZ61CCU1p7b+czdb4UP6ukXHJhORs64Cr9
 /dBNglRMh6XzclbbpvPTTmrNb2biAhW4VzBGFCsSF4wDPcQGL48I9GRJLvD/4HxX3v
 n06fE7uytcy7w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 9B80CC4166F; Fri,  8 Sep 2023 02:55:35 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.6-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tx-wOoVEc96nkOh=E5rDhsn-QM+QJF5oeYQK-yi2Cy8uQ@mail.gmail.com>
References: <CAPM=9tx-wOoVEc96nkOh=E5rDhsn-QM+QJF5oeYQK-yi2Cy8uQ@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tx-wOoVEc96nkOh=E5rDhsn-QM+QJF5oeYQK-yi2Cy8uQ@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-next-2023-09-08
X-PR-Tracked-Commit-Id: 43ffcd6fa1635f479ad73145dfbba59edc2b3b28
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a48fa7efaf1161c1c898931fe4c7f0070964233a
Message-Id: <169414173562.17056.8974388469030565712.pr-tracker-bot@kernel.org>
Date: Fri, 08 Sep 2023 02:55:35 +0000
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

The pull request you sent on Fri, 8 Sep 2023 12:45:13 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-next-2023-09-08

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a48fa7efaf1161c1c898931fe4c7f0070964233a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
