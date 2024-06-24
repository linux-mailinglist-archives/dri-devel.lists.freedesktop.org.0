Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EB391438D
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 09:23:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA5F110E1EA;
	Mon, 24 Jun 2024 07:22:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.b="MzbWX5RW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com
 [95.215.58.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF7810E178
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 01:37:31 +0000 (UTC)
X-Envelope-To: dmitry.torokhov@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
 s=key1; t=1719192639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vSIdYkvNGFlVlsQy9M50XkydHh2OwcYsy8NxF0doad4=;
 b=MzbWX5RW5j6CKndPqvrMh98kjYayvn+fUOLaGW7KwmfZKhCyKxSaQSe9ZddyUG5AtdQ6Qg
 vTJxt2mH/2mO5cj/PvsLezFCDyPe6gdBwl9k2N1cWBPo/BXl8+amrpH5+5MRUVCbOuHh4k
 P70aBdfepSZNjLFoSsqO5pTnndnac7BiyGywSSCgUeRgnocLI3a7cWT/cjPDoHHHAHodUn
 c8MNYG6Dh8AtR2d8IVqlvs8K9WJ9EaGM9NTMXjYI4+BsFpZ3/88UZreOo9EVpq+iJHJak2
 UGjP2XJimhIiU43EGz+Y2MFTb3Fh+OruBA7i84Iq+ZHKPdmpItZR7ym4VqH3uA==
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: quic_jesszhan@quicinc.com
X-Envelope-To: linux-input@vger.kernel.org
X-Envelope-To: rydberg@bitmath.org
X-Envelope-To: konrad.dybcio@linaro.org
X-Envelope-To: andersson@kernel.org
X-Envelope-To: linux-arm-msm@vger.kernel.org
X-Envelope-To: caleb@postmarketos.org
X-Envelope-To: ~postmarketos/upstreaming@lists.sr.ht
X-Envelope-To: tzimmermann@suse.de
X-Envelope-To: maarten.lankhorst@linux.intel.com
X-Envelope-To: airlied@gmail.com
X-Envelope-To: krzk+dt@kernel.org
X-Envelope-To: devicetree@vger.kernel.org
X-Envelope-To: conor+dt@kernel.org
X-Envelope-To: daniel@ffwll.ch
X-Envelope-To: robh@kernel.org
X-Envelope-To: mripard@kernel.org
X-Envelope-To: neil.armstrong@linaro.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Caleb Connolly <caleb@postmarketos.org>
Date: Mon, 24 Jun 2024 03:30:25 +0200
Subject: [PATCH 1/7] dt-bindings: panel: document Samsung AMB655X
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-oneplus8-v1-1-388eecf2dff7@postmarketos.org>
References: <20240624-oneplus8-v1-0-388eecf2dff7@postmarketos.org>
In-Reply-To: <20240624-oneplus8-v1-0-388eecf2dff7@postmarketos.org>
To: Caleb Connolly <caleb@postmarketos.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Henrik Rydberg <rydberg@bitmath.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht
X-Developer-Signature: v=1; a=openpgp-sha256; l=1867;
 i=caleb@postmarketos.org; h=from:subject:message-id;
 bh=3wuuyZRn04C2HmOsJ2tCtoWRp50+LXh8JBT0OpCN7Zg=;
 b=owEBbQKS/ZANAwAIAQWDMSsZX2S2AcsmYgBmeMw7FEWLxM509rVGpvrS5mGgN0xetJGbNC5Jj
 BKW2FZy5pGJAjMEAAEIAB0WIQS2UaFGPGq+0GkMVc0FgzErGV9ktgUCZnjMOwAKCRAFgzErGV9k
 tlu2EACg1fWl6ROkJUe1T1OBQQaGU0Sz0jMounze9Gtzs+weigxjs1pNrT0zVn+E5hn4cybm/RV
 RMp0CBCTMR3XiJvwL8KMPEwr5l80aAL/lXnMTMiFbN6h7QWV6eT9muXJlhUbHMNMwIT1l9m18NB
 aqBW/1y6Mowyw9+vIGDAUfyAwzuDuVPkZKnJmhRfJLdT8pWt+9sGWv7fFY9LCGZPFKjKVaqTqf3
 i3lmGZFa8xmFd2PFlSbEGNGLa6HwKDdiJd52fTieHeyR8eXKyyptbDghZi1J7qYU34+j7wpZ8NU
 qvMnndnqBubCoCna6e9otVHCJGn4XeNre7/rwIKNDP8Hv9X/SDKQE3f49etJJmm328nLw2mgBfE
 fktB0LtMwWuq+Ymk+vBxdxTOt8x6jSzeTlfVMbNfLSLEG9tZTL052VtwLwXNS09oF+WPU0hhKMt
 /AvSpOSpwS+CEE1mYJKAMgpBJ8f825AAGmEPIiOA5a88EY9UiViFtQ1Ymu7dVQO3IQAE/+dCVL5
 06YO6+PDJfA5coLfXxKU1xRsdQyOn0YXFCZWR1L4bhGQzqqNULpnJvGMy/uM4sJfb10l202T9NP
 0EDyrjigzWJpwhUrlTvUFGiJNCQg0K3KGTW3S0/F40QlA8ptmogVqGTcsPF2N70J0iXS2VlKJkd
 SMDswny1nRl1YTg==
X-Developer-Key: i=caleb@postmarketos.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Mon, 24 Jun 2024 07:22:58 +0000
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

Describe the Samsung AMB655X panel. It has three supplies.

Signed-off-by: Caleb Connolly <caleb@postmarketos.org>
---
 .../bindings/display/panel/samsung,amb655x.yaml    | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,amb655x.yaml b/Documentation/devicetree/bindings/display/panel/samsung,amb655x.yaml
new file mode 100644
index 000000000000..eb987d022a0d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,amb655x.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,amb655x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung AMB655X 1080x2400 120hz AMOLED panel
+
+maintainers:
+  - Caleb Connolly <caleb@postmarketos.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: samsung,amb655x
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    description: reset gpio, must be GPIO_ACTIVE_LOW
+  vddio-supply: true
+  vdd-supply: true
+  avdd-supply: true
+  enable-gpios: true
+  port: true
+
+required:
+  - compatible
+  - reg
+  - vdd-supply
+  - avdd-supply
+  - vddio-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        panel@0 {
+            compatible = "samsung,ams495qa01";
+            reg = <0>;
+            reset-gpios = <&gpio4 0 GPIO_ACTIVE_LOW>;
+            vdd-supply = <&vcc_3v3>;
+
+            port {
+                mipi_in_panel: endpoint {
+                  remote-endpoint = <&mipi_out_panel>;
+                };
+            };
+        };
+    };
+
+...

-- 
2.45.0

