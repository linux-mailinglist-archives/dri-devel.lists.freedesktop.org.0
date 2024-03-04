Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB6D870679
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 17:05:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9233E1122D7;
	Mon,  4 Mar 2024 16:05:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="RJGwyF4v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B6EF1122D6
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 16:05:02 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::227])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 35CDFC39A2
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 16:05:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 92D922000C;
 Mon,  4 Mar 2024 16:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1709568299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8RrmFDhb/hI64FahWrZ6hwr/R5wFK7u5uPfr7IWELcA=;
 b=RJGwyF4vbjrYp/s2XsLFxiHONc2Rj5CyxpcxKhuyfvU2i6YfssDcAvn2HV9azH1PZox/BB
 YH1lGBD5H0I0GCgVZG49KRj32QrqW0xQyFUKInfmon2Gf7xMaW7VDyr2DkZWy8xyNjJWq/
 68+CZakrrfdY8ltlIHUepS2WV4KK4ck3v7RG9thfnDtdXKJjlm3ULjcYQiebyakcL/qyHS
 EVm0uUC2Ri7XNwOFYHtQLt1oPbvy6UcChqb6IEidpvDnvtMiBUWPSA9dbOy3cAwpIPB3c4
 eAhI+/vMooa3/+zZSeOY8twndc+vA3dMVMBR65pSlAL9vYlzjdQeqpl3plAvWQ==
From: =?UTF-8?q?J=C3=A9r=C3=A9mie=20Dautheribes?=
 <jeremie.dautheribes@bootlin.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Yen-Mei Goh <yen-mei.goh@keysight.com>,
 =?UTF-8?q?J=C3=A9r=C3=A9mie=20Dautheribes?= <jeremie.dautheribes@bootlin.com>
Subject: [PATCH v2 1/3] dt-bindings: Add Crystal Clear Technology vendor prefix
Date: Mon,  4 Mar 2024 17:04:52 +0100
Message-Id: <20240304160454.96977-2-jeremie.dautheribes@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240304160454.96977-1-jeremie.dautheribes@bootlin.com>
References: <20240304160454.96977-1-jeremie.dautheribes@bootlin.com>
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

Update Documentation/devicetree/bindings/vendor-prefixes.yaml to
include "cct" as a vendor prefix for "Crystal Clear Technology". CCT is
the vendor of the CMT430B19N00 TFT-LCD panel.

Link: http://www.cct.com.my/
Signed-off-by: Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index fef2e12b504e..96e47742e250 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -248,6 +248,8 @@ patternProperties:
     description: Catalyst Semiconductor, Inc.
   "^cavium,.*":
     description: Cavium, Inc.
+  "^cct,.*":
+    description: Crystal Clear Technology Sdn. Bhd.
   "^cdns,.*":
     description: Cadence Design Systems Inc.
   "^cdtech,.*":
-- 
2.34.1

