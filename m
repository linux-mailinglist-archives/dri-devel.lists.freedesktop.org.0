Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EB291D324
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2024 20:36:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DC3D10E2BF;
	Sun, 30 Jun 2024 18:36:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.b="mOidTYR/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-187.mta0.migadu.com (out-187.mta0.migadu.com
 [91.218.175.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D23610E2B7
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jun 2024 18:36:44 +0000 (UTC)
X-Envelope-To: robh@kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
 s=key1; t=1719772602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZdEQ1EbZMn01XAPtZH6WuK788jpoWDyo/EngDbWuXh8=;
 b=mOidTYR/gxv822MQFeMCLNdEv4aKUAa5B6FIIk0HhymW6xlwW2VG1d74ZUBI7i9sTt4Cjz
 3mhdwH7K96vbI4cHiVj8M0F5UdDozu88faIqZcvCwO25meHxt17l3KwZ9GFbBmLNtuTivr
 8esnvnpcaa5YwKpVyO2mIwCImlIpAO5xLuWnMY1uY11glGPmjQbenDWLV7tdsa/IEILgRX
 cZUK8SGhwFmjyVQOhMdy5YgIi9voBgBUikkM4v3k+ILIvF0NBf+iiti37CZUfF+9pqFfA4
 0kmetHzHuIIm0PRkZHVVRuvRRl6lep9OU41kxZHn9jwbKG587b73bdzvkq+9Xw==
X-Envelope-To: conor+dt@kernel.org
X-Envelope-To: neil.armstrong@linaro.org
X-Envelope-To: daniel@ffwll.ch
X-Envelope-To: ~postmarketos/upstreaming@lists.sr.ht
X-Envelope-To: dmitry.torokhov@gmail.com
X-Envelope-To: linux-input@vger.kernel.org
X-Envelope-To: mripard@kernel.org
X-Envelope-To: caleb@postmarketos.org
X-Envelope-To: linux-arm-msm@vger.kernel.org
X-Envelope-To: krzk+dt@kernel.org
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: rydberg@bitmath.org
X-Envelope-To: konrad.dybcio@linaro.org
X-Envelope-To: maarten.lankhorst@linux.intel.com
X-Envelope-To: devicetree@vger.kernel.org
X-Envelope-To: dmitry.baryshkov@linaro.org
X-Envelope-To: tzimmermann@suse.de
X-Envelope-To: airlied@gmail.com
X-Envelope-To: quic_jesszhan@quicinc.com
X-Envelope-To: andersson@kernel.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Caleb Connolly <caleb@postmarketos.org>
Date: Sun, 30 Jun 2024 20:36:25 +0200
Subject: [PATCH v2 2/8] dt-bindings: input: touchscreen: document synaptics
 TCM oncell
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240630-oneplus8-v2-2-c4a1f8da74f1@postmarketos.org>
References: <20240630-oneplus8-v2-0-c4a1f8da74f1@postmarketos.org>
In-Reply-To: <20240630-oneplus8-v2-0-c4a1f8da74f1@postmarketos.org>
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
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht
X-Developer-Signature: v=1; a=openpgp-sha256; l=2098;
 i=caleb@postmarketos.org; h=from:subject:message-id;
 bh=XL5TcWDmclGnBkenp9Wm9HwFQWHhCM5cOKm1DOPdk6k=;
 b=owEBbQKS/ZANAwAIAQWDMSsZX2S2AcsmYgBmgaWzCd60t6AOzbkYJCsy1RmzqLlkpK03uXyb4
 aFrFHSqZe6JAjMEAAEIAB0WIQS2UaFGPGq+0GkMVc0FgzErGV9ktgUCZoGlswAKCRAFgzErGV9k
 tvqmD/4hxnXUzUEcQ6Wm8IIt1YhkO6B6Lsalzw1i2BTO7N5Z1gySLQod9ZBHJwIq2/McIzIC+01
 KXLn2JU+C8Y4IFoPmBbAQygivnNDR0oXqYH6JW/D5jWIIuZqL3MDNpa4fdkZbh/FmOffZFzdXah
 2gvZCLl0PAYXAAhD3J7P6ShhJbto56KA4ojs6rXz+/ZNg5B7LgQMUSutPjOuWnBIwVPExKD0jl5
 RllLKPLUKoj1Pw/fIbMOBh1T14ovjOpX9+zX9c84PPEPjMjGxxAS4UrlEz3LEVgO+HHpUofNEGi
 rNjGLglowsCzcNIenPZogX9mLs3W17vcS4a8KNuy81SbKuUOEWSZjsWUr07iLNi/VakK1YwDJhN
 UZgiHzKiFphvNtgVOwn8TUMuwkiA++guKwjRs1iw/fIjR4tPqduJMbCVKYCpt4h1qF/6tSFK0jT
 P0BYax56LF53IGCgfq+Zl9dlplfgkhesWKapmGp5VXaKQIq+13L+2XvfT++HagEpoJYRbAD05Ty
 OfcBve782wlAmUK/6YfRyhG/h/Fy4LchCYc+/NdUmXk6KrQjwKbg5ld941/S7qWzysh64HAwmnz
 3JZx8w1PJ54XA6RnxEQXZb2OI2/cXmmkIMiOc+sgV/8JRo891zxEEkNz47Rc7DBi1F4tihDaIh3
 +yCMT61aD9u/4og==
X-Developer-Key: i=caleb@postmarketos.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
X-Migadu-Flow: FLOW_OUT
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

Document the Synaptics TCM oncell series of touchscreens, starting with
the s3908.

Signed-off-by: Caleb Connolly <caleb@postmarketos.org>
---
 .../input/touchscreen/syna,tcm-oncell.yaml         | 68 ++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/syna,tcm-oncell.yaml b/Documentation/devicetree/bindings/input/touchscreen/syna,tcm-oncell.yaml
new file mode 100644
index 000000000000..6e366c9446f8
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/syna,tcm-oncell.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/syna,tcm-oncell.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synaptics TCM Oncell i2c touchscreen
+
+maintainers:
+  - Caleb Connolly <caleb@postmarketos.org>
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  compatible:
+    enum:
+      - syna,s3908
+
+  reg:
+    maxItems: 1
+
+  interrupts-extended:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+    description: Reset GPIO the chip is connected to.
+
+  vdd-supply:
+    description: a phandle for the regulator supplying 3V power.
+
+  vcc-supply:
+    description: a phandle for the regulator supplying IO power.
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts-extended
+  - reset-gpios
+  - vdd-supply
+  - vcc-supply
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      clock-frequency = <400000>;
+      status = "okay";
+
+      touchscreen@4b {
+        compatible = "syna,s3908";
+        reg = <0x4B>;
+
+        interrupts-extended = <&tlmm 39 0x2008>;
+
+        reset-gpios = <&tlmm 38 GPIO_ACTIVE_LOW>;
+
+        vdd-supply = <&vreg_l13a_ts_3p0>;
+        vcc-supply = <&vreg_l1c_1p8>;
+      };
+    };

-- 
2.45.0

