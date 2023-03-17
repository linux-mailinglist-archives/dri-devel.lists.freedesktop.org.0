Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 230E46BF648
	for <lists+dri-devel@lfdr.de>; Sat, 18 Mar 2023 00:24:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97CCA10E437;
	Fri, 17 Mar 2023 23:24:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80D0310E2A0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 23:24:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2B048B82722;
 Fri, 17 Mar 2023 23:24:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E1F2C433A1;
 Fri, 17 Mar 2023 23:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679095440;
 bh=wMdj6XMSKvcrwZmlfjFE87Mo/K0QwNMqQP6DoUCEh10=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=V7WZLmN/f4vrQhvkHFIhjRas7Jj2UFY3UEQOixFtO03eD6fgNZwgj3qLzBq5nPt0/
 kfevjrBRC3fVUwIO4ahdTus1s07972KBOWtqzDISoCpD+QxwEBpT1JOOGkCAjtPXsx
 JFjVd0k2GYo0RI2lVIV/f8nAQHzn/2ugP98XcdDvpIb9cge+klspr8KDeNNq2sG6ZT
 1QeD3imwyqyOOuEQyYvoKYLmTPFqv37Oj0W4qI9ufDV9SSzLWml/QnI+rJlFrScbvO
 cj4O6fOjHZx4llqqyMArc8LsZNDP9PlV0DXO65dbt+gqxQZ8GrBsFhvQzanpNEhAU5
 rxmIjQ3DYZ+0g==
Received: by mercury (Postfix, from userid 1000)
 id DB22210620FF; Sat, 18 Mar 2023 00:23:57 +0100 (CET)
From: Sebastian Reichel <sre@kernel.org>
To: Sebastian Reichel <sre@kernel.org>
Subject: [PATCHv1 2/7] dt-bindings: display: st7789v: add Inanbo T28CP45TN89
Date: Sat, 18 Mar 2023 00:23:50 +0100
Message-Id: <20230317232355.1554980-3-sre@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230317232355.1554980-1-sre@kernel.org>
References: <20230317232355.1554980-1-sre@kernel.org>
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
 Thierry Reding <thierry.reding@gmail.com>,
 Michael Riesch <michael.riesch@wolfvision.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add compatible value for Inanbo t28cp45tn89 and
make reset GPIO non mandatory, since it might not
be connected to the CPU.

Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
 .../devicetree/bindings/display/panel/sitronix,st7789v.yaml  | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
index d984b59daa4a..4fc86f96b00f 100644
--- a/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
+++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
@@ -15,7 +15,9 @@ allOf:
 
 properties:
   compatible:
-    const: sitronix,st7789v
+    enum:
+      - sitronix,st7789v
+      - inanbo,t28cp45tn89-v17
 
   reg: true
   reset-gpios: true
@@ -29,7 +31,6 @@ properties:
 required:
   - compatible
   - reg
-  - reset-gpios
   - power-supply
 
 unevaluatedProperties: false
-- 
2.39.2

