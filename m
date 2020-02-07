Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9BB1551F5
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 06:26:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 190786E885;
	Fri,  7 Feb 2020 05:26:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEB686E86D
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2020 05:26:53 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id k3so524172pgc.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2020 21:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CIn5sKN4KiBio0RDhfFCPXTE80uz5ajGK0muKh5dKSI=;
 b=jehEAPOlDHxOIf658U57Pz+Lxc9WjB5npjsc5eIfdKKIgLI6wIasqGvVPkiVpdJQ0G
 Hzpf9s+Mrm6ErGv53ZanL5Ar8j551dwPz09ideYJ5ExThnUtNvN841ZIU2L4qTBXCsLw
 CUJvrrL1JkluseTv3rUysxVHovsnV10a4Qg0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CIn5sKN4KiBio0RDhfFCPXTE80uz5ajGK0muKh5dKSI=;
 b=OiTJ+k6j2se2qtWmc9uokxAxQ/G8FclzD5D6KZI3J7uRNwmlidofyg6tlSspTrWaEv
 NjqnI3jqU27eaQX15uMGVbtwshAi6p77vfVPhH9OvlS785JtoMX0SM1SPbCcgHO50QEJ
 tYS2ky2u4jXbpwLQDn3E4yNOFF4DzcDKVhpHojR8Rf6Ja3Kta3kpyGMKNw2CdW6ZtDZb
 NiX3/5f4hwdoVkbfby1eu6A52tCSffnxJNmIllh+JP888xtrXiI4cqifMm131ezTuXFZ
 zrcJP1tf8UDDTtpF2ZaK9xTMWQa7eBG0rOqFguIH3wJhwBGkPB68E6LRZ774isthp3Io
 JURg==
X-Gm-Message-State: APjAAAUtMpKRASipsP/UG5UdVLQlwjLB/un7TZPZ90Ui/SxI8T/gMtDV
 WUArXZUUKjNpvrAHIqPrlt4K+g==
X-Google-Smtp-Source: APXvYqx5i7f7z7/eMVnpdL5X2gaY4KuXn3Lv/gF5m1NmEIhVV0KooOh59/YHin0f3dnQN5ufHFD66g==
X-Received: by 2002:a63:5558:: with SMTP id f24mr7314186pgm.92.1581053213363; 
 Thu, 06 Feb 2020 21:26:53 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:d8b7:33af:adcb:b648])
 by smtp.gmail.com with ESMTPSA id i66sm1174485pfg.85.2020.02.06.21.26.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 21:26:52 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 1/7] dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
Date: Fri,  7 Feb 2020 13:26:21 +0800
Message-Id: <20200207052627.130118-2-drinkcat@chromium.org>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200207052627.130118-1-drinkcat@chromium.org>
References: <20200207052627.130118-1-drinkcat@chromium.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 ulf.hansson@linaro.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
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

v4:
 - Add power-domain-names description
   (kept Alyssa's reviewed-by as the change is minor)
v3:
 - No change

 .../bindings/gpu/arm,mali-bifrost.yaml        | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 4ea6a8789699709..0d93b3981445977 100644
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
@@ -62,6 +63,30 @@ allOf:
           minItems: 2
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
+            - const: 2d
+
+      required:
+        - sram-supply
+        - power-domains
+        - power-domains-names
 
 examples:
   - |
-- 
2.25.0.341.g760bfbb309-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
