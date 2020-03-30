Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C60BA19750E
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 09:12:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D3C16E0FE;
	Mon, 30 Mar 2020 07:11:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D070389F0B
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 01:09:39 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id n17so16300645lji.8
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Mar 2020 18:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EC82F0fSy3SGAzZ5vo6pkiYKuzU18mbiBELCUdjdApo=;
 b=aAfRh2hPeJ5U8aqPYvJk9kV4DbkEc3hB2h3TgpqjZNydVjAJl7Tvnh7VWeRlsUZNJi
 RqmVtFDLMuERdmbPCWaM5BIBv/Lo1hIu6d3UpKM/dWrbvbanJU0WUzwNqOxIldVRGwtV
 CRCs/cOWwqqxiYHAigdROhOK01KYBKVOLNWyZaMeictkfj3voWItSh6IOAzzZUHZS3y8
 cAY04+Pwpn8yyTpXMvNFGSKr9QtWsLszeDFNmvZpqeJiUpXLecaUAzkUx1SpHsVAnNAs
 63Q4ugparHN/KsR8ZQ9fAnrDXAWF2TB+YrtREY/PfNXjz/fPCV3ejgYYL2zrXKFTQvdR
 V3lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EC82F0fSy3SGAzZ5vo6pkiYKuzU18mbiBELCUdjdApo=;
 b=qWMr4bTqWrpfjFXlU+Cu9oLvfBDEQfgFQCWm/WotvrjmYhTNeJaRrPUqZal3k6S/uP
 zhmvHRohyYpoBXrbs6VYJNU5gNGEq4Yqb0jp7hX+k/Ea6VRQINrt1dCK7qcZeQJNeeL0
 Nsd6P+vAjC1ZC8YsVXeKAM/AV/at7e49uwNZYUg417llRCYeZ0rLT8bQWp4e4/Eht8YD
 EUuLBndUb1laaex7cp1KHLdcYtunl1IsuXGd06XmHDf88a7+0akws7l82EkM2Kw6n/tn
 VUVF+P5iqo4rEE0/Ax8zCaQVlZxRBKYNDfjuNdbfLsex0qU6Z8nQDWGbrPdTpRkKv6Pg
 c09w==
X-Gm-Message-State: AGi0PubJGUjqOHegkeVdOAYM1EWIkDEh5G2wgeL/Nt3XkDIF5+2uzOYe
 hhYi6ExDqonYvk5KcLzvLpg=
X-Google-Smtp-Source: APiQypK+LJHCIcBln1YFym+wyJQvikaZ6KKCNt2Pt1rTIIshYKQAwMhdCBctd/5zaYU6dVLvDlO7AQ==
X-Received: by 2002:a2e:9d83:: with SMTP id c3mr5746993ljj.3.1585530578298;
 Sun, 29 Mar 2020 18:09:38 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru.
 [91.78.208.152])
 by smtp.gmail.com with ESMTPSA id f23sm2449005lja.60.2020.03.29.18.09.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Mar 2020 18:09:37 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 04/22] dt-bindings: memory: tegra30: emc: Document new
 interconnect property
Date: Mon, 30 Mar 2020 04:08:46 +0300
Message-Id: <20200330010904.27643-5-digetx@gmail.com>
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

External memory controller is interconnected with memory controller and
with external memory. Document new interconnect property which turns
external memory controller into interconnect provider.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/memory-controllers/nvidia,tegra30-emc.yaml     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml
index e4135bac6957..2d7aed245552 100644
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
@@ -217,6 +220,7 @@ required:
   - interrupts
   - clocks
   - nvidia,memory-controller
+  - "#interconnect-cells"
 
 additionalProperties: false
 
@@ -230,6 +234,8 @@ examples:
 
         nvidia,memory-controller = <&mc>;
 
+        #interconnect-cells = <0>;
+
         emc-timings-1 {
             nvidia,ram-code = <1>;
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
