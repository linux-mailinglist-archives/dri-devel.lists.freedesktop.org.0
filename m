Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A65019161FC
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 11:09:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11C5410E188;
	Tue, 25 Jun 2024 09:09:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="y+S66Uyo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6D2C10E0BE
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 09:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1719306581; x=1750842581;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hGvbHljF9xjHMTI4lhUwfwH0I82vEpDfIngxhWIu2MQ=;
 b=y+S66UyoQNbO1MZxzH4ZxO80IFGSGxGC0kmz5oFJUd1jZpL3qGRDvs80
 9klVWrajGB3pAWssk5WuaTsdt4J6XIQ6k77qgoryooz1GQS/yzo4xmyrV
 b2ZhfvPkMzqSPOTDs4e2cIzHKHILAREYAVlcL5PGed8PUTj2AwLb8G5hp
 n4ydRLRYbBsQf1tBZNsX03VemJ3V4lIyG9AIlYht6zCyw0XaqEn7GhOfW
 h6/pf8dNG04y+NpdgOWwz0vRn1cgHO8DvcLU3uKjQmsgN0Lj4Cn6wQTpw
 inb8a8KENIPPgK/JiqwnSv+h2jJMecldtC+JCHoPTVminWnR3noKiz2IX g==;
X-CSE-ConnectionGUID: zjd0MkvxRYe9+LbhgcS+Jw==
X-CSE-MsgGUID: KO++c9z9R3WMG+rqCc8piw==
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="28465914"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Jun 2024 02:09:40 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 25 Jun 2024 02:09:24 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 25 Jun 2024 02:09:18 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <megi@xff.cz>, <javierm@redhat.com>, <neil.armstrong@linaro.org>,
 <quic_jesszhan@quicinc.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH 3/4] dt-bindings: display: himax-hx8394: Add Microchip
 AC40T08A MIPI Display panel
Date: Tue, 25 Jun 2024 14:38:52 +0530
Message-ID: <20240625090853.343176-4-manikandan.m@microchip.com>
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

Add compatible string for the Microchip's AC40T08A MIPI Display
panel.This panel uses a Himax HX8394 display controller.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 .../devicetree/bindings/display/panel/himax,hx8394.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
index 017cb19ed64f..d547df794b3b 100644
--- a/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
@@ -24,6 +24,7 @@ properties:
       - enum:
           - hannstar,hsd060bhw4
           - powkiddy,x55-panel
+          - microchip,ac40t08a-mipi-panel
       - const: himax,hx8394
 
   reg:
-- 
2.25.1

