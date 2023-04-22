Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 953D86EBB42
	for <lists+dri-devel@lfdr.de>; Sat, 22 Apr 2023 22:50:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0540910E1A3;
	Sat, 22 Apr 2023 20:50:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A297C10E181
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Apr 2023 20:50:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1E1F561548;
 Sat, 22 Apr 2023 20:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D114DC433A0;
 Sat, 22 Apr 2023 20:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682196628;
 bh=PUQCKwZnGVDUiojPXOs7mXeeN6nrWGsi+ffulJh2jzg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TJ/PCE6VMqtkdLmrKvX/mN8uXAMMCurbr2XU1A0mTWg+SZ25EC4YGBB8HzDCYqQ6V
 v/GhWqb9mBo6YEbohP0sGUuh+Z7cDVTvmSY4CSikYgyfrhspoWioqmwZsiv/Cm1QmU
 16UbSfX6rjE+ZL3LtoDR/fb0iEcrLntDDBbyBFGLwGrh69zVHKRxHFRTDkxUlgVPoG
 DDdpvf/ZDCdDgZpKsSimIARhRcgTCWTgQMn3zYzr6mVb+1svnUhUQXAhw5UPsgpIw7
 XcR0nDPRob8AuYwkSoapGBexN+aMPFDZXiYluZ4eocdSp6BVSIhdleRgJTqaOMtDu7
 fBaAl+0xkSmgg==
Received: by mercury (Postfix, from userid 1000)
 id 0BD691066CBF; Sat, 22 Apr 2023 22:50:25 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
To: Sebastian Reichel <sre@kernel.org>
Subject: [PATCH v2 01/13] dt-bindings: vendor-prefixes: add Inanbo
Date: Sat, 22 Apr 2023 22:50:00 +0200
Message-Id: <20230422205012.2464933-2-sre@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230422205012.2464933-1-sre@kernel.org>
References: <20230422205012.2464933-1-sre@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Michael Riesch <michael.riesch@wolfvision.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Shenzhen INANBO Electronic Technology Co., Ltd. manufacturers TFT/OLED
LCD panels.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ed64e06ecca4..33e1d65cf4b2 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -609,6 +609,8 @@ patternProperties:
     description: Imagination Technologies Ltd.
   "^imi,.*":
     description: Integrated Micro-Electronics Inc.
+  "^inanbo,.*":
+    description: Shenzhen INANBO Electronic Technology Co., Ltd.
   "^incircuit,.*":
     description: In-Circuit GmbH
   "^inet-tek,.*":
-- 
2.39.2

