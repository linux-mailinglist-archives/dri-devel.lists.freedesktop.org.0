Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 121F8BE8ED4
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 15:37:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4F4010EC26;
	Fri, 17 Oct 2025 13:37:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="SP49e7sf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFD0210EC14;
 Fri, 17 Oct 2025 13:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=icb7i+7ku9WJXiXCeMGwCIdD78osrj3YeQeaOuYIqAg=; b=SP49e7sf6qHmxIScLmWlOQNka9
 IzsRuQ/AgBLAMhEHw//XunggwGPdPoTmai4trAD90TT0m8VIda3SO5M28zRA+NxUv+7XLwjCpQuQ9
 8WuI9K/eaeqpveN/qcVPAo7+imcraqKQV4/Wqla2o1vM0XMIefO1ILk0+q09nxgFmA13elWIYShQw
 Olc364v9YSHb2Ez3tZH6h+rS+s+HKzEmQ8dz8WQHVR4QrBA+MFJS88mNdDBrcGh8ctIaekv6r4RnX
 W5NwuEAkGtullU7WGXTCP6oheOTCYlQagUy8FChIZYNaBBkS3T5Iw701DWIVc3aqt/r3enR37E0yA
 tBSBerIg==;
Received: from [90.242.12.242] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1v9kdd-00B3vi-0y; Fri, 17 Oct 2025 15:36:57 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Min Ma <mamin506@gmail.com>, Lizhi Hou <lizhi.hou@amd.com>,
 Oded Gabbay <ogabbay@kernel.org>
Subject: [PATCH v2 14/27] accel/amdxdna: Remove drm_sched_init_args->num_rqs
 usage
Date: Fri, 17 Oct 2025 14:36:31 +0100
Message-ID: <20251017133644.44747-15-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20251017133644.44747-1-tvrtko.ursulin@igalia.com>
References: <20251017133644.44747-1-tvrtko.ursulin@igalia.com>
MIME-Version: 1.0
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

Remove member no longer used by the scheduler core.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Min Ma <mamin506@gmail.com>
Cc: Lizhi Hou <lizhi.hou@amd.com>
Cc: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/amdxdna/aie2_ctx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index ab4d66f1325d..e95e10556b00 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -528,7 +528,6 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
 	struct amdxdna_dev *xdna = client->xdna;
 	const struct drm_sched_init_args args = {
 		.ops = &sched_ops,
-		.num_rqs = DRM_SCHED_PRIORITY_COUNT,
 		.credit_limit = HWCTX_MAX_CMDS,
 		.timeout = msecs_to_jiffies(HWCTX_MAX_TIMEOUT),
 		.name = "amdxdna_js",
-- 
2.48.0

