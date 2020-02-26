Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 193E917121A
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 09:13:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 868366EC13;
	Thu, 27 Feb 2020 08:13:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F9236E409
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 09:46:40 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id a14so1027875pgb.11
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 01:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=uhG/24QG2V0Xvo4gbhTdi+VNYSRRPHVYttLMEUxAx8w=;
 b=t4AqN5u9aZHEyTXvEvetqO8lREDWT2EfTwCzpTpij/ZPqr5Rcx8Cui8SZokdbMz0fE
 iHNuDTlyfK5BBbwq/KSS6aj7leLs7yazWnUWoN1vYrtT7HNmghVO0apKn278N2U5qMPW
 QY4i6lCMhJpgKR93EPr2h7BBoieaWVRg2RoWXoKtxXM/8d5XEicVD48Z6CViP0NSuEra
 RDLbwHUMAfjOsU9nCzWNYffLnjxwlohPyudAKqrMkrRkxS8w+iuz7wKtGsoawJVgkc2H
 Fm9hNwiKLqIWdjUKXsdstb73Mq9W1o3yVM+ReS+C+8efGPqvkejlgCU7GUbMJFz6ZnTl
 tPpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=uhG/24QG2V0Xvo4gbhTdi+VNYSRRPHVYttLMEUxAx8w=;
 b=qKvd7Wa+30u9dpOc0pQdC3dEP14d6p6Vza0GtVdB58/VLvwdhjIeARY87iGpyJtjFz
 cwptGV8B8NPjCnWdEcV8aQ+zUQmqf7c10Nwi/47JEJSWovWVKZEI3ur5hIzcCIf/GBNj
 OZ0Bh0dPRS2jXRZfRVUqlt6z6ompBe+bQwMSgg81JrIU13U3Jek6V5Cd6WIhGHqYrNJi
 tCDvc1uTcqsEAhVDZRtS8hUzQCHM77/3N1Rbg0HEHyAioqa0m2xrx1ezS51vzg7jcB31
 8tpaXRKripMr0Qjh8+3jly3kBpINmwz9ad49Yi0wlxFP8TwqMWN7WqbxPwp45odLEZ34
 /V0g==
X-Gm-Message-State: APjAAAVQVpASJZVSxYl9PYSLu8JvLIw5Hl1pPV/FpFHy4iH5TRYlkV1x
 qK5gI+rMNarK6DpZcIuk22s=
X-Google-Smtp-Source: APXvYqx7xFhoX8ieFIAHgnO+VksXJBFPWUHPzeaafb7B5odTeANXxL2kutWQ2HwgGcmwYG4vanpQ5g==
X-Received: by 2002:a62:5447:: with SMTP id i68mr3574464pfb.44.1582710399881; 
 Wed, 26 Feb 2020 01:46:39 -0800 (PST)
Received: from nj08008nbu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id h185sm2276518pfg.135.2020.02.26.01.46.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 26 Feb 2020 01:46:39 -0800 (PST)
From: Kevin Tang <kevin3.tang@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, kevin3.tang@gmail.com
Subject: [PATCH RFC v4 3/6] dt-bindings: display: add Unisoc's dpu bindings
Date: Wed, 26 Feb 2020 17:46:14 +0800
Message-Id: <1582710377-15489-4-git-send-email-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582710377-15489-1-git-send-email-kevin3.tang@gmail.com>
References: <1582710377-15489-1-git-send-email-kevin3.tang@gmail.com>
X-Mailman-Approved-At: Thu, 27 Feb 2020 08:13:09 +0000
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
Cc: orsonzhai@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, zhang.lyra@gmail.com, baolin.wang@linaro.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kevin Tang <kevin.tang@unisoc.com>

DPU (Display Processor Unit) is the Display Controller for the Unisoc SoCs
which transfers the image data from a video memory buffer to an internal
LCD interface.

Cc: Orson Zhai <orsonzhai@gmail.com>
Cc: Baolin Wang <baolin.wang@linaro.org>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
---
 .../devicetree/bindings/display/sprd/dpu.yaml      | 82 ++++++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sprd/dpu.yaml

diff --git a/Documentation/devicetree/bindings/display/sprd/dpu.yaml b/Documentation/devicetree/bindings/display/sprd/dpu.yaml
new file mode 100644
index 0000000..54ba9b6f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sprd/dpu.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/sprd/dpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Unisoc SoC Display Processor Unit (DPU)
+
+maintainers:
+  - Mark Rutland <mark.rutland@arm.com>
+
+description: |
+  DPU (Display Processor Unit) is the Display Controller for the Unisoc SoCs
+  which transfers the image data from a video memory buffer to an internal
+  LCD interface.
+
+properties:
+  compatible:
+    const: sprd,sharkl3-dpu
+
+  reg:
+    maxItems: 1
+    description:
+      Physical base address and length of the DPU registers set
+
+  interrupts:
+    maxItems: 1
+    description:
+      The interrupt signal from DPU
+
+  clocks:
+    minItems: 2
+
+  clock-names:
+    items:
+      - const: clk_src_128m
+      - const: clk_src_384m
+
+  power-domains:
+    description: A phandle to DPU power domain node.
+
+  iommus:
+    description: A phandle to DPU iommu node.
+
+  port:
+    type: object
+    description:
+      A port node with endpoint definitions as defined in
+      Documentation/devicetree/bindings/media/video-interfaces.txt.
+      That port should be the output endpoint, usually output to
+      the associated DSI.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/sprd,sc9860-clk.h>
+    dpu: dpu@0x63000000 {
+          compatible = "sprd,sharkl3-dpu";
+          reg = <0x0 0x63000000 0x0 0x1000>;
+          interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
+          clock-names = "clk_src_128m",
+      	        "clk_src_384m";
+
+          clocks = <&pll CLK_TWPLL_128M>,
+                <&pll CLK_TWPLL_384M>;
+
+          dpu_port: port {
+                  dpu_out: endpoint {
+                          remote-endpoint = <&dsi_in>;
+                  };
+          };
+    };
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
