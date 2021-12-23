Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F32C647E9AE
	for <lists+dri-devel@lfdr.de>; Fri, 24 Dec 2021 00:46:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3194810E136;
	Thu, 23 Dec 2021 23:46:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EADDA10E136
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Dec 2021 23:46:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2C3B1B8212A;
 Thu, 23 Dec 2021 23:46:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5754C36AE5;
 Thu, 23 Dec 2021 23:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640303169;
 bh=mBt988pV4kWE/KH2zKVeh/zXjm3TAeqjnonncY9U4qA=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=EX1FlIiF3tWqZ6eChU35r/WN5cLAwedmI2iQLZsiTp7GWk+CVaprP0g9zeLpP7hti
 Ry1/Pf3ROptuAYndD5B0YIegzdy+xo3jiPdts/aqB93lWXJaIuDoTp0pAx41UYYqoG
 QR3GJ61KyxYaZsXKbJWZuHnCP5S3+6BwsSw/6e3qpA50Say1Zg/S7I6MU1MlBR9G59
 dNQRuiHEKvKK6XyVtUw8h3b+4bEhY4eEuwai5LGLFflHC6Nt2hmHG2//BTEkT9OYPf
 VYh4YSOoD9NFHEmxw+HMydS+uZYiISnnAgDlhw59Q8fDUZ7a8a8XVhsC2CPV8qGXRR
 RTV7mU0wgC1vA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 AE28AEAC06C; Thu, 23 Dec 2021 23:46:09 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 5.16-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9ty=B0ZvuwiQExR2-RoCZo18DZYrKMzTfK8-00psKncw9w@mail.gmail.com>
References: <CAPM=9ty=B0ZvuwiQExR2-RoCZo18DZYrKMzTfK8-00psKncw9w@mail.gmail.com>
X-PR-Tracked-List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
X-PR-Tracked-Message-Id: <CAPM=9ty=B0ZvuwiQExR2-RoCZo18DZYrKMzTfK8-00psKncw9w@mail.gmail.com>
X-PR-Tracked-Remote: git://anongit.freedesktop.org/drm/drm
 tags/drm-fixes-2021-12-24
X-PR-Tracked-Commit-Id: dbfba788c7ef839849e013264fef551e4d119d0b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 95b40115a97bda99485267ca2b3b7566f965b5b4
Message-Id: <164030316965.13743.3716169270809623738.pr-tracker-bot@kernel.org>
Date: Thu, 23 Dec 2021 23:46:09 +0000
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

The pull request you sent on Fri, 24 Dec 2021 08:14:51 +1000:

> git://anongit.freedesktop.org/drm/drm tags/drm-fixes-2021-12-24

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/95b40115a97bda99485267ca2b3b7566f965b5b4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
