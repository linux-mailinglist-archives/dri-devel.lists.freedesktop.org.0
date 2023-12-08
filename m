Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCA3809E3E
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 09:35:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8B9C10EA1D;
	Fri,  8 Dec 2023 08:35:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 467 seconds by postgrey-1.36 at gabe;
 Fri, 08 Dec 2023 02:53:06 UTC
Received: from mxct.zte.com.cn (mxct.zte.com.cn [58.251.27.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C97AC10E013;
 Fri,  8 Dec 2023 02:53:06 +0000 (UTC)
Received: from mxde.zte.com.cn (unknown [10.35.20.165])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxct.zte.com.cn (FangMail) with ESMTPS id 4Smb8p73Fsz5SgR;
 Fri,  8 Dec 2023 10:45:14 +0800 (CST)
Received: from mxhk.zte.com.cn (unknown [192.168.250.138])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mxde.zte.com.cn (FangMail) with ESMTPS id 4Smb8h3dhrz64Yj5;
 Fri,  8 Dec 2023 10:45:08 +0800 (CST)
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4Smb8b4FnLz5B101;
 Fri,  8 Dec 2023 10:45:03 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
 by mse-fl2.zte.com.cn with SMTP id 3B82itc9067680;
 Fri, 8 Dec 2023 10:44:55 +0800 (+08)
 (envelope-from yang.guang5@zte.com.cn)
Received: from mapi (xaxapp02[null]) by mapi (Zmail) with MAPI id mid31;
 Fri, 8 Dec 2023 10:44:56 +0800 (CST)
Date: Fri, 8 Dec 2023 10:44:56 +0800 (CST)
X-Zmail-TransId: 2afa657283282d5-bc543
X-Mailer: Zmail v1.0
Message-ID: <202312081044568085747@zte.com.cn>
Mime-Version: 1.0
From: <yang.guang5@zte.com.cn>
To: <harry.wentland@amd.com>
Subject: =?UTF-8?B?W1BBVENIIGxpbnV4LW5leHRdIGRybS9hbWQvZGlzcGxheTogcmVwbGFjZSBremFsbG9jIGFuZCBtZW1jcHkgd2l0aCBrbWVtZHVw?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl2.zte.com.cn 3B82itc9067680
X-Fangmail-Gw-Spam-Type: 0
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 65728339.001/4Smb8p73Fsz5SgR
X-Mailman-Approved-At: Fri, 08 Dec 2023 08:35:21 +0000
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 gabe.teeger@amd.com, sunpeng.li@amd.com, cgel.zte@gmail.com,
 qingqing.zhuo@amd.com, xinhui.pan@amd.com, rodrigo.siqueira@amd.com,
 linux-kernel@vger.kernel.org, samson.tam@amd.com, chen.haonan2@zte.com.cn,
 chiawen.huang@amd.com, wenjing.liu@amd.com, alvin.lee2@amd.com,
 jiang.xuexin@zte.com.cn, alexander.deucher@amd.com, jun.lei@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yang Guang <yang.guang5@zte.com.cn>

Convert kzalloc/memcpy operations to memdup makes for 
cleaner code and avoids memcpy() failures

Signed-off-by: Chen Haonan <chen.haonan2@zte.com.cn>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 76b47f178127..867e1a0fdef6 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -2264,12 +2264,10 @@ struct dc_state *dc_copy_state(struct dc_state *src_ctx)

 #ifdef CONFIG_DRM_AMD_DC_FP
 	if (new_ctx->bw_ctx.dml2) {
-		dml2 = kzalloc(sizeof(struct dml2_context), GFP_KERNEL);
-		if (!dml2)
-			return NULL;
-
-		memcpy(dml2, src_ctx->bw_ctx.dml2, sizeof(struct dml2_context));
-		new_ctx->bw_ctx.dml2 = dml2;
+		dml2 = kmemdup(src_ctx->bw_ctx.dml2, sizeof(struct dml2_context), GFP_KERNEL);
+		if (!dml2)
+			return NULL;
+		new_ctx->bw_ctx.dml2 = dml2;
 	}
 #endif

-- 
2.25.1
