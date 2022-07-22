Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FCD57E7EC
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 22:07:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 423B28A540;
	Fri, 22 Jul 2022 20:07:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FA472BA4E
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 20:07:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3D66AB82A47;
 Fri, 22 Jul 2022 20:07:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E2A3BC341C6;
 Fri, 22 Jul 2022 20:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658520471;
 bh=yvLUvjeW4JCCFMQx/C+ldKvP9tMF7d3pHBZD2YskKoU=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=pNXeGkhPBrf6C2GcZAh049d0OUjyBVeLLrmwnWYgvLVA9Q2vmNmO/eHFUTsJFTqrw
 sRzCec4ztqSHzW1JBw3nt8ORcJYVBicdb382aB4jjG+HfA2ddGo+SSk+PmhATvlZiG
 0X1YdCaChC4vEaR5CeD/bNvuiHVwiQ4kwqmXqdN9mf4MHsDNx/gYkQqISXheLwPkBU
 tjNipcBcemwZ81ZuyLmSMHZcHHoJaB5ZU86JRv93RZtlaTzGxS2Fvtu7StyQZQODMK
 Vt60iSpSKXIOEsXTrvVoylujtrjZiGPPeLAPoPovbAnZYnH6aHkJUOyeKWCn8gAPqc
 FD/T/4vrPODWg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 CFD0BE451B3; Fri, 22 Jul 2022 20:07:51 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.19-rc8
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tx177pqAbBTC586NRwr+kbx=_pQjQwKpFjB+442m-uSdw@mail.gmail.com>
References: <CAPM=9tx177pqAbBTC586NRwr+kbx=_pQjQwKpFjB+442m-uSdw@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tx177pqAbBTC586NRwr+kbx=_pQjQwKpFjB+442m-uSdw@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2022-07-22
X-PR-Tracked-Commit-Id: 7f5ec14a4e07a2a78fbde069709d5c8806882be2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8e65afba6baaa1317efc4038cbced1268c6e2f6b
Message-Id: <165852047184.15752.15754098115255802753.pr-tracker-bot@kernel.org>
Date: Fri, 22 Jul 2022 20:07:51 +0000
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

The pull request you sent on Fri, 22 Jul 2022 14:15:37 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-07-22

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8e65afba6baaa1317efc4038cbced1268c6e2f6b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
