Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E9B7F6E82
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 09:41:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 526FA10E7AE;
	Fri, 24 Nov 2023 08:41:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BEB110E7AD
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 08:41:28 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3316ad2bee5so953933f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 00:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700815287; x=1701420087; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pmqHf7vG3OgSbkZDuoqTVPYV9KLNSSDAPn0Rr1mvHIw=;
 b=PNKjOrRUuqikK7MVnG7W3abzPMQ4nUREe6R+Qfo8XZDQVsOHEJYpzA4EJRqnttcC6r
 a68WboEtFcO8mpABvlYAUi6Nv4pfBRM8Etr71u2zOW86KuCWOh7GkxGblrkDeF23ZvDf
 UvHCIGEAKrHFXbcZ+I7YAy3b5W5PI319DfdBuegUtHX5B3XUUkVL9+SEpU+KTrN0nnY6
 5xIjebqA7SHf893a5H55fKMddg1wagfNUke/RIqJ5oiKjuvb4AlXD+pLL0Yy2drE5c6N
 aYIG7O/5pjtMYWoDQeB3kAESXpxSHDKApZwpGG7+3JheS/Wj3nvZKufNDVMc7ifAzCsq
 0UCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700815287; x=1701420087;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pmqHf7vG3OgSbkZDuoqTVPYV9KLNSSDAPn0Rr1mvHIw=;
 b=t+b3UDVfXvNwvtnEy3JEcU/Se95Ueis/5B43lH57I4ASMsk/Iqg1EntWa/h3J2qgTO
 iFj7FAdICy1o5FZEkeWjHgJmPJUpQB2dfD9t5ysJcD8ea5Z5aeFRFzrEvoJx13/C7WyN
 ZhvSD7FYAXqc9z5rYoCRSUvyEHo2PoPp0P5R/KoR8mloYgwO30WYwSLd9iKx/Hb6XL8k
 ALASdg4Bu/bYvgw1Iu8t0FjQAOAGZMekRnQjqk2W7AbJfwcWps+0Yk3s8s4phvZ8sp7R
 aUH6JrK6ys8rEiIBKsQhGCJgph+0hxi5mKdj2jg6TZKPH7ybKV/brduK/3v8yO6ZID4c
 AZRw==
X-Gm-Message-State: AOJu0YwMSB/ocX9FzlpF4GHcUUbMnC2s1GW6jqECBw8D/0J7q1oW51px
 C/mjMgurgQ6BS6IY0yrkjIX6zA==
X-Google-Smtp-Source: AGHT+IFPKfH4bRgwYLSScdIAX4eq/D8aF5dbD0VbyY0HPbjeV7slo9I4RmgXoBTePe/TnCrXi0Gj6g==
X-Received: by 2002:adf:f10d:0:b0:331:6c3b:4f1b with SMTP id
 r13-20020adff10d000000b003316c3b4f1bmr1399602wro.6.1700815286963; 
 Fri, 24 Nov 2023 00:41:26 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a5d4f0b000000b00332e67d6564sm2534562wru.67.2023.11.24.00.41.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 00:41:26 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 24 Nov 2023 09:41:13 +0100
Subject: [PATCH v9 02/12] dt-bindings: soc: amlogic,meson-gx-hhi-sysctrl:
 add example covering meson-axg-hhi-sysctrl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-2-95256ed139e6@linaro.org>
References: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
In-Reply-To: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Remi Pommarel <repk@triplefau.lt>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1847;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=KQGG1ytiHBIC5JgUp3eMPUlMvnricP4K9ae8Hqw91b4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlYGGuRHAkz/o0FoARcM/nBhaSVY4S5HKY2Q4xPPDK
 g0HXtl+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZWBhrgAKCRB33NvayMhJ0SoJD/
 40QaN+xss8YhXmbPd7kcRXbNr00DUi9YXy17gL5d+nQzAJClUpXWM/LHE9EckZTKnrONy8hm8IyTsm
 +Q7v99Ma/k1BhRTuMLsWwfwFdFNoAm7OTDjKTKX3C8XSRZsYU+fUgVCAk9mLi0ILxo3unQMKEakNSO
 dE9rb6fvsHrXEVu4hEJRwGyxCKaj3v/DHp1F3CJPhnYNbdk+GJFAYD9mL6/Rquv7pfpR3IjTM6le/R
 CteRqtCWIuTLlnxJ2PR3bb6vtUGOpsAkWvdE95r40uUkhGJ5c4kZUY26dxnxstVIwWFeG2s7oL8t3S
 ZVlS1l/hLzSrpaeHiYKZfwxv5nccbZ/0qhpFqor44I2oPPA1T3HykRL+qs0mIMrBmmmK6W5gikOwrA
 GZifoZAOOG3AChGpZamhVtFHgvVgLP/SvPLmJamG2uSYLX4M7Wu2blhSuoHw/L2HdKB+d3880wK096
 fdWsEuUVgv8fRo95lxdriQPJb69/AHXgHKL4NQcNFjTNqOJ8YkkAquQwhf/yOaDIcnW3ERUKxybg5+
 2lm/rhZbQ1IYLlYT1bip3o4J/rw6V6TvE6LtKHhjvs31uK1MH2UwobR7GUv+a6sJR+vtVHbwzC+9YM
 iNd8dCd57nIB+Awkk1LFT+YJgUoJCMyAh8AI+tTF+Y4Vrb1wSxd8bt5jIWKQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Conor Dooley <conor.dooley@microchip.com>, linux-phy@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a third example covering the meson-axg-hhi-sysctrl variant and more
importantly the phy subnode.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml  | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml
index 16977e4e4357..c6bce40946d4 100644
--- a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml
+++ b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml
@@ -158,3 +158,36 @@ examples:
             };
         };
     };
+
+  - |
+    system-controller@ff63c000 {
+        compatible = "amlogic,meson-axg-hhi-sysctrl", "simple-mfd", "syscon";
+        reg = <0xff63c000 0x400>;
+
+        clock-controller {
+            compatible = "amlogic,axg-clkc";
+            #clock-cells = <1>;
+            clocks = <&xtal>;
+            clock-names = "xtal";
+        };
+
+        power-controller {
+           compatible = "amlogic,meson-axg-pwrc";
+           #power-domain-cells = <1>;
+           amlogic,ao-sysctrl = <&sysctrl_AO>;
+
+           resets = <&reset_viu>,
+                    <&reset_venc>,
+                    <&reset_vcbus>,
+                    <&reset_vencl>,
+                    <&reset_vid_lock>;
+           reset-names = "viu", "venc", "vcbus", "vencl", "vid_lock";
+           clocks = <&clk_vpu>, <&clk_vapb>;
+           clock-names = "vpu", "vapb";
+        };
+
+        phy {
+           compatible = "amlogic,axg-mipi-pcie-analog-phy";
+           #phy-cells = <0>;
+        };
+    };

-- 
2.34.1

