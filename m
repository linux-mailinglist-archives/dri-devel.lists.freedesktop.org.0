Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34314197522
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 09:13:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AB7189F99;
	Mon, 30 Mar 2020 07:11:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF91089F0B
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 01:09:38 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id q5so12698145lfb.13
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Mar 2020 18:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pGhshIQ08W/fF40FAntS+cxcTBW0fRcj4eZ28EWAmTE=;
 b=XxBzBB8C/ouLvpvhWv1tCGRnvopFMnR02tvWDdHXE34VMJoFRNre/opbCtXicTKrzV
 qZyMxdHtx9nh3QfyBBDUF5WO0UAdCOtboU2OXh8FvVLeOHYffG/yVfjb33pkfyFATTP2
 GScNvvzwf9E9GE8Mw5OT7LAkm/VwTyoLDmyKs3QR0jsH4X6PbVSK0cEP60Lzy3HC/ADd
 948zayzTPaM/FaB4TU8EkObczi75mj8ZAMirY/qlyv5PwPXL3w0JVCf0Zqqb7IF8tcxz
 zixt0HJclbyM7lNFFQx3qn8AsoyuOE5n3mg8k1IeFQCBuMZ6AlihowbLymymM5a4YsGt
 kUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pGhshIQ08W/fF40FAntS+cxcTBW0fRcj4eZ28EWAmTE=;
 b=LV+9Cl+Uo/xlHfJxDRK9qVh4OioVLpX3tQh/OEsQzixfpmP3HBY59aNP3cmkD9nzGx
 rRcUmoM2oNUmdSYFJWg8AsxwgKzcLI5bkAzCvLMbar5hcidj6tE9m2vvJ+zcoYhwSjL/
 SSx4rHIPwQPGF6dOHFdSML++qzci6qr1PSRd/+4i8Xc4Lfe6E3IzxQYqJ0s76g/7EeIw
 Yp1/Tst1ZwthY6SdRb1I6U2u0KBhIV7op+bt81ym+imkxUNCgPKGZw5rZxh6HG2PZ3cA
 E2SsR+5vv5eVVRpNhp5/Z7nGwvzGM+ekl5qmZUEzdklS8bxTqSisz+zy2jd05IXoEnyd
 SkBw==
X-Gm-Message-State: AGi0Puak7tyveAqMybqqO6KGclHUv+iFd4hJSlL9ebWdBUkAP6XwGAqK
 H4af6MIhh8yIMvKN7Vfzits=
X-Google-Smtp-Source: APiQypLyzsbk89h1xbagVghUO7mdmiHIeONm1fV88bNjfaxU8lIGGhlh4l/LkO7c6iKxzJDhMtB4yA==
X-Received: by 2002:a19:4a50:: with SMTP id x77mr6474950lfa.159.1585530577323; 
 Sun, 29 Mar 2020 18:09:37 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru.
 [91.78.208.152])
 by smtp.gmail.com with ESMTPSA id f23sm2449005lja.60.2020.03.29.18.09.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Mar 2020 18:09:36 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 03/22] dt-bindings: memory: tegra30: mc: Document new
 interconnect property
Date: Mon, 30 Mar 2020 04:08:45 +0300
Message-Id: <20200330010904.27643-4-digetx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200330010904.27643-1-digetx@gmail.com>
References: <20200330010904.27643-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 30 Mar 2020 07:11:44 +0000
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Memory controller is interconnected with memory clients and with the
external memory controller. Document new interconnect property which
turns memory controller into interconnect provider.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/memory-controllers/nvidia,tegra30-mc.yaml       | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-mc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-mc.yaml
index 4b9196c83291..083676676d0d 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-mc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-mc.yaml
@@ -57,6 +57,9 @@ properties:
   "#iommu-cells":
     const: 1
 
+  "#interconnect-cells":
+    const: 1
+
 patternProperties:
   "^emc-timings-[0-9]+$":
     type: object
@@ -121,6 +124,7 @@ required:
   - clock-names
   - "#reset-cells"
   - "#iommu-cells"
+  - "#interconnect-cells"
 
 additionalProperties: false
 
@@ -136,6 +140,7 @@ examples:
 
         #iommu-cells = <1>;
         #reset-cells = <1>;
+        #interconnect-cells = <1>;
 
         emc-timings-1 {
             nvidia,ram-code = <1>;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
