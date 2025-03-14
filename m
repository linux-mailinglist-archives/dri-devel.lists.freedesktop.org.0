Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 525C3A60C58
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 09:57:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3800910E983;
	Fri, 14 Mar 2025 08:57:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FKQZhTEj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46D0310E983
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 08:57:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 84002A48895;
 Fri, 14 Mar 2025 08:51:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05FDDC4CEE3;
 Fri, 14 Mar 2025 08:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741942644;
 bh=Wt6EQ+gmaMT7P+wTt642ww7xztKlQ8QVzn8b8zd4uCk=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=FKQZhTEjOAJfEDJG9Yw121R83VXWVenb8BrEaUmym1B8QkYoJ4zgLlk2CvkNRVxyu
 PNO2xp/4jXtvK8ZpWd2Ez8MU8EJg03DTiFgc+CURki5RqNGj5s/ZO/hErmhU1WL0q7
 qtjo9YFZQoaR5OgUAioAv3l8uzV73bhvR+Ah+MBqW3civoOJcNDzYDRu5PEEeVKBoM
 ImHssJrGkPd6B6UbuZgNMB9TsYIJ6uloL5bscrIbZxHRUX9HT4btf0M+qCPhHEeXWs
 ceungCg36tC7Nm/qH2lMf2ISTJp0ycGfAauLfXfmSgbnQkXcYwVrL/kUAkh2PzhEU1
 BMUcdY2ZOc4ug==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EB5A53806655; Fri, 14 Mar 2025 08:57:59 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.14-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tynNkAv1s70kbsCVHj31sGTXL1AQ0Dv6n0kwr7kw1rhkA@mail.gmail.com>
References: <CAPM=9tynNkAv1s70kbsCVHj31sGTXL1AQ0Dv6n0kwr7kw1rhkA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tynNkAv1s70kbsCVHj31sGTXL1AQ0Dv6n0kwr7kw1rhkA@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2025-03-14
X-PR-Tracked-Commit-Id: d1d77326f585ccf1fb388e1bcc18a630e044577f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 00ddc3f951e266a7df5fead1cfec69b251ca7d41
Message-Id: <174194267853.2165191.4608357621548683618.pr-tracker-bot@kernel.org>
Date: Fri, 14 Mar 2025 08:57:58 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
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

The pull request you sent on Fri, 14 Mar 2025 17:11:16 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2025-03-14

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/00ddc3f951e266a7df5fead1cfec69b251ca7d41

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
