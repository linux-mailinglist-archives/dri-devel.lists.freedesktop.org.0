Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72793BE9E1C
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 17:30:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6964610E16A;
	Fri, 17 Oct 2025 15:30:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oS0r83PG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E43E210E16A
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 15:30:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 16EE564553;
 Fri, 17 Oct 2025 15:30:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B96EDC4CEE7;
 Fri, 17 Oct 2025 15:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760715045;
 bh=4/Efo52pUqgliVCdTmMb32ALCL+VU1GtLvRS0tzhQx0=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=oS0r83PGSuWgJV1LXR1ZdK9J/YmCVJD7KPozmwXVXD1i65intFzzZ3XZpbG+rGd3B
 WylazXP7ud3e6MLueJ/z92SJICNxUkgdFo76MMLUws6ef9tP4E31WxTPEaSRUKCGCD
 wVm+zZRX+3EZKeXJ4HpR29ix4pHoELKLhP99ge3xx0vrW/1yK5mYfSpXXceNLDDAm4
 FHxJfHOwbmZ0qLc+1O7IF2JGzL8CvGABhxAxGfYrewi8xb/4aOdPX/V95OlLt/H72Y
 xcDUtERMJoDP4TgHBuJMuPH8nDTu5/uhCjnUnznBceM57CFobyNllgv13UjJ0wm5TR
 dhpk3mnFQtBxQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADFDD39EF978; Fri, 17 Oct 2025 15:30:30 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.18-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9ty=C+PAgZD44Y_LkUuKkRtLFGffjX9rZX8=fkP0s-8zSg@mail.gmail.com>
References: <CAPM=9ty=C+PAgZD44Y_LkUuKkRtLFGffjX9rZX8=fkP0s-8zSg@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9ty=C+PAgZD44Y_LkUuKkRtLFGffjX9rZX8=fkP0s-8zSg@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2025-10-17
X-PR-Tracked-Commit-Id: 62cab426d0e340cd38893227c279705cc9e8416a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e96687c6d3b7814e6516dfa732946d3f40142819
Message-Id: <176071502928.2669258.8216523114880112616.pr-tracker-bot@kernel.org>
Date: Fri, 17 Oct 2025 15:30:29 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>,
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

The pull request you sent on Fri, 17 Oct 2025 16:14:43 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-10-17

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e96687c6d3b7814e6516dfa732946d3f40142819

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
