Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D9EAD9981
	for <lists+dri-devel@lfdr.de>; Sat, 14 Jun 2025 03:37:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA1FE10E686;
	Sat, 14 Jun 2025 01:37:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sLXHYMnj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC5810E779
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Jun 2025 01:37:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C2AED61126;
 Sat, 14 Jun 2025 01:37:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75D66C4CEE3;
 Sat, 14 Jun 2025 01:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749865047;
 bh=PANyOgUMpQ57aspGiqpd5eJuxrd70tbjfiIkPaHQ3T0=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=sLXHYMnjnNyWxnWhEG0P1mQDbFLUfmq5ZVqqGkJ18DdyrtxCiLgut6hgvWcy3mwwq
 jGl1mVtkDTpRIQzFQNLOd4hKG0CZZaL7CmrQsDVLj7ITxHScoucdNJctzkJ89xojfR
 V7GQAhzqhD6KC6PU+dbLbebx7a3ZIilK1UDuwbuqaVmBSKheFJX6+rT2gWDePdK2aG
 K8SbHXxmRGXkROjKov8KYnFN8ckwRnJduSOTROU2/6Gmhtz8kt9dWGu5v4TkBvVLPM
 DQFM6TdmQZK5Ygs08TWP2T50oswtIeSJzu9xluvd7GYu4ELX20QN5u8MqQLNhB37a3
 VNJreWjtCLvzw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33DDB380AAD0; Sat, 14 Jun 2025 01:37:58 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.16-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twFdWPhCA7-6yY27xkdnecxRJXOF5Ni8iDc9Oa5QOtukw@mail.gmail.com>
References: <CAPM=9twFdWPhCA7-6yY27xkdnecxRJXOF5Ni8iDc9Oa5QOtukw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9twFdWPhCA7-6yY27xkdnecxRJXOF5Ni8iDc9Oa5QOtukw@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2025-06-14
X-PR-Tracked-Commit-Id: 1364af9cb2c5716f1905113cc84ff77ddf16a22e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 25294cb8a404e8116eecaf2f151ee2fd6c17fb9b
Message-Id: <174986507674.952904.9196591912805895656.pr-tracker-bot@kernel.org>
Date: Sat, 14 Jun 2025 01:37:56 +0000
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

The pull request you sent on Sat, 14 Jun 2025 06:42:46 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-06-14

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/25294cb8a404e8116eecaf2f151ee2fd6c17fb9b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
