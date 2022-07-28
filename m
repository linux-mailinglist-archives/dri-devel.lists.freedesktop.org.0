Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 289C95836F6
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 04:36:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAFF110F05B;
	Thu, 28 Jul 2022 02:36:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77B0BC84A7
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 02:36:30 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id s206so437807pgs.3
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 19:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W6PqjvUfdXE1hrn9zx8bHU/TCdCT/CsB8mmw94/JhKM=;
 b=Lm4HW/pnGCR2dZaVRuQk1dOrOSAzbaiC3bTwZINTIfMWL6zlJRi7tqPe+TJ03s/HpT
 ReBy89/q9Yvap0VFR7mfSRx05HXX+sD+CIi8wTTX0ZE9jrxN6VG95MFHFJn4UQgsFxZ9
 qXAwstgFXokyHQku2ZponVYYIloPfy2JjlKhaFet6IU6NuV7dPj6FKT71VD7mdhdrm20
 /e7BiG8tD+WF/69ldSie9lePl2BTMrac5fgp/zb9PG3HpfdCKBhQG/0YGjzImYBJOHvh
 HSI8J3SjmR74QeQIQJ8iaYbfdiUdGCQUtza7b+xvchRVk7s5ozVp/LcUikxvm3r+FUUm
 n8lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W6PqjvUfdXE1hrn9zx8bHU/TCdCT/CsB8mmw94/JhKM=;
 b=YTFBu619tTVtug4SiYnjrO+ELDQwYk6aUjeR+0ziPBnYf31Ht8vSv3Hz2AAu+0a0wu
 FKWgD49xQcXHdseQpstsN623UjANFuY4EtKVGTgln7V5FOWEBYDVFrRbHxDHoxtqsTkU
 jGMBMVnJ44fp/LnZavjFBXueebut8I3G4rY5QS9qBEIbpM2GiaHAb+0livMCJ3aGiKIR
 kY2QBmifaeSs+aM9YqdfiihLrsk02dcaePhDnYemOjxm2oJaiYkaAJ/Fo56LGlGofYvY
 /5Xqh2zkNpHY0/pQG0068YXz1z7hcJrdkTxbElVe1Jma7clQyOtytG39qikwlL+8ozRC
 yvKw==
X-Gm-Message-State: AJIora/jCVcITmgEiRnDLHJ0kYM8Ie3EjlYHrAAVche9EL1iQ8WLhIk3
 5MA+LaL5V/NesdFnmhZDM2w=
X-Google-Smtp-Source: AGRyM1uoTd7vgZLP+jNu7RpFAjD3RlQLiUPIegjHCHHveEpqVD0QIUiXsI71MlB8LtSmPoMc8cJlvg==
X-Received: by 2002:a65:6b89:0:b0:41a:69b1:8674 with SMTP id
 d9-20020a656b89000000b0041a69b18674mr21195388pgw.417.1658975789956; 
 Wed, 27 Jul 2022 19:36:29 -0700 (PDT)
Received: from localhost.localdomain ([112.0.190.165])
 by smtp.gmail.com with ESMTPSA id
 v12-20020aa799cc000000b00528c149fe97sm14631311pfi.89.2022.07.27.19.36.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 19:36:29 -0700 (PDT)
From: Molly Sophia <mollysophia379@gmail.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: display: panel: Add Novatek NT35596S
 panel bindings
Date: Thu, 28 Jul 2022 10:35:54 +0800
Message-Id: <20220728023555.8952-2-mollysophia379@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728023555.8952-1-mollysophia379@gmail.com>
References: <20220728023555.8952-1-mollysophia379@gmail.com>
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
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Molly Sophia <mollysophia379@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add documentation for "novatek,nt35596s" panel.

Changes in v4:
- Correct numeric order of the items.

Changes in v3:
- Embed the documentation into existing one (novatek,nt36672a).

Signed-off-by: Molly Sophia <mollysophia379@gmail.com>
---
 .../display/panel/novatek,nt36672a.yaml       | 20 ++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
index 563766d283f6..d21a4a87a9d8 100644
--- a/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
@@ -20,14 +20,20 @@ allOf:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - tianma,fhd-video
-      - const: novatek,nt36672a
+    oneOf:
+      - items:
+          - enum:
+              - jdi,fhd-nt35596s
+          - const: novatek,nt35596s
+
+      - items:
+          - enum:
+              - tianma,fhd-video
+          - const: novatek,nt36672a
+
     description: This indicates the panel manufacturer of the panel that is
-      in turn using the NT36672A panel driver. This compatible string
-      determines how the NT36672A panel driver is configured for the indicated
-      panel. The novatek,nt36672a compatible shall always be provided as a fallback.
+      in turn using the NT36672A or the NT35596S panel driver. This compatible string
+      determines how the panel driver is configured for the indicated panel.
 
   reset-gpios:
     maxItems: 1
-- 
2.37.1

