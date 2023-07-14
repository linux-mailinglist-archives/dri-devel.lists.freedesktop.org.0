Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDC7752EA9
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 03:38:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6FD510E7AC;
	Fri, 14 Jul 2023 01:38:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21ECB10E094
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 01:38:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6D96C61BA9;
 Fri, 14 Jul 2023 01:38:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A59EBC433C9;
 Fri, 14 Jul 2023 01:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689298681;
 bh=LPOwEiLDba7WqkS5e6PMVWcf9bxL4V+UFMcte4xKN7s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ENVvj5nN3emsfKqKyx1iWqHLTmxPBlBu+UBlk0CVbM6eJB/AHK4ulqq1AzPz8MdzK
 uaG9auED1JyG44KGnoZ6PwzjBU5bhT7wEnGxyzqy3mm0eH1y/sEdtVTervd51DMX+C
 uUKloTsfhMRbg56oFkfgCIO6cbtDj/Bg/EsDQxp/JavFzFKXqbbN2zyV+qZzclTz5t
 XusvMJVYrSr8P09hBrOAwGVbaArjdEeGiri2m2oEkgrEA0HzOKGkjAQFtr44HLiaOQ
 7Z14321ihJoc6BmI6UFH9OVI5Oi19HRB2dScVTqP7ByUhvUVoW26YyiaxYhfwBb4Z5
 SJBtmL7mSEzbA==
Received: by mercury (Postfix, from userid 1000)
 id CAE161067666; Fri, 14 Jul 2023 03:37:58 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
To: Sebastian Reichel <sre@kernel.org>
Subject: [PATCH v3 01/19] dt-bindings: vendor-prefixes: add Inanbo
Date: Fri, 14 Jul 2023 03:37:38 +0200
Message-Id: <20230714013756.1546769-2-sre@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230714013756.1546769-1-sre@kernel.org>
References: <20230714013756.1546769-1-sre@kernel.org>
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
 Michael Riesch <michael.riesch@wolfvision.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Shenzhen INANBO Electronic Technology Co., Ltd. manufacturers TFT/OLED
LCD panels.

Reviewed-by: Michael Riesch <michael.riesch@wolfvision.net>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index af60bf1a6664..1e2e51401dc5 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -617,6 +617,8 @@ patternProperties:
     description: Imagination Technologies Ltd.
   "^imi,.*":
     description: Integrated Micro-Electronics Inc.
+  "^inanbo,.*":
+    description: Shenzhen INANBO Electronic Technology Co., Ltd.
   "^incircuit,.*":
     description: In-Circuit GmbH
   "^indiedroid,.*":
-- 
2.40.1

