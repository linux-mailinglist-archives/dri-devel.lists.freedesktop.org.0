Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FEDC90E4D
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 06:43:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B36F10E0EA;
	Fri, 28 Nov 2025 05:43:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="F9Qhixqe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 713B910E0EA
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 05:43:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 274F542B7B;
 Fri, 28 Nov 2025 05:43:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE5D5C4CEF1;
 Fri, 28 Nov 2025 05:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764308591;
 bh=qksVU/Su9/xnfbbp8R2/BEBuOyDVKcPXtlhG2RdO1vY=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=F9QhixqeUx1qQm1IUacoLNCS+ihZlpJDHfkxDbbVyO47SZ9ieC0D0GwQAluAn0fsT
 2H05uEUyk1vy41Qxj9+0pjtyJEqoFzDScGh4J651E3EwjtgFMWb+zBW57wpixbMji+
 k5JBFK47SXD2Y2JD3Wvt9hRqehvxvfjnE0u7JmPTzm77zfcH62c84LZPvYo6BDIT4m
 ZatWZzxF9PQ1z1HH8jEXDbcCyIfXWnVOMe2SuIFGNGmnpZwPX5A38QIY4GNh5hthZX
 DqNZ0al3QAgwDhYD3wagIQzKQsOD69vpVIRf7qw5xIHaSeIwoQNk/yVw+D6syvMHzq
 TPbf2DtwwBrYw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 4140E3808205; Fri, 28 Nov 2025 05:40:14 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.18 final
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twp8AapPsQGjVqdNhU9BxyR28-wngDH3zrTyBxoqDb+OQ@mail.gmail.com>
References: <CAPM=9twp8AapPsQGjVqdNhU9BxyR28-wngDH3zrTyBxoqDb+OQ@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9twp8AapPsQGjVqdNhU9BxyR28-wngDH3zrTyBxoqDb+OQ@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2025-11-28
X-PR-Tracked-Commit-Id: 6dbcb801e1eb1b1764fd0012918225b60dd7916c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e538109ac71d801d26776af5f3c54f548296c29c
Message-Id: <176430841279.340903.9272750952244765314.pr-tracker-bot@kernel.org>
Date: Fri, 28 Nov 2025 05:40:12 +0000
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

The pull request you sent on Fri, 28 Nov 2025 14:16:57 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-11-28

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e538109ac71d801d26776af5f3c54f548296c29c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
