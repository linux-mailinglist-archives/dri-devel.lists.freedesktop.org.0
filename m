Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DAAAD08F0
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 22:11:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78F6B10EC6C;
	Fri,  6 Jun 2025 20:10:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dzJf6thx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD3DA10EC4A
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 20:10:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 040455C4C7B;
 Fri,  6 Jun 2025 20:08:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CC93C4CEEE;
 Fri,  6 Jun 2025 20:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749240653;
 bh=+GDJ0Nu5QE5EUDCUWsES7cpX0Hil+V6LCVDl8RsoSmg=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=dzJf6thxyNPeMnQoUI8w8YzFW9+1KeN0R6p+A93bb7tGwin38pJNGhe1eeL1vv8Lj
 U/LpVkYNtYJF5aV4yZ2W4QHB3fKOHFYZFcet/MlCCv4y0+MxsQEXMqQqUR+Jp0noO8
 e5FWqwh8CpkURxcc8sJkUMYK6/3D1bZyxfP95aQ/awQcaTpJgjQXuaLVvGUa31cEqu
 OAnNOQrnegO/QOMHfJGenWUwuw9thj3WGCtdKatClIe4FxYczy3XdCktvFyCScc4JS
 76RPM/sXwbQQcAe65a3ZHHCifUE/A1KQEhp4pe/DjPlfWlrxleDqw2+Oab1vNTqoZ5
 bGesadcbul2Tg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 3654F39F1DF9; Fri,  6 Jun 2025 20:11:26 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.16-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twQ4c_Xr_ZP0H2d7HT7HMrDgYGNGOSALBHO5jhjS3GimQ@mail.gmail.com>
References: <CAPM=9twQ4c_Xr_ZP0H2d7HT7HMrDgYGNGOSALBHO5jhjS3GimQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9twQ4c_Xr_ZP0H2d7HT7HMrDgYGNGOSALBHO5jhjS3GimQ@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-next-2025-06-06
X-PR-Tracked-Commit-Id: 04c8970771b4f1f39bb8453a2eeb188c4d5edbd6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e332935a540eb76dd656663ca908eb0544d96757
Message-Id: <174924068506.3964077.8177096844390618389.pr-tracker-bot@kernel.org>
Date: Fri, 06 Jun 2025 20:11:25 +0000
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

The pull request you sent on Fri, 6 Jun 2025 16:04:25 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-next-2025-06-06

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e332935a540eb76dd656663ca908eb0544d96757

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
