Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E08D72ECBB3
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 09:27:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF21A6E409;
	Thu,  7 Jan 2021 08:27:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82D766E409
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 08:27:07 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id n25so4365453pgb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jan 2021 00:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XpndNtEhPNiPnJlNZJY14B7qFPqqFru+Jd25xhO0eCA=;
 b=CCIqzTVbaqQ4xH2qjUNPXVmi3/8fMX6PZZ9aRDj7LN3QiX7o5wP18sPAnYp/cQqw2l
 zWArJJlt/c1XprpPe/fibef8DtWX+l0eiohRN0M/6SMOwm5PXqi72F4kELz93iIb9Usg
 cL97G4vq2WyRMDgPBlO++jamO95iUbcGNFPl4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XpndNtEhPNiPnJlNZJY14B7qFPqqFru+Jd25xhO0eCA=;
 b=mojulNwy4kpu1QKIQXaLs9vW4whiSC5K0rDgkAeOA9BOZSmLhrEWfpfbBVqG5XmPXZ
 9sgquGv1YQQob4IXGV1roe4fqu27/XZCB1yftO+tVoVJUVdhsmI6aRggSFNKP3EJWIy2
 fZtz6c91LM20+n6XEm8oR3o3FIFBd2ineLPv/pNzJ6oDG44bLiYNjJYAYZ9hPnZgAWBJ
 Kdy2Ys7Eyqf/1DI7n4WINf6fbhVtC8AH3YB9XzrwAAJbYnH1gsE1hJv3metebJEG94/9
 wp8TStKpHp0JQXLszs4vRDhxL7LLgq/egYLDIaYMrA8OB8lXtmeM1KSKaz/VCDDFm9pO
 q77w==
X-Gm-Message-State: AOAM5308Fjy7E4nMczYBnRa7aFl8YZ0mRIeDjABz41A8jhLNKL4ka6N0
 U4WaPdPreUleEl+wv4apLV5G0w==
X-Google-Smtp-Source: ABdhPJyDRvZwDRdfn6gwo/sWqjBrwSNaAvcRYBsmcZtej2I+KzJ+rQjSlJkbD6E2xtI6RP8hdgHDDA==
X-Received: by 2002:a63:2fc5:: with SMTP id v188mr748878pgv.243.1610008027155; 
 Thu, 07 Jan 2021 00:27:07 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:7220:84ff:fe09:41dc])
 by smtp.gmail.com with ESMTPSA id o14sm5825580pgr.44.2021.01.07.00.27.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 00:27:06 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Subject: [PATCH v7 1/4] dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
Date: Thu,  7 Jan 2021 16:26:50 +0800
Message-Id: <20210107162632.v7.1.Ie74d3355761aab202d4825ac6f66d990bba0130e@changeid>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
In-Reply-To: <20210107082653.3519337-1-drinkcat@chromium.org>
References: <20210107082653.3519337-1-drinkcat@chromium.org>
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
 fshao@chromium.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 boris.brezillon@collabora.com, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>, hoegsberg@chromium.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Define a compatible string for the Mali Bifrost GPU found in
Mediatek's MT8183 SoCs.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
Reviewed-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
---

Changes in v7:
 - Fix GPU ID in commit message

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
