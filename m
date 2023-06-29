Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0223742B53
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jun 2023 19:34:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0B7510E3ED;
	Thu, 29 Jun 2023 17:34:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EC9C10E3ED
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 17:34:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A2275615C7;
 Thu, 29 Jun 2023 17:34:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1623BC433C0;
 Thu, 29 Jun 2023 17:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688060080;
 bh=6fDzS8S6GJhX0BHRKcZ+yXdaSTKoh7FAFJWjWKouEDc=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=iJY3NdbQ+VEqwusgtRaGx2dNHsVkvFzyqBJT+fDTeFxGVwrR6NeTtIUQA4QaLNCt8
 5dHPQuWKWsXk5xKgaYplBhka6LesgZvnubiHX6oyUKBxpqH89+Fm88giwStNbLjEAc
 DG/AU5qF0c0mdeQa3FFMdLhtIbX7XGNdrfgyq5RTSZM90/PX5bmf5a1ARBkG4NBQ66
 zH3BFFhJNUg4TgAYq9Xtr11rUoflqt1yA0ZDxr3lrJNQsmHrdL0r0eQ0wxtUzdyB+w
 xRiv+3sDnj+IXZuA2rXoVVkqXStzsmuVx2ZVIbyyNYTKIxI461eP6e4ypG8hTYB7nm
 iJj+1AL2sBWBA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 04FBDC41671; Thu, 29 Jun 2023 17:34:40 +0000 (UTC)
Subject: Re: [GIT PULL] fbdev fixes for v6.5-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZJp/DpaLeYq6s3hB@ls3530>
References: <ZJp/DpaLeYq6s3hB@ls3530>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZJp/DpaLeYq6s3hB@ls3530>
X-PR-Tracked-Remote: http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git
 tags/fbdev-for-6.5-rc1
X-PR-Tracked-Commit-Id: c2d22806aecb24e2de55c30a06e5d6eb297d161d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 675285ad819293844018aa8096ba9a6d7c77b90b
Message-Id: <168806008001.7356.17414940393085478476.pr-tracker-bot@kernel.org>
Date: Thu, 29 Jun 2023 17:34:40 +0000
To: Helge Deller <deller@gmx.de>
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
Cc: linux-fbdev@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pull request you sent on Tue, 27 Jun 2023 08:17:50 +0200:

> http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.5-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/675285ad819293844018aa8096ba9a6d7c77b90b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
