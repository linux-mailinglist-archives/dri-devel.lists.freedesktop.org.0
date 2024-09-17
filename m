Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CDB97AE47
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 11:54:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88FBE10E212;
	Tue, 17 Sep 2024 09:54:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="OGKi1MPR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 018E910E208
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2024 09:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1726566842; x=1758102842;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Knr0oz1eQjbz+tPKBtBrMJW5eGNSdwYGIS4Zj8zkcZA=;
 b=OGKi1MPReyZlfCMMuRuQk9sg46n8Pp5YkvYmC5reZRJqdz48v0nrNZW+
 7Wd6WrQodLjKo6J8KN5jXg9iTaWX/ZcHw+WRWsUIODPDHxybIxA1SODPq
 6lucj/iUZS1QwZtbYCUhcoOGh8SesawGT+w03tkw2WOPFKmIEUZtUngsr
 MAc+Gil+sPHIBTSCVL4A+KPiXXQSDDkUr0+6vADcXTmY9VElSdzI19CVw
 /pmGJGqDoPLPcGCGvSyIXEuSdUfKfOjXnM7lV2xN28XZAmUabcPeHCmZs
 0xZmsnGARG9VLtpuOwUyv99mCBnzvWlydb/UQBmjCLUNtXXZndE21Kt9l w==;
X-CSE-ConnectionGUID: Mdul6PMYQfWPexUkUfCh/g==
X-CSE-MsgGUID: 3SiWlWyIRI230gpDrSVBCA==
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="199320851"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Sep 2024 02:54:01 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 17 Sep 2024 02:53:45 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 17 Sep 2024 02:53:40 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <neil.armstrong@linaro.org>, <quic_jesszhan@quicinc.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <thierry.reding@gmail.com>, <sam@ravnborg.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH 1/2] dt-bindings: display: panel-simple: Document support for
 Microchip AC69T88A
Date: Tue, 17 Sep 2024 15:23:29 +0530
Message-ID: <20240917095330.267397-1-manikandan.m@microchip.com>
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
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index b89e39790579..09911b89d140 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -200,6 +200,8 @@ properties:
       - logictechno,lttd800480070-l2rt
         # Logic Technologies LTTD800480070-L6WH-RT 7” 800x480 TFT Resistive Touch Module
       - logictechno,lttd800480070-l6wh-rt
+        # Microchip AC69T88A 5" 800X480 LVDS interface TFT LCD Panel
+      - microchip,ac69t88a-lvds-panel
         # Mitsubishi "AA070MC01 7.0" WVGA TFT LCD panel
       - mitsubishi,aa070mc01-ca1
         # Mitsubishi AA084XE01 8.4" XGA TFT LCD panel
-- 
2.25.1

