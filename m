Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17767534750
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 02:09:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3A1D10F698;
	Thu, 26 May 2022 00:09:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46C0D10F698
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 00:09:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DC5F5B81EC0;
 Thu, 26 May 2022 00:09:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 11D66C34118;
 Thu, 26 May 2022 00:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653523754;
 bh=dg0cMATWEEeBg9rG4Uve1+Cswpobi3GWRVoLrBPHiGw=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=u24Lwt1KAjMm7MZuNETGfQeqTEeFuzzWaFqj/UEpRi8muh7W5oqE2H59+9Apbtot1
 Pd9l8vwotSEHMUdPGiA0+SDfgQzeD0I6xG/Bn9TwTaj3sEbYVY4fjdpk61VGrChs3B
 kz8AIpE1FpIn5JF3EVvGigfbSWylZ0QcpMixl9x1ujJHIvTsGcTr4C538tVn/TJXEX
 /QbcfUYVU50PSDKRNI9H6OLn4pHeTQDIevHRx51JeL56R+2F6ybmD/q5Uaviu4NKKv
 QEIFG+oudLc5aERuk8xwLxbOwCpJzrhPFz9x6fXzVR0Exh1umWAznETv0Sdqf/5Fmc
 lG3eNbMBiY6Lg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 00F90E8DBDA; Thu, 26 May 2022 00:09:14 +0000 (UTC)
Subject: Re: [git pull] drm for 5.19-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tw62EZfAm0PbiOPmMrpfR98QMFTWGEQcA34G4ap4xxNkA@mail.gmail.com>
References: <CAPM=9tw62EZfAm0PbiOPmMrpfR98QMFTWGEQcA34G4ap4xxNkA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tw62EZfAm0PbiOPmMrpfR98QMFTWGEQcA34G4ap4xxNkA@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-next-2022-05-25
X-PR-Tracked-Commit-Id: c4955d9cd2fc56c43e78c908dad4e2cac7cc9073
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2518f226c60d8e04d18ba4295500a5b0b8ac7659
Message-Id: <165352375400.5177.660648340109162209.pr-tracker-bot@kernel.org>
Date: Thu, 26 May 2022 00:09:14 +0000
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

The pull request you sent on Wed, 25 May 2022 16:06:58 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-next-2022-05-25

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2518f226c60d8e04d18ba4295500a5b0b8ac7659

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
