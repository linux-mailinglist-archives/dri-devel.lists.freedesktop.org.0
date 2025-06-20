Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80304AE13DC
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 08:34:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EEE110E0C3;
	Fri, 20 Jun 2025 06:34:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tJAVlss/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBFFC10E0C3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 06:34:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CA8F961785;
 Fri, 20 Jun 2025 06:34:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E6F1C4CEED;
 Fri, 20 Jun 2025 06:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750401248;
 bh=dVLl9EUNjWGmiCDhYmFZI0+MgMZZogKvTobR1Gx3A2c=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=tJAVlss/09O6zE7KKmNPbBz0UmB+exM4jzNe60pNIN97PKIsUGVuuIrBueB2KvOWX
 mCZA3Brz50zjPKeCS1BNv/0y9BUwtQmoEBKzE4Vn9p8f3JuOtQv6JswrlnD7NhA0dK
 Rf+uQA6fQcccDtJjqIMgAUGjmsJkgnaSMzKZdOl8Eoe0v6XS8xWQR6kpVcNZr2OSbk
 9RhzGQsTiCt0dB+o3I/Sa/ksf7qPDmaCq3hgcN/ZHQbYJqneiS7fxUFO5ZQsRYI87Q
 NFYTrLu1kJ2iKTHKQrp2RPm2101U9cFEdYt6+3OvLJvugx2MmqNDhcpmml3lNIcOgt
 /paObgyybkJQw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADC2638111DD; Fri, 20 Jun 2025 06:34:37 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.16-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txjJTL-dgwgrZbsiQzAHxe97vQ6mrttCxnf0okZQ5t3gQ@mail.gmail.com>
References: <CAPM=9txjJTL-dgwgrZbsiQzAHxe97vQ6mrttCxnf0okZQ5t3gQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9txjJTL-dgwgrZbsiQzAHxe97vQ6mrttCxnf0okZQ5t3gQ@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2025-06-20
X-PR-Tracked-Commit-Id: b8de9b21e8499a09ef424e101a8703e8e1866bfd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5f2b6c5f6b692c696a232d12c43b8e41c0d393b9
Message-Id: <175040127634.1104049.1483328524375191524.pr-tracker-bot@kernel.org>
Date: Fri, 20 Jun 2025 06:34:36 +0000
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

The pull request you sent on Fri, 20 Jun 2025 13:25:32 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-06-20

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5f2b6c5f6b692c696a232d12c43b8e41c0d393b9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
