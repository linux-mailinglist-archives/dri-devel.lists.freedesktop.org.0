Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B97FB46F48
	for <lists+dri-devel@lfdr.de>; Sat,  6 Sep 2025 15:54:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 830F310E387;
	Sat,  6 Sep 2025 13:54:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Mn1ZYVCa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6A6310E36B
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Sep 2025 13:54:22 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-55f7ad815ceso3350137e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Sep 2025 06:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757166861; x=1757771661; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2IxAZoNFqRXhhMhpvmVHUSqaQIDxBjYcwMBDTUotPdE=;
 b=Mn1ZYVCa+n6i+FZiZZfJ6lr0CYD6LRGdOXuTKDCecKjvuijZ4iwgsLqWdfVllxStec
 wbsH4VAvycuqMJD0SLCo2Y5zyu6h5UiK8Z+CynJuLySTSXHa+EpFIe2QfhYDt9qs9YTh
 bNcU4zhEDVYeTizc3VbHSqywM0425bMhVJvCHKctcL4ZM+2KtzBobcPdcO5wHKY8GF/i
 x6Ogd/U6Lpz/eRZxI58MLMLuI+2ParvCKkeVnI98dFm2RmCES06pmRxzWe9XV24K4deZ
 fUmsX7M+IT/hgl3Gc6OStkbnLbGADrYetqZvpVaF8O804qdZTlJiNlSKc1iEAPWqX0kZ
 VWLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757166861; x=1757771661;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2IxAZoNFqRXhhMhpvmVHUSqaQIDxBjYcwMBDTUotPdE=;
 b=Ee+M3zZhqD9Efy5s2e9l/BPvyMFD5AcujaPfYCOrorbwawsOVKxlHMD9qIIeCy//F5
 ugf19WTResDvr3i71A6LAiK2G5juYPc5igP9Hze/rg1AARhRRTafxD5jDVGHnzI00vLi
 hdRBZiV4MONRx4xYcuz0W5iIazEY+nhpIXYt1fP8NTdSR9xyl9X9q5zcw17ZpnxZDUeR
 JfseMp5vgGEFsT+kwuGIDlwd4EamR8/rgiAhYZwnFT2E9sp0lRvELZI2FSmo/DEsEXcb
 t/Tn53GYC+tIA8kpu+CSs+7gwJsJum00QGfLsclQTsb+0V7qj57q8LE5uUj2wD3lGlh7
 ji8A==
X-Gm-Message-State: AOJu0YzcQDdw9+CcWMRoIgqkwq6BwO75WMZkf/30lLsirxo1ERjJLACS
 Vquw4IbULkQtJigvEgPyrJI9HoKvMQyWEnz3gsC0mQOl1NnoxCyX4QR3
X-Gm-Gg: ASbGncvklS1PdPqECdE1QAXeuknOMsmg2EekD/ZU83Ym86uO9tfiCj4UWnNqRFvTt6d
 iYC58+ioB5njtG0qzTVM/LE6CJG+egwTLay3zK8cj0oUErFQDFPwRkOr9/XNSVe1q1XoR75hmiH
 06oCVsVrC2FSpSJ9V5sMvhcA8Bs0bBtEq/RovahgHa8vQTBItbN/BEiZS7GbsQl279C7wqEKO6x
 CVMzqKFHy/OSq23CcyD0ZjlB4CtwxVcgSavMvWyetlfESfPL1sA2Z/4RuF82J64ae4Y8EM3eSBP
 6LSBlClWujnxaO6AbpKiN3AB+UPvn16VAsxMZcYg9F1PPOFioKsxblhp+bUs2OJYV+0ug3eIn7i
 6R1JQx/IP+Nf7Pg==
X-Google-Smtp-Source: AGHT+IHrlNGovAefOUdofD05VkXnyiP4PSuVmL1cFj3ZUmCUQ6U8TDmFSCBGRpnbBAUWYquvhaaN4g==
X-Received: by 2002:a05:6512:39c3:b0:55f:6a5e:36a6 with SMTP id
 2adb3069b0e04-5625ffc7e17mr829513e87.17.1757166860926; 
 Sat, 06 Sep 2025 06:54:20 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608ace9c65sm2357467e87.85.2025.09.06.06.54.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Sep 2025 06:54:20 -0700 (PDT)
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
Subject: [PATCH v2 12/23] dt-bindings: display: tegra: move
 avdd-dsi-csi-supply from VI to CSI
Date: Sat,  6 Sep 2025 16:53:33 +0300
Message-ID: <20250906135345.241229-13-clamor95@gmail.com>
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

The avdd-dsi-csi-supply is CSI power supply, it has nothing to do with VI,
like same supply is used with DSI and has nothing to do with DC. Move it
to correct place.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml   | 3 ---
 .../devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
index dd67d4162884..bb138277d5e8 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
@@ -75,9 +75,6 @@ properties:
   ranges:
     maxItems: 1
 
-  avdd-dsi-csi-supply:
-    description: DSI/CSI power supply. Must supply 1.2 V.
-
   vip:
     $ref: /schemas/display/tegra/nvidia,tegra20-vip.yaml
 
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml
index fa07a40d1004..37f6129c9c92 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml
@@ -37,6 +37,9 @@ properties:
       - const: cile
       - const: csi_tpg
 
+  avdd-dsi-csi-supply:
+    description: DSI/CSI power supply. Must supply 1.2 V.
+
   power-domains:
     maxItems: 1
 
-- 
2.48.1

