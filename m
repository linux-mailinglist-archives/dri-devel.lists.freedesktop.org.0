Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF08E1F4F08
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 09:36:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E73F46E05F;
	Wed, 10 Jun 2020 07:35:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3455B6E2CC
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 13:14:51 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id w15so12410706lfe.11
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jun 2020 06:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cD6QbvUalU2rLnxp32Ky1as2vyVdkG0FzQ7kZtLukL0=;
 b=Q3BU6gEN8cA0NMpF2QMR7/ASta55aBJk7I1MDLK4koAixnvzP0ayWGZf3TbVJLF+65
 vId8KuOWkM8U5/Iu7EFpk85VTkAI1Oehc5+09VHXeLIo+3cVsuJq4oGVwhxOfGNsuvbD
 NY1D4HQAhEREDBvmx8hAhNZ0GxixaeV++zeo7LJMnNn7h/CFhkHfaAgF7SCKO1XsKJJY
 0ZyzEXamv8Ak+eCx/bhJHanQn+avSJOXU6PU4tk+eh+cUe2i6S0A4Jt1tYo88dL8dYJC
 s5eTYYMCyCjEBFckuvK4gbtaaU0Yeq9B1wPNhczvvoYJBXYoJl7pPyfH9SzzMzxPj2yF
 LUag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cD6QbvUalU2rLnxp32Ky1as2vyVdkG0FzQ7kZtLukL0=;
 b=JzN50ZfFg6+0nhHhJjapy9XC25Gwa9KT+bMfofgYHtRkuRWOcEgCTAbyUOSX1fdujp
 0Riqdp8L/ZTXnXgI94Hzku0iBXWr0wYuTQ+evJFgL/oSjGwZnxHRR6ZHBJvJL9gWzQMn
 YZ24zxPmOKZ6pu4R2fo/ts1FcQSUjLClvKJBJ+XcJHudKmBOIX6aQY1zWIxvl9j1eXle
 v3h2XzmW6Kc8kPWHo/VQaTDpp+xuWNkR7uD7JG8toYHidNK1vpoisLEaH6yfULG+De4R
 78StcTkN3xfbZFtMG2XsRV0YGjCx0J/sXs5z57Eje5GVCjaqrMGzN5GYwRZYqP/gz975
 8jKA==
X-Gm-Message-State: AOAM530ZMIHMQOX0Fg3+40z4s/2Tj8M7EiNxDIB4BxGgufH1yKfJVyq1
 35fazxTOxebI25ME/tQbJPQ=
X-Google-Smtp-Source: ABdhPJy+RmOWQqGmO4euFmKISnOZyzVw/14wPtNZKhpxrmxeb6HuV6Wq/6xWdmnG+KQ6p+Izt7lD/w==
X-Received: by 2002:a19:6a09:: with SMTP id u9mr15434868lfu.65.1591708489649; 
 Tue, 09 Jun 2020 06:14:49 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id l22sm4323522lji.120.2020.06.09.06.14.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 06:14:49 -0700 (PDT)
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
Subject: [PATCH v4 20/37] dt-bindings: memory: tegra30: mc: Document new
 interconnect property
Date: Tue,  9 Jun 2020 16:13:47 +0300
Message-Id: <20200609131404.17523-21-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200609131404.17523-1-digetx@gmail.com>
References: <20200609131404.17523-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 10 Jun 2020 07:35:32 +0000
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>,
 linux-tegra@vger.kernel.org
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
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
