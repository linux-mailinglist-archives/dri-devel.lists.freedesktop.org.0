Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EEF538C15
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 09:41:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49D5E10F477;
	Tue, 31 May 2022 07:41:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0837E112177
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 20:15:00 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id q21so4822112wra.2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 13:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v1KekYBsM60PWOUWQkx+YAzcNsdLIbx5495ax2Uk44I=;
 b=CqyGXFlBzgROVHYp7ecYqfw78XKSS+1L6CsO2OmUQm1gW9QrLMVzAign7WkMfXoBme
 A8lr2oORL6b6NHYKjjkGlHMWy7WFnjRrmqtAWvs/Q9zTHfZTXuiqF3FDL3d9wiX/in6V
 1y+cx25AaHHtQ/O9bqYMNx4kDPTzWFDu+rFFWtZ+VbALHzs8N3WQ9XJKKYwr7qvthQfp
 skZkKYkVdVHMoEGPFjwk/62HwsA0GrOQw6QBBXa3+BnVTT+YrZOyX75AW/4ZXbrAZ+Px
 05flweFs9wJmVhJcMbp4jwVZB++k4TYn8pbr+gMqfBnuWNl1Ka8iCQB8UiZ18JHZw7Q2
 r9eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v1KekYBsM60PWOUWQkx+YAzcNsdLIbx5495ax2Uk44I=;
 b=WuvuEtGctMdnJEDN7TwpFCaaKC99s7ZPdLtNPmsg800PJT57iNDifZO9MQwBnXi2v9
 US7PiVyeDmJLynqs7zZ2xGLPVeqbYxdipM1BN3fsLMWD+DxKmBqDes1xsXDpcNP/NlX4
 LnvsjXUQDdZ6xXo6eBeZG9zJqdmjrojZHVzvItaJBki+pSvTXoRWztrWpxigdLWY7sXk
 2IQawdXu7R61OrGA5+R29lUKXaAf8bC0CGiwZC6BO2bmYlG1axjkRenQTSE+2EOUTAN3
 kkwZC51H+hbduHGzTCaBK/p3d2BvqQCmpi84dKxJFn8inFa63xfjgBddywkjVNWu252e
 EuAw==
X-Gm-Message-State: AOAM532Ulp9X4BLaBl4U1iNNciJjgZyK6RHZNVFbz4QoT8gFpwkqYW+9
 6JcbmkIJoJJr8IOi9VuWAOxfbQ==
X-Google-Smtp-Source: ABdhPJywyGKnqq1V2paxWnR8T4gDyaRPZAbgv7ZM88KcD65BYAgOubg2wGcIuvlSdR++OtUlPvntWw==
X-Received: by 2002:a5d:5281:0:b0:20c:d5be:331c with SMTP id
 c1-20020a5d5281000000b0020cd5be331cmr46490408wrv.9.1653941699537; 
 Mon, 30 May 2022 13:14:59 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id
 t1-20020adfe101000000b0020d110bc39esm9770401wrz.64.2022.05.30.13.14.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 13:14:58 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: matthias.bgg@gmail.com, ck.hu@mediatek.com, jitao.shi@mediatek.com,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org
Subject: [PATCH 1/7] dt-bindings: display: mediatek: dpi: add power-domains
 property
Date: Mon, 30 May 2022 22:14:30 +0200
Message-Id: <20220530201436.902505-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 31 May 2022 07:41:20 +0000
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
Cc: chunkuang.hu@kernel.org, devicetree@vger.kernel.org, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Fabien Parent <fparent@baylibre.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DPI is part of the display / multimedia block in MediaTek SoCs, and
always have a power-domain (at least in the upstream device-trees).
Add the power-domains property to the binding documentation.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml  | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index 77ee1b923991..caf4c88708f4 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -57,6 +57,9 @@ properties:
       Output port node. This port should be connected to the input port of an
       attached HDMI or LVDS encoder chip.
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -64,6 +67,7 @@ required:
   - clocks
   - clock-names
   - port
+  - power-domains
 
 additionalProperties: false
 
@@ -71,11 +75,13 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/power/mt8183-power.h>
 
     dpi0: dpi@1401d000 {
         compatible = "mediatek,mt8173-dpi";
         reg = <0x1401d000 0x1000>;
         interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_LOW>;
+        power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
         clocks = <&mmsys CLK_MM_DPI_PIXEL>,
              <&mmsys CLK_MM_DPI_ENGINE>,
              <&apmixedsys CLK_APMIXED_TVDPLL>;
-- 
2.36.1

