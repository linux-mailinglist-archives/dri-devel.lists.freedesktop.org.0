Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0F52EEAB4
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 02:10:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B9BD6E5C0;
	Fri,  8 Jan 2021 01:10:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B68B06E5C0
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 01:10:21 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id x18so4805762pln.6
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jan 2021 17:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uW2DZ7++hBKvfAfIb4cUFZ4hOVC2XsuncgcT5bF8JnM=;
 b=LRt6wt6zwQgeeZf8xg4HcyENMcrZzQVkz9tGJoA6djOlZ1N3MP4kaflXq2plSxgFmc
 OlhEnQnmrC8TvP7M9bX4FqBN3JKXxILyCyrcCFl9eeA6qrVHyURp7SrTKiUiffsJq/QG
 R0gPecLoLZ4tk+CgPSbefZeAEnWiaCcVyEEQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uW2DZ7++hBKvfAfIb4cUFZ4hOVC2XsuncgcT5bF8JnM=;
 b=ULn8zz36a3PoX7rQMFmItfvPdlVn2JFbD1FtVR5G1a7QiFhIsX1SLvlL+l9lqW1jM1
 /7F14a+Ej+3eqUzE+KtqYBfiNj4NLnc9seDFOcNGtUQQxaJR1xNwshiuCbokiaq3JhCL
 NWsdx4322Hvcfu77Xbzz2WqBKFg2QxhZ5kLkcMfluZXGCpNriE/KBggrQ91bPEgDJLV2
 h/OEBn5lUz2ZgCWUcTzTz0+/wIoG/pLskEA34a6RiA/QbxxrhgT2w4uDghiUN5q8hZdG
 5rfwEoM8ES2cDTtmcyrwCl9YxSH0Rd48TI1/5NYMjAlyhg0Mk0oC35BTQgx8FR4HD6GO
 SdRQ==
X-Gm-Message-State: AOAM530S/+ADfIhcWdNbn7OJU8x4zp3CgWAlCGYJRw3EYmhlEl0LoxiH
 UMYH6Mx2rWMpAuj7p5EevWK8Sw==
X-Google-Smtp-Source: ABdhPJwdO6ZcHG1U4ALrAyJ4b4UCm4nWNkd1/YwfnuNlNEfcdJ5LV471yb4CJzOXi1o8bg+Vgh3XJw==
X-Received: by 2002:a17:90a:7e18:: with SMTP id
 i24mr1163773pjl.72.1610068221365; 
 Thu, 07 Jan 2021 17:10:21 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:7220:84ff:fe09:41dc])
 by smtp.gmail.com with ESMTPSA id s1sm6400083pfb.103.2021.01.07.17.10.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 17:10:20 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Subject: [PATCH v9 1/4] dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
Date: Fri,  8 Jan 2021 09:10:08 +0800
Message-Id: <20210108091005.v9.1.Ie74d3355761aab202d4825ac6f66d990bba0130e@changeid>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
In-Reply-To: <20210108011011.4061575-1-drinkcat@chromium.org>
References: <20210108011011.4061575-1-drinkcat@chromium.org>
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, fshao@chromium.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, boris.brezillon@collabora.com,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 hsinyi@chromium.org, Matthias Brugger <matthias.bgg@gmail.com>,
 hoegsberg@chromium.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Define a compatible string for the Mali Bifrost GPU found in
Mediatek's MT8183 SoCs.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
Reviewed-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
---

(no changes since v6)

Changes in v6:
 - Rebased, actually tested with recent mesa driver.
 - No change

Changes in v5:
 - Rename "2d" power domain to "core2"

Changes in v4:
 - Add power-domain-names description
   (kept Alyssa's reviewed-by as the change is minor)

Changes in v3:
 - No change

 .../bindings/gpu/arm,mali-bifrost.yaml        | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 184492162e7e..71b613ee5bd7 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -17,6 +17,7 @@ properties:
     items:
       - enum:
           - amlogic,meson-g12a-mali
+          - mediatek,mt8183-mali
           - realtek,rtd1619-mali
           - rockchip,px30-mali
       - const: arm,mali-bifrost # Mali Bifrost GPU model/revision is fully discoverable
@@ -87,6 +88,30 @@ allOf:
     then:
       required:
         - resets
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8183-mali
+    then:
+      properties:
+        sram-supply: true
+        power-domains:
+          description:
+            List of phandle and PM domain specifier as documented in
+            Documentation/devicetree/bindings/power/power_domain.txt
+          minItems: 3
+          maxItems: 3
+        power-domain-names:
+          items:
+            - const: core0
+            - const: core1
+            - const: core2
+
+      required:
+        - sram-supply
+        - power-domains
+        - power-domains-names
 
 examples:
   - |
-- 
2.29.2.729.g45daf8777d-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
