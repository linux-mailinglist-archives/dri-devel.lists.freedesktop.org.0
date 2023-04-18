Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2479F6E67CB
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 17:07:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6244F10E0A1;
	Tue, 18 Apr 2023 15:07:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3E0D10E0A1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 15:07:26 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id
 5614622812f47-38bef71c258so447074b6e.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 08:07:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681830445; x=1684422445;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YcqBimFCHj3MmeRz1Cnp48tZO7IirUdvbf3eVDP9RoM=;
 b=G+M5cTSqTa3xzii7VgVW9EQCQnQ0kDWLd4eDMFEWJNlNTdl9oKv8spdoee2jJOtFbC
 /b4VDgFOEgiQICPIX277NhbndUXiyke5O8mrI5rkrSZI66+ZmamuFox7U2tB+0fCqC/y
 pzDUkAZtph5yDql2oTz/pRcWG7DZP3k0PkgHeTimwnarKAh4IBjIB05UdUFv57WT++ZO
 KcdnJNwI3j+TJuVJn8xsbw6HqxWCvsbDXdNsJgQjWoWB44/fztge17Oa4vI76oOSKkhD
 chMXOXp0K7OuqWUlgKDcbMyuSeV6gRzP3g9hK11Svyxzlz0x5ir1NT8o7qECyvbpIUgu
 c1wA==
X-Gm-Message-State: AAQBX9fOSXjOmdk0Cs5/PRHaKQkBy9MkG4HC3IOvulHnFJGCeVziwxmo
 AVhwLR7R9yuRwekPXYiMOQ==
X-Google-Smtp-Source: AKy350aQFH3SOS8eGc5PQFYBNOKHnYlUX5aaxmlfxu9uN9d7QhO70k6+CIhwuq6LQRIL6vGeIxIbfg==
X-Received: by 2002:a05:6808:f12:b0:38c:5287:7c6d with SMTP id
 m18-20020a0568080f1200b0038c52877c6dmr1364330oiw.39.1681830445397; 
 Tue, 18 Apr 2023 08:07:25 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 z12-20020a056808064c00b0038cabdbe3a7sm3516244oih.3.2023.04.18.08.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 08:07:24 -0700 (PDT)
Received: (nullmailer pid 1536183 invoked by uid 1000);
 Tue, 18 Apr 2023 15:07:04 -0000
From: Rob Herring <robh@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Heiko Stuebner <heiko.stuebner@bq.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH] dt-bindings: display: Fix lvds.yaml references
Date: Tue, 18 Apr 2023 10:06:57 -0500
Message-Id: <20230418150658.1535120-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The trailing "/" in "lvds.yaml/#" is not a valid JSON pointer. The existing
jsonschema package allows it, but coming changes make allowed "$ref" URIs
stricter.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/display/panel/advantech,idk-1110wr.yaml | 2 +-
 .../devicetree/bindings/display/panel/innolux,ee101ia-01d.yaml  | 2 +-
 .../devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml | 2 +-
 .../devicetree/bindings/display/panel/mitsubishi,aa121td01.yaml | 2 +-
 Documentation/devicetree/bindings/display/panel/panel-lvds.yaml | 2 +-
 .../devicetree/bindings/display/panel/sgd,gktw70sdae4se.yaml    | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml b/Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml
index 3a8c2c11f9bd..f6fea9085aab 100644
--- a/Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml
+++ b/Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml
@@ -12,7 +12,7 @@ maintainers:
 
 allOf:
   - $ref: panel-common.yaml#
-  - $ref: /schemas/display/lvds.yaml/#
+  - $ref: /schemas/display/lvds.yaml#
 
 select:
   properties:
diff --git a/Documentation/devicetree/bindings/display/panel/innolux,ee101ia-01d.yaml b/Documentation/devicetree/bindings/display/panel/innolux,ee101ia-01d.yaml
index 566e11f6bfc0..ab6b7be88341 100644
--- a/Documentation/devicetree/bindings/display/panel/innolux,ee101ia-01d.yaml
+++ b/Documentation/devicetree/bindings/display/panel/innolux,ee101ia-01d.yaml
@@ -12,7 +12,7 @@ maintainers:
 
 allOf:
   - $ref: panel-common.yaml#
-  - $ref: /schemas/display/lvds.yaml/#
+  - $ref: /schemas/display/lvds.yaml#
 
 select:
   properties:
diff --git a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml
index 5cf3c588f46d..3623ffa6518d 100644
--- a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml
+++ b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml
@@ -12,7 +12,7 @@ maintainers:
 
 allOf:
   - $ref: panel-common.yaml#
-  - $ref: /schemas/display/lvds.yaml/#
+  - $ref: /schemas/display/lvds.yaml#
 
 select:
   properties:
diff --git a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa121td01.yaml b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa121td01.yaml
index 54750cc5440d..37f01d847aac 100644
--- a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa121td01.yaml
+++ b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa121td01.yaml
@@ -12,7 +12,7 @@ maintainers:
 
 allOf:
   - $ref: panel-common.yaml#
-  - $ref: /schemas/display/lvds.yaml/#
+  - $ref: /schemas/display/lvds.yaml#
 
 select:
   properties:
diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
index c77ee034310a..929fe046d1e7 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
@@ -12,7 +12,7 @@ maintainers:
 
 allOf:
   - $ref: panel-common.yaml#
-  - $ref: /schemas/display/lvds.yaml/#
+  - $ref: /schemas/display/lvds.yaml#
 
 select:
   properties:
diff --git a/Documentation/devicetree/bindings/display/panel/sgd,gktw70sdae4se.yaml b/Documentation/devicetree/bindings/display/panel/sgd,gktw70sdae4se.yaml
index 2e75e3738ff0..e32d9188a3e0 100644
--- a/Documentation/devicetree/bindings/display/panel/sgd,gktw70sdae4se.yaml
+++ b/Documentation/devicetree/bindings/display/panel/sgd,gktw70sdae4se.yaml
@@ -12,7 +12,7 @@ maintainers:
 
 allOf:
   - $ref: panel-common.yaml#
-  - $ref: /schemas/display/lvds.yaml/#
+  - $ref: /schemas/display/lvds.yaml#
 
 select:
   properties:
-- 
2.39.2

