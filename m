Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7A940B8C7
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 22:13:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06A256E7D0;
	Tue, 14 Sep 2021 20:13:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A61326E7D0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 20:12:59 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id C2320D18F4
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 20:06:12 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 1CAEAFF806;
 Tue, 14 Sep 2021 20:05:50 +0000 (UTC)
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v9 2/4] dt-bindings: mfd: logicvc: Add patternProperties for
 the display
Date: Tue, 14 Sep 2021 22:05:37 +0200
Message-Id: <20210914200539.732093-3-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210914200539.732093-1-paul.kocialkowski@bootlin.com>
References: <20210914200539.732093-1-paul.kocialkowski@bootlin.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The LogiCVC multi-function device has a display part which is now
described in its binding. Add a patternProperties match for it.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 Documentation/devicetree/bindings/mfd/xylon,logicvc.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/xylon,logicvc.yaml b/Documentation/devicetree/bindings/mfd/xylon,logicvc.yaml
index 8a1a6625c782..9efd49c39bd2 100644
--- a/Documentation/devicetree/bindings/mfd/xylon,logicvc.yaml
+++ b/Documentation/devicetree/bindings/mfd/xylon,logicvc.yaml
@@ -46,6 +46,9 @@ patternProperties:
   "^gpio@[0-9a-f]+$":
     $ref: /schemas/gpio/xylon,logicvc-gpio.yaml#
 
+  "^display@[0-9a-f]+$":
+    $ref: /schemas/display/xylon,logicvc-display.yaml#
+
 required:
   - compatible
   - reg
-- 
2.32.0

