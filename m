Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F443577836
	for <lists+dri-devel@lfdr.de>; Sun, 17 Jul 2022 22:30:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 765A418BD13;
	Sun, 17 Jul 2022 20:30:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BDDE11A0FF;
 Sun, 17 Jul 2022 20:30:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1A1A861342;
 Sun, 17 Jul 2022 20:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6ECC7C3411E;
 Sun, 17 Jul 2022 20:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658089829;
 bh=lEdjhd01YuWenIn0jyc84AE0TeTaXh/VNHB2/XXtmBA=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=F53gc8yBXWtx7YvISWzgGhtOs26xXJvFAFdvWcm/QJHWVf/umS7xKGIcHuVIGf1yC
 cSUbvuV9b/m0ANF7oGioPFsejXZVBJFPEe1os0yP4ZhfNq2AmU+DxIGh3VtgJ02Onh
 odoEvRso4ByU68NHTd3ooTeL2IQT0lnWffGRxhy6jlFSKi2rHubeFtMq5kbe2EhGZU
 ZWSarz+f+hg5bmwy58a48nJbNZZjGGhnufNDwTRt6KcLv2Pj0+zRXBfve3yTePj9D5
 QlrLWlQJgWLm4tK+U7rK4SjxwX+ybQRor4XOXQYe6Qume/DHLVKfnA4yewXQuYuxFO
 LguUobJUiV+Rw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 5B243E45225; Sun, 17 Jul 2022 20:30:29 +0000 (UTC)
Subject: Re: [Intel-gfx] [PULL] drm-intel-fixes
From: pr-tracker-bot@kernel.org
In-Reply-To: <YtRcHpDGMbVYRU5v@intel.com>
References: <YtRcHpDGMbVYRU5v@intel.com>
X-PR-Tracked-List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <YtRcHpDGMbVYRU5v@intel.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm-intel
 tags/drm-intel-fixes-2022-07-17
X-PR-Tracked-Commit-Id: ced7866db39fc5c59ee05e154d4abc0977a17f6b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 55ea9bd666887ed4159df38d1494c204246cf2bc
Message-Id: <165808982936.1462.14773604353634760539.pr-tracker-bot@kernel.org>
Date: Sun, 17 Jul 2022 20:30:29 +0000
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
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
Cc: dim-tools@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pull request you sent on Sun, 17 Jul 2022 14:59:42 -0400:

> git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2022-07-17

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/55ea9bd666887ed4159df38d1494c204246cf2bc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
