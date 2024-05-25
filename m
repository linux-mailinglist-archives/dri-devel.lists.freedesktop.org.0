Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D87BD8CED3B
	for <lists+dri-devel@lfdr.de>; Sat, 25 May 2024 02:32:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C06A10E05D;
	Sat, 25 May 2024 00:32:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kYgPZVXC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C977A10E05D
 for <dri-devel@lists.freedesktop.org>; Sat, 25 May 2024 00:32:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4D9B9CE1A4A;
 Sat, 25 May 2024 00:32:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 64256C2BBFC;
 Sat, 25 May 2024 00:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716597126;
 bh=EvgWL2BDkJOvNs1ZjmnWRRwbqncAWAl+1GT4o4nFRbU=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=kYgPZVXCpjW8Rui4RXPPp7WsjXrMfr15ROG16SIJVtyuprNKJCRoQELPc83hmINRu
 sXMEAwv1PR8+BGgEjcSURe203ZpVrQZ+dalV8xoIhXuqapK1zuRXlGN3NJX9A/9IzS
 ErPh4GHoEh6Ec6SR6eMz4VNDw/skcMM5+X6krEatqv+eNPeZYfGXNL2cIwY0EtWOOY
 NCTTvcUDEmYWEv9IXLLoxjseP3jSdr5DRFo8cwmCNRXzXZ0iRbf1WIGVn7SQF06Mhw
 J2keGsjIU/UBYkjyGaueEoGXl13Qyu1UVTatpFbfuVY6kVUOw5vmLU8A6S5lcwiwCR
 rCVwUetYBOetA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 57F3AC433F2; Sat, 25 May 2024 00:32:06 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.10-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txzvSpHASKuse2VFjbdVKftTfWNtPP8Jibck6jC_n_c1Q@mail.gmail.com>
References: <CAPM=9txzvSpHASKuse2VFjbdVKftTfWNtPP8Jibck6jC_n_c1Q@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9txzvSpHASKuse2VFjbdVKftTfWNtPP8Jibck6jC_n_c1Q@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-next-2024-05-25
X-PR-Tracked-Commit-Id: 32a0bb7ef217aa37e6b67ca7950f5e504312ed72
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 56fb6f92854f29dcb6c3dc3ba92eeda1b615e88c
Message-Id: <171659712634.25728.14253838140127757042.pr-tracker-bot@kernel.org>
Date: Sat, 25 May 2024 00:32:06 +0000
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

The pull request you sent on Sat, 25 May 2024 06:23:25 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2024-05-25

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/56fb6f92854f29dcb6c3dc3ba92eeda1b615e88c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
