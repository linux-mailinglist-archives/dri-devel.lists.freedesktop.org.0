Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBQbFLJNq2lYcAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 22:57:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0940228236
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 22:57:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A215110E32E;
	Fri,  6 Mar 2026 21:57:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Pk3yBj7m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B47D10E32E
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 21:57:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E914F408B5;
 Fri,  6 Mar 2026 21:57:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8BACC19425;
 Fri,  6 Mar 2026 21:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772834221;
 bh=zmA5TuEAmdchLagt2OlC8j3FLPYtzSXHAiLN5Jy+gDM=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=Pk3yBj7ms0cf5T6tbkTe1sSMnN5TEwzKij35h2ui6XcdHbzG0MAOWaEnSbpcBtRMa
 QEDdfP8yfMduxytGcIL72HtwrvtVNS0aPTvkPcLBE4WD3M1EBa8GCzgaeDOGTfk/GT
 M0OQcRqLhGIXDLC6djrOF4LH0NheEvH4LZQdmhN+Pm2mTqkFfv9l51a0YFqVRTWsEk
 Za3Gk0EuV5F2T3nkvRL7+v6zX2JFHSKJ3Tz7nGyOaxB38WMfwEyjvclIC4Q6GE+3r9
 7gTI/O6CXl9B6EktEkp0d1Lm+fci7EAT0/7aQTs6Abwz5fYYr5bR8qFUcvcdlGoo7q
 NGQP6FNz7lOwQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 3FDBC3808200; Fri,  6 Mar 2026 21:57:02 +0000 (UTC)
Subject: Re: [git pull] drm fixes for 7.0-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAPM=9txfLEdF+faNUOP6_DWyKV9TnRCMGEbfA+ppnc6FJEJkMQ@mail.gmail.com>
References: <CAPM=9txfLEdF+faNUOP6_DWyKV9TnRCMGEbfA+ppnc6FJEJkMQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAPM=9txfLEdF+faNUOP6_DWyKV9TnRCMGEbfA+ppnc6FJEJkMQ@mail.gmail.com>
X-PR-Tracked-Remote: https://gitlab.freedesktop.org/drm/kernel.git
 tags/drm-fixes-2026-03-07
X-PR-Tracked-Commit-Id: 96bfe9ff7e88f0541002640acbcb3ec63c9d0130
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: dfb31428444b00824b161d8c0741d4868552813a
Message-Id: <177283422073.65918.6725534206217888332.pr-tracker-bot@kernel.org>
Date: Fri, 06 Mar 2026 21:57:00 +0000
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
X-Rspamd-Queue-Id: D0940228236
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:torvalds@linux-foundation.org,m:sima@ffwll.ch,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[pr-tracker-bot@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

The pull request you sent on Sat, 7 Mar 2026 06:30:41 +1000:

> https://gitlab.freedesktop.org/drm/kernel.git tags/drm-fixes-2026-03-07

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/dfb31428444b00824b161d8c0741d4868552813a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
