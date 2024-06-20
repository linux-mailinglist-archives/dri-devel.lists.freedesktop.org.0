Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D93910111
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 12:05:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B06CF10E2EA;
	Thu, 20 Jun 2024 10:05:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="cOEsY973";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Thu, 20 Jun 2024 10:05:39 UTC
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E37E10E2EA
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 10:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1718877939; x=1750413939;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JsDkBa8BIU8kt1tFosPylwKEidocTtesbost8Ep5hjU=;
 b=cOEsY973Uw9M5QFGNQ6HLIO78j47xvWZt70zktUzVupBOpXFXLbBd4Sw
 FwlEfwYiucDGscbDvvFhu802Oue+gTND1TeRZxrDmdyothXZQtwae7J1X
 0I9hM2JUPE3un3+kPhy1iGoIdiQgXcnRTRRCUPo+Tg/oP4td61LPCezfQ
 E8ukVL0nw9YI+/CEaV/f/rvhzqEp/oxOWK22HIzw+YLakRIn9hMlXWzuO
 mvOoPFYelO1I2s+a3/SIbsVrANPA7BG57dQaFHcdyv5zTK3Zcym8uEJSr
 wAkc7BL7MTCn5gPxesS9KlxTN7g8y3wq3Gp/Q3Z6G+AhzHLt+dveREj10 g==;
X-CSE-ConnectionGUID: xMJ21LrvTXOs5KEZiuh2KA==
X-CSE-MsgGUID: 9oDDM3BQRcSi06Ooessizw==
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="259152117"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jun 2024 02:58:31 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 20 Jun 2024 02:58:18 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 20 Jun 2024 02:58:15 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
CC: <Hari.PrasathGE@microchip.com>, <Dharma.B@microchip.com>,
 <sam@ravnborg.org>, <bbrezillon@kernel.org>, <nicolas.ferre@microchip.com>,
 Manikandan Muralidharan <manikandan.m@microchip.com>
Subject: [PATCH] MAINTAINERS: update Microchip's Atmel-HLCDC driver maintainers
Date: Thu, 20 Jun 2024 15:28:56 +0530
Message-ID: <20240620095856.777390-1-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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

Drop Sam Ravnborg and Boris Brezillon as they are no longer interested in
maintaining the drivers. Add myself and Dharma Balasubiramani as the
Maintainer and co-maintainer for Microchip's Atmel-HLCDC driver.
Thanks for their work.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d1566c647a50..8f2a40285544 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7290,8 +7290,8 @@ F:	drivers/gpu/drm/ci/xfails/meson*
 F:	drivers/gpu/drm/meson/
 
 DRM DRIVERS FOR ATMEL HLCDC
-M:	Sam Ravnborg <sam@ravnborg.org>
-M:	Boris Brezillon <bbrezillon@kernel.org>
+M:	Manikandan Muralidharan <manikandan.m@microchip.com>
+M:	Dharma Balasubiramani <dharma.b@microchip.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
-- 
2.25.1

