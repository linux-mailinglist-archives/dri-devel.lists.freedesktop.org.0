Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD80777A1CC
	for <lists+dri-devel@lfdr.de>; Sat, 12 Aug 2023 20:34:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 151A610E027;
	Sat, 12 Aug 2023 18:34:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ixit.cz (ip-89-177-23-149.bb.vodafone.cz [89.177.23.149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 808B110E027
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Aug 2023 18:34:07 +0000 (UTC)
Received: from newone.lan (unknown [10.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ixit.cz (Postfix) with ESMTPSA id D5030160BE6;
 Sat, 12 Aug 2023 20:34:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
 t=1691865244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=e/X3Jp03pfCojLdzJqlMAuYtV41cck+wlhq+414/CjQ=;
 b=KQshq1aG5s6vd3VRPPPirmrRIriAu8hACMtBQN9thn0RX37gRWY0eVCDJMdFkE63k8ICBV
 0noxhLgEk8ANfhdO0MTIJHS5MK3eMlnMJghhPq/npbndQN0GK5pUrEmSWBsZkRcSoU1qxg
 4ds2pQAlHI/h+SjQHfx81sK7MEk19fg=
From: David Heidelberg <david@ixit.cz>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/panel: JDI LT070ME05000 drop broken link
Date: Sat, 12 Aug 2023 20:34:03 +0200
Message-Id: <20230812183404.374718-1-david@ixit.cz>
X-Mailer: git-send-email 2.40.1
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
Cc: dri-devel@lists.freedesktop.org, David Heidelberg <david@ixit.cz>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Link is no longer functional and web.archive.org doesn't provide PDF
with detail information.

Some informations can be found from web.archive.org here:
https://web.archive.org/web/20170629205602/http://panelone.net/en/7-0-inch/JDI_LT070ME05000_7.0_inch-datasheet

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/panel/panel-jdi-lt070me05000.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c b/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
index 213008499caa..f9a69f347068 100644
--- a/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
+++ b/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
@@ -5,10 +5,6 @@
  *
  * Copyright (C) 2016 Linaro Ltd
  * Author: Sumit Semwal <sumit.semwal@linaro.org>
- *
- * From internet archives, the panel for Nexus 7 2nd Gen, 2013 model is a
- * JDI model LT070ME05000, and its data sheet is at:
- * http://panelone.net/en/7-0-inch/JDI_LT070ME05000_7.0_inch-datasheet
  */
 
 #include <linux/backlight.h>
-- 
2.40.1

