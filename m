Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4AB82A9A2
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:52:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 955B010E808;
	Thu, 11 Jan 2024 08:51:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.7])
 by gabe.freedesktop.org (Postfix) with ESMTP id 53E2610E570
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 06:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=AFybaTdIOLDtKhWkjS
 fj+9IhSzf1uJELy1AANTtfmo0=; b=By7FeYAzNlDev86pD7wDPMImb7EtMtXVbC
 noDgGmkQyvvCvvE0JsI5wQ5/LwRKfXqwa+NLVwUIa8IUNFBSdIJSRsXjJuijZS5H
 o75UmWz7/MXrdATfvctsw9toXtjLgVvdDtl0YtLXgGa/WscIiosW822NJCFsgcdy
 pSePYl4xE=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g0-4 (Coremail) with SMTP id _____wD3P_XnjZ9lXE2hAA--.3673S2; 
 Thu, 11 Jan 2024 14:42:47 +0800 (CST)
From: chenxuebing <chenxb_99091@126.com>
To: airlied@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 daniel@ffwll.ch, tzimmermann@suse.de
Subject: [PATCH] drm: Clean up errors in drm_dp_mst_topology.h
Date: Thu, 11 Jan 2024 06:42:45 +0000
Message-Id: <20240111064245.8789-1-chenxb_99091@126.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wD3P_XnjZ9lXE2hAA--.3673S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tFW7Xw43AF43WF43ZFy8uFg_yoW8GrWfpr
 WqkrZrK34IkanIkw4UZF1Uur4DGan7Xryxtr45Cws3tay5Ar1rX3WUKFy3tr17XFZ2y34f
 trZ7uF17GF92kw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UFLv_UUUUU=
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: hfkh05lebzmiizr6ij2wof0z/1tbiGAtixWVLZWcFvwAAsi
X-Mailman-Approved-At: Thu, 11 Jan 2024 08:50:44 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 chenxuebing <chenxb_99091@126.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: space prohibited before open square bracket '['

Signed-off-by: chenxuebing <chenxb_99091@126.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index bd6c24d4213c..a4a24ec11b80 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -100,7 +100,7 @@ static bool drm_dp_mst_port_downstream_of_branch(struct drm_dp_mst_port *port,
 
 #define DBG_PREFIX "[dp_mst]"
 
-#define DP_STR(x) [DP_ ## x] = #x
+#define DP_STR(x)[DP_ ## x] = #x
 
 static const char *drm_dp_mst_req_type_str(u8 req_type)
 {
@@ -131,7 +131,7 @@ static const char *drm_dp_mst_req_type_str(u8 req_type)
 }
 
 #undef DP_STR
-#define DP_STR(x) [DP_NAK_ ## x] = #x
+#define DP_STR(x)[DP_NAK_ ## x] = #x
 
 static const char *drm_dp_mst_nak_reason_str(u8 nak_reason)
 {
@@ -156,7 +156,7 @@ static const char *drm_dp_mst_nak_reason_str(u8 nak_reason)
 }
 
 #undef DP_STR
-#define DP_STR(x) [DRM_DP_SIDEBAND_TX_ ## x] = #x
+#define DP_STR(x)[DRM_DP_SIDEBAND_TX_ ## x] = #x
 
 static const char *drm_dp_mst_sideband_tx_state_str(int state)
 {
-- 
2.17.1

