Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7073AAF8CCD
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 10:53:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69B1610E995;
	Fri,  4 Jul 2025 08:53:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=qq.com header.i=@qq.com header.b="m9rnZ8wR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out203-205-221-252.mail.qq.com (out203-205-221-252.mail.qq.com
 [203.205.221.252])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B508710E1EF
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 03:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1751600028; bh=bFXOKhRD3XQTRhPLxEM3PAo9vfwaWA7EHK/JAyHGCdI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=m9rnZ8wR7E2SJK1ZlCM0l0lChTTSGf1IdbMTftjAWYdJhbuFBdpdXOO1YV67uwdwZ
 G48sdsC+8dpvSXIhIBtm4DGiOeWpo+EVhwOSocAwiKCJWC+uyRWASNq7mpWGVQIeHt
 As5jaYvT4o3FgIUX8mTlVRJ3jZTAYoaRtP8CU/1M=
Received: from VM-222-126-tencentos.localdomain ([14.22.11.161])
 by newxmesmtplogicsvrszb16-1.qq.com (NewEsmtp) with SMTP
 id 41D374E3; Fri, 04 Jul 2025 11:16:29 +0800
X-QQ-mid: xmsmtpt1751598989tu9g03dp5
Message-ID: <tencent_54FF4252EDFB6533090A491A25EEF3EDBF06@qq.com>
X-QQ-XMAILINFO: NMCsm0XXqhsSqGHC+kB9Lm1HUBzPkmLgoLRzlOUijHischq+TH3av4I2cs12qA
 NbyVwEH/4vWdutakSDTOWAiyWypzEkhoxF77bdbL413cWyaF2tOqh0++NUwDgGlzINgbAjlXlyWj
 wNOmkQ64HjH0VPClFndT3hixvfDLijqJpHO8Tqzh26SNnUsaimbeKeVZd+uZYK4MYU/xDtLHzUBx
 rGbBgg/+HkHRFMNQn35VJ+pnGD8O/2dj0sceXP2vO6yEDy2iraK5ALeuhAAa8rfT+DaiwessBNMa
 Pzsi8p8Kjnyaee9tH4l8fFSuAgWwa+jWAt3mBnHuueOw3gGO1VEPwUECJjmcaLzDRBOvkAgIJYGL
 4BOVewoX7h7gDFNpi9NcYvUquiAIhZGrc4ii3y3KvvtIxgXLuw1qeYkQ7fu5tBObVL5zxU56jY8i
 FH4Clw3wVX6hXZcYqdb9Wgmoh7AE/L6GAwDF+vI512hV7DnRD923thEi1YFWUKxxC2+8sL53r8aC
 x+zFBeY6WCHCVvPZEhIllT01w9Abbbn8KpBSyS8cGxWCv/udsSBE0pPLFuhNJnq3HDk7UvWX0Adp
 AWdDHnZ2I7MQIJECkPmfYoyLbUrNmkpLqRRtTYJoDdI5ktBv/3viCSBemaLjWeBeSgfFzbP4qJFr
 xjZUUHpGapKxRsoK/wZovE9kJ+8dSrhq5ElSa5L4FpjlmbjhaFapzcMY7pElT61499+jTPzO5JCW
 6AtHih1I8HoTXBFHask0FuOLu3+pZRrTUOfbUzw/7q2x0FbPkBKpe6XhAf0UHx3vEeOzwJNh62mn
 Kom91FHElD3a8dwdz9I9jp7nvajTDcR7oXKldVBfNeF0PcFMbKuuKanWZ9g7oLvlPIIOc3wsPqYn
 p9yH9vdEsOx04RU+Qyf7DHqfrRUQ6KxNEunf3QkE5T6siaHo3Mon4UvNxFx2DXgDp1H6SyzxuqtU
 GHzMJcRE/xN7khy9zB1/UN5nmbluUr66NOskKcvb+6K97n0wAbytaHkTtDriCpv+/ZvEkPDdz080
 WyKijJJtZfX/YFbD1c5l+wJfZ1V58NG7AFCqp/UEXf/HwAY3KV/gIoI3EFXtJ4xu6bPhNahy6CEk
 bFRPsu
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
From: jackysliu <1972843537@qq.com>
To: harry.wentland@amd.com
Cc: 1972843537@qq.com, Austin.Zheng@amd.com, Dillon.Varone@amd.com,
 Security@tencent.com, Sung.Lee@amd.com, Wayne.Lin@amd.com,
 airlied@gmail.com, alexander.deucher@amd.com, alvin.lee2@amd.com,
 amd-gfx@lists.freedesktop.org, aurabindo.pillai@amd.com,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 joshua.aberback@amd.com, linux-kernel@vger.kernel.org, linux@treblig.org,
 mario.limonciello@amd.com, ryanseto@amd.com, simona@ffwll.ch,
 siqueira@igalia.com, sunpeng.li@amd.com
Subject: [PATCH v2] drm/amd/display:fix a Null pointer dereference
 vulnerability
Date: Fri,  4 Jul 2025 11:16:22 +0800
X-OQ-MSGID: <20250704031622.3124142-1-1972843537@qq.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <220f9fb4-45ad-4997-9572-564242737dd4@amd.com>
References: <220f9fb4-45ad-4997-9572-564242737dd4@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 04 Jul 2025 08:53:39 +0000
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

From: jackysliu <Security@tencent.com>

A null pointer dereference vulnerability exists in the AMD display driver's
 (DC module) cleanup function dc_destruct().
 When display control context (dc->ctx) construction fails
 (due to memory allocation failure), this pointer remains NULL.
During subsequent error handling when dc_destruct() is called,
there's no NULL check before dereferencing the perf_trace member
 (dc->ctx->perf_trace),
 causing a kernel null pointer dereference crash

Signed-off-by: jackysliu <Security@tencent.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 56d011a1323c..393f87cfe74d 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -934,17 +934,21 @@ static void dc_destruct(struct dc *dc)
 	if (dc->link_srv)
 		link_destroy_link_service(&dc->link_srv);
 
-	if (dc->ctx->gpio_service)
-		dal_gpio_service_destroy(&dc->ctx->gpio_service);
+	if (!dc->ctx) {
+		dm_error("%s: called with NULL ctx\n", __func__);
+	} else {
+		if (dc->ctx->gpio_service)
+			dal_gpio_service_destroy(&dc->ctx->gpio_service);
 
-	if (dc->ctx->created_bios)
-		dal_bios_parser_destroy(&dc->ctx->dc_bios);
+		if (dc->ctx->created_bios)
+			dal_bios_parser_destroy(&dc->ctx->dc_bios);
 
-	kfree(dc->ctx->logger);
-	dc_perf_trace_destroy(&dc->ctx->perf_trace);
+		kfree(dc->ctx->logger);
+		dc_perf_trace_destroy(&dc->ctx->perf_trace);
 
-	kfree(dc->ctx);
-	dc->ctx = NULL;
+		kfree(dc->ctx);
+		dc->ctx = NULL;
+	}
 
 	kfree(dc->bw_vbios);
 	dc->bw_vbios = NULL;
-- 
2.43.5

