Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 524F0743FBD
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 18:29:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD91A10E4B8;
	Fri, 30 Jun 2023 16:29:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75C5410E4B5
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 16:29:22 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3fbc6ab5ff5so10142805e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 09:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688142560; x=1690734560;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2+ge4K54TEOm7/rx5aIH7nXv5noKUxUQbqIp51XysbU=;
 b=J1Ks+nmhLmK/yIjXRjKXrVSyZu+qt4jmmi/bLA1IYs3KR9uimZVAJ1HEuSo5W+Z7H/
 JWKyfCb9ctBjOMB7uqlKuOuSFpl77/Sj1jZTRxnB0Z7fKUvUd+UIgFfZYd3u5PjzcASw
 3lzTO9XjR3dnOSfpDYavATmJoFCSNDJ1aHk0V3O6xZNd99biNOtWn+KKUbIzVVMo77Do
 pK7e81U7FFfrCLzISieqln+zleDgQu3BfE4lVa4lvvxq3jPdBomQ/lr6N9gBwVz7rgYg
 WjnrgtZxK2xvjdgnmGVdJG3WEOMLzyqP/sp3R41U0gOKS3UFUM+9YRsjUQpUJpQXpeQV
 42WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688142560; x=1690734560;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2+ge4K54TEOm7/rx5aIH7nXv5noKUxUQbqIp51XysbU=;
 b=Tx+GdjWRQ9PkELpjNv4PX3SCOfUq8sbOFDJB6dYlnDMEpbT8SFaxdFxTLB2iPOmqP+
 N4KnSyAeSiriFlzL3Fuvdu5XOMHD7THCx1SWmbCMfWzjd/ZLk4uoO7K9+93/Q+rjoN58
 ToSF3TTpGOZce5kwRvHPsqXqfEw7Yw0Aheg6UbZP70zMWmfCE1+DrAr5PD6qYKe14l6y
 ZyBrztOJzntgv+04bB/C1Tw4ZWhoB5X8sig5Nuj/I+mZMCFH/H2Iab4wcP0f2PY+d9Zu
 mbOtkE59DuSJN2IUxSdcqewRJIKVW5f4BFY4nWlZMe5TllAP9iqyzTs+l1dQAPoO6mK9
 Qigw==
X-Gm-Message-State: AC+VfDxI5bNUgFfVx2A2pSn84HfzALyBh/HfkPnYVODUE8ZfG9PjUgg5
 /h1VTBRgaR23dtXiT3/VhOzb+Q==
X-Google-Smtp-Source: ACHHUZ7+BKIoV4xg598c9FcGgrVTApX6k0SblZg1KAXK2Su2xV1DQfef4QNQLs2dAHCtVhgm3/ucSA==
X-Received: by 2002:a7b:ca48:0:b0:3f7:948f:5f17 with SMTP id
 m8-20020a7bca48000000b003f7948f5f17mr2495585wml.7.1688142560218; 
 Fri, 30 Jun 2023 09:29:20 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 cx16-20020a056000093000b00301a351a8d6sm18835836wrb.84.2023.06.30.09.29.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 09:29:19 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 30 Jun 2023 18:29:08 +0200
Subject: [PATCH v6 1/9] dt-bindings: clk: g12a-clkc: add CTS_ENCL clock ids
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-1-fd2ac9845472@linaro.org>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-0-fd2ac9845472@linaro.org>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-0-fd2ac9845472@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=708;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=2BBkVc8TRDNmHWa33LPRxnRmu9hb0Ks3oe1kaJIh+rY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBknwLau1zel3znaoFXRHvm8v9nGwRc+jS3jn2r5/YP
 4uXeT2yJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZJ8C2gAKCRB33NvayMhJ0T5bD/
 4imT9yiAOF5zIvuIj9aCuaNMuqR8MW8jMUm6XGMwTiP0uoljcoGWPDwMKyIG1/+/xY42La8gfRHk4/
 3ZtfR0P6o1PAT7b23wDPosJG5xJbLO+RPDSv/z6QLiA9S46BDbYCT4tEcc5OkmC2phi2XJTZN5VgJ/
 +YD6VFQwnwcXNvK5niHTfFY1sOSYJ2kTdVkk128ETB1ihBwTS5k2RpsdpuX08RNUysHizODZk3PeiJ
 GLnKpaVWCVbKJiHsj+09dRgZy5Jk5YzuCQYL5r1lZHpx8fZA7BiLo5UqePwpM1Jjp9B8Y8AhkAxBIO
 7d68VX7wNOJSt0AlbwrelecftuqGoTIUPafuMUAZs5of4hABKdkWm0A1vqx4MuUpR0Rung0dr+ITEb
 Bqbcb0MX6p4G0orZYph0YqliRgFacr9YRSSkmNqpcd2QUBD0dyI2RJAw333tFlcZ5iNDjzuzkyk98d
 cSjJM80zQz74HUL3XyPCuLyAx9SaEL/8G+FGoA9Dx50rPFTA5zcUnBDZQJ86PkfSFBi17y+Js8jUQo
 /qr4cfRdi6sLtneh1CVkNPv1K4fcWOOj+TcTsSNGYwm+PWmrB44ajPm4vuSrZl2Ci6uU5/8PRYjP/L
 hQZYKF+r3whHKpljUXJERnJm9oQTuD9JMJQ/lKKvBR9rJp7ez+rxiwS2om9Q==
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
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add new CLK ids for the CTS_ENCL and CTS_ENCL_SEL clocks
on G12A compatible SoCs.

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

