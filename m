Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFHFMWATgWkqEAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 22:13:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5225FD1947
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 22:13:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09E3C10E2E3;
	Mon,  2 Feb 2026 21:13:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Uq5OaIjw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C219810E2E3
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 21:13:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 79F9543862;
 Mon,  2 Feb 2026 21:13:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CEF3C116C6;
 Mon,  2 Feb 2026 21:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770066780;
 bh=45JWBDcPH1hp0NOZL2h8woaDHJCkVxiD9kfgbtpkqE0=;
 h=Date:From:To:Cc:Subject:From;
 b=Uq5OaIjwH/2cJHpuay8bsuC8SV+TMEfvN7MWNrH7VcW6x28GownRmWwniLQ29/lNe
 0+mDtwjc9jMHJBNIbiyeqxn76+OFVPOqKTQmdyK8g3ffwYvsa3rnz/RqMzj1zVuK8K
 ROBX5xYLqCYY+qnlZJMqldiKi+QgXqI2D3X3AwJ0lKnjj3dLXB3jMjxo2DG9gcjGx2
 RG1khaEJfWCYuMQS6yngF+htdoWP4vEqxvxnVTqHizHjtC/HHBcwVQxlPDc9XHjY2b
 wmiyDnLEzyDLNgH1e/l+v00VCf9C1sCbbpOn4dXC6krOzjYyOpkODmuF0PjiL5Ycrm
 yuANKbHzAQ8yg==
Date: Mon, 02 Feb 2026 11:12:59 -1000
Message-ID: <2fe2b534479363ab3aad3db25fa65377@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Chen Ridong <chenridong@huawei.com>, Maarten Lankhorst <dev@lankhorst.se>,
 Maxime Ripard <mripard@kernel.org>, Natalie Vock <natalie.vock@gmx.de>,
 Waiman Long <longman@redhat.com>, cgroups@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] cgroup fixes for v6.19-rc8
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[huawei.com,lankhorst.se,kernel.org,gmx.de,redhat.com,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:torvalds@linux-foundation.org,m:chenridong@huawei.com,m:dev@lankhorst.se,m:mripard@kernel.org,m:natalie.vock@gmx.de,m:longman@redhat.com,m:cgroups@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[tj@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tj@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 5225FD1947
X-Rspamd-Action: no action

Hi Linus,

Three dmem fixes. While it's late in the cycle, all changes are confined to
kernel/cgroup/dmem.c and can only affect dmem controller users.

Thanks.

The following changes since commit 84697bf5532923f70ac99ea9784fab325c560df0:

  kernel: cgroup: Add LGPL-2.1 SPDX license ID to legacy_freezer.c (2026-01-15 22:03:15 -1000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup.git tags/cgroup-for-6.19-rc8-fixes

for you to fetch changes up to 99a2ef500906138ba58093b9893972a5c303c734:

  cgroup/dmem: avoid pool UAF (2026-02-02 06:04:13 -1000)

----------------------------------------------------------------
cgroup: Fixes for v6.19-rc8

Three dmem fixes from Chen Ridong addressing use-after-free, RCU warning,
and NULL pointer dereference issues introduced with the dmem controller.

All changes are confined to kernel/cgroup/dmem.c and can only affect dmem
controller users.

----------------------------------------------------------------
Chen Ridong (3):
      cgroup/dmem: fix NULL pointer dereference when setting max
      cgroup/dmem: avoid rcu warning when unregister region
      cgroup/dmem: avoid pool UAF

 kernel/cgroup/dmem.c | 70 ++++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 63 insertions(+), 7 deletions(-)

--
tejun
