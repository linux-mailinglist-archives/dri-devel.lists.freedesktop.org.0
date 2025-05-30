Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3638AC941B
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 18:59:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BC0410E853;
	Fri, 30 May 2025 16:59:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ScD6pNLy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF27A10E839
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 16:59:14 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-450cf2291bbso9803025e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 09:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748624352; x=1749229152; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J29EcBVuIttsOHLv7IujYOeDwvkRN/jk5j1fyQfRryc=;
 b=ScD6pNLyqv2XoxDTO6BDYu16lxEHTR1i4Q8mKhSM7G+cZyTaU/D5BZwRkTwpNuSE65
 ZpguZ/NYM8fBqwCnUD6iSSh7Kyu/BYy6l0lRkXvSrKb7N6DkShWrFEb0maOEGjc6w85X
 poQcP7+ylh3mD1DdUGi5fC2CJnJnX1AnixdEPmhCONg71tel8ch6ROi7ZCLAQU0SBwba
 fs7BmKZCngS24e2bb7cxEpHH2+TGZMNaCQa4bC9Y8IktWRzNy6MiKiQIWXhdBIuokl04
 8n9yt1k8BGdf7Vvsi2Przx69GDLGLaAua/kw2UytCa+UB2/FQtWb055vHsJ47RsEt+mG
 1ulA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748624352; x=1749229152;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J29EcBVuIttsOHLv7IujYOeDwvkRN/jk5j1fyQfRryc=;
 b=xDMdGd+FvB3wT7ktb6aHqI63N+I+YwzVeUSD8fsamV+a+QFBmH29ee6ruq5Ue8JiL6
 4QuhpiQ26pjS6Rgxxbku5iP9trwCMWB+oz92t0NgiFWlIybkM0HEajuyC8/0TX1wAiEC
 6em0fDGPNKka+kUkgsgLjv062ov4lrwwTQRq5u17y6VNmVtN8FzzlGy+yEzQnAWcsiXh
 VdQiVFbKOu5o95DoZQlCKtSoHGiaL0rDkM4FK+N7kEQQCBtcooVToTe5j1p4Km9WkzRf
 XCsmm+2qmL4IRno8SItfnJ/3GzS7jtTNASyqgoTzghjS29lY+hNEexWzVMrXkiD10tTQ
 TGhA==
X-Gm-Message-State: AOJu0Yx+GI1p07TQwGUmkxuVvBwHCLBJ4jbbF8BtJQnkHPLFU++fYi35
 j7NgV/MLn3BjmNTpzrn2TOaGE6JR9DK36wkWpUzfAEsTUXDKdkckjgTf
X-Gm-Gg: ASbGncvXCRJcpCcO/rtEO9bBFalixtXtXoGdWkf56ZakfTt0AOV8Ylghh+CeUCFIHcF
 RlB+gFzwr/wKOauVmT+xvyLAmItUnMGrMJNBRTgODGZfE/Gn3riRQSULC8Lckq/SZUmTi9/Fi8E
 NSxO20S6dHGm4RjOnJqs8TNuduBK0HJmfVOEeAnEQRAZbzUpJg0kyJ5zxr20tYfj24cnYF6SXl+
 4rN8BkrDym09U+todGRr3h8qopAavDgqinId+L5AGkcIbOxaiTMSuD2p28Oq8ZlatK5ITbAjTHx
 ow1xxupxMsrBzrWTvmIMlPa3AwDuA1CMx8eECNfLRX/A0z/051pHI5sGI9+GdWjGvlsRX7/KAOz
 BoCjgLpk4nzDzNReTPynr
X-Google-Smtp-Source: AGHT+IEgb3nbN0iVIeen/LbG4sknJalruo4HyGCevDz1eygcOvfBWGBMSq4X1ts+nPwvfRFkUIK59Q==
X-Received: by 2002:a05:600c:3b9c:b0:450:cd25:e69c with SMTP id
 5b1f17b1804b1-450d6550c5dmr33841175e9.21.1748624352173; 
 Fri, 30 May 2025 09:59:12 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:bcab:7ec7:2377:13b0])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-450d7f9efa3sm22733455e9.9.2025.05.30.09.59.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 09:59:11 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 01/12] dt-bindings: display: renesas,
 rzg2l-du: Add support for RZ/V2H(P) SoC
Date: Fri, 30 May 2025 17:58:55 +0100
Message-ID: <20250530165906.411144-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530165906.411144-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250530165906.411144-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The DU block on the RZ/V2H(P) SoC is identical to the one found on the
RZ/G2L SoC. However, it only supports the DSI interface, whereas the
RZ/G2L supports both DSI and DPI interfaces.

Due to this difference, a SoC-specific compatible string
'renesas,r9a09g057-du' is added for the RZ/V2H(P) SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v5->v6:
- Added reviewed tag from Laurent

v4->v5:
- Added reviewed tag from Biju

v3->v4:
- No changes

v2->v3:
- Collected reviewed tag from Krzysztof

v1->v2:
- Kept the sort order for schema validation
- Added  `port@1: false` for RZ/V2H(P) SoC
---
 .../bindings/display/renesas,rzg2l-du.yaml    | 23 ++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
index 95e3d5e74b87..1e32d14b6edb 100644
--- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
+++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
@@ -20,6 +20,7 @@ properties:
       - enum:
           - renesas,r9a07g043u-du # RZ/G2UL
           - renesas,r9a07g044-du # RZ/G2{L,LC}
+          - renesas,r9a09g057-du # RZ/V2H(P)
       - items:
           - enum:
               - renesas,r9a07g054-du    # RZ/V2L
@@ -101,7 +102,12 @@ allOf:
 
           required:
             - port@0
-    else:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a07g044-du
+    then:
       properties:
         ports:
           properties:
@@ -113,6 +119,21 @@ allOf:
           required:
             - port@0
             - port@1
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g057-du
+    then:
+      properties:
+        ports:
+          properties:
+            port@0:
+              description: DSI
+            port@1: false
+
+          required:
+            - port@0
 
 examples:
   # RZ/G2L DU
-- 
2.49.0

