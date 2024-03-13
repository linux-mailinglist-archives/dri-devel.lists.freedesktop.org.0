Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0BF87ACE4
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 18:20:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B8610F0E1;
	Wed, 13 Mar 2024 17:20:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="iDIsBv1G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DFB610EF63
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 17:20:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0F3936000C;
 Wed, 13 Mar 2024 17:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1710350425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h7GiX8uMeHKsAZ6m4Gc5pTZj0slQf5QBqcXc0IPAs4E=;
 b=iDIsBv1GsnU8Bp2AAy1YKPp+QEt+YS32Ambyu5/RMpBNuDTLA17I9bJMpHTAbenDpFpHot
 InGrmi3tolZauVHE6vWPRZyOrmpDrlQUUXkWyMXnMtbnNEM+nsA4if2idfA1O30ZFe2W3R
 HB5cXkJ19MSTNvF/0ggk88Fekw/+QRpXrVJOrIPdjKEEsqC7AYL2Z3Wltu96BwbFgrOnG1
 YilvujDcbIPeJibDzaONhx3kA6c1hE5Jw01JoNXIWoSEYgkxw4gxWxrSnQXmhs2jLDUqUW
 XgM/HCvHsbep2UpmvrGX6r3cN+0gjz1ctVj6DmoYR2o6Patt0BMFZpgMvZiAIw==
From: =?UTF-8?q?J=C3=A9r=C3=A9mie=20Dautheribes?=
 <jeremie.dautheribes@bootlin.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Yen-Mei Goh <yen-mei.goh@keysight.com>,
 =?UTF-8?q?J=C3=A9r=C3=A9mie=20Dautheribes?= <jeremie.dautheribes@bootlin.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 2/3] dt-bindings: display: simple: add support for Crystal
 Clear CMT430B19N00
Date: Wed, 13 Mar 2024 18:20:15 +0100
Message-Id: <20240313172016.387277-3-jeremie.dautheribes@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240313172016.387277-1-jeremie.dautheribes@bootlin.com>
References: <20240313172016.387277-1-jeremie.dautheribes@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: jeremie.dautheribes@bootlin.com
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

Add Crystal Clear Technology CMT430B19N00 4.3" 480x272 TFT-LCD panel
compatible string.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index a95445f40870..c575f7c4b745 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -91,6 +91,8 @@ properties:
       - boe,nv133fhm-n62
         # BOE NV140FHM-N49 14.0" FHD a-Si FT panel
       - boe,nv140fhmn49
+        # Crystal Clear Technology CMT430B19N00 4.3" 480x272 TFT-LCD panel
+      - cct,cmt430b19n00
         # CDTech(H.K.) Electronics Limited 4.3" 480x272 color TFT-LCD panel
       - cdtech,s043wq26h-ct7
         # CDTech(H.K.) Electronics Limited 7" WSVGA (1024x600) TFT LCD Panel
-- 
2.34.1

