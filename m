Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A21B31F4F20
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 09:36:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ADFF6E44B;
	Wed, 10 Jun 2020 07:35:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 626076E2CD
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 13:14:52 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id q19so2275311lji.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jun 2020 06:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LMNT0sLytr4m3uFIZANOy+2q8/EiZDnxOa5gRaq0ITs=;
 b=lbMlxJS2Nz9rtjKFACkhNVig0C+NLEZNIUQjbCyAejsn/LTxC42QfroGOTv+8KLqAW
 6y5xkKZb09oaRg2UZVbz7aLFAAdIrJ+kgt1Tlq9Dq7iId7/Z+BWwMm2kxyu/SCDUYlql
 12ZVVrjXylQbQi5tuhR420Yw3BZrrE6CmUUR83gh8A0KjatkRl9Eo0KnlYRhSnq0OL2w
 zGw4GlwjSIo2wOuNRhjRMk48Q5E/srRH9rWAlnd72rQwqJNLphk4vbbXMbOBkoVP4G2b
 qWLWKcVCSFqFtQ7JqQSVJl50Sbqjzq7bnL5VmxGG7iA8V/hf8nZInlDgFPI8qJHjRRD6
 SLUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LMNT0sLytr4m3uFIZANOy+2q8/EiZDnxOa5gRaq0ITs=;
 b=a4SmB/X9yLTNEGbB5hFjRDFDuzYcTZ0sC5tmGDgtmcZOXPzP5Gpo/5emnrVpwzwQcx
 gR9qXKxynSMCisbuwB2tUMp65+stJyH3ikDP/V1g8Zl553R8kqeRgfsLYhOtUYbsq2Dp
 6kwb7PsBWJPV0KVqbfEsm29UQgpMFzGzM405EylKsio3mwDsQPXaMfwerHpsB2bMlhpS
 EiAGvEfXWu2qlK1B6BZ3OeSKS1bOEU4Lgf9j7xFwZS+QMhF/adb1QIqEIvoUJw3ZhtYD
 iGi8vwVWmc7mW3NXtu3GXAV8lILoeoI75BxnxFVBEhOwavsgeE8vMuXkRbBtfy+CP4ap
 jkFQ==
X-Gm-Message-State: AOAM533HoYnDtTPZ7reqA2U4F+/7GS+WFchtG0EeQpOX76TbyhSkP2ea
 eQsuq9hj+PXZLPm6lF4mFDY=
X-Google-Smtp-Source: ABdhPJzANPUwZcPwRmo0EzLdzFN781gP6GVzps4LmakICCdU1/D+4djzR//O5R7z6v44gq/opoA+KA==
X-Received: by 2002:a05:651c:384:: with SMTP id
 e4mr13499996ljp.410.1591708490782; 
 Tue, 09 Jun 2020 06:14:50 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id l22sm4323522lji.120.2020.06.09.06.14.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 06:14:50 -0700 (PDT)
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
Subject: [PATCH v4 21/37] dt-bindings: memory: tegra30: emc: Document new
 interconnect property
Date: Tue,  9 Jun 2020 16:13:48 +0300
Message-Id: <20200609131404.17523-22-digetx@gmail.com>
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
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
