Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 296FBBCF892
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 19:03:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53AD710E0F7;
	Sat, 11 Oct 2025 17:02:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="e7edRgvr";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="vEZiE5kR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B85110E0F7
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 17:02:56 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4ckVKq29N6z9svm;
 Sat, 11 Oct 2025 19:02:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760202175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t5LIwADdeTrYwbX6llVTzDuJpx8CtqSl8BhfaECop4A=;
 b=e7edRgvr7JCvLHkAnG2gKhAYgQgN1BDydmcfE24RmzO9bTGEPJoeeueGSxojF6dvwz3vNQ
 TzUJHpnC05SshopU/YEyWiUlSZy5JhrMU8iqs6OoJywYRR7nPXzN+lDFeHDuWVZ9iwScpE
 +t5R1w0MjEs3xnjR0tODpKwGH+53kcbzWwx4je6amDuh6RmJ8MM/b1PDYi7Fr5uaJEhVwX
 Zf82lRtf2TQFKQjIjjFcC5/XZ29Snq0KAStl3g14Ai4zwaMGPVWq8aga0u4mFtmUppaFuK
 t4YNw1cTVjo8aSCXTSGddvVtdquvqbpOyexZ7hieCJ0cSGuZ8hpGtd3sTr0qQw==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760202173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t5LIwADdeTrYwbX6llVTzDuJpx8CtqSl8BhfaECop4A=;
 b=vEZiE5kRykGhGEjoOqVbJP0v71GbvnBv3DNUXoBdCQweCz3kGCpE1TzRUPSDE68yKWXh84
 XKQ3nvmO7zTC1rLi2ERpioTilckplNCIaqRjQ5BSIG9QbCww57kzLBMOvi4OePMczmc6oG
 Hu0Fyk92lCY/f/4/gbtDY/l/eQ4ztCD0/x4fkZ3fcVUYS9/gh53GVpoYwyIDKInj9ZShJK
 lmycnmUlqFM5wOHDOybzS/lrsQwBpgFpYWaaDlAqKKnkm8DC5iJYFa39HoPjQnsFjWj2KF
 msBk3CzVpBnpmGLqZ+talo7CMxhgofzd4DpnlzhKX8jfy3FUyVfSwyW7bS9hmw==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut@mailbox.org>, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: [PATCH 01/39] dt-bindings: display: imx: Document i.MX95 Display
 Controller DomainBlend
Date: Sat, 11 Oct 2025 18:51:16 +0200
Message-ID: <20251011170213.128907-2-marek.vasut@mailbox.org>
In-Reply-To: <20251011170213.128907-1-marek.vasut@mailbox.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: gqxarmiuu1o1k3jtio5duniphc4sjzo3
X-MBO-RS-ID: 54db7b2b31df76cf6e5
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

i.MX95 Display Controller display engine consists of all processing
units that operate in a display clock domain. Document DomainBlend
block which is specific to i.MX95 and required to get any display
output on that SoC.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Liu Ying <victor.liu@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
---
 .../display/imx/fsl,imx95-dc-domainblend.yaml | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx95-dc-domainblend.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx95-dc-domainblend.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx95-dc-domainblend.yaml
new file mode 100644
index 0000000000000..703f98e3321e8
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx95-dc-domainblend.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx95-dc-domainblend.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX95 Display Controller Domain Blend Unit
+
+description: Combines two input frames to a single output frame.
+
+maintainers:
+  - Marek Vasut <marek.vasut@mailbox.org>
+
+properties:
+  compatible:
+    const: fsl,imx95-dc-domainblend
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    domainblend@4b6a0000 {
+        compatible = "fsl,imx95-dc-domainblend";
+        reg = <0x4b6a0000 0x10>;
+    };
-- 
2.51.0

