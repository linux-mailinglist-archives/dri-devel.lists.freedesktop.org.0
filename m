Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A3AACCDB9
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 21:42:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DAF310E203;
	Tue,  3 Jun 2025 19:42:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iEs4w9D7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0591C10E203
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 19:42:01 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id
 46e09a7af769-72c27166ab3so4148969a34.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jun 2025 12:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748979720; x=1749584520; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XjzLPAsqasz0SsRAqSr7Vzo2ligN562NWSmZO1lw4nU=;
 b=iEs4w9D7fA1+qdC8p5dgZAAXXaehBceKQGxz+LHppPY99kTVdfz3P9V3ILdMDrWRmn
 jpiKDoHoiGKQBzaaSyNcxUgnkoG3h1GIIt01ljp8YFZvpV645/7BuLe3P5fQwl8C4wCl
 baYm7+D5oP9Selqbx9ThvLTgtq+SAmfCpDGyY64OSc/TpaKxkVWac2xADe07023HtFoJ
 hfg5KYFDUpo2ZnTmaBdC7PunRUtplC6gkCBe3Ovfy9HJksnp8GYjg3X2U9mvzYEvS+Xp
 Dy7PomV3FdDZ3XY9l+Y6sS3mTD+acogXbFEi8++/zqI8pOD3dpbJMZm1MrXZ4AAuERJg
 myJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748979720; x=1749584520;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XjzLPAsqasz0SsRAqSr7Vzo2ligN562NWSmZO1lw4nU=;
 b=bgNi2LdugLTDL8N3Tg1hI+3O1VTO6APHoWojmpjCTCZfOdSSE+15OYT5LHzUW/Wsse
 wv2GeQKzdu38RpI7+Ds4/LcAGtGC9Ayfp4gygdVvXMFOeBtofNM4j30Nvwq4v9zsmSqv
 odwhU0sgeljt0bSPp+wfKwmjKn3gAsM2skmOGDhD0CMAFL3LsT5pFYGz3LSX6sIeAP/R
 nD0n19tdSr5G8/s0DGDghE40E5k3wDaELMm2ftUh54f6HJMLJ/SuClCEtAf1kDy/v+ah
 xeZo4AJI/jnQje8MTIAUcKRSL5a1EmM+xlWtx6LTqYdGL4AgZX4B4AWQ7TO1aZ0ohggo
 vDtA==
X-Gm-Message-State: AOJu0YxU1HMUhBiitNPKSFCguZRPpgW652n85gOb8Ia2gQ8Z1zmfEclU
 I3t4VCAme7ITtdwMpd6dC2gPmHISoqfefAVTLpLy0YcDcMtKRBfTgh4JanE54Q==
X-Gm-Gg: ASbGnctGYloaiSypoKKkgnkq5Z/+0ji5O0+Dc9RbkAHFoHUwCPQE5DOBCwg5/VgjoEZ
 DlQvRzH4Z6DhFOjnWssqbQCjqZVW294Ao/H+XqEaZICXdAeREox8uJYA0d7pNvgx5NO1RM4PYKY
 0x5IhLmkqIG531b4Kf0zI/prQWnle8hkVmzNQBUb6Y2gUq4ZdQWYGmxnetrVJs7vxh7r1V4pyUG
 pdNOsqttVoI5+fJzz7oYwys64zjAcfrS9vU8r9tcoEypRZoOCbYW+umOKzNJTCy8CQIE2oWftR4
 0oCHpiNS3sMLkTw36m9eQ5Q1SclO3oJ1YeQWY6KBha2KbhmgOeffJmDrM/CvcHZo9ZO49XpQeC/
 rpYlhDA==
X-Google-Smtp-Source: AGHT+IGEdqI2TCTVkK8o7agajIP4kfms0UAr6s+D6iGNsRfQhvMcgU7dK7DNcXKDtlDRpdBJDSTayg==
X-Received: by 2002:a05:6830:d13:b0:72b:9f17:1da0 with SMTP id
 46e09a7af769-73869c39496mr299430a34.7.1748979720415; 
 Tue, 03 Jun 2025 12:42:00 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:d19a:d10c:4358:1346])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-60c14c88f96sm1967615eaf.17.2025.06.03.12.41.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 12:42:00 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 sebastian.reichel@collabora.com, heiko@sntech.de, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, tzimmermann@suse.de,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, simona@ffwll.ch,
 airlied@gmail.com, quic_jesszhan@quicinc.com, neil.armstrong@linaro.org,
 javierm@redhat.com, megi@xff.cz, Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 2/4] dt-bindings: display: himax-hx8394: Add Huiling
 hl055fhav028c
Date: Tue,  3 Jun 2025 14:39:28 -0500
Message-ID: <20250603193930.323607-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250603193930.323607-1-macroalpha82@gmail.com>
References: <20250603193930.323607-1-macroalpha82@gmail.com>
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

From: Chris Morgan <macromorgan@hotmail.com>

Add compatible string for the Huiling hl055fhav028c. This panel is
based on the Himax HX8399C display controller which is extremely
similar to the existing HX8394. Add a new constant for
himax,hx8399c for this new display controller as well.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../bindings/display/panel/himax,hx8394.yaml    | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
index 75ccabff308b..5725a587e35c 100644
--- a/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
@@ -17,12 +17,17 @@ description:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - hannstar,hsd060bhw4
-          - microchip,ac40t08a-mipi-panel
-          - powkiddy,x55-panel
-      - const: himax,hx8394
+    oneOf:
+      - items:
+          - enum:
+              - hannstar,hsd060bhw4
+              - microchip,ac40t08a-mipi-panel
+              - powkiddy,x55-panel
+          - const: himax,hx8394
+      - items:
+          - enum:
+              - huiling,hl055fhav028c
+          - const: himax,hx8399c
 
   reg:
     maxItems: 1
-- 
2.43.0

