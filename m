Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A0745F1A2
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 17:19:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3BD56F909;
	Fri, 26 Nov 2021 16:19:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15CFD6F900
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 16:19:41 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id d11so19689258ljg.8
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 08:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qK0ts7tSPXqbn+UV99/el3TluqWl3fnnOWodFc+vpkg=;
 b=Pmn0vtIlqSKEdyEV/mRDjpdG0O/iIE7rX0GbGsZ326iW9MdkgI+N5JaHDiQcV0ZmS9
 s4mpBHjz/7079fkGZPCvb2Vo0bI3spK0A3LWqDQ+dpdFVGntM/eWN9OoWOuyRTH+64B3
 IaHtf/9xA6SzLzmJjcZL++iKWiBokestwrBvJiNUVh4Yk9aYXyl6lPVkacuxZGZ/Bx/N
 bIoV6e8Le0wnz6SsRhMauxy7ArLSQrzlpxcv2FF4mP++cZ2c2pd0I+d3K7wMxTvetWbP
 U87t+R2UCkC04NPB0LqGKnYfFl9jL2UWUYLDxdyTg3RGEaqSxNumKFEA9qakcaeJmDae
 npbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qK0ts7tSPXqbn+UV99/el3TluqWl3fnnOWodFc+vpkg=;
 b=4RqWRFmfBTKZ+EjlzhetNJrxpX/M4p6julCwOHymmCDDqfB8s9Wnr0A4B7u1z7GyhL
 OIwvsB7mEf0E2vhRCxYxUN8spwI8sh0nY4XBfAnppySj/keFH33kOFKAvVIU8gFK8NhJ
 +LwXNe8a7G0QYzS4QwH9WLB+bBRYDteVSbtidkkp025G4FkmLFIQg4I71xCUcpX2SHml
 zFKHrp2GrB+Gk/EpXCjWdw2SxFRntEHWn7ndoyQ4GiGgcLRVpX7rofcKBQPMHqmEEnTT
 5JydBmXfZOyP5mLoE04CoX2WWA3v3y7rQFi9fPj/gI6Z9GFJQVGCAmkyLgEDK7RRUCC0
 t0aw==
X-Gm-Message-State: AOAM530/I6MgTRIarafgQNIBznpiQ1Xo4fmO1JjqbYfBbiYm8LQXwJX3
 vYM4K/bg9+w+WmcdM9BU/Cs=
X-Google-Smtp-Source: ABdhPJxTJmcAap80hyd09S2lN6AlqNMLYeO32b48+fRf5WDQzP8DiYELFZORQcZMSD+wC0g73ko2fQ==
X-Received: by 2002:a2e:2a41:: with SMTP id q62mr30884162ljq.515.1637943579438; 
 Fri, 26 Nov 2021 08:19:39 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id t7sm613381lfl.260.2021.11.26.08.19.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 08:19:38 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 01/20] ASoC: dt-bindings: Add binding for Tegra20 S/PDIF
Date: Fri, 26 Nov 2021 19:17:48 +0300
Message-Id: <20211126161807.15776-2-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126161807.15776-1-digetx@gmail.com>
References: <20211126161807.15776-1-digetx@gmail.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add device-tree binding for Tegra20 S/PDIF controller.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/sound/nvidia,tegra20-spdif.yaml  | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra20-spdif.yaml

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra20-spdif.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra20-spdif.yaml
new file mode 100644
index 000000000000..00240205817d
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra20-spdif.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nvidia,tegra20-spdif.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra20 S/PDIF Controller
+
+description: |
+  The S/PDIF controller supports both input and output in serial audio
+  digital interface format. The input controller can digitally recover
+  a clock from the received stream. The S/PDIF controller is also used
+  to generate the embedded audio for HDMI output channel.
+
+maintainers:
+  - Thierry Reding <treding@nvidia.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+properties:
+  compatible:
+    const: nvidia,tegra20-spdif
+
+  reg:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 2
+
+  clock-names:
+    items:
+      - const: spdif_out
+      - const: spdif_in
+
+  dmas:
+    minItems: 2
+
+  dma-names:
+    items:
+      - const: rx
+      - const: tx
+
+  "#sound-dai-cells":
+    const: 0
+
+  nvidia,fixed-parent-rate:
+    description: |
+      Specifies whether board prefers parent clock to stay at a fixed rate.
+      This allows multiple Tegra20 audio components work simultaneously by
+      limiting number of supportable audio rates.
+    type: boolean
+
+required:
+  - compatible
+  - reg
+  - resets
+  - interrupts
+  - clocks
+  - clock-names
+  - dmas
+  - dma-names
+  - "#sound-dai-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    spdif@70002400 {
+        compatible = "nvidia,tegra20-spdif";
+        reg = <0x70002400 0x200>;
+        interrupts = <77>;
+        clocks = <&tegra_car99>, <&tegra_car 98>;
+        clock-names = "spdif_out", "spdif_in";
+        resets = <&tegra_car 10>;
+        dmas = <&apbdma 3>, <&apbdma 3>;
+        dma-names = "rx", "tx";
+        #sound-dai-cells = <0>;
+    };
+
+...
-- 
2.33.1

