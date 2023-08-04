Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7450F770895
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 21:07:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C30110E757;
	Fri,  4 Aug 2023 19:07:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89F8910E757
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 19:07:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 53E1561FCE;
 Fri,  4 Aug 2023 19:07:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B278AC433C7;
 Fri,  4 Aug 2023 19:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691176019;
 bh=0zirEVVzRvgLiu5ZMZaMlqvvUJyoQ/fRdJMPJ/KCU1E=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=G002A/txUg4hTe7rGhgR5SQs9YjGWs1vrOuVPZlS+CvCys1soSdOuAuJTMX2bSOeK
 lUVfIAsKjVH4Cwm+BML/1rsq7w+sNqbv0dsTAaiAR6aEzRTKg4OgbtVOJjTdoSjKMN
 6ocIYhzyChJQH7EFCJ/qnT/Ltn63ggmIwzYgP0oiiR1N82AMI4YDxhoRrck1GxCXvh
 WhOg0NG0z8wlFlQXhG69WSKJ9FaUoXa1Ae+TblzjezUr9aMwWwKoQXAtPvNe8Uin0u
 /HG3d5LR6g5B78SxF8F3qmY5KtaKMWUDovRDhfsXSOGz3mTghgFIzHngQgIOjOaEXw
 OxwY/YtQV6O3g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 9BA43C395F3; Fri,  4 Aug 2023 19:06:59 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.5-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9ty0b5R=rfu21PD=V1dh91XMit2wzAuAcrJA0E8h2EuUng@mail.gmail.com>
References: <CAPM=9ty0b5R=rfu21PD=V1dh91XMit2wzAuAcrJA0E8h2EuUng@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9ty0b5R=rfu21PD=V1dh91XMit2wzAuAcrJA0E8h2EuUng@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2023-08-04
X-PR-Tracked-Commit-Id: 1958b0f95a35e4443573c4c3ec2efd89d2d00d82
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4142fc6743d39271e712936d9fb284cd84cb6010
Message-Id: <169117601962.19359.10923133631430492175.pr-tracker-bot@kernel.org>
Date: Fri, 04 Aug 2023 19:06:59 +0000
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

The pull request you sent on Fri, 4 Aug 2023 15:07:56 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-08-04

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4142fc6743d39271e712936d9fb284cd84cb6010

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
