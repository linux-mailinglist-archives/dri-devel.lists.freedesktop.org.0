Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F0B65C1BF
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 15:22:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92D6010E3E4;
	Tue,  3 Jan 2023 14:22:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7657B10E3E4
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jan 2023 14:22:32 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id w1so17481358wrt.8
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jan 2023 06:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=BrQTlFtoTu8he9ydQRdvctc8hmi7ieuddKkLwr03Ix0=;
 b=xHYxZ0jDW2+TBmQ5IAf+o48+WdHcrpuYIJpkEKuoa8Hvb/BQHziGbWUph2B1hstbEU
 uOyZAreWTU3SynAXgs/KUVW609XGxXbjE8SsFSYwTSxphKlGUqg45z2jv+ip4PNysIhJ
 wLWNeS5qSAFdzN+2Z0T6EqzqQ9FX3YK4UKmLI76hIez8PmYQUq1WhrC8nv/0nqFQ/1LF
 PCUBCuC4YGW5VHu3UoRcGpJG8YR3gqXl/ieW1R1rMvOIBWb3ugsRIo02L/g6ewizQvWq
 wZ7p2jYJTssUMdyu0jckxKPj6/vtUUc3Wz+cmmQ/69Fy/D/7ZK2CNhweVpsmgFUl9bvD
 NejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BrQTlFtoTu8he9ydQRdvctc8hmi7ieuddKkLwr03Ix0=;
 b=kPltCSolURqE69oe6i55PG1xGzZA3zxwEiCJyL4cinJBxR5mvZtQ+S4tNWr1/H+Fft
 9ecMZTxd9cBB5z+3rCexVp75EbskDmWJyafEgoz9L3pvJqppbd0sUpvh6MrFeAAlChhb
 WsRLqqBZmt23ttvVhvcK0ppS8VO4o44Ttq9a48IsqYwnckkIoA2WNrjOEIdTPqxrrZHM
 f6afWFklS5HVgPbawT/qA7/dwxdicj85tH/KbOcVTvpTLbaIVfIrnvOuuMqn7/rmvYsj
 TeJ8Xr7K4yHZEGat3KOiN+YMPykVZmtdVFpRF9t+cMnpL8xM6ow7fJNV9Gwkbr0h5Ii3
 3xbQ==
X-Gm-Message-State: AFqh2kqaNHfgfJXeX5nTYHzRX6psd0uAxSpmacLKwQifKpdenv1wEKbs
 QIgUOWjcwXST5+qBWQY3bi6NqLd22+21Lix1
X-Google-Smtp-Source: AMrXdXtnzaQHGwPx//u/Ga79fT/ywgStvs4FSMtqKeiQ5XHpCdrPdwXKkzKkcqbwm/wMjYulEUQyaQ==
X-Received: by 2002:adf:cc81:0:b0:275:ae5c:d448 with SMTP id
 p1-20020adfcc81000000b00275ae5cd448mr26043702wrj.13.1672755751009; 
 Tue, 03 Jan 2023 06:22:31 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a5d55c6000000b00283c7b5ee3bsm20182163wrw.101.2023.01.03.06.22.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 06:22:30 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 03 Jan 2023 15:22:27 +0100
Subject: [PATCH 1/2] dt-bindings: display: panel: document the Visionox
 VTDR6130 AMOLED DSI Panel bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230103-topic-sm8550-upstream-vtdr6130-panel-v1-1-9b746b858378@linaro.org>
References: <20230103-topic-sm8550-upstream-vtdr6130-panel-v1-0-9b746b858378@linaro.org>
In-Reply-To: <20230103-topic-sm8550-upstream-vtdr6130-panel-v1-0-9b746b858378@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
X-Mailer: b4 0.11.1
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
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document the 1080x2400 Visionox VTDR6130 AMOLED DSI Panel bindings.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/display/panel/visionox,vtdr6130.yaml  | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml b/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml
new file mode 100644
index 000000000000..49e2fd4b4e99
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/visionox,vtdr6130.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Visionox VTDR6130 AMOLED DSI Panel
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: visionox,vtdr6130
+
+  vddio-supply: true
+  vci-supply: true
+  vdd-supply: true
+  port: true
+  reset-gpios: true
+
+additionalProperties: false
+
+required:
+  - compatible
+  - vddio-supply
+  - vci-supply
+  - vdd-supply
+  - reset-gpios
+  - port
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    panel {
+        compatible = "visionox,vtdr6130";
+
+        vddio-supply = <&vreg_l12b_1p8>;
+        vci-supply = <&vreg_l13b_3p0>;
+        vdd-supply = <&vreg_l11b_1p2>;
+
+        reset-gpios = <&tlmm 133 GPIO_ACTIVE_LOW>;
+
+        port {
+            panel0_in: endpoint {
+                remote-endpoint = <&dsi0_out>;
+            };
+        };
+    };
+...

-- 
2.34.1
