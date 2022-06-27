Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E605E55BBC5
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 21:41:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12EF211B2BA;
	Mon, 27 Jun 2022 19:41:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BDBA11B293
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 19:41:27 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 h14-20020a1ccc0e000000b0039eff745c53so6246936wmb.5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 12:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MzCNuZqg5sJhSSZ4d8it+v4YJ89K4kJOhMYbzqau3T0=;
 b=cUa3Qgj83LJO9FwTx4+4xOL790JLFgJuhmgrSJi2YTyi4TgZ3QHn23OZlSeP4eGr4a
 +enZvFjacedK5hJJSmGuCcyBjxh6MEKPUZcAKWykCCkkzvwUXNfJsUoFjLQwQryYFGEJ
 SEbmehS1/iTbEmVVTU2q3WXprQHUDo8Yv+5IRCY/CL6szKGQQ7BpxVYKxwivyntZnwWp
 5Xv8KR8mPYL/SOmWZuX8ct7NDa7Xzt9ST4L4cgfrh9H9lYDK+db/7RreYUhPECg4PNpK
 JaGXGh00MEhhzcMG33inGWEsNDk9YWUpGPQgCmkOL0K2m2AjTH2Zi02b+cHy0MmqI0tK
 MzQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MzCNuZqg5sJhSSZ4d8it+v4YJ89K4kJOhMYbzqau3T0=;
 b=eqsnC/1xbA3Nm3ds8aUk+i45dES/39iD0uFaCNxpCHoefZNEi9PoHCAaf58CIIU1X0
 yVcTU4SKp+p3bbSz3sZiKbwCdqO5g88/mW0ud5VKHZ2G2pzoxc1VPy4abfnMLPAF6suz
 Q+9QksbF1DIPbd1PRdBz+xCPIqDty4Ej+TL2/NnwTdhWvUW3e/XFTEIxA/ChJ9eATyOJ
 bR/u3EnHeM9jKY2ngg14x9Xp64AXKZeVqLoT5Qa9wp1JnfU7eLr8afqCjHGYcwrxhhVf
 zbflf8FBVtUyOwnH94PafJYmGuCX9nGqBwYQ51/Rkb+nT9fnb7jgm18whLXzCRHsioV4
 28JA==
X-Gm-Message-State: AJIora9lOlaAZRS+naKzmJQi6fnjEMj5XQDeNlvr2HUMRixJJF7YR+AP
 57//tbOMAs7LyXJYFCqY0HhDzg==
X-Google-Smtp-Source: AGRyM1t6tJJ0mxAtUsYUzthMYkrnacnVvnK447unbGgsisXeL7ZGVx2xR03CLUvVfWRC838snmZcVA==
X-Received: by 2002:a1c:4b05:0:b0:3a0:32df:533 with SMTP id
 y5-20020a1c4b05000000b003a032df0533mr22012475wma.155.1656358885670; 
 Mon, 27 Jun 2022 12:41:25 -0700 (PDT)
Received: from henark71.. ([51.37.234.167]) by smtp.gmail.com with ESMTPSA id
 e9-20020a5d4e89000000b0021a3a87fda9sm11428047wru.47.2022.06.27.12.41.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 12:41:25 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v2 06/16] dt-bindings: timer: add Canaan k210 to Synopsys
 DesignWare timer
Date: Mon, 27 Jun 2022 20:39:54 +0100
Message-Id: <20220627194003.2395484-7-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627194003.2395484-1-mail@conchuod.ie>
References: <20220627194003.2395484-1-mail@conchuod.ie>
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
Cc: linux-riscv@lists.infradead.org, Niklas Cassel <niklas.cassel@wdc.com>,
 alsa-devel@alsa-project.org, Albert Ou <aou@eecs.berkeley.edu>,
 devicetree@vger.kernel.org, Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 linux-kernel@vger.kernel.org, Heng Sia <jee.heng.sia@intel.com>,
 linux-spi@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Jose Abreu <joabreu@synopsys.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel@lists.freedesktop.org, Paul Walmsley <paul.walmsley@sifive.com>,
 dmaengine@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Dillon Min <dillon.minfei@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Conor Dooley <conor.dooley@microchip.com>

The Canaan k210 apparently has a Sysnopsys Designware timer but
according to the documentation & devicetree it has 2 interrupts rather
than the standard one. Add a custom compatible that supports the 2
interrupt configuration and falls back to the standard binding (which
is currently the one in use in the devicetree entry).

Link: https://canaan-creative.com/wp-content/uploads/2020/03/kendryte_standalone_programming_guide_20190311144158_en.pdf #Page 58
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/timer/snps,dw-apb-timer.yaml     | 28 +++++++++++++++----
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml b/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml
index d33c9205a909..9a76acc7a66f 100644
--- a/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml
+++ b/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml
@@ -12,6 +12,9 @@ maintainers:
 properties:
   compatible:
     oneOf:
+      - items:
+          - const: canaan,k210-apb-timer
+          - const: snps,dw-apb-timer
       - const: snps,dw-apb-timer
       - enum:
           - snps,dw-apb-timer-sp
@@ -21,9 +24,6 @@ properties:
   reg:
     maxItems: 1
 
-  interrupts:
-    maxItems: 1
-
   resets:
     maxItems: 1
 
@@ -41,7 +41,23 @@ properties:
 
   clock-frequency: true
 
-additionalProperties: false
+unevaluatedProperties: false
+
+if:
+  properties:
+    compatible:
+      contains:
+        const: canaan,k210-apb-timer
+
+then:
+  properties:
+    interrupts:
+      maxItems: 2
+
+else:
+  properties:
+    interrupts:
+      maxItems: 1
 
 required:
   - compatible
@@ -60,8 +76,8 @@ oneOf:
 examples:
   - |
     timer@ffe00000 {
-      compatible = "snps,dw-apb-timer";
-      interrupts = <0 170 4>;
+      compatible = "canaan,k210-apb-timer", "snps,dw-apb-timer";
+      interrupts = <0 170 4>, <0 170 4>;
       reg = <0xffe00000 0x1000>;
       clocks = <&timer_clk>, <&timer_pclk>;
       clock-names = "timer", "pclk";
-- 
2.36.1

