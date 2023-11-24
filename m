Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A5B7F6EA8
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 09:42:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE11A10E7C1;
	Fri, 24 Nov 2023 08:42:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E556010E7AE
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 08:41:32 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-50970c2115eso2181390e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 00:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700815291; x=1701420091; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=szbyE8B5HmerWTS9QCGM8GNA9TtBAZ10zn0t2kxJOBs=;
 b=ZLlsG7EQ/wEQvFD8OE6l/s/UhPx5syKiwIV0/RPkD9O6l4xUa0tpBEg/07RP2SuynU
 oF+xEUKxcr6dv1o0KtYNfHw3llAp6bKazCv5mKn9vFM5rmJWcrLPrJ3EpzS859z1gYqw
 nxEo1aZr55z9M3Pj1WrjNJGPgF/CNG9pZKp3StxoWAqLdcwNfLtpqWpHhHxHXMZw7BWv
 u49iuddktD3dsJQXEjg82vkDtu2N3+EOaJsjpDDEZGO5XLcGXyLfyY4uPRpv8WgDz/Ja
 WbTe8ZTM21Yw6S3PaBDbRpj4wKEU6JrG+FuLc75PI7e1GErjEp16+3yOYX68eROMPkFM
 3vXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700815291; x=1701420091;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=szbyE8B5HmerWTS9QCGM8GNA9TtBAZ10zn0t2kxJOBs=;
 b=rPFCusXWRe4l+6V8hRNoBTzABAtfAFuOJatLJ2RvAksW7Of2Q/mZaH/QJ+ipLc9hT2
 SXmUCdwff73PIx90le+4ojlk0KV9766zZ/7uHp1ygp99x80Sy8AoTrUWqJ2+Y7d8GR1r
 AyGHCvlMRlKlUHjzQujvCU5aSgpSVvWXR7nsiJHPKIAnLw+Gr9/1WERAAqPsZs8jZBEa
 ERJ4STZyct6Pp+VGM1JWuKuNAKXwGiJePoOomnXfVqHPHSY75T6fDZHkv53Yj5CV8qDZ
 MQBnF+6K5RzUgPjJ+prpo2QX6IKeCDd3OaIeVu1c+0xvZ5rJarU5dTw0T2e4NrXeCySu
 b0Gw==
X-Gm-Message-State: AOJu0YxhtzuJMc+plhsrb/3bOdAZdO3MhOpHv7elpwx95/acwBHm6fDs
 1yCUR8Yk8izlMK7RDypb72LGPA==
X-Google-Smtp-Source: AGHT+IF8wC4ZbNV+iRqsapT1X1L6KArgTHWCtJUniE+JBLrichukip7x/MNUSFgjU69zSXGhwIYP9Q==
X-Received: by 2002:a05:6512:2026:b0:509:4916:8b6f with SMTP id
 s6-20020a056512202600b0050949168b6fmr1088541lfs.37.1700815290893; 
 Fri, 24 Nov 2023 00:41:30 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a5d4f0b000000b00332e67d6564sm2534562wru.67.2023.11.24.00.41.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 00:41:30 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 24 Nov 2023 09:41:16 +0100
Subject: [PATCH v9 05/12] dt-bindings: arm: amlogic: Document the MNT
 Reform 2 CM4 adapter with a BPI-CM4 Module
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-5-95256ed139e6@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=886;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=dsHeljQP++qeke1zASpQ3YPnuH6eGTAu4r6z8mvmrbM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlYGGv3r2urKVQCnv1GMSXAcUHF2wbzkyg1d49b8yI
 ncf0ylyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZWBhrwAKCRB33NvayMhJ0VlcD/
 4y1L+GLLwogkpqrR1xVtyGU3WNktnmQpmbhriYFVjc8mfDK6pfyBAzykOOFUyjcoCgKWxV1oJTuxod
 n2fNJepwZ3udvXq/phRAoM+JgB5VwPl02d66w6yh2mRT0xsuthdMpZ6GVLhbcP++Rm6wgxEcX9p/cl
 HRUp2NPx6OZGj49CiOwd4JQIe2nejmgGDUlTtfXBx0UrpPjamVyrNvMBGIIdLVH9mDQNONWT1rQM/L
 kSTuU57hLl926SrMVJ4DP3qFu/14HhsgOLiIPMgZjSVyiPWu3h2FGpFHOsXi8u4wUdJO1o/HOUy40V
 Mic7Q/lZFY39/kVxbZ4ICyg8QT9p5CzDwYXuLTYST5SCoBr7yLEBEraTke0toEJOpzx3meHPsl3ghp
 9BOlz3g/+AVzEyoz3yjDqnifU8Z4ZCG/pVJ3VAH88P7pXL8LkGyqfrzZSnWg9tiDwRC9P34pFG0CPs
 vZQ+OaIsqPpSEN6et5R/tN/luhPgfUia87H5KA3QYFyemEKu037HhZcdomNkQnxU+uBNy377thMRdD
 BxLMWftl1gzwElohUV/HuoVhcZbLRQy3xkepA0QjbquW5+cKI4Jog/261FPx6rw2ZHOLpxSyh2BoTG
 AEQOfpbdxt+xlZIRW3QRefScRXlSnVfYvXehYP9LUfxILN5HJYzvwxQy0xeA==
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

The MNT Reform 2 CM4 adapter can be populated with any Raspberry Pi CM4
compatible module such as a BPI-CM4 Module, document that.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index caab7ceeda45..2154a4614fda 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -164,6 +164,7 @@ properties:
         items:
           - enum:
               - bananapi,bpi-cm4io
+              - mntre,reform2-cm4
           - const: bananapi,bpi-cm4
           - const: amlogic,a311d
           - const: amlogic,g12b

-- 
2.34.1

