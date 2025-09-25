Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C988BA030B
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 17:17:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFC4410E964;
	Thu, 25 Sep 2025 15:17:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JbCR9LmF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53B5710E960
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 15:17:20 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-57edfeaa05aso1155312e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 08:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758813439; x=1759418239; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J0spy4sLoz5G0gz2wiaev4JFU/nZDYKwDr/0mjQIAt8=;
 b=JbCR9LmFyfrtvNHWHV1PV7GC/pg88BRdjiOMAt2IQwIrCwXm1NAHNPyHzhW6Kw6aQR
 uWmw4/A+IDs7ImykTdAOmHqW3XUTcAqZDSmli4Pmimk3XsekRTs33ViI6IeL3nl10yoR
 4pEAvB8/zgHuLhQIxuIplRPKXukK09MXlZO3PUJTBcGUVOSNPyPVCiWYvyRNGYCjR5yD
 qsqBkJW7MghMeciUxtHoL04NravN1YBJmiTRhCj0Pr24pduBQtD9FuXRWRGWr6a59MMo
 5nOh/3Wn4cgv8JdXgVVdYS8+EXtePmONrmxarlTaHongY2jt10B97eZarwwzdqoWK/ny
 uftA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758813439; x=1759418239;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J0spy4sLoz5G0gz2wiaev4JFU/nZDYKwDr/0mjQIAt8=;
 b=sWFDatXXLHQWB2ODTBxAvkM/KuTRGmmhisQiN23VkyXpvwBhGDcV0mY8+jKjbwXa7B
 4Z4oKkIwN44w5bRYC3/c/VgXMKXHgxkUjpQRcgeWKrwx07n6d/0V5ZGXFSbvwK8WiG+L
 HknPBGavCcUfKW1logstlTGSoEZYl9N+vvBBuisSd8tUmgKknh+Lh985CbfZgRuaf5u1
 sSFknPoZ9ZVKGNqi2o2tCMZ7vmX4kB0m8NHJ2GOPmBp6Hn6kpo8dzGUuiGqfFUAN1zUQ
 j47r45NCvsXtl51+/JTL348uyAE6apNrIJAgHR1+H2x4dHn3enNyIvp8zOOdzprODRif
 Ja4A==
X-Gm-Message-State: AOJu0YzJG2TRkI9HgcDYIBWii/rakc1fujZ1BmGuiDD78fvFWnxpTWrC
 yljPdDtRelGAQa0SI5di49JBzcQsSz1i0D4FqKusf11UeKOQfdAhO9i7
X-Gm-Gg: ASbGncvo1ypXbu5Z0gMElsxF/YLRykXgIQXarrCjRvVMUkNR7TX0BjoGYV3EGJBiiXq
 Ia6hh71kRS3HTU5A8KJguxQoj/ABzT85wkhXZFAbhHPUX9euzPKcLmUF4a91Pm0zErD+RnZTmu/
 n1eSEa2XxInvXJXj4ezPTe5dngEq4Tmnrlr6tEKnq2vVH7kdBakZtKbnmhXAnFOYTeD2Qax3BRN
 T75a6zxUqMV1AbckvVkVfweouPLzWVNIkJuH5ept+WqDdCGLW1qSJlput2IKbz3V663FGb8Bfct
 NmSxC58gzlOUY/mAY64y+6tQ8jx5xfE37qavSGRfkwiKjBJeIU6w5i4rbzLdp1q/lhPCgyaeQ0c
 Ah+niyYLmAKVIfQ==
X-Google-Smtp-Source: AGHT+IGqaK5Z05hEk75mGW8qDiu630uMdDhjqt6kFcIL4trP2Pfk6uAyKaszBGaqiiXlJzv0dGCm8w==
X-Received: by 2002:a05:6512:104a:b0:57b:8675:e35b with SMTP id
 2adb3069b0e04-582d073f694mr1192520e87.5.1758813438490; 
 Thu, 25 Sep 2025 08:17:18 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58313430496sm870084e87.27.2025.09.25.08.17.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 08:17:18 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 =?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
 Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Aaron Kling <webgeek1234@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH v3 04/22] dt-bindings: display: tegra: document Tegra30 VI and
 VIP
Date: Thu, 25 Sep 2025 18:16:30 +0300
Message-ID: <20250925151648.79510-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250925151648.79510-1-clamor95@gmail.com>
References: <20250925151648.79510-1-clamor95@gmail.com>
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

Existing Parallel VI interface schema for Tegra20 is fully compatible with
Tegra30; hence, lets reuse it by setting fallback for Tegra30.

Adjust existing VI schema to reflect that Tegra20 VI is compatible with
Tegra30 by setting a fallback for Tegra30. Additionally, switch to using
an enum instead of list of const.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/tegra/nvidia,tegra20-vi.yaml      | 19 ++++++++++++-------
 .../display/tegra/nvidia,tegra20-vip.yaml     |  9 +++++++--
 2 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
index 2181855a0920..dd67d4162884 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
@@ -16,16 +16,21 @@ properties:
 
   compatible:
     oneOf:
-      - const: nvidia,tegra20-vi
-      - const: nvidia,tegra30-vi
-      - const: nvidia,tegra114-vi
-      - const: nvidia,tegra124-vi
+      - enum:
+          - nvidia,tegra20-vi
+          - nvidia,tegra114-vi
+          - nvidia,tegra124-vi
+          - nvidia,tegra210-vi
+          - nvidia,tegra186-vi
+          - nvidia,tegra194-vi
+
+      - items:
+          - const: nvidia,tegra30-vi
+          - const: nvidia,tegra20-vi
+
       - items:
           - const: nvidia,tegra132-vi
           - const: nvidia,tegra124-vi
-      - const: nvidia,tegra210-vi
-      - const: nvidia,tegra186-vi
-      - const: nvidia,tegra194-vi
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
index 14294edb8d8c..9104a36e16d9 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
@@ -11,8 +11,13 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - nvidia,tegra20-vip
+    oneOf:
+      - enum:
+          - nvidia,tegra20-vip
+
+      - items:
+          - const: nvidia,tegra30-vip
+          - const: nvidia,tegra20-vip
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
-- 
2.48.1

