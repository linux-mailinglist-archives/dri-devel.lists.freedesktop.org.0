Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E42974667E1
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 17:25:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48D966F47D;
	Thu,  2 Dec 2021 16:25:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A14E36F47D
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Dec 2021 16:25:18 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id u22so714049lju.7
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Dec 2021 08:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F/X2rHEQd+Ucbeu0Y4aO3xdVUiQaaeBj1J30EhihxKs=;
 b=ZsHfNm2eziKXdlcYeMkKVQW9UerPtxFIVDlvToYifngdlP1woCI80BMNCQUeC6hVY9
 V9leCLPa1M1y5lyrfxg00COAo8GmEY+WralF/qN+TlCWScfNaGmY1CQN+DeAi0mT/Ab3
 iFmFPiA1waoDVT8jUCkA3MTM8xuIK3kEjYXv5bGZbOJy/lv8iytjOIv+7nEx67T/8N56
 QYMhXPzzzPBxXth0EExBmnRExcJUqWWGxvCg1aC9Acu8+54TCv8p7PyYHU6oWSnAPfr4
 dz02Xb/BZLsUPYz2SYyjgUkZOVA4iGU0M0JUrea3p3XHWqnoNxfml03NaKIq8OLlrneX
 Ej6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F/X2rHEQd+Ucbeu0Y4aO3xdVUiQaaeBj1J30EhihxKs=;
 b=DutejgS38MnxGeBmbsCSEvOHeeTBvgzecHvcAaVvE6gh68MjoaoyXsTSLH3jo9wJOK
 JNOWy8BREsthshZlsg+ICH3B2bKBOdhZ/IqzGHPVs6v6sLgYtaNhAf5p99jdFEwU0aJP
 AS91K9fQRPt5GC++IpI3F6rgmfG62GvbyBv/j8N76GfwfGqSZHEvN0tbgJ7OzK+Gycml
 EJ/QDiN1lk3gpB3p5ksboPcO90m09Tju3X+TrbTLGEnCtBlgSg6UiztIbuEbkHIX4PLK
 venIVQfBwVzppPDJ1s8M1kBJt1yyeb74ohClvTt+gIP4kCgfKZg9lDAT8mGu4pvSL0TS
 8tyw==
X-Gm-Message-State: AOAM5302vmB5rM7MPKQ20Zsykm6msVt1OhmPv1BJwHS1mynrgTKs/7Ki
 al5uxjCHjDDxkMleYebyiIQ=
X-Google-Smtp-Source: ABdhPJxjdeBBS4sFNL1pD6ub7cBQRrVaRXq2eSeIC5rlJ60PdQOVhO51JA7D4CnqBxl5gITOf6hkUA==
X-Received: by 2002:a05:651c:1546:: with SMTP id
 y6mr12305886ljp.76.1638462316891; 
 Thu, 02 Dec 2021 08:25:16 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id d18sm36806lfl.30.2021.12.02.08.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 08:25:16 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 01/20] ASoC: dt-bindings: Add binding for Tegra20 S/PDIF
Date: Thu,  2 Dec 2021 19:23:22 +0300
Message-Id: <20211202162341.1791-2-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211202162341.1791-1-digetx@gmail.com>
References: <20211202162341.1791-1-digetx@gmail.com>
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

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/sound/nvidia,tegra20-spdif.yaml  | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra20-spdif.yaml

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra20-spdif.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra20-spdif.yaml
new file mode 100644
index 000000000000..60a368a132b8
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
+      - const: out
+      - const: in
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
+        clocks = <&clk 99>, <&clk 98>;
+        clock-names = "out", "in";
+        resets = <&rst 10>;
+        dmas = <&apbdma 3>, <&apbdma 3>;
+        dma-names = "rx", "tx";
+        #sound-dai-cells = <0>;
+    };
+
+...
-- 
2.33.1

