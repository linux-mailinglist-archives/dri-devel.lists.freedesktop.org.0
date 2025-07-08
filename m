Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D829DAFC85E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 12:27:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 250D610E5E6;
	Tue,  8 Jul 2025 10:27:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iXuHEgMi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A53E710E1AA
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 10:07:00 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-b31d489a76dso3409917a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jul 2025 03:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751969220; x=1752574020; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fVDZwMbI3MaZsqcDOMuRideVCsmXg1PFZTHplOr/W9w=;
 b=iXuHEgMiWt+9KmIzQuvVjmDR555Uei1aFx4vWy5nYvqFyWMKZFq6RH0sudHYDnMwPe
 awloFyq09rQhqUfRC5q7xafEIf0fuXBsuBScVX5T+Os2L1sCjjbSK1t6nuPFGchZetl9
 gcbp+soINVRvrKi2k670sugROOcddoUFRdUUyD5oGRzifLjdJiGIekTaP4c1isexqMoK
 aSKfEnmpx6z3gg1LOR7icNFvBue43l5UL05++FUkSy7o4DKqSh3n/I6dSmVGOiRIKJXJ
 hIDqeZxHOvX6WHR3fXRDcjM0DKaT5UEeWieP0eqWij6R9SxSPSgiN9GjeonI9co8pLB8
 4gOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751969220; x=1752574020;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fVDZwMbI3MaZsqcDOMuRideVCsmXg1PFZTHplOr/W9w=;
 b=cV+Ktq9KVmuSv6xug+XICiKdJuPHzVEte0JFo9meger0wK+if0ls9qmNmv83Mb5xqy
 ZaYx/DAUOeqmWv4HOc/l92LNLIg8bb18aAwVJy9HW67tTYzTpAOaSN8NWVUpUpjLRTPO
 VZ3CNIzUmqqQUfNHPkadxcOsAwirYdaHhoiYLRW1v91IvP3CzKXuGQxq4ix8ifIDAvac
 juh3ATjjNOS+dC4jAMdXbLCMUkZyenKSk9bFPb5fRwVmQYM3qw/RUAx/hTbacSvbx7sE
 lM7Ik9yIMgOwAyjVvwFHDHCwUfDxKg1oSaYjzjJX6GRpqcwW9v7z9gsdgkRrgTK14D4m
 T0Iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqmThNZoknBoVLXpEa6VCO1PE2nr7WACGWgDIj4C5Qeu/VXMsHx4TsOscgrFAJ0bIHSV/Mhah1rqs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxudnUdgAdI6d35gtUe1VBP9YMFmgkGGFSEXjGiI27mVMEaUT49
 Nzek7GmGmbERyuNtkl9h/Jk1OyOn4eRAPxN0SFgqBP8zv8/MozPKSoqM
X-Gm-Gg: ASbGncsEybF9Be6Ntmv1xcounujgK/atVZr/fv8FKeeRcdRVWla10aWhGlQae1cmltP
 Qu8JVTs7IIacXNS5UJ/HYesotrm6TlPXONekk5L9Ybq5WzNaGIKcPFgGS+AgyYnwQHS6szY5Gh+
 HxrdmlxzI4UMcAP+OO+nb7MXTid8BTcJ+5T1kgwPapMOpuc1jV+iEx5763sPvZhsQQ3+TMdy8ep
 0Lr6SYthMq9rioVyKXgS0xS0kg1iwa8xMoDBlUk2V0gglmUbXfhheWQiWwz/lC9UZP6uzcuV2f3
 L/Aw361Ix7PzBLQgjaB5bBh6nEALUKyDqUhRKerkLrFwfMyfKF7aFzTHQVInfK16lkCYB9v3YJt
 pC0ehAEGdxMiLzBU=
X-Google-Smtp-Source: AGHT+IF5IEEWA6P5DDZbTNTa4RdtlbgzI1iI+TTgS3Fon36qdFB1AdrHk/f2Cb401XdKTWTaFrqLUw==
X-Received: by 2002:a05:6a21:7a44:b0:220:10e5:825d with SMTP id
 adf61e73a8af0-22608fbba67mr24621523637.8.1751969220107; 
 Tue, 08 Jul 2025 03:07:00 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74ce359ecd6sm11971174b3a.24.2025.07.08.03.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jul 2025 03:06:59 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Tue, 08 Jul 2025 18:06:46 +0800
Subject: [PATCH 3/3] dt-bindings: display: Add Mayqueen Pixpaper e-ink
 panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-drm-v1-3-45055fdadc8a@gmail.com>
References: <20250708-drm-v1-0-45055fdadc8a@gmail.com>
In-Reply-To: <20250708-drm-v1-0-45055fdadc8a@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Wig Cheng <onlywig@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, LiangCheng Wang <zaq14760@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751969205; l=2111;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=e/Pd6vA+VmaF2zukYk9DBDpw0E2bjx0yWVQX/BqXoL4=;
 b=P5GfjvHLmmcmbgI2dFTUjdqZ0y/W6BouIch2ERcYaoYs/FheTOD13/2l73i/QtsOg1LUKzrJ6
 4rpICTvKNnLDDbZRfZoin3nmzabD5/ZtFPs7wf6Zde1OAS6Yr6Xq8cR
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=5IaLhzvMqasgGPT47dsa8HEpfb0/Dv2BZC0TzSLj6E0=
X-Mailman-Approved-At: Tue, 08 Jul 2025 10:27:44 +0000
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

The binding is for the Mayqueen Pixpaper e-ink display panel,
controlled via an SPI interface.

Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
---
 .../bindings/display/mayqueen,pixpaper.yaml        | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mayqueen,pixpaper.yaml b/Documentation/devicetree/bindings/display/mayqueen,pixpaper.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..cd27f8ba5ae1d94660818525b5fa71db98c8acb7
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mayqueen,pixpaper.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mayqueen,pixpaper.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mayqueen Pixpaper e-ink display panel
+
+maintainers:
+  - LiangCheng Wang <zaq14760@gmail.com>
+
+description:
+  The Pixpaper is an e-ink display panel controlled via an SPI interface.
+  The panel has a resolution of 122x250 pixels and requires GPIO pins for
+  reset, busy, and data/command control.
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    const: mayqueen,pixpaper
+
+  reg:
+    maxItems: 1
+
+  spi-max-frequency:
+    maximum: 1000000
+    default: 1000000
+
+  reset-gpios:
+    maxItems: 1
+
+  busy-gpios:
+    maxItems: 1
+
+  dc-gpios:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - busy-gpios
+  - dc-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        display@0 {
+            compatible = "mayqueen,pixpaper";
+            reg = <0>;
+            spi-max-frequency = <1000000>;
+            reset-gpios = <&gpio1 17 GPIO_ACTIVE_HIGH>;
+            busy-gpios = <&gpio1 18 GPIO_ACTIVE_HIGH>;
+            dc-gpios = <&gpio1 19 GPIO_ACTIVE_HIGH>;
+        };
+    };

-- 
2.34.1

