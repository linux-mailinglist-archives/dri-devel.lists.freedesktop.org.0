Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F251F0F16
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jun 2020 21:14:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D0A36E3FB;
	Sun,  7 Jun 2020 19:13:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB0046E181
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jun 2020 18:57:37 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id x18so1288565lji.1
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Jun 2020 11:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cD6QbvUalU2rLnxp32Ky1as2vyVdkG0FzQ7kZtLukL0=;
 b=Zx0/1hMmV7JwuNDcTuFV87FFDLC9+B+dp2Kag8nEP32tfGG5AY7TIUMc5Q7YDrzw2m
 O4i4KTIf5oK4nZn4+oexDWc/UTRN6lcMtPrFqS5enX8R/af9d8R0wKnG5fCtg2cJFC6g
 OQzHs3HBAlv9Lkr8C3Fnk9aaYxFXGE+muRsGNuIHnABt/N5fl+QbyaL6jumFFJnlNPSm
 pfk7CwdRr8ZZJ0FxjpNXw6nQnHfAQk9TTrnaYl02uP8fPEKLhMoghDEQDVvIcmQUKlk5
 pdrxaZcfM2bra4USw9NiHTFEqSyTlmhm6HWHgHhYchrb9QfP0xko0hFciysthIve7UHr
 HYog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cD6QbvUalU2rLnxp32Ky1as2vyVdkG0FzQ7kZtLukL0=;
 b=k67e99+BLX9y5Bm7J1Tv9DBMCVZswgaojkG2lrVrzmZZCz4moErVogsZvS+6L9XTWj
 TFns9N8mCgETLUkBhiEZVs5O0oNnHmwZNuK3LmGSklWml7lvekAG5acZ053VQKymjTwa
 Ag12HUDnk+c+vBmkj6iKhvmFwNX3tNPZNKLv9GubMXiJJjYbTLUkaPA19iXY1smPbhB6
 WISKfiyBeFlp1Wt5ro5YPapU6Mk5zEyzcz1ZdGgYbHkv0n/g1XUPZ/jxQs/YEf2l/9Y6
 twWQZpJHgInOIyANHqGkGhex6MclNNqpfzpwptqzk9wmzsVDBViQcVqmKji/5MdAcs2C
 TSnw==
X-Gm-Message-State: AOAM530vHQhtY4FSOVOCVNlc7C0durLZ91ffSra7vKLz0NbVxq0IbiXP
 50Pthf+kM/1+dOsdLFj8qQU=
X-Google-Smtp-Source: ABdhPJxChLqhfKyGO8SHp6W8FYtkQdwFMh936C6G5u6017yDCRww2zRNxFkr6ioy8DMgy7hzU2gVdQ==
X-Received: by 2002:a05:651c:333:: with SMTP id
 b19mr9508872ljp.204.1591556256356; 
 Sun, 07 Jun 2020 11:57:36 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id e21sm3650953ljb.135.2020.06.07.11.57.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2020 11:57:35 -0700 (PDT)
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
Subject: [PATCH v3 20/39] dt-bindings: memory: tegra30: mc: Document new
 interconnect property
Date: Sun,  7 Jun 2020 21:55:11 +0300
Message-Id: <20200607185530.18113-21-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200607185530.18113-1-digetx@gmail.com>
References: <20200607185530.18113-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 07 Jun 2020 19:13:00 +0000
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
