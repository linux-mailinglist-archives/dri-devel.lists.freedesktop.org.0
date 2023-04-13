Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E42F6E1741
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 00:21:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C733510E14F;
	Thu, 13 Apr 2023 22:21:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FC6610E14F
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 22:21:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5E99E641FA;
 Thu, 13 Apr 2023 22:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9CCAEC433D2;
 Thu, 13 Apr 2023 22:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681424479;
 bh=88/OIL7pcebf90UeHpSbS/WTFZsHseIT9TjhS4eELnA=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=XOPp/RUHw1GQZXjn9wkp8RBCvOooew/kGx4ktSPW212FAVLLKMsENQ4pLLNPe/HAF
 07omFZGcvaVCPsLtxQMZDuvm7MNKtlRLYtn9dhwfQ8q74MdRsR+59G3knXYdtFK/IS
 hii892tXMzxe1FhjGYtorfK7S+vowDcXVHmzm40wcYpuR3UzzHbxEL64DZiRlHuVZD
 CvwqmzTSSu90PX7ShT3v97jGL+n1I/KwqSW4CxoOIDHd/GplagAjynhXs+QK1eD9ve
 xDqcDXjsjgEO1r/4mqgJDVghv9XSSOt2AiwD5qRjObbVBjyig+D2fn5cqPW/1n3ulv
 mfOC1b3VqPOlg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 8BC2CC395C5; Thu, 13 Apr 2023 22:21:19 +0000 (UTC)
Subject: Re: [PULL] drm-fixes for 6.3-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAKMK7uHy7FMdpEZLu2TTzgnGOrntBcQi_B0c=X+oT_fyUhcTDw@mail.gmail.com>
References: <CAKMK7uHy7FMdpEZLu2TTzgnGOrntBcQi_B0c=X+oT_fyUhcTDw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAKMK7uHy7FMdpEZLu2TTzgnGOrntBcQi_B0c=X+oT_fyUhcTDw@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2023-04-13
X-PR-Tracked-Commit-Id: cab2932213c5cd72a9e04e5e82002e81b946592b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f1be7b6c165f0d451c3ea2062f506bf5f130bd5e
Message-Id: <168142447956.24378.13098315995798149937.pr-tracker-bot@kernel.org>
Date: Thu, 13 Apr 2023 22:21:19 +0000
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pull request you sent on Thu, 13 Apr 2023 21:51:38 +0200:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-04-13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f1be7b6c165f0d451c3ea2062f506bf5f130bd5e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
