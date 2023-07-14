Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 783C0752ECB
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 03:38:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0077910E7BC;
	Fri, 14 Jul 2023 01:38:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3016710E0C8
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 01:38:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 70EC161BB2;
 Fri, 14 Jul 2023 01:38:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA4F8C433CA;
 Fri, 14 Jul 2023 01:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689298681;
 bh=ZCtk/JiU9swJ+bePtmvtWrQdxyBhpSeCtAN3ecv4HUU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=A0K+HtJDDCdq80eVoRo+GkyLE+/9F6xazEDDQC2KTgSI7y2DWuOi7c/y3FAz0g8A8
 kLPIeeyFWCAv8DzyjQENzBj0jH5InVUpWg/d+sC/8Qjc+dYnT+3EjOtivMZrvheFkG
 e/snkUhNmISUVLLUUIAslN/CGdwcAPI4a4DJ/B9HuC/K0hzoSVem9Au6ctjdgGPOsZ
 6rH6J2Sg4m/70vWF6wiUNd3erF7w8EGF2Ipt8/pcav6VQjzcpS5Sz97aUdN5vt6ouI
 5lfWHL8Ba6YwdZe8RvioFzhBq8R25nk86SivsZtR9wS28qJcMnYdXnQorjCJhjsw5s
 kkqyhECfAng0w==
Received: by mercury (Postfix, from userid 1000)
 id CDBC61067680; Fri, 14 Jul 2023 03:37:58 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
To: Sebastian Reichel <sre@kernel.org>
Subject: [PATCH v3 02/19] dt-bindings: display: st7789v: add Inanbo T28CP45TN89
Date: Fri, 14 Jul 2023 03:37:39 +0200
Message-Id: <20230714013756.1546769-3-sre@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230714013756.1546769-1-sre@kernel.org>
References: <20230714013756.1546769-1-sre@kernel.org>
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add compatible value for Inanbo t28cp45tn89 and make reset GPIO non
mandatory, since it might not be connected to the CPU.

Reviewed-by: Michael Riesch <michael.riesch@wolfvision.net>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
 .../devicetree/bindings/display/panel/sitronix,st7789v.yaml  | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
index fa6556363cca..75e935f0547b 100644
--- a/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
+++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
@@ -15,7 +15,9 @@ allOf:
 
 properties:
   compatible:
-    const: sitronix,st7789v
+    enum:
+      - inanbo,t28cp45tn89-v17
+      - sitronix,st7789v
 
   reg: true
   reset-gpios: true
@@ -33,7 +35,6 @@ properties:
 required:
   - compatible
   - reg
-  - reset-gpios
   - power-supply
 
 unevaluatedProperties: false
-- 
2.40.1

