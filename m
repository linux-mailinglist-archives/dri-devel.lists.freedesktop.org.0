Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5E0A44E84
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 22:15:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 084A810E10E;
	Tue, 25 Feb 2025 21:15:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="pbtrWwkA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 753A710E1C9
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 21:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
 t=1740518093; bh=g08GjdWndeD+8Od5WoeqAJLhdg02LWDKIbkAtiqenRA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=pbtrWwkAFE299XF+2DMLKMDhQgp95omo/FkdqCLBfA6bl4WbePmzuCl7oxVyPcDVL
 zrv77ZaXN1cCDgkFWD0N7oY1hQPk2miGASM9AcWQ6GueSE4o082gP9qZlX/Qw7nnQT
 bOun2M0bFDCzutf7mn4cpKVP4L4uH6TAQMa7I694=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Tue, 25 Feb 2025 22:14:29 +0100
Subject: [PATCH v2 1/4] dt-bindings: vendor-prefixes: document Shenzhen DJN
 Optronics Technology
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-fp3-display-v2-1-0b1f05915fae@lucaweiss.eu>
References: <20250225-fp3-display-v2-0-0b1f05915fae@lucaweiss.eu>
In-Reply-To: <20250225-fp3-display-v2-0-0b1f05915fae@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=918; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=g08GjdWndeD+8Od5WoeqAJLhdg02LWDKIbkAtiqenRA=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnvjLI6Mh3e/cZZMMQq3hcbldXzG82qfhZqWPEV
 3wFJf6S7BCJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ74yyAAKCRBy2EO4nU3X
 Vl3sD/wMTs6+IB3h9qvB3lAEBCrXn5gxbD+9pLzy13c4dbL7YGYLn71qXbvXD4e6L9eLzNdNEyq
 io+rOEuhhXnWD1S2SRQ+QSI/WQp6c+YWBmJ0BCkYzY9vQa9XzmlETHXr2dEzJpE97czJbNIYpRd
 bgcknY598W6aeQ7EtQnfmzgVT6Fv980+ubfXan+vS+oQaRt+SJbetm8b2OgpUMgI6ftivIChaS1
 w79SLMrr1d0oqhCz0IK3PpVZeGqH2w1ujVr6DaXCG2PFiwQQFJg4cAXQJyfH+XptWGToWQCH9Dc
 0nfHV5z8NA7f6U916gHj9TEbv0zu6gEUzrJ56C1JmsIxo7SauryPEFKnxw/HDtMHoihZiKw/Bxm
 W71v++jGgQU9IIjjgwWHY1nS4kS9r+TIE9MT9X51Jwm2hHyj65gQE7mr6R4nq5dxWe+33u2Ff1A
 KVsZM77UKE/9QvEYSu3ETH1/hmZU9dYHINVkkc30YomIkntqy3+2TL8x47Wl5NqHADqiiWKxUrv
 kH7hRVK4XgxaIR8egi5jq8FpBHXpR44ZC3tvHEI5/1mDMCa3G4in2lfRTDdLMcgfgLymRK+KY09
 GG9WKk0TWOuYdZVmLIpxKGAOfBmtckxLZQX0zftUNbGhuvoxtGJuJiw/RiYNzImt5PlrgOaEyNV
 G6D1PvZFnh2OPTA==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the vendor prefix for DJN (http://en.djnlcd.com/).

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index da01616802c76830a520594a69bd6a2e0231df0d..ee2dca4f372263c7a79ea17f4a9411939bd0531a 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -390,6 +390,8 @@ patternProperties:
     description: Diodes, Inc.
   "^dioo,.*":
     description: Dioo Microcircuit Co., Ltd
+  "^djn,.*":
+    description: Shenzhen DJN Optronics Technology Co., Ltd
   "^dlc,.*":
     description: DLC Display Co., Ltd.
   "^dlg,.*":

-- 
2.48.1

