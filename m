Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E39CE8C0DB2
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 11:43:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0B3610E566;
	Thu,  9 May 2024 09:43:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HL7k7Te8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8857910E566
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 09:43:02 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a59ab4f60a6so155927166b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2024 02:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715247781; x=1715852581; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=nXToc41FJ1K1jyZaFJj827r0wMrkwnVZ3gTS/QEqFfk=;
 b=HL7k7Te8T7qQ+znr11B2MBJOR0b0rHDn63Tf2gT2DqbSuXUFd54JFxVGqko8FusqiO
 JHjdxvXZS8LBNXySjJN6oem4+t8zoSNMAIHc8OzhiYLhTJOS2fXwby13ew8cevMe5wSx
 CaYDswbHxMbncTvOeC1nIJuNCqwEdpLN878gENfRGvZff2itHEkxiW3OPgJkOXgFBen2
 rGQroMnOj5KLlj8kDm+HTx3I9iCVq0rluNNGZ6lhToExNSDBrq3ZeNCnIkcY8VPhxdWL
 AyIlDc8z/YG7dHWzJDd5Q+cwH/+aIzdmLeM55ahZw8V97Jyiy7eHHWe92Lwk82NA0dWS
 T0Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715247781; x=1715852581;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nXToc41FJ1K1jyZaFJj827r0wMrkwnVZ3gTS/QEqFfk=;
 b=X1m8jpaWcoW2NsBIpKJfCLMf8ivdXSvop/ppP4UnpOdlhTavk7NiFDrix3fKgeI2XX
 oQ1e8xCVKcatnQk9px90DWq4UX0A7EO7cFbt0IDYX19av5LRuVCiB2M0RM6DuSZ0cvrY
 jq2DwxPWzjuj6pX+6kmi499Z1pbM4LV+V7Mj6DGCRExfxO6Qa7pIMJ98EcKsU1yvTwfP
 dNI1M9e0zbPnNpXZByRz+JEZ7MWtFgA7e3knXhAZwkljE112X/h/2IvY/UpEciPVMMks
 zU+QxLoFhkNATCMn1SY89V7q9BOI/oaFWDlEs/kWPOlGuZ0/9rBTiH5kiiEjQPNavcJ2
 gBxw==
X-Gm-Message-State: AOJu0Yx49BMmNSibk3zICbDQKbs7VYaMemuqjTjlY7VYEm0t4FxnN/v9
 NbqF6F7CO8aViqCz5u64M4BlDvW0PURCyZKVZ22mpZUoKw7V4W+48ZvwCD9Vrxg=
X-Google-Smtp-Source: AGHT+IGXROeW0KH1SDJKVClcQZYZh6a7R3plP3x7ydci5rtTGkV/8BOhrB2UWJ5um9j8RF60mjnBQw==
X-Received: by 2002:a17:907:1c09:b0:a59:c3d0:5508 with SMTP id
 a640c23a62f3a-a59fb958791mr596004266b.35.1715247780581; 
 Thu, 09 May 2024 02:43:00 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.169])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a179c7deasm53835666b.103.2024.05.09.02.42.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 02:42:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 09 May 2024 11:42:51 +0200
Subject: [PATCH 1/3] dt-bindings: display: samsung,ams495qa01: add missing
 SPI properties ref
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240509-dt-bindings-dsi-panel-reg-v1-1-8b2443705be0@linaro.org>
References: <20240509-dt-bindings-dsi-panel-reg-v1-0-8b2443705be0@linaro.org>
In-Reply-To: <20240509-dt-bindings-dsi-panel-reg-v1-0-8b2443705be0@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chris Morgan <macromorgan@hotmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Konrad Dybcio <konradybcio@gmail.com>, 
 Del Regno <angelogioacchino.delregno@somainline.org>, 
 Heiko Stuebner <heiko@sntech.de>, Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryskov <dmitry.baryshkov@linaro.org>, 
 Shawn Guo <shawn.guo@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=952;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=gjCs0DV7B7RR1j6936MwQyQwFKJMltSF9sVmZwvdZPw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmPJqdOM3LXjtcBIPKLbQXLjsQanOWad6C3iAgV
 aMXLVevr02JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZjyanQAKCRDBN2bmhouD
 1ybtD/47ueiz6JsAgTGEV+DVeVn6zEvjTIKNZre2ojMqTXekMWCISRS7B5MyObQCQvOHMY5rA1J
 /lBLSVOeP+7lnyE3LfbcYO+yCcHNtxn5496WnBBiGnjgzSq18fuwwfZlTeJinNar8R3vr84Sb3M
 nWVv1yT55ZFTPtUf5IjcDE18xRGZVZPwm53Uylbjml9r+KSfJUHc0BLDmAS2bO+AeNdbaEe3upn
 sKBddMIoKXMo7zvCRDSmu9oXT33URnIunXKQhUk9bwvS0c+6G3iyQeSgnOy+JZwGjoavjKWasah
 TXGmgsxq8zkYSC67ZmJF8Wzki5icFzgLA77n4muRP2TxDExDEJcmA5Vfy0wNUreg2B5nGmEDabm
 2OraygdJPmYP3y6gb4+tSRengY67XafwsnJFgrYkRRcPWLLNl999UAPsWvAu8cIGQf3H8iJT+6r
 zNgdhTgVy3ddV+CxBOhb/kPLZ8o4j0CPGiR5a8KBB0OtZZsOSsknhDAV7wLkbMEKwA6at7q/S61
 PFQx0anPvD8q41vHvCNk0KZ7uza3VDvA83p/uExA/MAdzZlD6xfxrI8DiJRf4vsMOqgj5WOzo9Z
 APkHwUGGEtKU1+giVbE0hHJ0JcAPgEPUPJgbOBbYL/PFF/NRb94sqDMCR8OY9BZiIPqryJjHXUc
 Cv0ohzDrUmUfVBg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Samsung AMS495QA01 panel is a SPI device, so it should reference
spi-peripheral-props.yaml schema to allow and validate the SPI device
properties.

Fixes: 92be07c65b22 ("dt-bindings: display: panel: Add Samsung AMS495QA01")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/panel/samsung,ams495qa01.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,ams495qa01.yaml b/Documentation/devicetree/bindings/display/panel/samsung,ams495qa01.yaml
index 58fa073ce258..a5ff4de74a15 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,ams495qa01.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,ams495qa01.yaml
@@ -11,6 +11,7 @@ maintainers:
 
 allOf:
   - $ref: panel-common.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
 
 properties:
   compatible:

-- 
2.43.0

