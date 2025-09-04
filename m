Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8C8B446D3
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 22:01:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23CB410E27D;
	Thu,  4 Sep 2025 20:01:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="xB5yQC+g";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="PGcRzfcO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F33210E27D
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 20:01:47 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cHr3F6rt9z9t3f;
 Thu,  4 Sep 2025 22:01:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1757016106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=0Umhovcau/YqRorev3Ev6aBhjaNGXWMdzGC74D6Sf68=;
 b=xB5yQC+gLAs/Ca00D/OMu2oZxi2Tu19fFMzbUUnE/AHV4ASg9oTHGzIdWo2vNwPm5GAIx2
 gvkEzwlBvPFA0YVfzFKjYVHsMHLQgflEnzO7EPTMT5eQi2ymR/GBIRyPLA53ROEFayASCm
 UxIDlBWKWQ7HycDvOLfTofZ785GpilJVw+J5HHbwMA3p1V/lqMiVyfRjfk6RB7NPL32To7
 Wh6BVFm9TrkVDv8yYsd+jlWv2Ie0B7u4/+bkOHjr7MURz06LC6+PDdIOTmZZlG3/XmuWRU
 UvAlpHwqg7h6D9tPg81P+sTNt/py/jOUA62cgiTfhGT33VlrI/vBmQLH+mY28w==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1757016104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=0Umhovcau/YqRorev3Ev6aBhjaNGXWMdzGC74D6Sf68=;
 b=PGcRzfcO89dfpdg4vTU5D296q5hb/j3j7dKL7ipTg+RwXasTFFKVxkwAvs/0ss4ub9z9uo
 6qywlKOG/6qVwP13e1o4LfrLA8T0OT+cq4mD+EraBKzQUZTQ+G+xQvJ0asGUGIInqX5v2S
 EqfUzF161xobHIBKlM85wrSqHjWG6z3EchMlbr2vvMY1ad+z0T9R/FxTAjSjKjbWvCafGe
 X3ZQEtUTaR1c7HiLRw7uNb2o4fu938hAK0G6qg1pClPEJvEw2edb131xGA0EyYW3rJOPBS
 Oq6LPV9wnYqJs6fsvnhCibwRx8zI5mR8p7QUSvuXvKWdfkYwUfOcYEoOXXvdgw==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH] dt-bindings: ili9881c: Allow port subnode
Date: Thu,  4 Sep 2025 22:01:08 +0200
Message-ID: <20250904200130.168263-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 755f89b141a440e5f99
X-MBO-RS-META: hkjeud4gg6a7prpocn71mp77f56oh519
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

The ILI9881C is a DSI panel, which can be tied to a DSI controller
using OF graph port/endpoint. Allow the port subnode in the binding.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
 .../devicetree/bindings/display/panel/ilitek,ili9881c.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
index 434cc6af9c954..cf0aa996e072d 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
@@ -30,6 +30,7 @@ properties:
     maxItems: 1
 
   backlight: true
+  port: true
   power-supply: true
   reset-gpios: true
   rotation: true
-- 
2.50.1

