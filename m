Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEA7C085C2
	for <lists+dri-devel@lfdr.de>; Sat, 25 Oct 2025 01:57:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40F3510E20D;
	Fri, 24 Oct 2025 23:57:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Y8/vLx1A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADDD410E20D
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 23:57:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D0C50601F6;
 Fri, 24 Oct 2025 23:57:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FA10C4CEF5;
 Fri, 24 Oct 2025 23:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761350266;
 bh=+Abpmx80dHyLdRXIXAEx6hgQNdKU00coHtI7fLEuwRc=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=Y8/vLx1ApQeihaTL0vL/8zWOEihCTuEGoaZgFduT4RNhnc0gkcmEktKHWb1v7k4gP
 Z7q4hyFiNHqFqRxqCSp55q68nIF4B7a/NjFkCsTyR2KX8+qgx1VmMhQZt3oUzrLOPu
 RCXGuL90yZFlUAeTOJs+Jid0eZsaHKmVF2JNYLtkweODLtrGnViQVxbjypZ8JzUoFe
 HYCX5kyg2vWRYY16NA6ZjOUEhEQqMmGuswExSERftzPKLd6HmqJHOcqrECX8Gdv2/b
 F5i00q9a+apdl1re7NxmwAwg3jIQe5GGm2zl7eKaPZU9jnZpK10Z1Z6ZuNNqarWPSn
 nsaB3i2BEA1YQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70E91380AA54; Fri, 24 Oct 2025 23:57:27 +0000 (UTC)
Subject: Re: [PULL] drm-fixes for -rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <aPvojo5uhoAatX2Y@phenom.ffwll.local>
References: <aPvojo5uhoAatX2Y@phenom.ffwll.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aPvojo5uhoAatX2Y@phenom.ffwll.local>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2025-10-24
X-PR-Tracked-Commit-Id: 18b1ce0b29c41833363b58ad030b76dabf984899
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3d08a425d2f667edf9ab7f9c3d999c218a96ba6f
Message-Id: <176135024595.4099580.14354874840145229936.pr-tracker-bot@kernel.org>
Date: Fri, 24 Oct 2025 23:57:25 +0000
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@gmail.com>
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

The pull request you sent on Fri, 24 Oct 2025 22:58:54 +0200:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-10-24

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3d08a425d2f667edf9ab7f9c3d999c218a96ba6f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
