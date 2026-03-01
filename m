Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGM2OsyTo2khHQUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 02:18:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFD01CA1AD
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 02:18:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF1C610E2E3;
	Sun,  1 Mar 2026 01:18:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JPOR7K5r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45CAF10E2E3
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Mar 2026 01:18:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B993460008;
 Sun,  1 Mar 2026 01:18:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0F86C19421;
 Sun,  1 Mar 2026 01:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772327881;
 bh=oX7yNXLTbGvb/uLyVqm7AKZQ66U23OfAjbAu/LYXgog=;
 h=From:To:Cc:Subject:Date:From;
 b=JPOR7K5rSRB4KX1UOKfu5o5njdXeiL8IrZXDRzZ7EIQBShZk7KIB7BzEJJXPROsrw
 S+mrLewpyxD9WIrUezg8WoIYOa4nTaikGYDOPFKdXMfk/whtBB+Mwl3jjmSdX6Mf0P
 UnjSik284g+23HavyqtOEB3TU4KXcK5s0rH3W0FkYvKYXvW0pDOa/yiiI4M+FKpiCz
 ygJ1d/VWOzMtjASZYtH6DegUkw/LBr8+dmp1ZG9wIZpEf8lI1ycCfId4umOFcn+AuS
 Tj/ShhnREMN9Xp+klvUqMyo+aq8c3veFdg8TXXD6VwMgcqyA6the4jpBLYiNMFo/WY
 Fwhizh0rtiG+A==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	olvaffe@gmail.com
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Steven Price <steven.price@arm.com>,
 dri-devel@lists.freedesktop.org
Subject: FAILED: Patch "drm/panthor: fix for dma-fence safe access rules"
 failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:17:59 -0500
Message-ID: <20260301011759.1672072-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
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
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:stable@vger.kernel.org,m:olvaffe@gmail.com,m:boris.brezillon@collabora.com,m:liviu.dudau@arm.com,m:steven.price@arm.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[sashal@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:email]
X-Rspamd-Queue-Id: 8DFD01CA1AD
X-Rspamd-Action: no action

The patch below does not apply to the 6.12-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From efe24898485c5c831e629d9c6fb9350c35cb576f Mon Sep 17 00:00:00 2001
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 4 Dec 2025 09:45:45 -0800
Subject: [PATCH] drm/panthor: fix for dma-fence safe access rules

Commit 506aa8b02a8d6 ("dma-fence: Add safe access helpers and document
the rules") details the dma-fence safe access rules. The most common
culprit is that drm_sched_fence_get_timeline_name may race with
group_free_queue.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Reviewed-by: Steven Price <steven.price@arm.com>
Cc: stable@vger.kernel.org # v6.17+
Signed-off-by: Steven Price <steven.price@arm.com>
Link: https://patch.msgid.link/20251204174545.399059-1-olvaffe@gmail.com
---
 drivers/gpu/drm/panthor/panthor_sched.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index a17b067a04392..0f83e778d89aa 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -23,6 +23,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/rcupdate.h>
 
 #include "panthor_devfreq.h"
 #include "panthor_device.h"
@@ -943,6 +944,9 @@ static void group_release_work(struct work_struct *work)
 						   release_work);
 	u32 i;
 
+	/* dma-fences may still be accessing group->queues under rcu lock. */
+	synchronize_rcu();
+
 	for (i = 0; i < group->queue_count; i++)
 		group_free_queue(group, group->queues[i]);
 
-- 
2.51.0




