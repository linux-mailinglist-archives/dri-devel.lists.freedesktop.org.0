Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7050ABCE37B
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 20:25:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4E9910EC6B;
	Fri, 10 Oct 2025 18:25:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="l6O+yOmO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F421010EC6B
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 18:25:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 23A2A602E3;
 Fri, 10 Oct 2025 18:25:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C63A2C4CEF1;
 Fri, 10 Oct 2025 18:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760120755;
 bh=y8fzFnlKunWEVat2RXlybSvQtyQAeDPzKvb7bm0YiXc=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=l6O+yOmOKx4iHMva2BFIJpVqz9f3UwLpP4446+ygYKeVWVCFtxZJyDvF8Tieptphl
 WSjTpFlMTuMcg59J9+UwUnJj7lBiImyUAuHiJWz1PPhEbQppzZuEfKMjD4djiedEcI
 fLPbr+eHQlaOwguOTe2WYKYra4frWWi/m1qex0QQp0H0QJIiVVqJfT9OusDpWp3BIp
 ADVFZD+s9UFtoBoYhYOL0j6WdU5XMFxTl5MsQMpzR7hGgkAsLLhTWFh2wFe6Fp0Zu+
 Q2DJ42Cl1MyzJrSEEPHBIR+zzLpoMvlFEdroAVYvr8tRbJebwtD/VpObZTcwJjzVU6
 8bNR/AhpLa9rA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70CB03809A00; Fri, 10 Oct 2025 18:25:44 +0000 (UTC)
Subject: Re: [GIT PULL] fbdev updates for v6.18-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <aOkKroU5EAorYET0@carbonx1>
References: <aOkKroU5EAorYET0@carbonx1>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <aOkKroU5EAorYET0@carbonx1>
X-PR-Tracked-Remote: http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git
 tags/fbdev-for-6.18-rc1
X-PR-Tracked-Commit-Id: 15df28699b28d6b49dc305040c4e26a9553df07a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 06a88f47990974f1322c2bf2e8c5125f8a2f69fe
Message-Id: <176012074303.1074429.6013388198844623304.pr-tracker-bot@kernel.org>
Date: Fri, 10 Oct 2025 18:25:43 +0000
To: Helge Deller <deller@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
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

The pull request you sent on Fri, 10 Oct 2025 15:31:26 +0200:

> http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.18-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/06a88f47990974f1322c2bf2e8c5125f8a2f69fe

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
