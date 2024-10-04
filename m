Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42952990BEC
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 20:39:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7C6310EA82;
	Fri,  4 Oct 2024 18:39:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lMnE1V5d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F0E210EA82
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2024 18:39:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B7ADB5C4CE4;
 Fri,  4 Oct 2024 18:39:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9956AC4CEC6;
 Fri,  4 Oct 2024 18:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728067174;
 bh=2ykzZZbh22oVJUGkvFyufnuf7+aYCIIm3sqRdBAk15Q=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=lMnE1V5doOKaZ3aH3qWJG7WWuypsyVTppQjMgRX97ciGsamn2SvDYstyBpPaTg2+/
 pXd1YC9FXMrrSY++CQxh4iWsjBhPpL1yRWjumeHQ10yqhcqYT68uQ8OouyGwVfRlBZ
 E2PMiZqtnGmUBW36Cg5oP6OEPsm+5okp+f5GOJyr4gq/bLjGQgQ83c2zfeaW3uI62s
 UsDPD1kirtQePJzf1eRfXDq/684A87v45owTcOhZtHM5wb0CPiTCmiio6Ii6OUxH6+
 sZSXsMuEi8x55GIcsYDlYN3O9DUWwKqWAsesSVkfrEnETHawlfgVHQqk7yPxAv9fWL
 SYxtIe294iOmw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 7132C39F76FF; Fri,  4 Oct 2024 18:39:39 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.12-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twn+on88T+O=_6LmVt2u-Lipxx3q_bp566owK9t+9UuMg@mail.gmail.com>
References: <CAPM=9twn+on88T+O=_6LmVt2u-Lipxx3q_bp566owK9t+9UuMg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9twn+on88T+O=_6LmVt2u-Lipxx3q_bp566owK9t+9UuMg@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2024-10-04
X-PR-Tracked-Commit-Id: 5b272bf7dcf969eb4f19ef994b6e60458ee6300f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fe6fceceaecf4c7488832be18a37ddf9213782bc
Message-Id: <172806717802.2698437.9192339503974154951.pr-tracker-bot@kernel.org>
Date: Fri, 04 Oct 2024 18:39:38 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Sima Vetter <sima@ffwll.ch>,
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

The pull request you sent on Fri, 4 Oct 2024 14:06:23 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2024-10-04

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fe6fceceaecf4c7488832be18a37ddf9213782bc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
