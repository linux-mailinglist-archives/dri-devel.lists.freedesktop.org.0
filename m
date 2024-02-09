Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E5B84FC35
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 19:46:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F6A610F975;
	Fri,  9 Feb 2024 18:46:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iCeb2hpj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D71610F975
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Feb 2024 18:46:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E345D62162;
 Fri,  9 Feb 2024 18:46:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9249EC43394;
 Fri,  9 Feb 2024 18:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707504382;
 bh=UjGzbJnF990WfC0Wgu/z17brvharXCEJIuwvkJvTiTE=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=iCeb2hpj4CN5OogHyH/B0Cq8H8ZlddWMH9DIqGbjLf70ghLF9cT2eZH4959+3zfDg
 anV+9/ZtjKqBgsQ6ai1/YgUwqFHZyF57lAFUa9V01V4H7WYLgsHOgKBO5/9nThVVWh
 /gPmjNGzdWX/IoHoUktlP/4ZDjZr2TItB6QM5MR6sf+sIzVcyC9/Es4gAkjasOs1PL
 JzwNjbFBRmCrCtQw9o3JBIVgZgLCs8bADEiAv5JGn8a5+v3V9R/ghEgzpvDYAHzg6j
 jepVO7sHScaAdtjjV5RmlxLeecUFtJ0yeJVIN0v2wA8zV//SZe47jLPXlbiPB7g8c7
 CD/vBvJMC3Odw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 7EE10C41677; Fri,  9 Feb 2024 18:46:22 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.8-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9tykW0CySOLSBfxiopj2xSnBi18LtzuFHmabFY3kFhZ6Lw@mail.gmail.com>
References: <CAPM=9tykW0CySOLSBfxiopj2xSnBi18LtzuFHmabFY3kFhZ6Lw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9tykW0CySOLSBfxiopj2xSnBi18LtzuFHmabFY3kFhZ6Lw@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2024-02-09
X-PR-Tracked-Commit-Id: 311520887d7cad2d5494933bd19bf85eb5398ffc
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c76b766ec50d3d43e2dacea53a733b285f4b730d
Message-Id: <170750438251.872.15630540874101800153.pr-tracker-bot@kernel.org>
Date: Fri, 09 Feb 2024 18:46:22 +0000
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
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

The pull request you sent on Fri, 9 Feb 2024 14:28:39 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2024-02-09

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c76b766ec50d3d43e2dacea53a733b285f4b730d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
