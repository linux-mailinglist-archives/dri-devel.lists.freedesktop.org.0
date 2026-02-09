Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJ0wICPliWnpDgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 14:46:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE4010FDB4
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 14:46:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2271710E025;
	Mon,  9 Feb 2026 13:46:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="m88SHKNd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 933 seconds by postgrey-1.36 at gabe;
 Mon, 09 Feb 2026 11:42:48 UTC
Received: from relay.virtuozzo.com (relay.virtuozzo.com [130.117.225.111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5F9410E066;
 Mon,  9 Feb 2026 11:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=Content-Type:MIME-Version:Message-ID:Date:Subject
 :From; bh=IIec2LSknqxkoPqpM3FPJF5Lz7rAFB101XiUbTj0NDI=; b=m88SHKNdjE5eDjtidGh
 Si4TM66ruxN8sBL7OGnbMvPmkxcPjD+h896ZhMd7qsndsH4ALdHDinNP24M5O3xnIEr9X0L7TFl7L
 36PiYNGjkBvByfWns00qPTnKqxmOoszkWcSyeY0IzHxMB0szbhG6UNuPB62nxyKjRWF+2eG6zObfW
 1sfNXixiSSjREb5iEN1HyEgtty3Zb34izkA0+K7ttsSN4i2QwIwSOQt4nSloxCOFtaVW+zX+sz4cf
 bm6B5CFh97UaqjvoLZOtYSIiCewScbq+FGlJ37nps/RbFRFp+ZUkg7AIR8slzz9gjvyP6KfwwoboS
 ts+kJRg4isDf9Xg==;
Received: from ch-demo-asa.virtuozzo.com ([130.117.225.8] helo=f0.vzint.dev)
 by relay.virtuozzo.com with esmtp (Exim 4.96)
 (envelope-from <khorenko@virtuozzo.com>) id 1vpPP9-00DGir-16;
 Mon, 09 Feb 2026 12:27:01 +0100
From: Konstantin Khorenko <khorenko@virtuozzo.com>
To: John Harrison <John.C.Harrison@Intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Konstantin Khorenko <khorenko@virtuozzo.com>
Subject: [PATCH] drm/i915/guc: fix corrupted copyright symbols in selftest
 files
Date: Mon,  9 Feb 2026 12:27:09 +0100
Message-ID: <20260209112709.2551603-1-khorenko@virtuozzo.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 09 Feb 2026 13:46:07 +0000
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[virtuozzo.com,quarantine];
	R_DKIM_ALLOW(-0.20)[virtuozzo.com:s=relay];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[khorenko@virtuozzo.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[virtuozzo.com:+]
X-Rspamd-Queue-Id: DBE4010FDB4
X-Rspamd-Action: no action

Replace broken UTF-8 sequences (Unicode replacement characters) with
proper "©" text in copyright headers.

Signed-off-by: Konstantin Khorenko <khorenko@virtuozzo.com>
---
 drivers/gpu/drm/i915/gt/uc/selftest_guc.c           | 2 +-
 drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
index 68feb55654f77..0ef294bef00b9 100644
--- a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: MIT
 /*
- * Copyright �� 2021 Intel Corporation
+ * Copyright © 2021 Intel Corporation
  */
 
 #include "gt/intel_gt_print.h"
diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c
index a40e7c32e6137..28e8a092f4e7d 100644
--- a/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c
+++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: MIT
 /*
- * Copyright �� 2019 Intel Corporation
+ * Copyright © 2019 Intel Corporation
  */
 
 #include "gt/intel_gt_print.h"
-- 
2.43.0

