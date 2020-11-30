Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 375642C8CB9
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 19:26:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D9166E5D5;
	Mon, 30 Nov 2020 18:26:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 284CD6E5D5
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 18:26:48 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 849552001F;
 Mon, 30 Nov 2020 19:26:45 +0100 (CET)
Date: Mon, 30 Nov 2020 19:26:43 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] drm: panel: add flags to BOE NV110WTM-N61
Message-ID: <20201130182643.GA1497637@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Ibmpp1ia c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=cm27Pg_UAAAA:8 a=pGLkceISAAAA:8
 a=e5mUnYsNAAAA:8 a=KWTeLqc14gzOAJQ15WEA:9 a=CjuIK1q_8ugA:10
 a=E9Po1WZjFZOl8hwRPBS3:22 a=xmb-EsYY8bH0VWELuYED:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When applying a patch to add the BOE NV110WTM-N61 panel I forgot
to add the changes that added flags to drm_display_mode.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Fixes: a96ee0f6b58d ("drm: panel: simple: Add BOE NV110WTM-N61")
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/panel/panel-simple.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 216cde33b5c4..2d093b5a513c 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1367,6 +1367,7 @@ static const struct drm_display_mode boe_nv101wxmn51_modes[] = {
 		.vsync_start = 800 + 3,
 		.vsync_end = 800 + 3 + 5,
 		.vtotal = 800 + 3 + 5 + 24,
+		.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC,
 	},
 	{
 		.clock = 57500,
@@ -1378,6 +1379,7 @@ static const struct drm_display_mode boe_nv101wxmn51_modes[] = {
 		.vsync_start = 800 + 3,
 		.vsync_end = 800 + 3 + 5,
 		.vtotal = 800 + 3 + 5 + 24,
+		.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC,
 	},
 };
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
