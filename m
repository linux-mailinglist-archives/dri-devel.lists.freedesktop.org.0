Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6052A78DB
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 09:20:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50F596E9E3;
	Thu,  5 Nov 2020 08:20:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 222A86E239
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 16:49:46 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id a7so28000528lfk.9
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 08:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G/gWaZVsDrg+B7oJiO/GfuEeS3ySH7bEMjaW24T/nJE=;
 b=ccWrihjAHhkulHQ70bzhiZSEnQyNp//mzVPgwLNcwy58NU6x6EHVJXt0bg7H6ckfjp
 6nxWy9kxJDTswhw1vbgY69ZlPIWn8zLR0vDx22Z4oyvOnr2gpUcJVJ6s9i3EszAX6y+H
 aMXYnXrhWsGnk+1HvI8BWAVMXIkP6KFNgDeQAEYOmgWb1kFz8S4VJxK6Z/dtuSDGU7t7
 sub9cu89dZMxY/tjGhByjNWvOq4aPZjZVFJ0GKmdzMbQign8sgF1rn6HOighSZ4q2RjQ
 w8odjDAWB5scMsfGMgVpoLONwh6ORbFmatrsRPGPkWSM4+Cd8OrliotngJALQLxnLvQn
 UhNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G/gWaZVsDrg+B7oJiO/GfuEeS3ySH7bEMjaW24T/nJE=;
 b=kfviD0nmIMc9iE3s1neH7d3HRhHuFiYS5G92XwX3vIKulTEIm1RSs3zuL1z3qPonmK
 1zF/O7Xg9Nv2QYfQKVkf/rzdEIfTjgZbTuxdt1YMcG1A8VJvM7QbwKf4BlOPsKyhfAgX
 DnENw1GU/Q5698EqChfRaCqAdZQHRah4GV5jWsxGVRpLmDYsyHGy/2JP2+UMEVmzVzCr
 GIoLz3MgULvXFAHQ2Qp5lJwd6WPSAEua9xHela6GyYr3+y2nS2h15ViVsdqvgtHYcO9g
 DcaxWTT+ps+yHe/0ceJkRZYCh56PAJ+esFL5OBUH+UIs0Dvfez5rfunJLYrR5RYlOvDb
 EKRQ==
X-Gm-Message-State: AOAM531jrQ5Zw0BT1gxPg9d/VUGDgUNbFYdOs+U2eQqh5LJSFQsDS8ur
 nCqhNy01aV8+zhi7JF8vPis=
X-Google-Smtp-Source: ABdhPJxeuKyJpt41bYMUa63HVmZKLXHDeIqS5FU59NXW9QJP9vR3xVUp6iPAf5ojcqJ1hR07YmjErw==
X-Received: by 2002:a19:c97:: with SMTP id 145mr10418006lfm.81.1604508584629; 
 Wed, 04 Nov 2020 08:49:44 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru.
 [109.252.192.83])
 by smtp.gmail.com with ESMTPSA id m2sm454587lfo.25.2020.11.04.08.49.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 08:49:44 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>,
 Viresh Kumar <vireshk@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v7 12/47] dt-bindings: memory: tegra124: mc: Document new
 interconnect property
Date: Wed,  4 Nov 2020 19:48:48 +0300
Message-Id: <20201104164923.21238-13-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201104164923.21238-1-digetx@gmail.com>
References: <20201104164923.21238-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 05 Nov 2020 08:20:02 +0000
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
External Memory Controller. Document new interconnect property which
turns memory controller into interconnect provider.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/memory-controllers/nvidia,tegra124-emc.yaml     | 1 +
 .../bindings/memory-controllers/nvidia,tegra124-mc.yaml      | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml
index 278549f9e051..8ae3dae42d6e 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml
@@ -345,6 +345,7 @@ examples:
 
         #iommu-cells = <1>;
         #reset-cells = <1>;
+        #interconnect-cells = <1>;
     };
 
     external-memory-controller@7001b000 {
diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-mc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-mc.yaml
index 84d0339505b1..7b18b4d11e0a 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-mc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-mc.yaml
@@ -40,6 +40,9 @@ properties:
   "#iommu-cells":
     const: 1
 
+  "#interconnect-cells":
+    const: 1
+
 patternProperties:
   "^emc-timings-[0-9]+$":
     type: object
@@ -104,6 +107,7 @@ required:
   - clock-names
   - "#reset-cells"
   - "#iommu-cells"
+  - "#interconnect-cells"
 
 additionalProperties: false
 
@@ -119,6 +123,7 @@ examples:
 
         #iommu-cells = <1>;
         #reset-cells = <1>;
+        #interconnect-cells = <1>;
 
         emc-timings-3 {
             nvidia,ram-code = <3>;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
