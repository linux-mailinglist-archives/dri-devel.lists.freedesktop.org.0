Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7937727F0
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 16:36:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 710DD10E2A5;
	Mon,  7 Aug 2023 14:36:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8237710E29D
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 14:35:36 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-99cce6f7de2so226374166b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Aug 2023 07:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691418935; x=1692023735;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=asTM4rKFSzp+icJaUkDK1RLj/Utx4x2PWtAP4aO5Afg=;
 b=hoJl9W9qSFU+nbBgkpjrBd7pg3z2yqFs/Sgdljv3EEXWkXxBFMd9YqhpbR1K/+gbtT
 mFsK0CopCClhN2AaPqDAp+ZjOOsIEca6KuBq8qZIh/b+wSD8UT857URmRODNU1Nja+T2
 fIa5zlxYOk30k7EizulVFt+7ZU/kJryvT54jOlPWZnHAmN1tkLRsOE7s32Egk4ZwCorV
 FX54PCIMZeoD57Y1zpd4LnKbhqTH0gR2RHCSVDoN5q+4JbbxxkdxKwCrnhQHfcsc9Ryo
 ihfkVPkgJfUNECsilJHguDxAvt69YfWaCX80fsuam6SIyIBs0N3OYIPC91Vfhlax1UlX
 NUXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691418935; x=1692023735;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=asTM4rKFSzp+icJaUkDK1RLj/Utx4x2PWtAP4aO5Afg=;
 b=esciTGK3hnSzKylO5dlTwfQC6ydw6t0ywl2CtNbvC3A5oSDjBrugQN4DepspHztORg
 0BKpjM/iZZSqIQikQFbk4aixvb4q93Q/qxNnkrJ1vaatTJEDS2JT83qITeROTDjtHdnL
 qm6UvXEAckhxIRinLyCaodtjNFvJi7MOgxxjFwpjvyhnXewvHeZOCDscb9u7kScGblPg
 fLiG3nAjrdgZaDsPlccFj+RHjRKtkZF40wbOdoj1Tow5T0waUh3YpgjakJe95IvUR3zk
 5GJ75Q2nT5FK1U/2Wh7+rqqHIe5Bysj4YWCO7lqqzG1Y8cXRVxUWJkbasykHt2DUSCUY
 JcWA==
X-Gm-Message-State: AOJu0YwI4trqCs9/PM3T75JQFiLtzaPkpEofouRhvMDqia6x5nKcx8SY
 6ScePo3rhSccRkIbuRHj9BU=
X-Google-Smtp-Source: AGHT+IEnSoGoSBbAkGwZZ6QVhfXEkQngtjQdyaY+wAvqyNycQ2LNqaPQeBes0NVHHROa9A2oaaJDUQ==
X-Received: by 2002:a17:906:76d4:b0:99c:75f7:19c1 with SMTP id
 q20-20020a17090676d400b0099c75f719c1mr7516516ejn.39.1691418934744; 
 Mon, 07 Aug 2023 07:35:34 -0700 (PDT)
Received: from xeon.. ([188.163.112.48]) by smtp.gmail.com with ESMTPSA id
 e3-20020a170906504300b0099329b3ab67sm5323292ejk.71.2023.08.07.07.35.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 07:35:34 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Maxim Schwalm <maxim.schwalm@gmail.com>, Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v3 3/5] dt-bindings: display: tegra: nvidia,
 tegra20-hdmi: Add HDMI output port node
Date: Mon,  7 Aug 2023 17:35:13 +0300
Message-Id: <20230807143515.7882-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230807143515.7882-1-clamor95@gmail.com>
References: <20230807143515.7882-1-clamor95@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maxim Schwalm <maxim.schwalm@gmail.com>

Either this node, which is optional, or the nvidia,panel property can be
present.

Signed-off-by: Maxim Schwalm <maxim.schwalm@gmail.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/tegra/nvidia,tegra20-hdmi.yaml    | 32 +++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hdmi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hdmi.yaml
index f77197e4869f..f8292551b9c8 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-hdmi.yaml
@@ -82,9 +82,39 @@ properties:
     description: phandle of a display panel
     $ref: /schemas/types.yaml#/definitions/phandle
 
+  port:
+    description: HDMI output port
+    $ref: /schemas/graph.yaml#/properties/port
+
   "#sound-dai-cells":
     const: 0
 
+anyOf:
+  - if:
+      not:
+        properties:
+          nvidia,panel: false
+    then:
+      not:
+        properties:
+          port: true
+  - if:
+      not:
+        properties:
+          port: false
+    then:
+      not:
+        properties:
+          nvidia,panel: true
+
+if:
+  properties:
+    port: false
+then:
+  required:
+    - nvidia,ddc-i2c-bus
+    - nvidia,hpd-gpio
+
 additionalProperties: false
 
 required:
@@ -97,8 +127,6 @@ required:
   - reset-names
   - pll-supply
   - vdd-supply
-  - nvidia,ddc-i2c-bus
-  - nvidia,hpd-gpio
 
 examples:
   - |
-- 
2.39.2

