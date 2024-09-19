Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D4797C6B9
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 11:16:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B1010E6B5;
	Thu, 19 Sep 2024 09:16:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="xRJWNl8f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03EB210E6B5
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2024 09:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1726737388; x=1758273388;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aXlvumLIjXjwd2EDcOSG4ZlwS9Ftm8iZU5L1gUO4cZk=;
 b=xRJWNl8fXPlrShtchsQgfYGk7sAq7aYESRIReGB/FrJW4tqCggjWsrTn
 IEZbG5y6qXR5UeOoBtHk3WphFneQaUAyvoQWGWKyd1g5lpf/FwUeb1mwD
 D0SrigckHEUx3Jq0Cq0HV+1h7U/si0T7Tj84MkeDC56Qp69aG/D7rcgfx
 KKL0/Oua3oXgrqka4+RP1vPQFT4gwOphxkNNkeAn1s+7X7naa6pLfBYM/
 jLrj/6oIruJJJeb1ur8tPzUBk6yV6gat0c6kADLLsI7mGqJ8lhVcWiNsO
 KZ2tqpMY0RmuSlVZaKYVzKR7tSyjVlPZwncG08tn3PBCewab7PtanZjfi g==;
X-CSE-ConnectionGUID: hZG0F33CRTSCTHegcNjbKA==
X-CSE-MsgGUID: oxDeqYO8S0W8YSrSaOxLaw==
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="31861850"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Sep 2024 02:16:28 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 19 Sep 2024 02:15:57 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 19 Sep 2024 02:15:52 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <neil.armstrong@linaro.org>, <quic_jesszhan@quicinc.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <thierry.reding@gmail.com>,
 <sam@ravnborg.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH v2 1/2] dt-bindings: display: panel-simple: Document support
 for Microchip AC69T88A
Date: Thu, 19 Sep 2024 14:45:47 +0530
Message-ID: <20240919091548.430285-1-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add Microchip AC69T88A 5" LVDS interface (800x480) TFT LCD panel
compatible string

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
changes in v2:
- Replace microchip,ac69t88a-lvds-panel with
microchip,ac69t88a
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index b89e39790579..18b63f356bb4 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -200,6 +200,8 @@ properties:
       - logictechno,lttd800480070-l2rt
         # Logic Technologies LTTD800480070-L6WH-RT 7” 800x480 TFT Resistive Touch Module
       - logictechno,lttd800480070-l6wh-rt
+        # Microchip AC69T88A 5" 800X480 LVDS interface TFT LCD Panel
+      - microchip,ac69t88a
         # Mitsubishi "AA070MC01 7.0" WVGA TFT LCD panel
       - mitsubishi,aa070mc01-ca1
         # Mitsubishi AA084XE01 8.4" XGA TFT LCD panel
-- 
2.25.1

