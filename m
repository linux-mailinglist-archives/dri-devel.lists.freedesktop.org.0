Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 318617B3A69
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 21:09:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BA1110E1AC;
	Fri, 29 Sep 2023 19:09:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86B5210E1AE
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Sep 2023 19:09:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CF8F3CE25A7;
 Fri, 29 Sep 2023 19:09:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0D513C433C7;
 Fri, 29 Sep 2023 19:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696014554;
 bh=F7BqptkTFZMjxW4sdEcZv+9Y5EEq6q0j8bKg3zmqiEY=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=HrAFnuuB4jdMfuaTB4/bCeVBAGdUK79UXR4QXm5yzIdOUQTuGqoGUL+gtA7hKD3T4
 aLQ8Op86PYt6cYcwhPgI8R9sf0wSTGhoZqe4gS1pPbcjXiLC6z9Jcg+7tRJa1DcQaF
 XZTqKbDId5s+s3uscQ/LhHEQpYR6fKzXMOoWlGw36618b5bVySSCj9DY3Lt1beXGe9
 8Ry8HKmAjJ+2Pyau+Hl+32nvoaKt+BIKunDRw3cqX2l3bZWaJR6aU0+2EGaoYYs9v2
 5j+hm35OMp4rGrx1EQlu535BcATXTqDq/AUWsFMB+m1m/aP5qVZZcXrFbOP4wncyQR
 LoTNeQTF9WyhA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 E9B1FC395C8; Fri, 29 Sep 2023 19:09:13 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.6-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twU2jO7zfje1XSmW55VnyKxWenszkLRFi-yLX7hQNG2+A@mail.gmail.com>
References: <CAPM=9twU2jO7zfje1XSmW55VnyKxWenszkLRFi-yLX7hQNG2+A@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9twU2jO7zfje1XSmW55VnyKxWenszkLRFi-yLX7hQNG2+A@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2023-09-29
X-PR-Tracked-Commit-Id: 06365a04fd32af25f90d8ccb4fecdda1f0e1ab78
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6edc84bc3f8aceae74eb63684d53c17553382ec0
Message-Id: <169601455394.20163.8006065333875033341.pr-tracker-bot@kernel.org>
Date: Fri, 29 Sep 2023 19:09:13 +0000
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

The pull request you sent on Fri, 29 Sep 2023 11:46:12 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-09-29

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6edc84bc3f8aceae74eb63684d53c17553382ec0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
