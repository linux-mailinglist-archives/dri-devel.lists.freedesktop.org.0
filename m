Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F7198AAA1
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 19:06:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61E6610E56B;
	Mon, 30 Sep 2024 17:06:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=hugovil.com header.i=@hugovil.com header.b="GCdcUvOE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6278C10E56B
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 17:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
 ; s=x;
 h=Subject:Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Cc:To
 :From:subject:date:message-id:reply-to;
 bh=UMnrG8ZjcGLecpo1O8GBztCjlOrIx408++7rYA1x43w=; b=GCdcUvOEP3uZQTKQdx8T3txvIf
 MiZCxOMr/8tm/pnPXMG+VrVXIgZS/ABmJSfE3EW9Hdm64aTGn7okpP+WbAK2JS3VzCfoLYWU0L+4h
 4lVxut9nopH6Ak+DX9GPamfgAKXlxla6olsXhtm4ZX6RcS1h3Mor7dZj6bTw7ISHVI0Q=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:40922
 helo=pettiford.lan) by mail.hugovil.com with esmtpa (Exim 4.92)
 (envelope-from <hugo@hugovil.com>)
 id 1svJql-0000XQ-Vv; Mon, 30 Sep 2024 13:06:20 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Jagan Teki <jagan@edgeble.ai>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: hugo@hugovil.com, Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Date: Mon, 30 Sep 2024 13:05:03 -0400
Message-Id: <20240930170503.1324560-1-hugo@hugovil.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.hugovil.com
X-Spam-Level: 
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED autolearn=ham
 autolearn_force=no version=3.4.2
Subject: [PATCH] drm: panel: jd9365da-h3: Remove unused num_init_cmds
 structure member
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)
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

From: Hugo Villeneuve <hvilleneuve@dimonoff.com>

Now that the driver has been converted to use wrapped MIPI DCS functions,
the num_init_cmds structure member is no longer needed, so remove it.

Fixes: 35583e129995 ("drm/panel: panel-jadard-jd9365da-h3: use wrapped MIPI DCS functions")
Cc: <stable@vger.kernel.org>
Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
---
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
index 44897e5218a6..45d09e6fa667 100644
--- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
+++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
@@ -26,7 +26,6 @@ struct jadard_panel_desc {
 	unsigned int lanes;
 	enum mipi_dsi_pixel_format format;
 	int (*init)(struct jadard *jadard);
-	u32 num_init_cmds;
 	bool lp11_before_reset;
 	bool reset_before_power_off_vcioo;
 	unsigned int vcioo_to_lp11_delay_ms;

base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
-- 
2.39.5

