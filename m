Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEA26BF636
	for <lists+dri-devel@lfdr.de>; Sat, 18 Mar 2023 00:24:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 237BB10E426;
	Fri, 17 Mar 2023 23:24:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6C8A10E285
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 23:24:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 192B260C89;
 Fri, 17 Mar 2023 23:24:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94C75C433A8;
 Fri, 17 Mar 2023 23:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679095440;
 bh=40wNAXlyIA7VZKGyZ/AHWKvTBQOSewOxuHR9874XOtk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Bauausuf+Ul8D8hrfy65CjeljDX2wWvOW6qAhSVR5rYKj1kHYlu8T/Xx0vjoL83/7
 32m5/aiJgEOnjaXRFLmkDgMGfi5ciY4zYYyfGjqePOvx8BhM1oAiUcfvTjzCygmfD4
 kaCGhSV6JtLc2UtEXmBPSzTBUWfHYoLGQba4bxXCH/ltjpl6MWcG9cP2RYOoo5EXy5
 w+nbRgUTZzgx//jvoGqOycoARkE8InRm2qNQqfhsdD+kfzhuDcP6YwZ8r4df7KHdoa
 +r6hX/dldX6AGFFB02Z50wQq5j+KKeFk/FcxerW5Ljmp8TrewfKa3sBIe1yFvcTz8V
 vzfbu8L1RWIvw==
Received: by mercury (Postfix, from userid 1000)
 id DA45A10620F5; Sat, 18 Mar 2023 00:23:57 +0100 (CET)
From: Sebastian Reichel <sre@kernel.org>
To: Sebastian Reichel <sre@kernel.org>
Subject: [PATCHv1 1/7] dt-bindings: vendor-prefixes: add Inanbo
Date: Sat, 18 Mar 2023 00:23:49 +0100
Message-Id: <20230317232355.1554980-2-sre@kernel.org>
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

Shenzhen INANBO Electronic Technology Co., Ltd. manufacturers
TFT/OLED LCD panels.

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

