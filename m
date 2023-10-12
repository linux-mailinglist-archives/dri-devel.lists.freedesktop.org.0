Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F147C65F8
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 08:58:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DA8010E41D;
	Thu, 12 Oct 2023 06:58:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5D3210E41B
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 06:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697093916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jYJU3nXdqvdbwcO4hjpDrp2WLD9hkGzJJegB/jryqJY=;
 b=iI2gOUDbc970AUDOuVwjqJrSefl98/y7WysqxCIsdpABSfFqZpcg2gZ6bby4emxsEgAXrp
 0VOUCtd4Iq10xac/NNveBlz69Mo6Y8jc21uMZZmUEEnSWsvFTT+31c9+GhjnDaBstqFVSO
 S3XruRKupXeGXrN611P2Qxyw5OqA5zQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-ISIm7tbLNe2MW1NXVZ3bYg-1; Thu, 12 Oct 2023 02:58:34 -0400
X-MC-Unique: ISIm7tbLNe2MW1NXVZ3bYg-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-40647c6f71dso5116705e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 23:58:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697093913; x=1697698713;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jYJU3nXdqvdbwcO4hjpDrp2WLD9hkGzJJegB/jryqJY=;
 b=ujmKBiWZo0uZB4JCGpbmS3i7k7HA26kRPKIXM4yTMX3BGt26MdIrB7d3LRrE9x8BRD
 WngLHoJ918/kVrAY/bI3KxmFN9omMvQiO2lxskDMYD6vxcRagRUs+jCGExwe3lB7lEI2
 9skCr+3/5Rzxz70TRzK5lwG1O1w+lbhnM3CuvPXi90MUwoPPvNPhg1zx1b0TEoZ/0W/l
 75GHS6EzrqS/zKu43gsEI8LBU74peTN6ARCMApWFsU0mCbCC2FayjOASYLUUAgSqQjlm
 pDC9Ld6vHiem3Ac0XoASBC8U0EisDkbI6L4ZivOhdwxdS0nXUlRQIe2979YYC4cLEUbr
 52DA==
X-Gm-Message-State: AOJu0Yw3u1vgwmkzSFy9nyzicZX0/o1j+ISiwFd91B2b9nIFfarAGWWM
 gpPZtA4MS5EDV5ekWs1rLvq6g4NifcL/O4vYaX2ATbP9uoTsvQBFuwOlGck1LbYpj/7H8kbnGRh
 Bxvu2iVyocxoiRHFj0qHje6DtmmUq
X-Received: by 2002:a1c:7c17:0:b0:401:bcb4:f133 with SMTP id
 x23-20020a1c7c17000000b00401bcb4f133mr20319553wmc.22.1697093913501; 
 Wed, 11 Oct 2023 23:58:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/Zp3Zrz43RsQjG2vKEMh7eT170A6k+ET5dAqpQw8c1vnh7x5XOF7CxlUvEz3D5sC4MMmtWw==
X-Received: by 2002:a1c:7c17:0:b0:401:bcb4:f133 with SMTP id
 x23-20020a1c7c17000000b00401bcb4f133mr20319536wmc.22.1697093913204; 
 Wed, 11 Oct 2023 23:58:33 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 q5-20020a7bce85000000b0040596352951sm21102422wmj.5.2023.10.11.23.58.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 23:58:32 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/6] dt-bindings: display: Split common Solomon properties
 in their own schema
Date: Thu, 12 Oct 2023 08:58:14 +0200
Message-ID: <20231012065822.1007930-6-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231012065822.1007930-1-javierm@redhat.com>
References: <20231012065822.1007930-1-javierm@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Conor Dooley <conor@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are DT properties that can be shared across different Solomon OLED
Display Controller families. Split them into a separate common schema to
avoid these properties to be duplicated in different DT bindings schemas.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 .../bindings/display/solomon,ssd-common.yaml  | 42 +++++++++++++++++++
 .../bindings/display/solomon,ssd1307fb.yaml   | 28 +------------
 MAINTAINERS                                   |  1 +
 3 files changed, 44 insertions(+), 27 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/solomon,ssd-common.yaml

diff --git a/Documentation/devicetree/bindings/display/solomon,ssd-common.yaml b/Documentation/devicetree/bindings/display/solomon,ssd-common.yaml
new file mode 100644
index 000000000000..677fd2b90960
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/solomon,ssd-common.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/solomon,ssd-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Common properties for Solomon OLED Display Controllers
+
+maintainers:
+  - Javier Martinez Canillas <javierm@redhat.com>
+
+properties:
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  # Only required for SPI
+  dc-gpios:
+    description:
+      GPIO connected to the controller's D/C# (Data/Command) pin,
+      that is needed for 4-wire SPI to tell the controller if the
+      data sent is for a command register or the display data RAM
+    maxItems: 1
+
+  solomon,height:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Height in pixel of the screen driven by the controller.
+      The default value is controller-dependent.
+
+  solomon,width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Width in pixel of the screen driven by the controller.
+      The default value is controller-dependent.
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+additionalProperties: true
\ No newline at end of file
diff --git a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
index 20e2bd15d4d2..3afbb52d1b7f 100644
--- a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
+++ b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
@@ -27,38 +27,12 @@ properties:
           - solomon,ssd1307
           - solomon,ssd1309
 
-  reg:
-    maxItems: 1
-
   pwms:
     maxItems: 1
 
-  reset-gpios:
-    maxItems: 1
-
-  # Only required for SPI
-  dc-gpios:
-    description:
-      GPIO connected to the controller's D/C# (Data/Command) pin,
-      that is needed for 4-wire SPI to tell the controller if the
-      data sent is for a command register or the display data RAM
-    maxItems: 1
-
   vbat-supply:
     description: The supply for VBAT
 
-  solomon,height:
-    $ref: /schemas/types.yaml#/definitions/uint32
-    description:
-      Height in pixel of the screen driven by the controller.
-      The default value is controller-dependent.
-
-  solomon,width:
-    $ref: /schemas/types.yaml#/definitions/uint32
-    description:
-      Width in pixel of the screen driven by the controller.
-      The default value is controller-dependent.
-
   solomon,page-offset:
     $ref: /schemas/types.yaml#/definitions/uint32
     default: 1
@@ -148,7 +122,7 @@ required:
   - reg
 
 allOf:
-  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+  - $ref: solomon,ssd-common.yaml#
 
   - if:
       properties:
diff --git a/MAINTAINERS b/MAINTAINERS
index 46ca5c4affdb..4a3baf970839 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6732,6 +6732,7 @@ DRM DRIVER FOR SOLOMON SSD130X OLED DISPLAYS
 M:	Javier Martinez Canillas <javierm@redhat.com>
 S:	Maintained
 T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	Documentation/devicetree/bindings/display/solomon,ssd-common.yaml
 F:	Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
 F:	drivers/gpu/drm/solomon/ssd130x*
 
-- 
2.41.0

