Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C80183E488
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 23:06:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A897910FF0F;
	Fri, 26 Jan 2024 22:06:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EBAA10FF0F
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 22:06:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3518862341;
 Fri, 26 Jan 2024 22:05:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 040AEC433F1;
 Fri, 26 Jan 2024 22:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706306728;
 bh=4QvJW67oQuA5OWDAolrMvi4/GfUn9uzNIjv/lnapjzw=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=rbStxWAjrZo1Lwv7Jack3YVWAjQhCRvejif6phfOYlvRj8nbbscIMMSqhSeHZ2CQb
 M4Rnbey/Sg07qxC4pEI0hffNptBmNrChBdgNXXLgT6QWtxNwA1c5KhUJWzlnRB+AmX
 /KOKb2I7Y5lTw1nKturNgvoiAAd+vGtB0tEAuytM1Otu5gnEi1lGig47eL6SmOYOdT
 Zq2pgqrJOFx8ZsYZgnwpTl+RIEhVfs4GSo6T8AsCgCc9r/cF565Wd8KxYq+u8LrAIn
 Du6NGlK8UvfQpvZ2SMQ/d6XRzHT97XtSkRKqRyNuaxnxNRonLdvCdz7dAhjRXvmYqD
 RezYAHWlm8KkQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 E5969DFF760; Fri, 26 Jan 2024 22:05:27 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.8-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tzGRDXLt3NqDcmhZHU7i2hBsL3Xn_zsTpGfOdMJH5tH9w@mail.gmail.com>
References: <CAPM=9tzGRDXLt3NqDcmhZHU7i2hBsL3Xn_zsTpGfOdMJH5tH9w@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9tzGRDXLt3NqDcmhZHU7i2hBsL3Xn_zsTpGfOdMJH5tH9w@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2024-01-27
X-PR-Tracked-Commit-Id: 987940f05735a960dd143214f7cc2d699885b625
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 168174d78157bba1315d5f8e1c66548b92c84ae9
Message-Id: <170630672792.20742.11197618829336878702.pr-tracker-bot@kernel.org>
Date: Fri, 26 Jan 2024 22:05:27 +0000
To: Dave Airlie <airlied@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pull request you sent on Sat, 27 Jan 2024 04:56:27 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2024-01-27

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/168174d78157bba1315d5f8e1c66548b92c84ae9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
