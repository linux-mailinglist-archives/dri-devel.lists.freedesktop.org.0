Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 267811F8295
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jun 2020 12:17:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 141BD6E154;
	Sat, 13 Jun 2020 10:16:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [62.157.118.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7B3A6E161
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 12:42:31 +0000 (UTC)
IronPort-SDR: BDhnoII0M5j0AM5ACfu2EdEEfKtrSoGwXs9TITsJg5tafTNqmjMvEAdbtBJqsIf8yK4TN9pjls
 JFVMi70zHZr4Zz+6UyNfU3SvC/6p7vsqJwtE/xxnhbKxRpdaIaEbDwPidJlhyC99oTRuMyz+EQ
 KHZUIFWKJUohBpOW1RLHlZ6RgX7sknV958rtKcuKEUbRH63+9m6yYPP3I2yxqpTGI0XCQkVM9i
 ipGjQZiqb9GpXVvmM/3IUeJqjzlSH4MVoXPqraC048EF5gHJe64xgeK+jIc5dhudLxSOUdiHgi
 Wtk=
X-IronPort-AV: E=Sophos;i="5.73,499,1583190000"; d="scan'208";a="12649669"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 11 Jun 2020 14:42:27 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Thu, 11 Jun 2020 14:42:27 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Thu, 11 Jun 2020 14:42:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1591879347; x=1623415347;
 h=from:to:cc:subject:date:message-id;
 bh=Z1KnUC/hvmXTSff/Y1nN8ENTL/SaSbNXTvnFH3mC13w=;
 b=pc8rpVQOhu/QjvRZxn7gEiZmQB6oEVOsz6+VCEFDkTsOyUpI+sirlVsV
 b2Xng+to8yUgRBX7CMnDA0XkEmxNSZ3V7wli22Tf3TZiHMrmZAWfkHW1u
 7OK99hr5N9PqVMP8lKxBzK1JEMFrEQH7dkv1hHK/huabZXk8CBE22vfzq
 EToeBCc2lv5prSD7/RDbpVoElZq1wcQJ9FdFmSb7PDIvmMFJFFpoPn5CS
 HUqpoDkc7J5JTC/wHVl2DfdD27pEyRZfFl32Vu983ZJSra1dVIR76vglJ
 Pd+q7+GOY2R5vKUIdJEkkBi3I0itc9XWZFcwI2jOTW3ecOSkjnZJLBVHv Q==;
IronPort-SDR: 58/fS4MqYbuzlu3KiGn9d8ovU5yqdtmXhZBT2zOLsLVH/zAWlKKz1NSz1tjEOFoWi8n8tkDAFB
 dJ/eGD9hpkqOFmUhF7lRLw52COW55B8y2kRzkKyTug90MFV/zCKswY8fszabEGN7niA3Ya6lZ1
 Jrjc+JzKkETrMigGLrLZkGy4BvxUBiBZ7Y4noLGKO16+PRTTdD6XxUftpllzy00Wi09s2dtr/v
 +1c6HR0Sa9qIEiFib4OsReL3wD6PEf5Q16m22459Iyd7FUq7yChjDLFN9sWQfGIqq/fq+ldOAv
 r1k=
X-IronPort-AV: E=Sophos;i="5.73,499,1583190000"; d="scan'208";a="12649668"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 11 Jun 2020 14:42:27 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de
 [10.117.49.26])
 by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 56D71280075;
 Thu, 11 Jun 2020 14:42:28 +0200 (CEST)
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 4/4] drm/panel: simple: add Tianma TM070JVHG33
Date: Thu, 11 Jun 2020 14:42:09 +0200
Message-Id: <20200611124209.25028-4-matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200611124209.25028-1-matthias.schiffer@ew.tq-group.com>
References: <20200611124209.25028-1-matthias.schiffer@ew.tq-group.com>
In-Reply-To: <20200610120131.3069-1-matthias.schiffer@ew.tq-group.com>
References: <20200610120131.3069-1-matthias.schiffer@ew.tq-group.com>
X-Mailman-Approved-At: Sat, 13 Jun 2020 10:16:46 +0000
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
Cc: devicetree@vger.kernel.org,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Max Merchel <Max.Merchel@tq-group.com>

Add support for the Tianma Micro-electronics TM070JVHG33 7.0" WXGA display
to panel-simple.

Signed-off-by: Max Merchel <Max.Merchel@tq-group.com>
Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---

v2:
- added connector_type
- fixed bus_format

 drivers/gpu/drm/panel/panel-simple.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index ee9815e5eee8..54f121256832 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -3380,6 +3380,18 @@ static const struct panel_desc tianma_tm070jdhg30 = {
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
+static const struct panel_desc tianma_tm070jvhg33 = {
+	.timings = &tianma_tm070jdhg30_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 150,
+		.height = 94,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+};
+
 static const struct display_timing tianma_tm070rvhg71_timing = {
 	.pixelclock = { 27700000, 29200000, 39600000 },
 	.hactive = { 800, 800, 800 },
@@ -3983,6 +3995,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "tianma,tm070jdhg30",
 		.data = &tianma_tm070jdhg30,
+	}, {
+		.compatible = "tianma,tm070jvhg33",
+		.data = &tianma_tm070jvhg33,
 	}, {
 		.compatible = "tianma,tm070rvhg71",
 		.data = &tianma_tm070rvhg71,
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
