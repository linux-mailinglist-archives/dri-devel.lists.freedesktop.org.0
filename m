Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA356BE9045
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 15:49:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1372E10EC3E;
	Fri, 17 Oct 2025 13:49:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="vAIba2Mx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 6887 seconds by postgrey-1.36 at gabe;
 Fri, 17 Oct 2025 13:49:10 UTC
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 894C410EC3D
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 13:49:10 +0000 (UTC)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
 by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59HBriZG261157;
 Fri, 17 Oct 2025 06:53:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1760702024;
 bh=pKkvE0lTyouIBYb6MvO2iIGZkpnvNriQd6pmUEwXrwg=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=vAIba2MxY6mudbrJ2TycPRcm5AIukIhEkh22CaUfrMmbE0Cg+N1T1+qGu8qnGIhbM
 L45M0Hb9Rlq2wj4sExUcpaK4+esD3hyExsFywzjgC0ENXarCbv4rpGm8rA/ld08+Vu
 uuvqbThRxDfcUceo6qv66i0kZ9V3vrdobSkpQDp4=
Received: from DFLE209.ent.ti.com (dfle209.ent.ti.com [10.64.6.67])
 by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59HBritK1974019
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 17 Oct 2025 06:53:44 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 17 Oct
 2025 06:53:44 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 17 Oct 2025 06:53:44 -0500
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [172.24.233.20])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59HBrPeA1246573;
 Fri, 17 Oct 2025 06:53:38 -0500
From: Swamil Jain <s-jain1@ti.com>
To: <nm@ti.com>, <tomi.valkeinen@ideasonboard.com>, <robh@kernel.org>,
 <jyri.sarha@iki.fi>, <aradhya.bhatia@linux.dev>, <airlied@gmail.com>,
 <conor+dt@kernel.org>, <h-shenoy@ti.com>, <kristo@kernel.org>,
 <krzk+dt@kernel.org>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <simona@ffwll.ch>, <tzimmermann@suse.de>
CC: <devarsht@ti.com>, <praneeth@ti.com>, <u-kumar1@ti.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <s-jain1@ti.com>
Subject: [PATCH 2/2] arm64: defconfig: Enable ILITEK ILI21X & ILI25X family of
 touch sensors
Date: Fri, 17 Oct 2025 17:23:25 +0530
Message-ID: <20251017115325.1942591-3-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251017115325.1942591-1-s-jain1@ti.com>
References: <20251017115325.1942591-1-s-jain1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

Microtips Technology USA's LVDS Panel MF-101HIEBCAF0[1] uses
ILITEK 2511 capacitative touch sensor to provide touch features on the
display. This panel is used with TI's AM62-SK EVMs.

Enable ILITEK ILI21X touch sensors.

[1]: https://www.ti.com/tool/SK-LCD1

Signed-off-by: Swamil Jain <s-jain1@ti.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 9379cb230f6d..dea15cd20828 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -472,6 +472,7 @@ CONFIG_INPUT_TOUCHSCREEN=y
 CONFIG_TOUCHSCREEN_ATMEL_MXT=m
 CONFIG_TOUCHSCREEN_GOODIX=m
 CONFIG_TOUCHSCREEN_GOODIX_BERLIN_SPI=m
+CONFIG_TOUCHSCREEN_ILI210X=m
 CONFIG_TOUCHSCREEN_ELAN=m
 CONFIG_TOUCHSCREEN_EDT_FT5X06=m
 CONFIG_INPUT_MISC=y
