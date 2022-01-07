Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9E2487B7F
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 18:35:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B694A10E1CF;
	Fri,  7 Jan 2022 17:34:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DF0B10E1CF
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 17:34:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2FE456171F;
 Fri,  7 Jan 2022 17:34:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9A766C36AE0;
 Fri,  7 Jan 2022 17:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641576893;
 bh=Nd3OSgzKs9gH96Ti42NMD51GnPFBvOzQFzTs0RG+2l8=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=jPNy20y/2jwRkIVTxIccpj2JRMw9ePAL6WNzxL8n0AyWPTgzuvzUMXdOWmTGxqftn
 kDHw3Omf8ecD5sqzx7SGKPRnP0MphIiEnEJafyfAEQ7Lh+mHmS3PV7jU1PKhwEncBl
 nn1KB+rov1m/GkpHG00robcwn3g+a+G50Yy+7YW5Qj/I2Si38B33B2YRi8TQxM2fMN
 YLtcjT+og9CUAAdrs0cagC74/+2pv7T1zzxhbv0UdgRxoihGGyc1a2rM5Z5KcjOKz7
 R1cLXrN28sBlQkUjeZG5OW/El3xmUSMZ/6bVyqLaDJja3nvaslakeAlbtEp+ryTIeB
 jPfSeqf40oV8g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 88ECBF79404; Fri,  7 Jan 2022 17:34:53 +0000 (UTC)
Subject: Re: [git pull] drm final fixes for 5.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twnYJ8SrVzJEEH+Vksibomvk5CE+Nn6BXKYwLG_8r=GJQ@mail.gmail.com>
References: <CAPM=9twnYJ8SrVzJEEH+Vksibomvk5CE+Nn6BXKYwLG_8r=GJQ@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9twnYJ8SrVzJEEH+Vksibomvk5CE+Nn6BXKYwLG_8r=GJQ@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2022-01-07
X-PR-Tracked-Commit-Id: 936a93775b7c4f2293f651f64c4139c82e19a164
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7a6043cc2e863ab45016622c30879e555523ee13
Message-Id: <164157689355.23528.13761079687707576778.pr-tracker-bot@kernel.org>
Date: Fri, 07 Jan 2022 17:34:53 +0000
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

The pull request you sent on Fri, 7 Jan 2022 13:23:45 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-01-07

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7a6043cc2e863ab45016622c30879e555523ee13

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
