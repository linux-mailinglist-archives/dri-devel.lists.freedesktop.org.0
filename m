Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B0746939D
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 11:25:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7A937A40D;
	Mon,  6 Dec 2021 10:20:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4B9C6E9C7
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Dec 2021 14:37:33 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id e11so11854278ljo.13
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Dec 2021 06:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F/X2rHEQd+Ucbeu0Y4aO3xdVUiQaaeBj1J30EhihxKs=;
 b=Hmo2bp0XD7MwfOW5ZCLk2GISHdr/yTvLIohTI7RHWuHGbeHlDJozx/LsdhpQe4yoH8
 A0PJJufbpQT4J4x549rDU6ERWTBWVUy73fRKupA2q9m+vVJnQKVTlHLeQsj2vwG+e2wJ
 YJ5PQvT9yS3tiaRak55w5VFSYMzfh37EbTpqs0XqQvdL8nv/ww6pxCYkv9UOVE+PR0I3
 aqIpYmAw4ZAbbmFphtECxow41rQMlYrds5ECDNmQDY6B5ypKDw30gze6Zm8/AziQAhgU
 1/Oiq9L2G9GM2qOkn/zeMBWjxkuoy84PVTgD+c4beyfgl/LWOn3CKFOUScHNfBdOcYNu
 HgQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F/X2rHEQd+Ucbeu0Y4aO3xdVUiQaaeBj1J30EhihxKs=;
 b=tEDRRF2ftvYO78MaCZ4TeXhWDspPUwQRy0HdfjBGbRWWrk+oCcYkXSyZfZ3b8L7In7
 JKpJGy48fA91A6dWt8Zdltq5rhpdz4A0Y/iNB2Bzf83WYqeRM54FjD9FnVFqur9ixvRC
 ZpctmqX7cB9CMOC6sXw2w6SqwiS/NYdh4s+xYfA3HSHJElmjEypcHcDkDnRYtraSYH57
 3lGpQIuB7tye5RLmaoao/IxMtWMv1sVd+XaaXgkcGkupehV5OGop4VKmcfuSxfO9N/8n
 U5fQCwTUeUOCHnnUCfTtf2v1vUeJUGYiAIXLdjm1anCtm6NCgoHdmIcFoMIkCuSVVEMf
 rQJQ==
X-Gm-Message-State: AOAM532r6rLbQzXdWt5XvpvCHQzkhL6gQG6xVWFQhv3MGSwgEhl4aQnl
 Dy/isKID+T5u5FSJIDDbTHM=
X-Google-Smtp-Source: ABdhPJwcdgRw44pXn41+KUa5AP/jULS0ohcmHnZPCR7EdYs/LEdBhNkorjhYbQ3H4RJ980OeL+c3Fg==
X-Received: by 2002:a2e:9bc9:: with SMTP id w9mr24035834ljj.27.1638628652007; 
 Sat, 04 Dec 2021 06:37:32 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id g36sm782934lfv.16.2021.12.04.06.37.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 06:37:31 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>
Subject: [PATCH v4 01/22] ASoC: dt-bindings: Add binding for Tegra20 S/PDIF
Date: Sat,  4 Dec 2021 17:37:04 +0300
Message-Id: <20211204143725.31646-2-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211204143725.31646-1-digetx@gmail.com>
References: <20211204143725.31646-1-digetx@gmail.com>
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
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-tegra@vger.kernel.org
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

