Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF86B3F95A
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 11:00:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82DE610E609;
	Tue,  2 Sep 2025 09:00:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EMPwRPbX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD62310E60A
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 09:00:37 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-45b82a21e6bso23213965e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 02:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756803636; x=1757408436; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=d4Gc9lydW9tzAwiGsPKTUOmW13FumVd5+LLitcdezXI=;
 b=EMPwRPbX3cMYdKyYtODrjXQyXGRfkcQl1153Di8tYklr7eEmwRzGSxSHKpNvdfT11Q
 D8GNome4u3sSfOIul/p6uasEBw+IkFpL+HwazFQYnMWZCiXz913D3liN2LoZyXPa2QGp
 +8y1yiKvVkzz23aQ5/ZxkTkPwVl+L9oyQ4ug0ptedMwfg1UK1P7KykV8vrFbnOHs/GV6
 Irv3YK6wKHI8h14eJ5pAI+gOZ9Sq8PjLuappqwqAiJYHi+7L0nOX7MP+E/3j/Xj/A4QV
 Sa9tgTdhOCC+KlLvvhbBImlRUXdlyt5u3gE7AqEFhil94mov2X7LKR3xQeCO2MMW/+Gp
 9KXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756803636; x=1757408436;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d4Gc9lydW9tzAwiGsPKTUOmW13FumVd5+LLitcdezXI=;
 b=eQuCTl+KUcygRFfpEhky/K3WURuDcRdeIHaAoU1nSEwRrdl/NwpCLW8zQ9XYRtv7wq
 4j3GUGD48XbAOfNHz4/o1UTjcUtlyTSErX8CzvqoHLNybsD10rlCwXzW3zymcg190HcF
 cnGb6IaNFjWi+ErVm9EBJdTgcsBgIZhOMPyPWbVBbFuUuIxi91MU8OTmPkUYOjzZcU+8
 +rlpAk1jkyqMX8dP/BrLg5xP0U71VlMMxoqUsg5oB0IyEUpmqCAtFSQEI3EqCOLcQpjr
 E0ScpojWtdB3ClZL6GVKyO8HH4xE4OszfNWSGcH4VeYHjCwSyyYQZ5Ajo8uVe7mCQdPy
 lpfQ==
X-Gm-Message-State: AOJu0YyKsyZmwYq53slaZf9thIeHVbjNH/Oq+iJYhsDamxp92m4F4SOn
 /4Hib20lBvfiEpObxjVY/lwuj2UTchMQ74DNTS5oTx4QR7OeKmYoGK18UTUdTBNCoy4=
X-Gm-Gg: ASbGncsvSJZKtCkodkSfNveGMjzOD1MhTBCeoQ0L7iYoKSSTWkaZCalmuBqPC1j+gEC
 CezjP8xzxfaXXSHuA6HrbBokepbVsbdQSggl6JpIujuWrdkPsoNApT+OTf9BBSmhSNf2moVfVn6
 LvkEonumn+GJUnOAo3eRiY++fq/OoVxEzqba+6g2IJ3z3uYYPIfMy1VFCoo0InexyPE3kWtnPmh
 qpdayG2v6RFCxSZs0i5Q35Bru+LbFDwsGWWchYbwu+Stc7qJ4pDATzaCkjcMwWQvcG4T3Gdlxhh
 Zy9UugEtShDH81QiRPt2rbzOXVyJ8w+y8s2b2hoM+Gg3jUgtndpov1+hNzdwOd/G0Bc219yDLIe
 lzl3ifjD9QAQRcrV2+eqTGLQHv7Ktk9EHnuYmQ7q8KOmysC8ydTuwwQ==
X-Google-Smtp-Source: AGHT+IEILw7DEldBdS7IGmRLvi+LEZl/gvFjKbfhYpEStds1C/TgZH01vWw4ozqfSAy+3MiHrBhGUw==
X-Received: by 2002:a05:600c:1e8a:b0:456:2b4d:d752 with SMTP id
 5b1f17b1804b1-45b8fe2bba1mr31627165e9.20.1756803636238; 
 Tue, 02 Sep 2025 02:00:36 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b7271cd01sm261112045e9.23.2025.09.02.02.00.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 02:00:35 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 02 Sep 2025 11:00:30 +0200
Subject: [PATCH v2 3/5] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Document static lanes mapping
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-topic-x1e80100-hdmi-v2-3-f4ccf0ef79ab@linaro.org>
References: <20250902-topic-x1e80100-hdmi-v2-0-f4ccf0ef79ab@linaro.org>
In-Reply-To: <20250902-topic-x1e80100-hdmi-v2-0-f4ccf0ef79ab@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2711;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=51R7ntqsrbjqkkbo9tDq8z9uhTW3d/VToQqy1+1C74M=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBotrIvc6t4TujnMpo58ede29xTmJGQdEWRpxV5GSqf
 h17tB6eJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaLayLwAKCRB33NvayMhJ0X+1D/
 4u4YL6Ysgv6k6MFx7QTE9Fi/CP4grEccBzfnrjMyg7+VSuEa694ZowkmTpMf08EX/FuD010Pjs2uhc
 J86s8vHTOcExjUoFmhz3QoDkMDUwn4PBZKxGVRa7xkgsadjEs9rKlnsRc56+X7AxMu6DX1AEu4be7Q
 471IeyJBoikRzPsZMFxKC7ai3e9OtbFoO4lWhnTmkSu5ByuAdm+OTqy9TH2m9rE0h1v4Dfw6L7AKoB
 EgN6WIjsjR/SXOGyPP3lgELCyni4+hPj/PvvGoyhZXXFV9wn4hrRJM+OoKzD0lXdmeb7sDA7+n/keG
 fP6XvhWQL0TOoWukD/8Y42HSn2Mqi6AAcG+sJJkpfXwl9wd4MjDd1LU74fGbd056V5NOPI0M8wIpGL
 As1f4pvje7+YN/eXdWJ0xM/+dKzJ54yw+xp8KdouBwhhu/eTDpMV/ti283/lOnSQIsGXODTIpUL1vV
 5/PMVXQsQ5L9bZJ9f8T2Lp0v/cybcpPvmLCV/frxtWSlR49L4DUfgMcYHrhTZcQrn1xuj7R9j+sYKs
 MDEWrxU+SPBcdvWgAvyHRqaOieELBxKvMCvSSTkrD74KcriI64wy0L/7ZBT3RpuVg7r0m/NyjD6kqn
 bfquLF1jGDVlthmN27a+ZWZngxTya5WD0OD4b3Fz0WfzuYKF27wiV2PU5Tyw==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The QMP USB3/DP Combo PHY hosts an USB3 phy and a DP PHY on top
of a combo glue to route either lanes to the 4 shared physical lanes.

The routing of the lanes can be:
- 2 DP + 2 USB3
- 4 DP
- 2 USB3

The layout of the lanes was designed to be mapped and swapped
related to the USB-C Power Delivery negociation, so it supports
a finite set of mappings inherited by the USB-C Altmode layouts.

Nevertheless those QMP Comby PHY can be statically used to
drive a DisplayPort connector, DP->HDMI bridge, USB3 A Connector,
etc... without an USB-C connector and no PD events.

Add a property that documents the static lanes mapping to
each underlying PHY to allow supporting boards directly
connecting USB3 and DisplayPort lanes to the QMP Combo
lanes.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index c8bc512df08b5694c8599f475de78679a4438449..12511a462bc6245e0b82726d053d8605148c5047 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -76,6 +76,35 @@ properties:
   mode-switch: true
   orientation-switch: true
 
+  qcom,static-lanes-mapping:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 4
+    items:
+      enum:
+        - 0 # Unconnected (PHY_NONE)
+        - 4 # USB3 (PHY_TYPE_USB3)
+        - 6 # DisplayPort (PHY_TYPE_DP)
+    description:
+      Describes the static mapping of the Combo PHY lanes, when not used
+      a in a Type-C dynamic setup using USB-C PD Events to change the mapping.
+      The 4 lanes can either routed to the underlying DP PHY or the USB3 PHY.
+      Only 2 of the lanes can be connected to the USB3 PHY, but the 4 lanes can
+      be connected to the DP PHY.
+      The numbers corresponds to the PHY Type the lanes are connected to.
+      The possible combinations are
+        <0 0 0 0> when none are connected
+        <4 4 0 6> USB3 and DP single lane
+        <4 4 6 6> USB3 and DP
+        <6 6 4 4> DP and USB3
+        <6 0 4 4> DP and USB3 single lane
+        <4 4 0 0> USB3 Only
+        <0 0 4 4> USB3 Only
+        <6 0 0 0> DP single lane
+        <0 0 0 6> DP single lane
+        <6 6 0 0> DP 2 lanes
+        <0 0 6 6> DP 2 lanes
+        <6 6 6 6> DP 4 lanes
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
     properties:

-- 
2.34.1

