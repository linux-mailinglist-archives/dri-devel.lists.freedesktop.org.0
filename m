Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BFF83DD1A
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 16:12:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F201F10FB61;
	Fri, 26 Jan 2024 15:12:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4500210E9F8
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 09:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
 q=dns/txt; i=@phytec.de; t=1706259456; x=1708851456;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cUQFchkQM75amrfr5RR7F6EnZDqjTOiCu1EFoQmt1uM=;
 b=E96oKaQ/CIBfPU8Vo+MFDo6ftFshz4A7NQJbvc3zLupR6odqc/dFfjylej0nqYo6
 RjmrWfcwXfLFDpJ/C0VTCiHGWiGhdzKUz+MkbMFxzGsczmXyc5LVgD6tTIep1THx
 8mF2VDxPL+IbJ71iglyAKj58AEJ5cTtYD649CMkF0OU=;
X-AuditID: ac14000a-fbefe7000000290d-ba-65b37400e067
Received: from berlix.phytec.de (Unknown_Domain [172.25.0.12])
 (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 42.F9.10509.00473B56;
 Fri, 26 Jan 2024 09:57:36 +0100 (CET)
Received: from lws-moog.phytec.de (172.25.0.11) by Berlix.phytec.de
 (172.25.0.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Fri, 26 Jan
 2024 09:57:36 +0100
From: Yannic Moog <y.moog@phytec.de>
Date: Fri, 26 Jan 2024 09:57:23 +0100
Subject: [PATCH RFC for upstream 1/4] dt-bindings: display: panel-simple:
 add ETML1010G3DRA
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240126-wip-y-moog-phytec-de-upstream-pollux-lvds-v1-1-8ec5b48eec05@phytec.de>
References: <20240126-wip-y-moog-phytec-de-upstream-pollux-lvds-v1-0-8ec5b48eec05@phytec.de>
In-Reply-To: <20240126-wip-y-moog-phytec-de-upstream-pollux-lvds-v1-0-8ec5b48eec05@phytec.de>
To: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP
 Linux Team <linux-imx@nxp.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>
X-Mailer: b4 0.12.3
X-Originating-IP: [172.25.0.11]
X-ClientProxiedBy: Berlix.phytec.de (172.25.0.12) To Berlix.phytec.de
 (172.25.0.12)
X-Brightmail-Tracker: H4sIAAAAAAAAA02SaUhUURiGPXfzOjR5Gyc8GikMWim4gcIhKiKCTvVDWySSTAe9qWg2jKZp
 VK6l19yCLCcxG0XMBspxGUdcSpTUcCHTwEwbNdxyiVxSMPM6RP57vvdb3vfHx5KyScqejYiO
 5dXRyigFI6F0dha73Cxiq3nPrDEF6visJdBC+UOAdE09BNqsyyfR87YeGn1aXmCQacAXVT42
 UihnykQi/fggjYT1lyTqbyhi0IuftRS6n1lOowXjEEAdgolGKY+ekCi9qc0SbRj0FKpYqwVo
 qsYWrTUUU6jmRz6NsuYPorRhn+N2WFesA7hppYTCRs1XS6yvzGTw8GAjg4s7z+HRrPcEri67
 h3Oz0mi8uvyGxlXz9QTO3fDE+Y13cVnBAIOrP9zGv/QOflyA5EgoHxURx6s9jgVLwlMMfYyq
 kL3Vkd8FksA3RgAsCzlv2KWLF4CElXGlBMxbbKbNhQnAlpZpIAArluGc4PjUCC0yxTnDyXEt
 IbINFwhzhTxKZCm3B3YWTlDiUZJzga8bPESZ5ByhYa6INI9cgd1137d9ZVssjAeJaLV1JTnV
 TXSVcwIDZ/XdjHl1CUCtwVlkyNnAB9qhbVcZtx9O9WZbmnVHWNAzS5rZH9YuGYg8INPsCKT5
 H0izI1AJICuB7HpESCSvjoh0V4UnxPIh7qG8HojPILeQ1IOcItwKCBa0AsiSCrnU26eKl0lD
 lQmJvPpGkPpmFB/TCvaxlMJW+irjAi/jwpSxfCTPq3j1vy7BWtknAdWZDGEw6qpXTfDZlXfT
 lR7h/U8NWjmVBPvGGvyDv8A/tZu/k06vppeXBs+v75VfHpWOHkh1iN89M3E08861SJ8N+u1h
 bE20Z190PTn3UbJ0wsHePzk3MPTQM796VYXbTJy0t8ZIjKo1i4UB1gu6Ed/2S+ebBCe5S6I+
 rPmUaUZBxYQrvVxJdYzyL6ZfVfD6AgAA
X-Mailman-Approved-At: Fri, 26 Jan 2024 15:12:02 +0000
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
Cc: devicetree@vger.kernel.org, Yannic Moog <y.moog@phytec.de>,
 upstream@lists.phytec.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Primoz Fiser <primoz.fiser@norik.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add Emerging Display Technology Corp. etml1010g3dra 10.1" LCD-TFT LVDS
panel compatible string.

Signed-off-by: Yannic Moog <y.moog@phytec.de>
---
 Documentation/devicetree/bindings/display/panel/panel-simple.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 11422af3477e..b6bbdb3dd2b2 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -139,6 +139,8 @@ properties:
       - edt,etm0700g0edh6
         # Emerging Display Technology Corp. LVDS WSVGA TFT Display with capacitive touch
       - edt,etml0700y5dha
+        # Emerging Display Technology Corp. 10.1" LVDS WXGA TFT Display with capacitive touch
+      - edt,etml1010g3dra
         # Emerging Display Technology Corp. 5.7" VGA TFT LCD panel with
         # capacitive touch
       - edt,etmv570g2dhu

-- 
2.34.1

