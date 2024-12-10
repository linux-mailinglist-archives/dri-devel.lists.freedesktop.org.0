Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5884A9EB836
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 18:28:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D94210E10B;
	Tue, 10 Dec 2024 17:28:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="bzbjBktf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C732410E07A
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 17:28:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2D59C1C0004;
 Tue, 10 Dec 2024 17:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1733851702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GS+vwpanwrRpzMg7vBXvtfqStuSko6swxapbB+Fqz7M=;
 b=bzbjBktfb1UgmR3w1TS8MKybm/SazVNPyZM1gbStEmydfyUmYmfGy3lVhfpo1165aHsvs5
 0IwIoz5bw+W7EvAtIG6h3z8LMNDg41aOrbn7J4tn2ZE4Kz8d/ZjfOOPJZkJRAoxJXnTFAY
 ze5EdcZ9cOGEHIVlm0HFogMZwTZDe/Oz8s+Dn5yytmRJgwWjNXftia9mss1S1Imr7JgyMh
 yFEl0WYuv+65ct7tFrT7v68c8CZbWtT8MaoP4HnHNLkXkeJ0N5E42ZflgW8A5BEp1XEC/H
 1fyYbwgxKfbNiu7eRrjSSbJQmjlD4stfzgxBW+cHU7uUv7H1Xy/ru8otwm8iEw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 10 Dec 2024 18:28:03 +0100
Subject: [PATCH 1/2] dt-bindings: display: simple: Add Tianma
 TM070JDHG34-00 panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-tianma_tm070jdhg34-v1-1-9fb7fe6b6cf0@bootlin.com>
References: <20241210-tianma_tm070jdhg34-v1-0-9fb7fe6b6cf0@bootlin.com>
In-Reply-To: <20241210-tianma_tm070jdhg34-v1-0-9fb7fe6b6cf0@bootlin.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: luca.ceresoli@bootlin.com
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

Add the Tianma Micro-electronics TM070JDHG34-00 7.0" LVDS LCD TFT panel.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 Documentation/devicetree/bindings/display/panel/panel-simple.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 18b63f356bb4bbf6d2c8e58b13ebb14c5f4004ad..30f655e82666bb1aa227edd26bd8d3621a39e74f 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -281,6 +281,8 @@ properties:
         # Tianma Micro-electronics TM070JDHG30 7.0" WXGA TFT LCD panel
       - tianma,tm070jdhg30
         # Tianma Micro-electronics TM070JVHG33 7.0" WXGA TFT LCD panel
+      - tianma,tm070jdhg34-00
+        # Tianma Micro-electronics TM070JDHG34-00 7.0" WXGA (1280x800) LVDS TFT LCD panel
       - tianma,tm070jvhg33
         # Tianma Micro-electronics TM070RVHG71 7.0" WXGA TFT LCD panel
       - tianma,tm070rvhg71

-- 
2.34.1

