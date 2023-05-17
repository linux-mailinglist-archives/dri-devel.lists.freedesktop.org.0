Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CD7706BC3
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 16:53:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B90210E43D;
	Wed, 17 May 2023 14:53:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9359D10E435
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 14:52:53 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id
 ffacd0b85a97d-3093a6311dcso872833f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 07:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684335171; x=1686927171; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9mr1L/m4ima+2h/NhXtcjqbHddpi6u41EWoGArxh1iQ=;
 b=pdG2+3ODw0cGuNg/LORzvNsUqX1IiweDfrWioVGocQZDWZOWLRqkDaX4MTzyiQe1c7
 pkyEeUQ7xqMrhFPqgtTXbdZp3T0rwW0l0BIMsILSnzXcX/Sd7NVDoMo/aiSxsYvHmvbE
 9CFhqMy1vU2U8NqgvLhl8WgFol9WpTF6r6EFUqq/RKyHw1v7dAJHBpN4C35EGlhKFu2m
 bv8X2zua8yim+q2TU1Nwjf+yYUMToKg1IrzAFE9ZZPxUgS9V2JJXJY3xZezoYKEGwVXh
 5JUMdyDg8DXWWvuNp3X07uEX8GvfXlSZm2H1ourLwVfh0bfHuRQHtAUbRtnalP8rK24w
 5aJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684335171; x=1686927171;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9mr1L/m4ima+2h/NhXtcjqbHddpi6u41EWoGArxh1iQ=;
 b=G6MqWWZnwoPTwUnUMR0JTgIxEYKntRxy8h5MJ7f2oDmDKfhATTBlbMDoEuTZ8K7DOw
 S+Rk4++BWs6NAtpqoMKoPEaUVehqlmMSyKIa/AAXJfk3vNhIQ0grV6h4+F/3Khom6ee9
 O+qnSpyuBQ7zYhzn713vpxdqA4y/9qEcakaX1tlMXYTzd88zofRhhSYF2CGT2TUGizkK
 cDv61LAW18yDVQcxPZWrVbOwz+HUDWW4mO3nzjQrBOSQYKZp6gsQNW2RwB/7ZaeDy6K/
 w0gdLRV128l7hYMe4fgqZlFoJAJMLwvmlflRUSn5UTY+/OVVAGAL783WAWjPe1GCVLXS
 dLrA==
X-Gm-Message-State: AC+VfDzZuLqaXAOUuhgG4iEgn9XtN/6x4xd76pLOhCTl3kuqa3cSmYpq
 R24+hYc5ENUNgxgLzMn3YWna4g==
X-Google-Smtp-Source: ACHHUZ7D+XIYOY7fwEt1VA+EKenIzVfyhPoXQPx4ACohe42JP1CZtzERdmroTv625PctD16NHx1kmg==
X-Received: by 2002:adf:e450:0:b0:307:97dd:1de2 with SMTP id
 t16-20020adfe450000000b0030797dd1de2mr930581wrm.25.1684335171626; 
 Wed, 17 May 2023 07:52:51 -0700 (PDT)
Received: from blaptop.baylibre
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id
 v11-20020a5d678b000000b002f7780eee10sm2979098wru.59.2023.05.17.07.52.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 May 2023 07:52:51 -0700 (PDT)
From: Alexandre Bailon <abailon@baylibre.com>
To: airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de
Subject: [PATCH 7/7] dt-bindings: Add bidings for mtk,apu-drm
Date: Wed, 17 May 2023 16:52:37 +0200
Message-Id: <20230517145237.295461-8-abailon@baylibre.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517145237.295461-1-abailon@baylibre.com>
References: <20230517145237.295461-1-abailon@baylibre.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, bero@baylibre.com,
 khilman@baylibre.com, jstephan@baylibre.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 linaro-mm-sig@lists.linaro.org, Alexandre Bailon <abailon@baylibre.com>,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, nbelin@baylibre.com,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-media@vger.kernel.org, sumit.semwal@linaro.org,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds the device tree bindings for the APU DRM driver.

Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
Reviewed-by: Julien Stephan <jstephan@baylibre.com>
---
 .../devicetree/bindings/gpu/mtk,apu-drm.yaml  | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml

diff --git a/Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml b/Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml
new file mode 100644
index 000000000000..6f432d3ea478
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpu/mediatek,apu-drm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AI Processor Unit DRM
+
+properties:
+  compatible:
+    const: mediatek,apu-drm
+
+  remoteproc:
+    maxItems: 2
+    description:
+      Handle to remoteproc devices controlling the APU
+
+  iova:
+    maxItems: 1
+    description:
+      Address and size of virtual memory that could used by the APU
+
+required:
+  - compatible
+  - remoteproc
+  - iova
+
+additionalProperties: false
+
+examples:
+  - |
+    apu@0 {
+      compatible = "mediatek,apu-drm";
+      remoteproc = <&vpu0>, <&vpu1>;
+      iova = <0 0x60000000 0 0x10000000>;
+    };
+
+...
-- 
2.39.2

