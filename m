Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CF53D14E2
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 19:13:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B363F6E918;
	Wed, 21 Jul 2021 17:13:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B3496E918
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 17:13:15 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 10C3980214;
 Wed, 21 Jul 2021 19:13:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1626887593;
 bh=JERC+M4dDHoKPheAlBwaqOPvTpwxzAM0qBpaViFNMLQ=;
 h=From:To:Cc:Subject:Date:From;
 b=xRvxgcZwOs08SSFUzb5RLKYfeIiB1qqGFzTjhNNCZgDCCk6CGbLRjnuXdjiEnRZ8i
 +4PLtMcFFXXfRZVxHZq2lUmECXNkam+xjUs0UDNxR/SiqXaX0zy1g7ySD7g2wfmOFr
 Ldp+VS5g/HlspOVbS+adnKqFlJp4uIhR0A5SPKkHA/uMwr/x7wNF34LKBfibq7TvPJ
 mfeyhOxLEfd6PVZV1sQLnx21GwKEzfkZnazZ2aO+sR52nFGDbVl1adeHQqQfWbCPgM
 SKzlN9v3mvgJRXLhD+/YD6uQKRqyc5/cM8TSbJsTFQz81gPbgKK/EcAHN4mKjpeEuB
 fJKv27h1m4aUQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/panel: panel-simple: Add connector_type for EDT
 ETM0700G0BDH6 panel
Date: Wed, 21 Jul 2021 19:12:56 +0200
Message-Id: <20210721171256.111361-1-marex@denx.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, Biju Das <biju.das.jz@bp.renesas.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the warning message "missing connector type" by adding connector_type
for EDT ETM0700G0BDH6 panel.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/panel/panel-simple.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 21939d4352cf0..9a9d9d91ace4c 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2044,6 +2044,7 @@ static const struct panel_desc edt_etm0700g0bdh6 = {
 	},
 	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
 	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
+	.connector_type = DRM_MODE_CONNECTOR_DPI,
 };
 
 static const struct display_timing evervision_vgg804821_timing = {
-- 
2.30.2

