Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 468945ABAA8
	for <lists+dri-devel@lfdr.de>; Sat,  3 Sep 2022 00:07:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F30110E919;
	Fri,  2 Sep 2022 22:07:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B801D10E919
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Sep 2022 22:07:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2925561D70;
 Fri,  2 Sep 2022 22:07:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8BC78C433C1;
 Fri,  2 Sep 2022 22:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662156436;
 bh=iNpb5npbEG7uwkUAyiim6o1IHE6SIZcL6Xy9bL8Krvg=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=Xpq5Na3HlMRubINHxnK6F7V0hm6uRse8Dv2Qx8qJkGfCnafmRD+EpN4+V2s9giC58
 7TmhAi1L+2H0V9B6rseWFEbXydrCEWzbZOB6kzMQxBuBYRLHjlyrsBax7CzKtQFf4k
 Ep6L7wUlpc2emdYQZYeZo4RcTKZvx1ot8ZCDVvwhSicc71zUweH5ySAM2LIELhE3K7
 t0JTy5DVrigjyakZ7IJRV65mUB05DxNP6Va8MXoIkxFexcPj4u0EhMT5kp2Tsus0qe
 5ls3vRnPdPOfaCzH39AWMoUxMO/t49/Bm1eCRGgTiGKzy1MyS9xj19DwnTcp248eir
 z0SAC8QAb9l3w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 7AAD5C395DB; Fri,  2 Sep 2022 22:07:16 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.0-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twhqKoDa84xNhsRmrfApyu206m+58-1yHnxLj=r3pxvag@mail.gmail.com>
References: <CAPM=9twhqKoDa84xNhsRmrfApyu206m+58-1yHnxLj=r3pxvag@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9twhqKoDa84xNhsRmrfApyu206m+58-1yHnxLj=r3pxvag@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2022-09-02
X-PR-Tracked-Commit-Id: bfe632f6d0a1371784dd9a11fa5a9aa2dbf53bf1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1e8e515edd6dbe15b86003d846fee005c12c0685
Message-Id: <166215643649.30372.17824007577014953666.pr-tracker-bot@kernel.org>
Date: Fri, 02 Sep 2022 22:07:16 +0000
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

The pull request you sent on Fri, 2 Sep 2022 11:48:36 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2022-09-02

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1e8e515edd6dbe15b86003d846fee005c12c0685

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
