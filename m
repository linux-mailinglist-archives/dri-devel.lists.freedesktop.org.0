Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C57A9161F9
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 11:09:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A42D410E257;
	Tue, 25 Jun 2024 09:09:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="H/BO2dh8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA42D10E188
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 09:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1719306573; x=1750842573;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JKCpk5dk6D/SobJZSKKYeEwrkj1EvysciZO75GXo7IY=;
 b=H/BO2dh8Faqhth0yWZhk+jTsqgJht1vIklzP1k4XIyBwOigZwidVZUlh
 UyC5xPia3KvhdOi5rf5Mb5RWknU/yK7wYb6bBQLSj0b2/BL9FbJBMDWyQ
 nXeQAk/qyQrq+me/knmt3RXlg7YsMfYDYYp0oyARDeCd1uYwzFlFIdJeA
 4BBHbPCMcgAylaZ2Yvdh/UueJNxcM6/YG46eUstCAloE0OpsHAG1UT6Wg
 FCWuhTKsfIbPT5ElDNAXW/AcWwTFE+AWI9IMYX8CBFfJGw2xtXNBMaRwe
 ZNOci6mV+7/k5WbneqJuMhjDwW5kyWlAAjRcDy9sSSHCim8FCwqRt719M A==;
X-CSE-ConnectionGUID: VUslT87US1uPmx+Nea0QOA==
X-CSE-MsgGUID: MRhWt4BEQDqSog1AnAJX2w==
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="29096477"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Jun 2024 02:09:32 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 25 Jun 2024 02:09:11 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 25 Jun 2024 02:09:04 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <megi@xff.cz>, <javierm@redhat.com>, <neil.armstrong@linaro.org>,
 <quic_jesszhan@quicinc.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH 1/4] dt-bindings: display: himax-hx8394: remove reset-gpio
 from required properties
Date: Tue, 25 Jun 2024 14:38:50 +0530
Message-ID: <20240625090853.343176-2-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240625090853.343176-1-manikandan.m@microchip.com>
References: <20240625090853.343176-1-manikandan.m@microchip.com>
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

Remove "reset-gpio" property from required properties list and
make it optional.When interfaced with some boards where reset line is not
populated it leads to driver probe issues.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 .../devicetree/bindings/display/panel/himax,hx8394.yaml          | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
index 644387e4fb6f..017cb19ed64f 100644
--- a/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
@@ -46,7 +46,6 @@ properties:
 required:
   - compatible
   - reg
-  - reset-gpios
   - backlight
   - port
   - vcc-supply
-- 
2.25.1

