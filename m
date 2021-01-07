Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B752ECC1B
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 10:00:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E9786E409;
	Thu,  7 Jan 2021 09:00:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6BAF6E409
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 09:00:32 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id c12so3451272pfo.10
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jan 2021 01:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uW2DZ7++hBKvfAfIb4cUFZ4hOVC2XsuncgcT5bF8JnM=;
 b=ceuRr2vCLfwVkTOq/VcGBU7S8g5DI6OExSxZXsevbMkMlUFTTtEoeSBdVJiKtsvpm9
 XXPR8oHJ/8FQKMWzYReFMSnjifWFx645G8tahx+ROxzworGzNcS5/oXqxCY8UDFGpHIS
 hHwliIjmTsby+Z8mXe3qcenaPnCKy3dd3McuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uW2DZ7++hBKvfAfIb4cUFZ4hOVC2XsuncgcT5bF8JnM=;
 b=E4EoynzejnFIg+b171K7Rs5psXzdrzi0mZlp5DsxiTiOZ32LAuOVbknEomDPKmOycE
 sBfU7xDhjwJQksLcB2V7bpAtLD0B0xv6AwM9Q7RFR32Nf49SSXACZxjrrdUyDfr05tpk
 v6GTPL6EAJQzCfQdi5S62etUhVW9X0s8RYaxuttXqSyit3twKsX5501shxNSx9AoKfWG
 zC+8Fyf/rgFZNKRJ3W0MasUJ/gkeIhxMKm0naxEb//Ziv3aMM8lWWGoBb5C1zio5BQ+7
 OKTM55fU63PpSl4+ho9URWNL+pXev1rmQ8Vs+Rjx9fKfpL+rvQbDlCU1LUWuMgyOheKS
 fOug==
X-Gm-Message-State: AOAM5306g9yLe+cV1t860Deeyf6rPFsLF16I6VwYMmTDkslE1SaXQr6D
 60yV9RQyGr4q4Kg6VPwvhlCexg==
X-Google-Smtp-Source: ABdhPJzNJimZ3cRtHZh+r/SU68IFYZuuwWPhKHKnlEFoewT1OQ4PW/o2cLbm4VXer0U6Lblk0QToRQ==
X-Received: by 2002:aa7:8d12:0:b029:1ae:4344:3b4f with SMTP id
 j18-20020aa78d120000b02901ae43443b4fmr7649594pfe.16.1610010032321; 
 Thu, 07 Jan 2021 01:00:32 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:7220:84ff:fe09:41dc])
 by smtp.gmail.com with ESMTPSA id a29sm5022421pfr.73.2021.01.07.01.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 01:00:31 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Subject: [PATCH v8 1/4] dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
Date: Thu,  7 Jan 2021 17:00:19 +0800
Message-Id: <20210107170017.v8.1.Ie74d3355761aab202d4825ac6f66d990bba0130e@changeid>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
In-Reply-To: <20210107090022.3536550-1-drinkcat@chromium.org>
References: <20210107090022.3536550-1-drinkcat@chromium.org>
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
