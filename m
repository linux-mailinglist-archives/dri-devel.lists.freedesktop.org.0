Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C210E1A29EB
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 21:52:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB4696EAE4;
	Wed,  8 Apr 2020 19:52:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFC2D6EAE3
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 19:52:10 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id k21so9043868ljh.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Apr 2020 12:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VLNfyRlmaYQ3/Tah2cpzN27telonR8g89G9XuIdJiRY=;
 b=lzzcPZNk3D+gr/CuCxW+wG0s2eiBtcOwaQ+4kVNKOjv0ELjFALUSyfhD6PMy82Is6W
 rfi0xNy6EBM6iiEwzcuMSyPtq25HJZrUGKE1dM5IaT7lgnO92QrVQrP/QveCFdPDQoB7
 fiNdNwH+Ut2D6kPE6+EgGEnNd3SIyqEO2XocbnaHXOyjHkFRbbRjasw4y/i9drd/aZSv
 o9Q7avZnj+YocaKUVMmIDhcKZOU88P9WtXCdyi9EplgE0PdAtMCYxcWEdD2TNNzBL8TD
 dpU1JaHDKISHIKJtTyKFuT2cRcbs3qVu5sSiW8wbsugOAL846McmY+wnFHjssBf0AM46
 u4Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VLNfyRlmaYQ3/Tah2cpzN27telonR8g89G9XuIdJiRY=;
 b=RmoB5ywmCpgKodtV1B52rmg+rqTTtd7VavtKxprMWz2sipa+p1QBX2SaGipEsNgKhs
 jxO4Tns/n8Sd9iM8XPqvsEFAIq37vdgv5jvB9ZOGp7Ca0xeRQB7U5hOs7y81PcZGzUL5
 +YVV+CtwDomCIQLRNZArJ16WzKfprNcnJe2ZShgk2COPmwGLqeJ4QjhFqAESl0G+qb/7
 WJmOCyWDXfvmJQ5Dd/AILSAgTd/jswwWkZ7OfIfNr2DCgRI495iAlzq0PeorMMEo/fVb
 5BPysytBXdbjW8Y/ZQYvA1ynRIDML8bDWnV32GiqlYI+Q6PA9FEVHakI9aHNwjwN9gHM
 ulEw==
X-Gm-Message-State: AGi0PuboBlu1OjT4U69vb/zQp5aAXYwcFeBlDRqxIMxtYqDM/n6CJnTD
 hciDDAOjZQq7SRUJDMwvGs08Iag5+5U=
X-Google-Smtp-Source: APiQypJyrRv0aS4Yh2ooLaXwJplXtwi5QzSmKmOw4hVeMqh0eP+Sek81CoQP0pujKQ7qi07udXd0ag==
X-Received: by 2002:a05:651c:c7:: with SMTP id 7mr5972954ljr.124.1586375528305; 
 Wed, 08 Apr 2020 12:52:08 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 i20sm3961304lfe.15.2020.04.08.12.52.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2020 12:52:07 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v2 25/36] dt-bindings: display: convert startek,
 startek-kd050c to DT Schema
Date: Wed,  8 Apr 2020 21:50:58 +0200
Message-Id: <20200408195109.32692-26-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200408195109.32692-1-sam@ravnborg.org>
References: <20200408195109.32692-1-sam@ravnborg.org>
MIME-Version: 1.0
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
Cc: Marek Belisko <marek@goldelico.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Marek Belisko <marek@goldelico.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../display/panel/startek,startek-kd050c.txt  |  4 ---
 .../display/panel/startek,startek-kd050c.yaml | 33 +++++++++++++++++++
 2 files changed, 33 insertions(+), 4 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/panel/startek,startek-kd050c.txt
 create mode 100644 Documentation/devicetree/bindings/display/panel/startek,startek-kd050c.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/startek,startek-kd050c.txt b/Documentation/devicetree/bindings/display/panel/startek,startek-kd050c.txt
deleted file mode 100644
index 70cd8d18d841..000000000000
--- a/Documentation/devicetree/bindings/display/panel/startek,startek-kd050c.txt
+++ /dev/null
@@ -1,4 +0,0 @@
-Startek Electronic Technology Co. KD050C 5.0" WVGA TFT LCD panel
-
-Required properties:
-- compatible: should be "startek,startek-kd050c"
diff --git a/Documentation/devicetree/bindings/display/panel/startek,startek-kd050c.yaml b/Documentation/devicetree/bindings/display/panel/startek,startek-kd050c.yaml
new file mode 100644
index 000000000000..fd668640afd1
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/startek,startek-kd050c.yaml
@@ -0,0 +1,33 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/startek,startek-kd050c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Startek Electronic Technology Co. KD050C 5.0" WVGA TFT LCD panel
+
+maintainers:
+  - Nikita Kiryanov <nikita@compulab.co.il>
+
+allOf:
+  - $ref: panel-dpi.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: startek,startek-kd050c
+      - {} # panel-dpi, but not listed here to avoid false select
+
+  backlight: true
+  enable-gpios: true
+  height-mm: true
+  label: true
+  panel-timing: true
+  port: true
+  power-supply: true
+  reset-gpios: true
+  width-mm: true
+
+additionalProperties: false
+
+...
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
