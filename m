Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C00C5F679
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 22:42:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A019D10EB26;
	Fri, 14 Nov 2025 21:42:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QNQxHU2V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7238810EB26
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 21:42:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8747B6019F;
 Fri, 14 Nov 2025 21:42:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F2B4C19425;
 Fri, 14 Nov 2025 21:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763156568;
 bh=T0Es+ppOyjCa+pUU5ya0CvwFSnjfKh1LKC3BWdkNlJk=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=QNQxHU2VM/JX8QDVK/rKWHR+3w3CG98IAZRHhbZtyUl4kzZDouJGjIramOpq3KGer
 fP8IgSn3TojLHqgqmsWMjkBv1qGkd0dPiQ49iAn/RuACFEMF9cLkcFQot9ZXcMoI6P
 5v5FI1XnHGRMdmOGlOx4/D5O36CRXttq+/06JG+gYl0twc/PCkWV/aqLgr8hS3AyHX
 T2SqtWSGCljBsFtNci+yASEHRPuKfpT4j94qF4gustrpxQ6TjiK3ZpxL+u17RCED82
 TnM7Q9SuhXzu8vDsZjpjO2feBww8eMPazbibX4RXiud4fV2vVsS8OBiGnwirXHFW8n
 +4liTcBdlcTAg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EB1713A78A5E; Fri, 14 Nov 2025 21:42:17 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.18-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tz0CT3EWFjMPXffj2_kqExJe+3GNrUgkCQ3ZFuOf_-_rQ@mail.gmail.com>
References: <CAPM=9tz0CT3EWFjMPXffj2_kqExJe+3GNrUgkCQ3ZFuOf_-_rQ@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tz0CT3EWFjMPXffj2_kqExJe+3GNrUgkCQ3ZFuOf_-_rQ@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2025-11-15
X-PR-Tracked-Commit-Id: 362a7d4fd5c473d43c498e68e13ff7acf8ca4ccf
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d5c1b4b43249bfa038df2f63e2d506bbf6e07df9
Message-Id: <176315653670.1846194.17544972611476514489.pr-tracker-bot@kernel.org>
Date: Fri, 14 Nov 2025 21:42:16 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Simona Vetter <simona@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>,
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

The pull request you sent on Sat, 15 Nov 2025 06:36:17 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-11-15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d5c1b4b43249bfa038df2f63e2d506bbf6e07df9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
