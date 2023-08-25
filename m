Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B402788CF2
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 18:10:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7394910E6CF;
	Fri, 25 Aug 2023 16:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 984DA10E6CD
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 16:10:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 127B964CED;
 Fri, 25 Aug 2023 16:10:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7B4B2C433C9;
 Fri, 25 Aug 2023 16:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692979812;
 bh=12pbIoGcUXHHnWR/AjaT2D08GqLgEYvlCV0ILVgOklE=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=HgC0g+tjZm5tZUUe3CegGhfClRIeRLtaQYs0QJi/ehcmKaALc+47SS0rKM7WP1Aa2
 LtjGTzRS5GRoNJ20NphxHBZbrI25AkwZu3V9XGcxtAAuR8U/+IZRoMYSfcPk1Zn4yl
 Ov0jQjnCVx7jENBVmLVcr0/5syANq7z5GXZXM30JnZ4ikxDNQxDCziknScH+Bpw+4D
 AAVG7ag6xPGmxDK4Km+wnso50Zs0/TR+XzIUZ88EtimXmepCTlwsxHJveJ9Ts/aCf7
 3C1Kmtu0iqZYX+Q5/M9S01yo9O39RAIrzBpWhulJmBDfLKHqmYIaovtmnhuO3k2mYm
 HBjymNRvspoTw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 5F090C595D7; Fri, 25 Aug 2023 16:10:12 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.5 final
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyKm+X8XMk75_vWoFk90vjA33Jyo-ic==PQM84_WK2_Wg@mail.gmail.com>
References: <CAPM=9tyKm+X8XMk75_vWoFk90vjA33Jyo-ic==PQM84_WK2_Wg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tyKm+X8XMk75_vWoFk90vjA33Jyo-ic==PQM84_WK2_Wg@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2023-08-25
X-PR-Tracked-Commit-Id: 59fe2029b9e05cd490eaf972053dd86f96f77869
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: beaa71d6e64103403a328bcc8cefa6e9b19544c1
Message-Id: <169297981236.24147.14742169892084120200.pr-tracker-bot@kernel.org>
Date: Fri, 25 Aug 2023 16:10:12 +0000
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

The pull request you sent on Fri, 25 Aug 2023 13:07:17 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-08-25

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/beaa71d6e64103403a328bcc8cefa6e9b19544c1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
