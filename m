Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DF3AC6ECB
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 19:09:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B27510E6AB;
	Wed, 28 May 2025 17:09:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UvrY54qe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E938910E0A3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 17:09:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3E8DB629D3;
 Wed, 28 May 2025 17:09:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7F11C4CEEF;
 Wed, 28 May 2025 17:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748452180;
 bh=BJ/ZgklTcy9+MXNhe9PBNRegZQfOjXStNiGBkaVuyMU=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=UvrY54qeuqkLPbDgr89sGf0odhUehgJBEFqzF8+2/D1jUoMphYhq5neO/jcBC3yrU
 Q3wbfpG8d3kyLKUJHQAQyOuCzimf7HOoqQwh19NVyVM4CkB+j2fb4ebraDlFMBJQAD
 dskOuq/7rx5QUagmtvdtm6gLdkacj+QJnWrUvgzUpZ15jAS0DhD3lGW0f4fOGH1yJ6
 TeTQ1OFV4mxTfMcz3U8psne4V8mmoTvygrMyuTRFR4kn6N+9tf16QzG8GaCgYVUMC5
 /ZiD3d/qtCTfOisdWvE6lck1CAraXOuMwCpaPuCZYioApqdubuJOVjgjNoSXk5f38w
 kV7cjxW6PsSLQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 311EE3822D25; Wed, 28 May 2025 17:10:16 +0000 (UTC)
Subject: Re: [git pull] drm for 6.16-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tyv4CODKMbTW0Xwx4xYWgKPA0rMgThLgCy8OkF-DvVTNg@mail.gmail.com>
References: <CAPM=9tyv4CODKMbTW0Xwx4xYWgKPA0rMgThLgCy8OkF-DvVTNg@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tyv4CODKMbTW0Xwx4xYWgKPA0rMgThLgCy8OkF-DvVTNg@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-next-2025-05-28
X-PR-Tracked-Commit-Id: f8bb3ed3197966fb60bedcbdc126d2bd5bc0a77f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b08494a8f7416e5f09907318c5460ad6f6e2a548
Message-Id: <174845221480.2474092.12132473999464633723.pr-tracker-bot@kernel.org>
Date: Wed, 28 May 2025 17:10:14 +0000
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

The pull request you sent on Wed, 28 May 2025 13:51:25 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2025-05-28

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b08494a8f7416e5f09907318c5460ad6f6e2a548

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
