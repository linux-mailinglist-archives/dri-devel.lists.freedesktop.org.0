Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA68967D412
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 19:25:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B2410E96B;
	Thu, 26 Jan 2023 18:25:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-34.mta0.migadu.com (out-34.mta0.migadu.com
 [IPv6:2001:41d0:1004:224b::22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26EE110E969
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 18:24:53 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Rayyan Ansari <rayyan@ansari.sh>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 2/2] dt-bindings: display: simple-framebuffer: Document the
 panel node
Date: Thu, 26 Jan 2023 18:24:35 +0000
Message-Id: <20230126182435.70544-3-rayyan@ansari.sh>
In-Reply-To: <20230126182435.70544-1-rayyan@ansari.sh>
References: <20230126182435.70544-1-rayyan@ansari.sh>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org, janne@jannau.net,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rayyan Ansari <rayyan@ansari.sh>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, asahi@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document the new panel node and what it is used for.

Signed-off-by: Rayyan Ansari <rayyan@ansari.sh>
---
 .../devicetree/bindings/display/simple-framebuffer.yaml  | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
index dd64f70b5014..4e10a100b6c8 100644
--- a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
+++ b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
@@ -26,6 +26,11 @@ description: |+
   over control to a driver for the real hardware. The bindings for the
   hw nodes must specify which node is considered the primary node.
 
+  If a panel node is given, then the driver uses this to configure the
+  physical width and height of the display. If no panel node is given,
+  then the driver uses the width and height properties of the simplefb
+  node to estimate it.
+
   It is advised to add display# aliases to help the OS determine how
   to number things. If display# aliases are used, then if the simplefb
   node contains a display property then the /aliases/display# path
@@ -110,6 +115,10 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: Primary display hardware node
 
+  panel:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Display panel node
+
   allwinner,pipeline:
     description: Pipeline used by the framebuffer on Allwinner SoCs
     enum:
-- 
2.39.1

