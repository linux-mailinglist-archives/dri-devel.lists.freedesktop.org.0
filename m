Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5882416A6
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 08:59:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3824A6E141;
	Tue, 11 Aug 2020 06:58:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 654BE6E49D
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 00:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1597105374; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8AQMkbmdhOguOVhFrlhaDMnBpKno97BYw594g3hdJ4U=;
 b=crs9kUCotubhHCSrMtCvBxvgzCbzdCHdDYhpIvJW/4kWWOMuBYlgBtWyR/772iRZ4+fGBY
 0TNhg8koRNG1EIluSegEYHKteqp2f9Rlf672emmaFZY+seE7xlL1TAHDv1nBE4GOqtnMvd
 UWBL7r/ShCQhOGskMna2MW5NZ62IK78=
From: Paul Cercueil <paul@crapouillou.net>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 5/5] drm/panel: simple: Add 50Hz mode for sharp,ls020b1dd01d
Date: Tue, 11 Aug 2020 02:22:40 +0200
Message-Id: <20200811002240.55194-6-paul@crapouillou.net>
In-Reply-To: <20200811002240.55194-1-paul@crapouillou.net>
References: <20200811002240.55194-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 11 Aug 2020 06:58:41 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Paul Cercueil <paul@crapouillou.net>,
 od@zcrc.me
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a perfect 50.00 Hz frame rate mode to the list of available modes
for the Sharp LS020B1DD01D panel.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/panel/panel-simple.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 4aee7eca6ded..1cf63582b5a2 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -3383,6 +3383,18 @@ static const struct panel_desc sharp_lq123p1jx31 = {
 };
 
 static const struct drm_display_mode sharp_ls020b1dd01d_modes[] = {
+	{ /* 50 Hz */
+		.clock = 3000,
+		.hdisplay = 240,
+		.hsync_start = 240 + 58,
+		.hsync_end = 240 + 58 + 1,
+		.htotal = 240 + 58 + 1 + 1,
+		.vdisplay = 160,
+		.vsync_start = 160 + 24,
+		.vsync_end = 160 + 24 + 10,
+		.vtotal = 160 + 24 + 10 + 6,
+		.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC,
+	},
 	{ /* 60 Hz */
 		.clock = 3000,
 		.hdisplay = 240,
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
