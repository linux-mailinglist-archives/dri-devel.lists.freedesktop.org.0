Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C00B900D62
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2024 23:17:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DB8710ED1A;
	Fri,  7 Jun 2024 21:17:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qIBOenLq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B3FA10ED1A
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2024 21:17:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B79056206E;
 Fri,  7 Jun 2024 21:17:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6DE88C32781;
 Fri,  7 Jun 2024 21:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717795025;
 bh=S+gLfAfsgGvz+l36YgNd/bEuEfEMMCVX1IbnE/gNbUw=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=qIBOenLq/l+q3uayFkgbFCBDshkX48ZlkjF5Wh5k0+B1/0n1Ok7ZlNo0BroaEX8E7
 dhgdbOeHhRBdZY48asj5DXtjmOz2i9mR/hii3qaKc+pOfR0HBhVIZc08d6chIdaDcw
 PAD0jAPl1y1Zsf6qtNn9j9E5ITnm1+OC0AHDLn6RvDjBvPJSVUGAcyfqQWFVDD6PE3
 kVr1bt6QZQFQyUZruL4t37HXyHd5Nq7eJiMFCyM5kgNWQT3hLo/gyInPOxK4x/zFuJ
 34URQsRQf/ihMHfhz8eDRu/y/9sUqryX5svCm2ATTkp8rLihj0t6u/wovBmPRUH7KD
 sItn8RCbE9m7A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 62572CF3BA3; Fri,  7 Jun 2024 21:17:05 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.10-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyvjs75_Op_yXD=vD_ZLQwZRzio0=_oM=vGkeOkaGW=TA@mail.gmail.com>
References: <CAPM=9tyvjs75_Op_yXD=vD_ZLQwZRzio0=_oM=vGkeOkaGW=TA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tyvjs75_Op_yXD=vD_ZLQwZRzio0=_oM=vGkeOkaGW=TA@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2024-06-07
X-PR-Tracked-Commit-Id: eb55943aab89be99a26e34fc2175ebb3583a2778
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2e32d580757362edc95fdd7a86d3b869b78e58d8
Message-Id: <171779502539.6230.4106074234980545453.pr-tracker-bot@kernel.org>
Date: Fri, 07 Jun 2024 21:17:05 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pull request you sent on Fri, 7 Jun 2024 12:05:49 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-06-07

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2e32d580757362edc95fdd7a86d3b869b78e58d8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
