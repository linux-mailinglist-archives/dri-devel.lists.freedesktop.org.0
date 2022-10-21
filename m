Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9BB606D1B
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 03:42:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 330E410E3E7;
	Fri, 21 Oct 2022 01:42:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1E1310E28D
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 01:42:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D9734B82A0E;
 Fri, 21 Oct 2022 01:42:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8C42FC433D6;
 Fri, 21 Oct 2022 01:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666316531;
 bh=XNx9+rvlsGEvlRUJaG20yjcV1nz98bS0gb/5ud1kOEg=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=LrhhaKWnqku9Tbi7mpYVl2q/ySbd5beYjRzpZxVPJAzHMlcOAb0VZ8ZKhTG/Sk9XF
 4iJhdAO9SovwM4JOoRelGFVi3PdrCWy9/Kc8m8s7KZHUvHHVUSnj4Ghq/57vcB9mUs
 lSBPMyfjrBGNsAT4s10tBG+WZiDWVrxWmRXnVByHvbuu4QRmzfN+6r3Zx13L6rFNmR
 v+LvnUZ07Fas+XAuvZsAEQ7GBEpfuY9mHTsAaNETuMA8Cgt9XrmzLFr2RGq+MNUFDr
 1czlAQU6d6u/FlSaHUIfgikDsEX/5hhcmMVucszDsSBBpjFYTpvKy1CcRtZ1OOdykj
 IJ+gM494Drbcg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 71A91E270E3; Fri, 21 Oct 2022 01:42:11 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.1-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzqUzVrUMtmXT1AQAkjec6DziLkuLriKZJVXb6aTWkhXQ@mail.gmail.com>
References: <CAPM=9tzqUzVrUMtmXT1AQAkjec6DziLkuLriKZJVXb6aTWkhXQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tzqUzVrUMtmXT1AQAkjec6DziLkuLriKZJVXb6aTWkhXQ@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2022-10-21
X-PR-Tracked-Commit-Id: cbc543c59e8e7c8bc8604d6ac3e18a029e3d5118
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e35184f321518acadb681928a016da21a9a20c13
Message-Id: <166631653145.12255.14877763131527807255.pr-tracker-bot@kernel.org>
Date: Fri, 21 Oct 2022 01:42:11 +0000
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

The pull request you sent on Fri, 21 Oct 2022 10:37:33 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-10-21

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e35184f321518acadb681928a016da21a9a20c13

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
