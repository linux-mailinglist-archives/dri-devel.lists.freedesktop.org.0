Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C00D47F6E87
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 09:41:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E792610E7AF;
	Fri, 24 Nov 2023 08:41:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6922210E7AB
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 08:41:27 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-32fdc5be26dso946273f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 00:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700815286; x=1701420086; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Rfvt+EmrHZv1zbeX+XtXPk6Fy/0gOVGXRVeJ603Il6c=;
 b=qGkE15fVwWg7WJT9IIoQENghAGQ0JABk5zHMQWG+FpOwIVNW/vFVeo/XPBfuWge4hf
 3dK8Vwnk07KIKlV0wcVb5NXTNCwuLSdH5a16fktei72AOGvG8H7p2kI72lfhunxJC/7h
 t+nOLpOxX/vwTX8LXsEe8yhfJwfp8B2s2VRbTmdXXB59VgnBRadywCf6PFSGP7ILuyXa
 F+i+DpPGFAVOLPxegZ9K3kLFgxfHuKsJH2RlCEIyuVBmuIcJaPHU/Y4db51LN5Be6QdO
 /oG2pTZ+eTE5eIdnLrDE5wYCdZ9Eg8c3UI0KsK5ebtBOIDfrmFlpWIPQIMCGV7Npr71a
 U8jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700815286; x=1701420086;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rfvt+EmrHZv1zbeX+XtXPk6Fy/0gOVGXRVeJ603Il6c=;
 b=gehMa9zStkj97ceUcnQ21XzEXyPVH2pQXhITxOZrvtMhrbo+DcDq6bcc3GpndnyHuK
 VwhzjHi8DnfJRKX+UK6jWrhAsd1POEHAi/rqsf12owRLL2Kel7sAyjGQyleBcNWHBwrV
 nLhaiIuWFOUByG23PvwGxNOvCxLKJnt5IWBafluHA8D2Uk5PkQER0obSZ+oHufvh2Zbu
 AjqE3ewpm1C9h3ZWkZlEDKwYP1EGhoLR25GRHQ8RYu5jrhDpIuU8IYDQ1pmxNYl7WNiK
 mYPS09Sz5yAivGoxw6Z4gjHeCoZvKRYn94UnUgt3Rt67MG5ps4QNl2rgm2cdSYsiYyCd
 M/rg==
X-Gm-Message-State: AOJu0YxA8RegEyfRc2l2+A9tVK3AKCnfG4xCn6vkW145rteg+rWp9nm5
 oiOP7aR/+MGIagVaa3Jx6cHLng==
X-Google-Smtp-Source: AGHT+IFnuchw8Ikyiy3m+j3gALkvJfoErNWWwqz7BB2ufK/58r0Gt+p5OXv1H8cdurIdKXJg/ONALw==
X-Received: by 2002:adf:f48d:0:b0:332:e6d8:9345 with SMTP id
 l13-20020adff48d000000b00332e6d89345mr1676453wro.8.1700815285668; 
 Fri, 24 Nov 2023 00:41:25 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a5d4f0b000000b00332e67d6564sm2534562wru.67.2023.11.24.00.41.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 00:41:25 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 24 Nov 2023 09:41:12 +0100
Subject: [PATCH v9 01/12] dt-bindings: clk: g12a-clkc: add CTS_ENCL clock ids
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-1-95256ed139e6@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=761;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=OBDzXE6zqX89kc7pvzy4CIEH7gf5glqDzs5WzIgtsF0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlYGGupCZ+JBm/j62lgDoGr7xNwQCD1mUMzIViQ3Q+
 5BTtcTmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZWBhrgAKCRB33NvayMhJ0e0rEA
 C7eQ9byvp8DK/smW2cQqD8180I42XiMLdt3wZ7xVsHlZzRItzA+GMiMo8KBxOsciSTcMe2vQ3qkNz8
 /viQaJnuONTjKXGF1XzU0w2a1mU/w+GMAqpq5t5GYrsJYhBKucDz9O4ybGOoKdKFn12f8S8vjiTPdC
 +zThFD679SlacJRPuk0vKbwaPI4yFbHSvKWYKMtm1yYUOTWdf3asCcSbA1r7ZdSxR9n5ptrY/j0S+/
 7MyDnuRCfp8bhrWJqlXGhdXqWuabpaTaiWo7WgKW1sfpHHJgnES0z1FOzy3t+/lECu07cuhyLkdHK6
 hBFrNDz28dCn70wp0d3lmAAKuMaGh0riTCG6cjJHW9y2nNUNfLScNubW48XowuSlqaadd5YUu67laO
 bsXX8vh7L1Nu5uT2wmRY2BZpkUek6F6XRKcvDP9fG/P7LNiGCNkG/gK2pGYR0D8pI8SfeZN3558EO5
 m43V1xVJ/3fhvgYUcrY9QiimI6m7WxdQhcxoePjjVBNYsQwezxq4FGFV6yYRLjjGzzPY1REEU0hYSx
 oHJQit3xEHjUuNXc2fQH7wAQLOFnTcqe1LFiHzo8u0TVEv0EaxKFo1fFXSlIPwb+jNK9flSKdZq9aV
 jjtxeGFXZGXslCW1Bd7c+mso633D4cWnl5ZWduv7cUenT9VDAgcrqQz9kh6w==
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

Add new CLK ids for the CTS_ENCL and CTS_ENCL_SEL clocks
on G12A compatible SoCs.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 include/dt-bindings/clock/g12a-clkc.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/g12a-clkc.h b/include/dt-bindings/clock/g12a-clkc.h
index 387767f4e298..636d713f95ff 100644
--- a/include/dt-bindings/clock/g12a-clkc.h
+++ b/include/dt-bindings/clock/g12a-clkc.h
@@ -279,5 +279,7 @@
 #define CLKID_MIPI_DSI_PXCLK_DIV		268
 #define CLKID_MIPI_DSI_PXCLK_SEL		269
 #define CLKID_MIPI_DSI_PXCLK			270
+#define CLKID_CTS_ENCL				271
+#define CLKID_CTS_ENCL_SEL			272
 
 #endif /* __G12A_CLKC_H */

-- 
2.34.1

