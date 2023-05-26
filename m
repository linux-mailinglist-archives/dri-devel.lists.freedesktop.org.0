Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F1E712E35
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 22:38:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7482D10E1F1;
	Fri, 26 May 2023 20:38:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF93010E1F1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 20:38:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6A83660EDF;
 Fri, 26 May 2023 20:38:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D1E00C433D2;
 Fri, 26 May 2023 20:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685133520;
 bh=UwDpVaQgaPvQK8UKS6GhInOdpxEkTghYst9jnZaQjIk=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=c99yrWdo5bqec30qbWTpV4CHxH9U57gXnejFXxoQLa5b8RS2/KtzOAg3r+DdwVM1r
 B3wEslnVCvfzXj2rjOHV4NHjvBS66mxPWry9zFDPSvHtDZiln+HseqM3RSnGUbtNv7
 O/rxyXsqfSXYZemdFgiT4gy1fuBNnyHxPeQNq4YThUYo2/VmFofwKBGYiCnDgtMr34
 ZpK1O6R/ZOs//z0D3AZhu/ajeC2v4QFvxl7a5xM/JJQ7iQSdeH6KACEshBfFPu+bGu
 khNhGLBMgZVvMq49hPtDMMFdccrJ1yqi4m2vJVt+LZ38X9qSLhTrBdFMh1a6Hj7Ijt
 w2vHkSpy6udqw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 BEE4FC4166F; Fri, 26 May 2023 20:38:40 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.4-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twM2=jSRCZgoJDEcWypfGFuniRMEOa=S9pJvsWQR9dASQ@mail.gmail.com>
References: <CAPM=9twM2=jSRCZgoJDEcWypfGFuniRMEOa=S9pJvsWQR9dASQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9twM2=jSRCZgoJDEcWypfGFuniRMEOa=S9pJvsWQR9dASQ@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2023-05-26
X-PR-Tracked-Commit-Id: 5502d1fab09df791a8b1208dea9defc418b9bbf7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b83ac44e02986e640ee954e187ba414cb94453e2
Message-Id: <168513352077.25583.16771068207257304745.pr-tracker-bot@kernel.org>
Date: Fri, 26 May 2023 20:38:40 +0000
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

The pull request you sent on Fri, 26 May 2023 16:04:02 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-05-26

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b83ac44e02986e640ee954e187ba414cb94453e2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
