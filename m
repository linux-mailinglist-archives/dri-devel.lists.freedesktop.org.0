Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C230E8121D1
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 23:42:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 376F510E84C;
	Wed, 13 Dec 2023 22:42:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A18B10E84C
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 22:42:20 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id
 46e09a7af769-6da2e360861so11358a34.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 14:42:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702507339; x=1703112139;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7K59ooZxYuShhkvJvLN2CDgTZo+xPppYuqKw2W9W670=;
 b=PKqcBFGhSeE1yhoRJI4ckmscaojNSWnKHYHYPjp6w8ZMNgiF09Cc8c9KKL+T+LwqLb
 NrN8SGWuLuzI1KCsCxrq9MWvEO45nrNhg+AxglBjP0bMkmiTFokS9mjwssUdc/0SZo71
 +6QLDF6iENZ/WEeE5/SvK+5YJaBfTm4qp8U3kBGMXiDcahfIUMDtvjG7FrUotu/SsBAa
 SNYxnln2YJC6JJQIqpZWzZjZtQtb/AgeeGtFtiYmma2fe7hCzwnp7g3/DYHyaK2ZGMWe
 NL97pdGoAtboV+zN1XGXZ6QzwEs4D4Q7IQcLJbK1fI6S+sV72RiifyKYmEDuvLs2os3N
 /Qfw==
X-Gm-Message-State: AOJu0YwlWbbcvMzTuvtQ3VO2c8oBDcmwBClu1rAA6h1e1f1X8XSavBd9
 pscYuro4PFrcEjw88Cx7xQ==
X-Google-Smtp-Source: AGHT+IHA7v1ulJzaKFeMR6eraq3R1cvHVp0vITLPnmA4eQUScOFCp8FpxEiaB/KLNBmQMGs6sL2urQ==
X-Received: by 2002:a05:6830:84e:b0:6d9:dac7:8703 with SMTP id
 g14-20020a056830084e00b006d9dac78703mr4444660ott.26.1702507339248; 
 Wed, 13 Dec 2023 14:42:19 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 m19-20020a0568301e7300b006b9cc67386fsm2958534otr.66.2023.12.13.14.42.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Dec 2023 14:42:18 -0800 (PST)
Received: (nullmailer pid 2191688 invoked by uid 1000);
 Wed, 13 Dec 2023 22:42:17 -0000
From: Rob Herring <robh@kernel.org>
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH] dt-bindings: display: samsung,exynos-mixer: Fix 'regs' typo
Date: Wed, 13 Dec 2023 16:42:01 -0600
Message-ID: <20231213224201.2191358-1-robh@kernel.org>
X-Mailer: git-send-email 2.43.0
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The correct property name is 'reg' not 'regs'.

Fixes: 68e89bb36d58 ("dt-bindings: display: samsung,exynos-mixer: convert to dtschema")
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../bindings/display/samsung/samsung,exynos-mixer.yaml      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/samsung/samsung,exynos-mixer.yaml b/Documentation/devicetree/bindings/display/samsung/samsung,exynos-mixer.yaml
index 25d53fde92e1..597c9cc6a312 100644
--- a/Documentation/devicetree/bindings/display/samsung/samsung,exynos-mixer.yaml
+++ b/Documentation/devicetree/bindings/display/samsung/samsung,exynos-mixer.yaml
@@ -85,7 +85,7 @@ allOf:
         clocks:
           minItems: 6
           maxItems: 6
-        regs:
+        reg:
           minItems: 2
           maxItems: 2
 
@@ -99,7 +99,7 @@ allOf:
         clocks:
           minItems: 4
           maxItems: 4
-        regs:
+        reg:
           minItems: 2
           maxItems: 2
 
@@ -116,7 +116,7 @@ allOf:
         clocks:
           minItems: 3
           maxItems: 3
-        regs:
+        reg:
           minItems: 1
           maxItems: 1
 
-- 
2.43.0

