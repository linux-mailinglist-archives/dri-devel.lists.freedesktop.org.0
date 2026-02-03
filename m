Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDz1OT5NgWlRFgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 02:19:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9E3D34F6
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 02:19:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D7B910E49A;
	Tue,  3 Feb 2026 01:19:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FOBJLlDv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E83D210E2F7
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 01:19:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E23D9600AA;
 Tue,  3 Feb 2026 01:19:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93C0EC116C6;
 Tue,  3 Feb 2026 01:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770081592;
 bh=/FYS35MMKL2tNo84SVyfH8r3fkD9uXXdm1le6ysArqE=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=FOBJLlDviMB4Lu5twl1e4nZCkD+TYBBwLSZZDCjisDeTRpsnljF/20iZcno0xd8GM
 rVSPHjf01IurEtORwWErRrFDjagHP5MVuMlgIbmgG8Vi71ZNLCkEVSKU7gvUmzhtJr
 ufszGdyZ+jrfbyFE/Myrc+6R9dwt9HdrVhpOD5QJGxCkfLgiQKuh7DaVgb3LO3+y+g
 3I30sUL69wh0pRZJkmyt9/rcDy8nEcxk3nF4kaWZXYIuP6V79adr3YcoCNPabYRxdu
 WgY6WG3QEfXNc6gSdJu8za5ygxN3jZIB201dZgEZ+VGaoYgHogPgwBur7eCkARANcL
 eE2FPGYYgUnpQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 9115A3808200; Tue,  3 Feb 2026 01:19:50 +0000 (UTC)
Subject: Re: [GIT PULL] cgroup fixes for v6.19-rc8
From: pr-tracker-bot@kernel.org
In-Reply-To: <2fe2b534479363ab3aad3db25fa65377@kernel.org>
References: <2fe2b534479363ab3aad3db25fa65377@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <2fe2b534479363ab3aad3db25fa65377@kernel.org>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup.git
 tags/cgroup-for-6.19-rc8-fixes
X-PR-Tracked-Commit-Id: 99a2ef500906138ba58093b9893972a5c303c734
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6bd9ed02871f22beb0e50690b0c3caf457104f7c
Message-Id: <177008158913.1261185.17599032125609778758.pr-tracker-bot@kernel.org>
Date: Tue, 03 Feb 2026 01:19:49 +0000
To: Tejun Heo <tj@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Chen Ridong <chenridong@huawei.com>, Maarten Lankhorst <dev@lankhorst.se>,
 Maxime Ripard <mripard@kernel.org>, Natalie Vock <natalie.vock@gmx.de>,
 Waiman Long <longman@redhat.com>, cgroups@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,huawei.com,lankhorst.se,kernel.org,gmx.de,redhat.com,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[pr-tracker-bot@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tj@kernel.org,m:torvalds@linux-foundation.org,m:chenridong@huawei.com,m:dev@lankhorst.se,m:mripard@kernel.org,m:natalie.vock@gmx.de,m:longman@redhat.com,m:cgroups@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 7A9E3D34F6
X-Rspamd-Action: no action

The pull request you sent on Mon, 02 Feb 2026 11:12:59 -1000:

> https://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup.git tags/cgroup-for-6.19-rc8-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6bd9ed02871f22beb0e50690b0c3caf457104f7c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
