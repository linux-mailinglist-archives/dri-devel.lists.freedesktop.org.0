Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 378D0BF6316
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 13:53:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB66D10E5CE;
	Tue, 21 Oct 2025 11:53:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CtaWd8R4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E7FD10E5CA
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 11:53:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8C32F623F7;
 Tue, 21 Oct 2025 11:53:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 27317C2BCB6;
 Tue, 21 Oct 2025 11:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761047588;
 bh=0ZOyYOwg/QtwEkA51L4dZelWZkCwJZ5UZfBiyAr5WcQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=CtaWd8R4mDZEMU4TSlGrMuImTlWNhvFeF8x5qZhAN1xOBPZV8YCx1t8PaWsL3IKnc
 OIqOlre1iDAM8OXMjQX5gKidoWSBpJozEbvtF/0hqNvCTlXv2qrdzmp1aBY/eYQJx3
 Vr7rW7XSQTjcCddGOK672rQhbjqV2qnHNcZPuvjlINal+JBPha/94e/LuNHi9WsxvY
 ApsIyQm0J4wp5ZMZ0TAeLkZnMJvSynAEiped5EnGKT+dDb9ZNB3LsPBM8xMJlmzH/y
 pyVqq3fxhlURDnXckNzeLBd3F98Maq1P9eyZhrZATTpOJu7/LlehCF1ZP9ePSQrtIg
 N3a04Q4RUAOAA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 1DCBFCCD1B9;
 Tue, 21 Oct 2025 11:53:08 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 21 Oct 2025 13:53:07 +0200
Subject: [PATCH v4 7/7] dt-bindings: display: panel-simple-dsi: Remove
 Samsung S6E3FC2 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-s6e3fc2x01-v4-7-5e3ee21c688a@ixit.cz>
References: <20251021-s6e3fc2x01-v4-0-5e3ee21c688a@ixit.cz>
In-Reply-To: <20251021-s6e3fc2x01-v4-0-5e3ee21c688a@ixit.cz>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1344; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=c5fkR2jWk5YkcniO/SxqMzx6Ew0swnPogltZcHFgTB8=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBo93QiJGeCP+WQuzYRJI4TdEzwLRxRfVymzu3Yy
 cuKKbXLmCSJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaPd0IgAKCRBgAj/E00kg
 clZmEADEDrhcdx28UjTgVPkdnxtUE00Vgeygf8rFA5JPmVtgqJ/0bAE7X0IJJekrhjppGEngSlL
 H2TwD14xpMLAdFV+wu4oFEtudEJXFyeI156Ze2AkBWH6Tc1XHjWgh89KJjsZKmTA9IAY8gd2S3t
 hJ3xgLrQFXMOtaGu7MoI7rrKUU43o3LoHRXg+CF0FHq1K2ck4nXWaqy9sQtJ2pc+zLHTSFud2na
 UC90C2/VxwoVaRugoeTBwCwLwAZM/TxNXjBiNjYlV0Gv7JIiNCp8tKavFcyC6ZCB+T7Af+8SJPv
 pDLLitGYpppyGdi28MAT+juOy/jhKAmI7EAV72gQETQQsiUH1nliO0ENssGwphfhQmOUwijAWKg
 YNrKCRjtLqUai9y0t2TOUGNpyegyj1LCuy5DWzLNTdpwCKIXew7yvVjcr+v3dAUryGYnba6dzI+
 witeJRPxU77NiCLYb7aTd7RqBwH2V+JSb/lsc4WEOVREszMvLmxwew8ATVGXbfH0PJtsSLG9o0R
 1J3+QrJ9hAsgsGwM7zUBfCecb+vNajXCCh5x7HHKHwk8R0VlqEqokY3CGaXYsLXxnY2YBZMhCH9
 4Fwt1ALHkk/zI7OlRa/I/AcCQCUnRXpDtWytxzbAvBiHm1/eX+nBJaRmXwDBYqPugKA3ATLqjjn
 zbk/08wWYl0x0jg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
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
Reply-To: david@ixit.cz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: David Heidelberg <david@ixit.cz>

Samsung S6E3FC2X01 DDIC isn't Simple DSI panel.

This panel has three supplies, while panel-simple-dsi is limited to one.
There is no user of this compatible, nor the compatible make sense.
Remove it.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
index 9b92a05791ccf..ac2db8cf5eb76 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
@@ -56,8 +56,6 @@ properties:
       - panasonic,vvx10f034n00
         # Samsung s6e3fa7 1080x2220 based AMS559NK06 AMOLED panel
       - samsung,s6e3fa7-ams559nk06
-        # Samsung s6e3fc2x01 1080x2340 AMOLED panel
-      - samsung,s6e3fc2x01
         # Samsung sofef00 1080x2280 AMOLED panel
       - samsung,sofef00
         # Shangai Top Display Optoelectronics 7" TL070WSH30 1024x600 TFT LCD panel
@@ -80,7 +78,6 @@ allOf:
       properties:
         compatible:
           enum:
-            - samsung,s6e3fc2x01
             - samsung,sofef00
     then:
       properties:

-- 
2.51.0


