Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 522EE3AE3D4
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 09:07:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B59F389D58;
	Mon, 21 Jun 2021 07:07:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C06689C82
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 06:44:45 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id e22so7173251pgv.10
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jun 2021 23:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MngqRxxEHl2ppcxz+/r0UlSDgAGtoX4UkbK2llRyjcc=;
 b=iDFn5N19FrrTYa7TxJRsUW4oiVbP2ALDloiMjEcD7XYz+nk/kVL3RD3W1cpYEQ77Wf
 yCQx1eT/Ap8/72YEUDmRPU8BNore/4yJOawiFSuZrOPXawDt8kboJNj1qJL4EjZSrTFb
 dKRiO0JPvqtD2qjEEWM5HJ7tnlRdqtKHqKMi5ABX4V/THftJJCqZ4djRotOE7ziKO2Sb
 EicQkU/b23u+GAsfO568WK76/I87GlwVTSUJkXAC6fc3saRmNPBv0bP5rxh34tdo1JWL
 y7GOdTjclhbn1hJ65xdQwcO2k5iZ9WA2glv0eRpHWpxon2kT38OHQAq+aMUgvzuM1LLx
 xPDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MngqRxxEHl2ppcxz+/r0UlSDgAGtoX4UkbK2llRyjcc=;
 b=MquovLulaz6aoP5B9m2Ne6G7j+JBkGUs1ZuKL6/M2+i+ptdayVqM8avLf2h+HeoacJ
 bjWZujuZXFQmvnIZ0JxsSz6GokBXbffsA/1conIbPHIRYFGSODdXRG4qY+5xamZECG6S
 EqxDCo7c+uR07vcaiVocIOW7y9+rLQm88YnO5H2riqOS1DOqxXGY7ym8js6SlzTrwKkl
 OXxKRle/Jz+vxY5o/aMuKUMm/ZkCKpLKyqnRYzdeaXmrOJrmXs6kQPofNYb3kpBwpf4s
 cWmbQej3stMxc/S2OoxfED/vT3TjwcqnkBc/+T6S4lk/wy0R1czFRAjmFVGQw5aqaICa
 6RCQ==
X-Gm-Message-State: AOAM532hNvBW5OMz8NaJS5ct8xozcI/ky9I5mt/I2bWYKzeED1YkvNxb
 +axihcv77cYT48fFo8gO7thRJw==
X-Google-Smtp-Source: ABdhPJz3uS2NIZaMaM/MYhOpgEafGu609FiIcSOzqpTKLKoyHWUGdazm9z6mtIzuamYok1wtYwHFuA==
X-Received: by 2002:a63:451f:: with SMTP id s31mr22278023pga.209.1624257884801; 
 Sun, 20 Jun 2021 23:44:44 -0700 (PDT)
Received: from localhost.localdomain ([240b:10:c9a0:ca00:61b8:26ec:dc30:8823])
 by smtp.gmail.com with ESMTPSA id
 o34sm12744450pgm.6.2021.06.20.23.44.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 23:44:44 -0700 (PDT)
From: Tomohito Esaki <etom@igel.co.jp>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATH 3/4] dt-bindings: display: Add virtual DRM
Date: Mon, 21 Jun 2021 15:44:02 +0900
Message-Id: <20210621064403.26663-4-etom@igel.co.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621064403.26663-1-etom@igel.co.jp>
References: <20210621064403.26663-1-etom@igel.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 21 Jun 2021 07:07:50 +0000
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
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, Tomohito Esaki <etom@igel.co.jp>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add device tree bindings documentation for virtual DRM.

Signed-off-by: Tomohito Esaki <etom@igel.co.jp>
---
 .../devicetree/bindings/display/vdrm.yaml     | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/vdrm.yaml

diff --git a/Documentation/devicetree/bindings/display/vdrm.yaml b/Documentation/devicetree/bindings/display/vdrm.yaml
new file mode 100644
index 000000000000..6493bb0fc09f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/vdrm.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/vdrm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Virtual DRM Device Tree Bindings
+
+description:
+  This document defines device tree properties virtual DRM. The initial
+  position, size and z-position of the plane used in the virtual DRM is
+  specified.
+  The current limitation is that these settings are applied to all crtc.
+
+properties:
+  compatible:
+    const: virt-drm
+
+patternProperties:
+  "^plane(@.*)?$":
+    description: Information of the planes used in virtual DRM
+    type: object
+
+    properties:
+      x:
+        type: int
+        description: x-coordinate of the left-top of the plane in pixels
+
+      y:
+        type: int
+        description: y-coordinate of the left-top of the plane in pixels
+
+      width:
+        type: int
+        description: width of the plane in pixels
+
+      height:
+        type: int
+	description: height of the plane in pixels
+
+      zpos:
+        type: int
+        description: z-position of the plane
+
+    required:
+      - x
+      - y
+      - width
+      - height
+      - zpos
+
+required:
+  - compatible
+  - "^plane(@.*)?$"
+
+examples:
+ - |
+   vdrm@0 {
+       compatible = "virt-drm";
+       plane@0 {
+           x = <200>;
+	   y = <100>;
+	   width = <800>;
+	   height = <600>;
+	   zpos = <1>;
+       };
+   };
-- 
2.25.1

