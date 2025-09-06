Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8279B46F2F
	for <lists+dri-devel@lfdr.de>; Sat,  6 Sep 2025 15:54:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18BA710E37B;
	Sat,  6 Sep 2025 13:54:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="c+Mc5ck1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F2AC10E374
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Sep 2025 13:54:10 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-56088927dcbso3747541e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Sep 2025 06:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757166848; x=1757771648; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c0PXCyJyHficBngfFi8GxW+R2qBl503JjuvrmcgEKW8=;
 b=c+Mc5ck1TVKszv3axmrK2Q5W58cS5gcZ3f8LMf4AUajyw0kgzaC4mD8dJkqFdaepRC
 L73uAxQX4l8R1V5kbUu46Mz/3DNctwRdslQTHiP5rpQIx4jvXWtJ6+woUT0HIlOSl87H
 zcSrDons1wLdVds1Zdf6psgX3J8PuaHnMwKRtCe1c7ueq8BpEyXiTQlsH0l5+cqC41v0
 24ovhAFOvl6cbBFQVLom/vgxxIMHS6pRwUzRqSiI+9izQJjEJkjungeWaslSPq76vxGz
 5ryInZiALmOK4lyJPFdU7twwH1Tf2vplSheY2BrrfXDxpV2o4UUQj9exfN8rh9TVZ8H5
 3oVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757166848; x=1757771648;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c0PXCyJyHficBngfFi8GxW+R2qBl503JjuvrmcgEKW8=;
 b=InU2ILJM+u0kEox7MHXVX0+tQfPUhMHAmy6PNWjrIkIzD23mHidP9uQvikt8A++hEV
 gylbINXC5oK1Bf05Ns1x1iDExhYGHNsDZ/dcopSM33zcg67F2ywy2sm9InKz7oxgjVKT
 wTzwTI4Z/0/Z3o9/JdZ/170vReqpDLECbYo0N0QAk36edU5y9wm63Di/FIFIk/pUnFcu
 kz4LkSg2g8xxXmAM1X3pvsy3IguRn7lp5mHPFmCjDjTMUrQqMTNAw+AFNy1KS5IuEVTM
 xxBYu28P3Bt4SiCCAuyHl1vq69ncvvnMDUZ8+mspEXbcR8MBKut1CpdpW4KPWlTx4INp
 cR9g==
X-Gm-Message-State: AOJu0YxwXPrl8OscwdW5zqEsdDYz6TX3YRXr9fiLVWbfFFgj6eWzHqe5
 u4SKi1/JUtzF/by4fHuUoIJAPetykulbBefEyyUCHgcEFn2h9boWQYVJ
X-Gm-Gg: ASbGnctk4HaRzRKqk8i6YfAilHSxtr9ALMiicH+4wd7FCcdhpaCZ4+qMCaHB9b57Rvo
 8vgGMYKUaGDTFDeWfOizCnoeSCCkTlur+Ql3FNkley8OtkuybfLQuw7SijUbWDUq9GgvRUBTqrV
 P1ZhNJtElMZYTZ1x1TZ4zb3S8I6EjaoTQ08nRJxEOSs5hS0VZNtUQHwTWw+GZFfXtFuxe7Gghe+
 i1Wl7hiqS4bUFog504R/gqZUwtrl7KiwX2wXK8E/hdxumQJQmGb4Ol9EMCmYHLsrSI6kKfcjOOh
 MasX1rDmFR3p91CH2JVYBm+6kKiDfBsIvV9hA3TaD/JPBZNfNfcKuGQAgvDktQJjQ81rarO8rCC
 D8Ao+TAN6t8jEcXd3hUadVuQp
X-Google-Smtp-Source: AGHT+IGbn7aQus8K4ENY1gefrmkJcMV2ebrlkldnJ2Jl75zObKrAtv/f8+dZEvE9G3LK5RCJdlACuQ==
X-Received: by 2002:a05:6512:1404:b0:560:8484:a920 with SMTP id
 2adb3069b0e04-5625ee795f9mr488463e87.2.1757166848427; 
 Sat, 06 Sep 2025 06:54:08 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608ace9c65sm2357467e87.85.2025.09.06.06.54.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Sep 2025 06:54:08 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 =?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
 Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: [PATCH v2 04/23] dt-bindings: display: tegra: document Tegra30 VI and
 VIP
Date: Sat,  6 Sep 2025 16:53:25 +0300
Message-ID: <20250906135345.241229-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250906135345.241229-1-clamor95@gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
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
index 14294edb8d8c..c135f1bd98a9 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
@@ -11,8 +11,13 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - nvidia,tegra20-vip
+    one0f:
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

