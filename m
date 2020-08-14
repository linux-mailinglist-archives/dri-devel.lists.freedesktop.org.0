Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E3F245CF6
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 09:06:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F8286E41F;
	Mon, 17 Aug 2020 07:06:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08DB26EAC4
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 00:07:25 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id i19so3949140lfj.8
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 17:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K2EFJxFHRRzm3oVjJIWeziT+lWBzLWjopR8bsePJKjY=;
 b=gCLmokeJ8inUJ64Wv4qZoc9xBFaNU6P54dhzlUIu5SlzNuE5ZDDqIAdu0Gnkr2vBSf
 yvhv83NVNMlBt49BK/TThw7IQ2KUdyCQwfHLOkPkbQMseIz7k81oA60MDiaEPfZXGWAZ
 g+H8DYJ+DEn7Gm3vwqups1sBZ17Xc2U64wXre5DxnK+5j+pbil+6qN7JQ02tDIhXXIZu
 ojHm1J+UMxK+iR6aLjRaBm+dFThXqiOGpiIWqsRwSTp7hKcwucfCPHH71BiA02jUnU75
 KtBbOpZNSjrruXOKE3EiNa7SnbGd6+cfDjTKoC2RreOLy30CcCrg2zt01SKYrUI1uFJm
 o51w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K2EFJxFHRRzm3oVjJIWeziT+lWBzLWjopR8bsePJKjY=;
 b=VZjuXmUzohiJCwOd16A+zbS6Mxx3bjfRPJy5ZRdOsq7Msmya/XMv2GvZhYdUHJgsYF
 6spRGGKJq+cYKwpZkJH35AFDsjZvRBRstRxTn6qkGqOHYUoK3xAwIjcUHI0Ujsjru/D5
 y8/ID2zFXeonwcXkJFeO+9cfijxgeOBHvS4F3YVz5ihpJN/a4d23EoROA73ZygFSZ7KY
 GpC0UH1rGLqHW6nQS6+rGrew+0R8GCizi+Thr/XdQt34TcSh2JoK35KrXGrrawplvnsk
 w1SY5r72IXIsIpkmBIlCKWnCM5oqGNyn4IoA0dA9o89kjXaWySXpGVPBwd0039xf3em5
 4s9Q==
X-Gm-Message-State: AOAM533KO5Y+hS5hB8ES/jrU27tfbOwW06ymGP249Gh88XpOEQrUSflr
 C/kgB7t0mgDesz5CgSpscCI=
X-Google-Smtp-Source: ABdhPJxkP/AmmrkF2DUBKBVT1VxNCH83s2+ZUFMnRJUNWGq20hs6pISg5ezMRacDLEuvgFM4869JMg==
X-Received: by 2002:a19:c7d0:: with SMTP id x199mr3333278lff.205.1597363643504; 
 Thu, 13 Aug 2020 17:07:23 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.gmail.com with ESMTPSA id c17sm1504450lfr.23.2020.08.13.17.07.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2020 17:07:22 -0700 (PDT)
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
Subject: [PATCH v5 20/36] dt-bindings: memory: tegra30: mc: Document new
 interconnect property
Date: Fri, 14 Aug 2020 03:06:05 +0300
Message-Id: <20200814000621.8415-21-digetx@gmail.com>
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

Memory controller is interconnected with memory clients and with the
external memory controller. Document new interconnect property which
turns memory controller into interconnect provider.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/memory-controllers/nvidia,tegra30-mc.yaml       | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-mc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-mc.yaml
index 84fd57bcf0dc..5436e6d420bc 100644
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
@@ -120,6 +123,7 @@ required:
   - clock-names
   - "#reset-cells"
   - "#iommu-cells"
+  - "#interconnect-cells"
 
 additionalProperties: false
 
@@ -135,6 +139,7 @@ examples:
 
         #iommu-cells = <1>;
         #reset-cells = <1>;
+        #interconnect-cells = <1>;
 
         emc-timings-1 {
             nvidia,ram-code = <1>;
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
