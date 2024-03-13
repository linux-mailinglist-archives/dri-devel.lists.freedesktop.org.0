Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4BD87ACE1
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 18:20:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06FE310EB0D;
	Wed, 13 Mar 2024 17:20:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="SW0f0tlU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC2910F50A
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 17:20:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1685A60004;
 Wed, 13 Mar 2024 17:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1710350424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=02+yT9N9o9NKCFVvGS4oNEPEPi28XRrK0I0VU7hqIgM=;
 b=SW0f0tlUmoTxL3YcuWCoCYj7x9fNRSpY2dFPqyo+Kr9B7DIm5V/tKpYhRogx0nNVaa9MtS
 x1ls05UAqlVm1E27fMrAprcuCGUf5ah1YxwDAQwKvUb7k3tT2ywSQXxgdUbS7WzPRmavnn
 DFpujesRViUwsKr/ts+0wl35rr3O8QwWssXTwWjImAtTdNwnRQN0EiFUz11wNYr3tZgW58
 t/3mrHNOtQY5+K4TkCKeLtIlJFMbgcRZWaetB9m/DUJiOLFgN0bXlVaQtZZKInep5p3TVG
 6CdwMqvC6r2za3WsIciNoIHXP5plZ8m9oAxZKOJB3ckxV/8i1zSQ3rtNEk0oVw==
From: =?UTF-8?q?J=C3=A9r=C3=A9mie=20Dautheribes?=
 <jeremie.dautheribes@bootlin.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Yen-Mei Goh <yen-mei.goh@keysight.com>,
 =?UTF-8?q?J=C3=A9r=C3=A9mie=20Dautheribes?= <jeremie.dautheribes@bootlin.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/3] dt-bindings: Add Crystal Clear Technology vendor prefix
Date: Wed, 13 Mar 2024 18:20:14 +0100
Message-Id: <20240313172016.387277-2-jeremie.dautheribes@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240313172016.387277-1-jeremie.dautheribes@bootlin.com>
References: <20240313172016.387277-1-jeremie.dautheribes@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: jeremie.dautheribes@bootlin.com
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

Update Documentation/devicetree/bindings/vendor-prefixes.yaml to
include "cct" as a vendor prefix for "Crystal Clear Technology". CCT is
the vendor of the CMT430B19N00 TFT-LCD panel.

Link: http://www.cct.com.my/
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index fef2e12b504e..96e47742e250 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -248,6 +248,8 @@ patternProperties:
     description: Catalyst Semiconductor, Inc.
   "^cavium,.*":
     description: Cavium, Inc.
+  "^cct,.*":
+    description: Crystal Clear Technology Sdn. Bhd.
   "^cdns,.*":
     description: Cadence Design Systems Inc.
   "^cdtech,.*":
-- 
2.34.1

