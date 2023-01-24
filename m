Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C4567A612
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 23:42:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B348E10E268;
	Tue, 24 Jan 2023 22:42:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-48.mta0.migadu.com (out-48.mta0.migadu.com
 [IPv6:2001:41d0:1004:224b::30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A63410E268
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 22:42:07 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ansari.sh; s=key1;
 t=1674600125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=36Vs8J0xhZS4TyMPNV0MC8jbKBVP8w8N3cOPO33G5Wk=;
 b=NDz7l4pPA+sUvoQ0mDQNcUtYzr72ERejOPwyYOT4DtmFUwQqUNTU257VyRO0+JF/FswAXH
 o+DK4x7vQ2KpVpyASwIA8gwOmP/oGcIzYvE/zqTEcqeFrGuPgG7NvzXYM8TEz1lj5rJldo
 K7Dqn36RngXMNaaFLCEqxRHj8zJe9GU=
From: Rayyan Ansari <rayyan@ansari.sh>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/2] dt-bindings: display: simple-framebuffer: Document
 physical width and height properties
Date: Tue, 24 Jan 2023 22:41:42 +0000
Message-Id: <20230124224142.7133-3-rayyan@ansari.sh>
In-Reply-To: <20230124224142.7133-1-rayyan@ansari.sh>
References: <20230124224142.7133-1-rayyan@ansari.sh>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

Document the optional width-mm and height-mm simple-framebuffer
properties.

Signed-off-by: Rayyan Ansari <rayyan@ansari.sh>
---
 .../devicetree/bindings/display/simple-framebuffer.yaml     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
index dd64f70b5014..4ae33a4d2da9 100644
--- a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
+++ b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
@@ -106,6 +106,12 @@ properties:
       - x2r10g10b10
       - x8r8g8b8
 
+  width-mm:
+    description: Physical width of the display in millimetres
+
+  height-mm:
+    description: Physical height of the display in millimetres
+
   display:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: Primary display hardware node
-- 
2.39.1

