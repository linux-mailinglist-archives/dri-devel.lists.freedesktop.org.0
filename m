Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C11719752D
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 09:13:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 585F189FFD;
	Mon, 30 Mar 2020 07:11:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 110DD89F0B
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 01:09:38 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id k21so16332730ljh.2
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Mar 2020 18:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=THnwhwTdTmg4c86hFlh2qknbtHQvbfTX5IFqa2InF7g=;
 b=Pg3NEZBItMfCSgDZPKnxTIcXNI+xr/d79Of+mkt+dYMW5wLwo4Ok4roS8EnABFr8to
 xwy1Sr5/1/6SLKsSJM0j0LjHENfTxhyPHZyEORqb2qJlsTpnub+E1FEtrgj1IRH81M6t
 dNlP8O6iO/HB5amOL4OsRy3/ZOzQ7DIz7nIygl7Mi5CFGOFhObTMot7NqF94YE0HnILN
 6u3UmhkiAOd9W++3BaZ6hFxXzZtoKFDtBLhW0Iw1k/suQz/MPpg7FJucm/Sl5yiKtdWS
 soby3PljbjCvP0aiph0jIIhGe13/Y2UxSrt1aRvhemGgtUV3to0eaAg5RFUHE6fBl9A2
 i9Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=THnwhwTdTmg4c86hFlh2qknbtHQvbfTX5IFqa2InF7g=;
 b=csmBZDWTExUe8N8m8dKybc6Oy9zDP0e8NRmJbe8kGkNL1pXx3WpsyFPP0RZoI3d+KJ
 AIsP5Xw3iRfyNiwiGDTlo+X376J/NSZI1kQwYf5148yVhWQWjZuvyNkRjdZv5FGvFXJk
 8T/xDKKAxFfw8X0Gh0CUZt6KKD88GObg4Ie4tDGls4vb6Fa00h1Ka/p87vl17kfatsUD
 wrQ+RoDZ28kzfWZIRsqdsFqwZF37qqB+WCR6aT8l1uvrvnbNHmPVovj8Rr6lRgmqwblK
 6EjPhTmivxiwH4NFOqaEIPQAQ0cMC0it/wBYWhRtHokX1jTSdRtY540v1GJ3G8WNuxJk
 J/Lw==
X-Gm-Message-State: AGi0PuYSprQwKkWQvSfgiY009bPEk8d7rHYWZX0rbVEt+hCJLOEC/hzo
 rPUH8/7eMInPb2mdsB+F2eOTLwdV
X-Google-Smtp-Source: APiQypKDy2Ro7EQKBqSUe7PyjSLNAnaV0wdFF27xRufe2z5meT1FtGCGpLLX8lEkaMU6PMzGngPfnA==
X-Received: by 2002:a05:651c:552:: with SMTP id
 q18mr5910854ljp.1.1585530576340; 
 Sun, 29 Mar 2020 18:09:36 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru.
 [91.78.208.152])
 by smtp.gmail.com with ESMTPSA id f23sm2449005lja.60.2020.03.29.18.09.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Mar 2020 18:09:35 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 02/22] dt-bindings: memory: tegra20: emc: Document new
 interconnect property
Date: Mon, 30 Mar 2020 04:08:44 +0300
Message-Id: <20200330010904.27643-3-digetx@gmail.com>
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
 .../bindings/memory-controllers/nvidia,tegra20-emc.txt          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
index add95367640b..f51da7662de4 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
@@ -12,6 +12,7 @@ Properties:
   irrespective of ram-code configuration.
 - interrupts : Should contain EMC General interrupt.
 - clocks : Should contain EMC clock.
+- #interconnect-cells : Should be 0.
 
 Child device nodes describe the memory settings for different configurations and clock rates.
 
@@ -20,6 +21,7 @@ Example:
 	memory-controller@7000f400 {
 		#address-cells = < 1 >;
 		#size-cells = < 0 >;
+		#interconnect-cells = < 0 >;
 		compatible = "nvidia,tegra20-emc";
 		reg = <0x7000f4000 0x200>;
 		interrupts = <0 78 0x04>;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
