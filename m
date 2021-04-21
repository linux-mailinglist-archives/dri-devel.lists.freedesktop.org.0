Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A15553664D0
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 07:29:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 382ED6E945;
	Wed, 21 Apr 2021 05:29:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BCB86E945
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 05:29:05 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id c3so8815496pfo.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 22:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kxnhLi78DPDSYFjxJIM+qzcCyplsSYCFm1pDPKchpRM=;
 b=hmTmxKk7RkXuD+YrXgXMT7YbIC9neJ63/n1UtLtvvY3ocKbGWYT7FRURBUJSutrmJW
 qxVfRy5vX/W6NqaKXQNqwkiwlb7RR0HTYRciruFEEb8N2oQPOaTQsSbNON3gBZ2l/Bdi
 FZqMALQbvzzM42Np2JYnVdxQGwEWEkli7Uq6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kxnhLi78DPDSYFjxJIM+qzcCyplsSYCFm1pDPKchpRM=;
 b=BjFUWVbbIaqeX1hBS2DeYjjfPAUGmRhlkXMGwwFDB6MJhVtH2pyahyKRU4DhWnDruR
 GnHGeJgywVaFfiZHaj4SBxZBcgYwQdlF5/X1QpiSbecSTZAk9pav58xdnG3ymXo5Vvwb
 uIPYcwMQgV6QjbF+1FdF544o/ciOXbIWGAivzv3WG4cb0CC5yPZM55i4JviiFXuoKDwv
 G3MhOnxPGNjvlTXrGcMpRzjZi8TxITTidanBnRF9TVsEEcEreclTcMWaNT41aXECni7c
 wokNQ/vS9q0usp6lESsERi9XuuCgn9rJMlVVWd5opxwIgMrnoqw8YU0/8t4q2I7aoVpE
 7MHg==
X-Gm-Message-State: AOAM530HHzGqZvJWjOV6j+MtSItB8y9E6voKVzTrWZhOSpth2fw/xbuD
 mXUi0o7PGfxVIwmRHlIO23fevg==
X-Google-Smtp-Source: ABdhPJyhb2uM0S9Pz4wG6iMzL3FZiBTC1btTNtARSLk++FAK0bWUnZI684adzhBP8AOcY3vu81YTNg==
X-Received: by 2002:a62:aa09:0:b029:25c:3c28:e2b with SMTP id
 e9-20020a62aa090000b029025c3c280e2bmr18791955pff.39.1618982945075; 
 Tue, 20 Apr 2021 22:29:05 -0700 (PDT)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:b3e5:49c0:4843:2bbe])
 by smtp.gmail.com with ESMTPSA id b6sm602537pfa.185.2021.04.20.22.29.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 22:29:04 -0700 (PDT)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Subject: [PATCH v13 1/4] dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
Date: Wed, 21 Apr 2021 13:28:52 +0800
Message-Id: <20210421132841.v13.1.Ie74d3355761aab202d4825ac6f66d990bba0130e@changeid>
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
In-Reply-To: <20210421052855.1279713-1-drinkcat@chromium.org>
References: <20210421052855.1279713-1-drinkcat@chromium.org>
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
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 fshao@chromium.org, linux-kernel@vger.kernel.org,
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
---

(no changes since v12)

Changes in v12:
 - binding: Fix min/maxItems logic (Rob Herring)

Changes in v11:
 - binding: power-domain-names not power-domainS-names

Changes in v10:
 - Fix the binding to make sure sram-supply property can be provided.

Changes in v6:
 - Rebased, actually tested with recent mesa driver.

Changes in v5:
 - Rename "2d" power domain to "core2"

Changes in v4:
 - Add power-domain-names description
   (kept Alyssa's reviewed-by as the change is minor)

 .../bindings/gpu/arm,mali-bifrost.yaml        | 30 ++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 184492162e7e..b22cd8f1b015 100644
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
@@ -41,10 +42,13 @@ properties:
 
   mali-supply: true
 
+  sram-supply: true
+
   operating-points-v2: true
 
   power-domains:
-    maxItems: 1
+    minItems: 1
+    maxItems: 3
 
   resets:
     maxItems: 2
@@ -87,6 +91,30 @@ allOf:
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
+        power-domains:
+          minItems: 3
+        power-domain-names:
+          items:
+            - const: core0
+            - const: core1
+            - const: core2
+
+      required:
+        - sram-supply
+        - power-domains
+        - power-domain-names
+    else:
+      properties:
+        power-domains:
+          maxItems: 1
+        sram-supply: false
 
 examples:
   - |
-- 
2.31.1.368.gbe11c130af-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
