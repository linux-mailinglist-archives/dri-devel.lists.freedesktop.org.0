Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 598DC245D2E
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:07:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1C8F6E4B0;
	Mon, 17 Aug 2020 07:06:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AA546EAC5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 00:07:26 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id d2so3962644lfj.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 17:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6hV/jfb1j57ds6uWusc67dwvrbgr9Nuaem2xPT64pOI=;
 b=ErKBwp+Pi3uw2mPs1tCdGXty9djbWFZh7U9QKleaHXoAfkxBNKfThE66Q/uzNnc7J4
 aTk8+/JsZmycsCyPcO8wlyCxP/+7dhTSQleHzgB8RAXh9y9JX/qoA3h0Dt4KqGsgqWgT
 32US2OzxXAYh3P3Bq+YMOkgwj1jgCvZwihVWC43so56FI4FPSpixkmxH7Ryz0yw9gdcO
 oycjad2ZwnRCk/P+MMGMiuHDdDaSqD6SW/HA2t+uraoAPUbv+yCSmeRz8aO8ak/Vfyco
 dauYMCWTVOLrANbGWhYaug2aCunXB+Mmt8gqYzR6ZB7AEUZVQQHPqWg9rQyiGNg8aABC
 xSIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6hV/jfb1j57ds6uWusc67dwvrbgr9Nuaem2xPT64pOI=;
 b=jCATUlbXzn3FDkuq2TYoz5mYFjp6eOV+XEWNNyzK8/BFjuX0EjNSlZTnkWXK10sCNQ
 RlfA8KQSK+Ncdwio4kTz3bssC8Q0b/TuBdcQQqy22yABR4hLN63cY7tRAweC7eJO80kt
 w3y73Z5TB/r0jUn4UbNZF11B50RUBOg1h445NYCP1rPALXgeoRca/e+LNZrLS3LhbXgP
 F29aVCjJJoSSzpF+HkcXiWU3o4hlJsfM0ss2SiXSA9b0WMqeV2QtgXYycGozVU8Ea7hZ
 TnZjCsCKr65Y0yKRRJvSsJSzIkrDfvVyE7a5WTRWuZBICs9HORGs8dSP69dTSL2Piogc
 6+lA==
X-Gm-Message-State: AOAM532GNZ+e8daSUs3RszFudk3rR1QA9aeIIgoStjLuB6VKY135QyTV
 oN6b8Zflur1bCjAQ+B1CgSw=
X-Google-Smtp-Source: ABdhPJyX4+8v8JUfhatSVHBEDRahqnCfgVnO8HrDC7HMA1cGJSRRGzDZfveHa/V3VlNsHtHH294fRg==
X-Received: by 2002:ac2:58c6:: with SMTP id u6mr3340219lfo.105.1597363644627; 
 Thu, 13 Aug 2020 17:07:24 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.gmail.com with ESMTPSA id c17sm1504450lfr.23.2020.08.13.17.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2020 17:07:24 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>
Subject: [PATCH v5 21/36] dt-bindings: memory: tegra30: emc: Document new
 interconnect property
Date: Fri, 14 Aug 2020 03:06:06 +0300
Message-Id: <20200814000621.8415-22-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200814000621.8415-1-digetx@gmail.com>
References: <20200814000621.8415-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Aug 2020 07:06:11 +0000
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

External memory controller is interconnected with memory controller and
with external memory. Document new interconnect property which turns
external memory controller into interconnect provider.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/memory-controllers/nvidia,tegra30-emc.yaml     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml
index 112bae2fcbbd..c243986db420 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml
@@ -31,6 +31,9 @@ properties:
   interrupts:
     maxItems: 1
 
+  "#interconnect-cells":
+    const: 0
+
   nvidia,memory-controller:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
@@ -214,6 +217,7 @@ required:
   - interrupts
   - clocks
   - nvidia,memory-controller
+  - "#interconnect-cells"
 
 additionalProperties: false
 
@@ -227,6 +231,8 @@ examples:
 
         nvidia,memory-controller = <&mc>;
 
+        #interconnect-cells = <0>;
+
         emc-timings-1 {
             nvidia,ram-code = <1>;
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
