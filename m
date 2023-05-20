Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C09C570A4E1
	for <lists+dri-devel@lfdr.de>; Sat, 20 May 2023 05:23:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3412610E059;
	Sat, 20 May 2023 03:23:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99EF310E059
 for <dri-devel@lists.freedesktop.org>; Sat, 20 May 2023 03:23:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B87C860FF8;
 Sat, 20 May 2023 03:23:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 27258C433EF;
 Sat, 20 May 2023 03:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684553012;
 bh=rwaoAboul94zfZFz6cOl695czqDtXxXDpRdPkgYovmw=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=G1gX6HHbjNrjdUH/rpKxAHBM7aCF0ENv1tSR/XL0ykxur1RjWf26nNnXJpAUiCl7S
 VCMe0tAsJ0NNHE5qKcrAFCZlOzn1srKdKje7bUao4xaOt8qCIisq3yGnCbKtAoAkz/
 /U8ncpsKv7/edTSA4BbTTBUkcDDGQYFTJmCnUbS+atZkNsIv5TnVqoZHnMuF3OFCHM
 juCUcYoTTGAoBlwiw4a9EYIsazocCbWt6jPK0njRx70f9w+PzLByA92hxE6XEOGdRe
 p06Xe2dY4xk9HEeb4JlDXUhu4b9jXc8MM+R3AqgHui66Ua4tlIr6U54/AEk/7Y74M2
 WWFabt+uNw33Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 1549AC73FE0; Sat, 20 May 2023 03:23:32 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 6.4-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9twwK+sN8iTjojdXd0waG0CUKmDqgyKuBvg76-cjT3PWxA@mail.gmail.com>
References: <CAPM=9twwK+sN8iTjojdXd0waG0CUKmDqgyKuBvg76-cjT3PWxA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9twwK+sN8iTjojdXd0waG0CUKmDqgyKuBvg76-cjT3PWxA@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2023-05-20
X-PR-Tracked-Commit-Id: 79ef1c9d14c65a5c3f7eec47389d8c2a33be8e8d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d635f6cc934bcd467c5d67148ece74632fd96abf
Message-Id: <168455301207.31362.16072827749088539245.pr-tracker-bot@kernel.org>
Date: Sat, 20 May 2023 03:23:32 +0000
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pull request you sent on Sat, 20 May 2023 11:09:38 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2023-05-20

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d635f6cc934bcd467c5d67148ece74632fd96abf

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
