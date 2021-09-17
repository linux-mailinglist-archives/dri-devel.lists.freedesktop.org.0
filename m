Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 611E24104BB
	for <lists+dri-devel@lfdr.de>; Sat, 18 Sep 2021 09:25:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDC6F6E0E1;
	Sat, 18 Sep 2021 07:25:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 676466EC6C
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 12:57:57 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 d207-20020a1c1dd8000000b00307e2d1ec1aso6811045wmd.5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 05:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iFUWw1a7QUKqKqitz2aLpXkNS/Ii3+Zh8E8PhFDc+ws=;
 b=0aPjARok8/bfyOykh5nmswrCWnnajZ9Af1BN4K/pxHOLzmexwy5ZSttA5vuhF+CteC
 jK/VKVic+QznbXHckMZV+vyrkKEAOQV7FSpYqgsPyImc+0nDdIL+qapHkvFD9hfn9HFw
 c/8hYl7aD9GYrpTdiOGoleERAwIz4yRWaXhAqFXEQIjTEGeDm+TB2s2hoa4RiHeDXozX
 pzaSQup9ftlw3Sx/54iPCDZsQgq2EZOGF+jmVIoVQGpaxuo//v/vIH52vpw7CcX59/Bj
 LK5trF/UjX8E5Z4bjl9Je4k96vrzzjCw6+zQWuNfbaMWusngmJzUb40pYixCah6EoQ6p
 uGQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iFUWw1a7QUKqKqitz2aLpXkNS/Ii3+Zh8E8PhFDc+ws=;
 b=wILMLetdPnYpU+rwN1FKlq+FyY5y7lhfxVr2mbKanjqVGOyjs0cmzvFB6LZrd7w/Mz
 +rih1Eib+Wrzh5737+VVHfxwtWeOM46nn4+iiUa0hkcyxgZS62sXhmNH1VYp3Cx3bG5p
 hlSAZUr1mBT7U5tGOiRHSeLkacnJq7auCZxgen8uj6mpjRFp1FxR4Cy+dzl4nt6TXTSp
 +5a1ySmf0AKMxYW9dGWwMmyBfAV/8jxDM1IbSmVh9b2DoHlAsMlYNoSGPrX2meuUUTF3
 4LGmvghYdsnICEU70UAldoeELdYn1CG1FVNy39chOC9BMFFFNfDvzMZ1gmMvOmuO1jUa
 1ucg==
X-Gm-Message-State: AOAM532R1RA4j55tIOxP95k+QoyddwfZfKiWcLGkRu5iLr4qPk8jyotz
 IM1+K+4PDoz8PGYnJWRxPyqR0w==
X-Google-Smtp-Source: ABdhPJxWy0XCmee8O9AAHX/X1X4XNYljnsvUJuOMbUQaDzoewnSPgl2VT0nmiywxBLNmsxTlY3hzgQ==
X-Received: by 2002:a05:600c:3ba3:: with SMTP id
 n35mr10075940wms.166.1631883475858; 
 Fri, 17 Sep 2021 05:57:55 -0700 (PDT)
Received: from localhost.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id f3sm6358636wmj.28.2021.09.17.05.57.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 05:57:55 -0700 (PDT)
From: Alexandre Bailon <abailon@baylibre.com>
To: airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 matthias.bgg@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, ohad@wizery.com,
 bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
 sumit.semwal@linaro.org
Cc: christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, khilman@baylibre.com, gpain@baylibre.com,
 Alexandre Bailon <abailon@baylibre.com>
Subject: [RFC PATCH 1/4] dt-bindings: Add bidings for mtk,apu-drm
Date: Fri, 17 Sep 2021 14:59:42 +0200
Message-Id: <20210917125945.620097-2-abailon@baylibre.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210917125945.620097-1-abailon@baylibre.com>
References: <20210917125945.620097-1-abailon@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 18 Sep 2021 07:25:35 +0000
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

This adds the device tree bindings for the APU DRM driver.

Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
---
 .../devicetree/bindings/gpu/mtk,apu-drm.yaml  | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml

diff --git a/Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml b/Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml
new file mode 100644
index 0000000000000..6f432d3ea478c
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
2.31.1

