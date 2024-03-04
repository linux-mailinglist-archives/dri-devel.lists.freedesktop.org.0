Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E40D87067B
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 17:05:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04AEB1122D4;
	Mon,  4 Mar 2024 16:05:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="mxcd7MhD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9AA41122D4
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 16:05:03 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (unknown [217.70.183.200])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 39A3EC39AC
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 16:05:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9436B20003;
 Mon,  4 Mar 2024 16:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1709568300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LWQ0te0Hyhk01MW2THXCDBvNYf7CwmLuR3EI8Wv6l6Q=;
 b=mxcd7MhDgscxROkA6tVuMcPScoYCH/fwAuUbAKBhuU6E80Ptv9G79yo3iGho7+FmQd0T+V
 2SvQDzslyoOdlMzvaS6+1CX8+eSVamjYivtlCb6NP3UNsCNbtTRpvTkMA2KvowyOMgleAx
 jXuzXhWPEXD3CAUxeBss/zzawKYX4Q8ku2GfrrNVxKmUC91dli1qXIGHX43Qj272GQEoJL
 xMGV8VBsa+kDoySLqZDEbGe80tQhYR6zCJtJX2fk8jFnLQ+IGrbjQKWaPwuc4Y3ZDBojO8
 sp05lYzHdwt+gkscLhipll3lXvQJ4/1351U0jeQipNEDXNl/mbeWZ+zgXlcnwQ==
From: =?UTF-8?q?J=C3=A9r=C3=A9mie=20Dautheribes?=
 <jeremie.dautheribes@bootlin.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Yen-Mei Goh <yen-mei.goh@keysight.com>,
 =?UTF-8?q?J=C3=A9r=C3=A9mie=20Dautheribes?= <jeremie.dautheribes@bootlin.com>
Subject: [PATCH v2 2/3] dt-bindings: display: simple: add support for Crystal
 Clear CMT430B19N00
Date: Mon,  4 Mar 2024 17:04:53 +0100
Message-Id: <20240304160454.96977-3-jeremie.dautheribes@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240304160454.96977-1-jeremie.dautheribes@bootlin.com>
References: <20240304160454.96977-1-jeremie.dautheribes@bootlin.com>
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

Add Crystal Clear Technology CMT430B19N00 4.3" 480x272 TFT-LCD panel
compatible string.

Signed-off-by: Jérémie Dautheribes <jeremie.dautheribes@bootlin.com>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index a95445f40870..c575f7c4b745 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -91,6 +91,8 @@ properties:
       - boe,nv133fhm-n62
         # BOE NV140FHM-N49 14.0" FHD a-Si FT panel
       - boe,nv140fhmn49
+        # Crystal Clear Technology CMT430B19N00 4.3" 480x272 TFT-LCD panel
+      - cct,cmt430b19n00
         # CDTech(H.K.) Electronics Limited 4.3" 480x272 color TFT-LCD panel
       - cdtech,s043wq26h-ct7
         # CDTech(H.K.) Electronics Limited 7" WSVGA (1024x600) TFT LCD Panel
-- 
2.34.1

