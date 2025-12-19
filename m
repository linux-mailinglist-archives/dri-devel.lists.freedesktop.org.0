Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A947CD026F
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 14:54:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8EE010EFCE;
	Fri, 19 Dec 2025 13:54:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="W3bccaJD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BB3F10EFBC;
 Fri, 19 Dec 2025 13:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CiT8IuSZ3q5Tl6/5nyWS4ob4rb7i5bWvgmniMwBUPLk=; b=W3bccaJDPKDoxAvE3rMVcH6xND
 WppdN+oW4Xa5VsR924HzS0vavl25M+4idIET4kIYjIfDqHeGkPMfj3xQ8CtvjG4aiaE6w0uVmKHFJ
 g+MQi52GljN5FpMQsNIXGhfkmEte1aNSXlAw5/hFqimRC+Ze61xZR6/y9/LBDTJdABT7AoAcoYYEj
 PcnzGXFDhiPnhTOw6Insc8uEqF2DoBkMf8UwH/plkTHCYG6z/StdWKj/uzSeDxWMis6KlG3E0oJO6
 0r3BXFoTyiKW3WhlzQZ+V5nvEaZA3gWgyVDSXPtQJwITbU5/KfrgRlsV19cK67gnnCRIydx7aDEnI
 tGhZSIYQ==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with utf8esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vWavu-00Eehi-Th; Fri, 19 Dec 2025 14:54:15 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Min Ma <mamin506@gmail.com>, Lizhi Hou <lizhi.hou@amd.com>,
 Oded Gabbay <ogabbay@kernel.org>
Subject: [PATCH v5 14/28] accel/amdxdna: Remove drm_sched_init_args->num_rqs
 usage
Date: Fri, 19 Dec 2025 13:53:36 +0000
Message-ID: <20251219135351.25880-15-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251219135351.25880-1-tvrtko.ursulin@igalia.com>
References: <20251219135351.25880-1-tvrtko.ursulin@igalia.com>
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
Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_ctx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index 5511ab2ef242..ae4c34b76cdb 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -558,7 +558,6 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
 	struct amdxdna_dev *xdna = client->xdna;
 	const struct drm_sched_init_args args = {
 		.ops = &sched_ops,
-		.num_rqs = DRM_SCHED_PRIORITY_COUNT,
 		.credit_limit = HWCTX_MAX_CMDS,
 		.timeout = msecs_to_jiffies(HWCTX_MAX_TIMEOUT),
 		.name = "amdxdna_js",
-- 
2.51.1

