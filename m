Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 596C748FB32
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jan 2022 07:45:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7E2F10E411;
	Sun, 16 Jan 2022 06:45:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46B1810E279;
 Sun, 16 Jan 2022 06:45:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6C6A8B80C8B;
 Sun, 16 Jan 2022 06:45:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 02528C36AE7;
 Sun, 16 Jan 2022 06:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642315537;
 bh=UlhVFMkDDLmkwvFqnHTB6Dei3PVIz0mljH4oBOdnMI4=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=Z83ulB58kYtW4cLGBngwj3o1KrR/bVaHlCgmqfugidKdyDED1nv5VY0GSgZFXc9Nk
 AJA54H9H9QhD1a94FFtKt2LSnATNLvh0g6ovQv6ERP3Mpc6K8KnKSnqKHPh67OiRzx
 rMeNytE9DIqCe+d4hZ0TKbuLSWECWhWOBRXyndXKRyXmOy+UNcEntwxlrJB4X3kL1O
 ZH4kYvoQFTeRlS165FbZEP3Q44IESb2Rn0jbZuz2JcMva4pMOnsVeGwaGL/Dpn6wYg
 En9Jn75P/pT/btD9NgOYSL0rIFWEzrKr5y9RGtuXmXEucbDhN9+ZiwXOdR6mNvxqrO
 pKFYjnCls2ynw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 E5DF1F60794; Sun, 16 Jan 2022 06:45:36 +0000 (UTC)
Subject: Re: [PULL] drm-next (merge window fixes really)
From: pr-tracker-bot@kernel.org
In-Reply-To: <YeGw6f4mhBZd0ZHg@phenom.ffwll.local>
References: <YeGw6f4mhBZd0ZHg@phenom.ffwll.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <YeGw6f4mhBZd0ZHg@phenom.ffwll.local>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm-tip drm-tip
X-PR-Tracked-Commit-Id: 4efdddbce7c1329f00c458e85dcaf105aebdc0ed
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 59d41458f143b7a20997b1e78b5c15d9d3e998c3
Message-Id: <164231553693.30539.3279246923381757604.pr-tracker-bot@kernel.org>
Date: Sun, 16 Jan 2022 06:45:36 +0000
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: dim-tools@lists.freedesktop.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pull request you sent on Fri, 14 Jan 2022 18:20:41 +0100:

> git://anongit.freedesktop.org/drm/drm-tip drm-tip

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/59d41458f143b7a20997b1e78b5c15d9d3e998c3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
