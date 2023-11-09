Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC8A7E6606
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 10:01:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 562CB10E1EE;
	Thu,  9 Nov 2023 09:01:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95A4810E1E8
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 09:00:15 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5079f3f3d7aso779140e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 01:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699520414; x=1700125214; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Rfvt+EmrHZv1zbeX+XtXPk6Fy/0gOVGXRVeJ603Il6c=;
 b=E5NH90Bs2ObohIIfQhzNl73iuA2ytlu6ipUTKfvbU5FeODPS3EPNnMsHDR/Vr68XJR
 BL6hLKA538yGSAtVq/FYb1Ca7Qf8SDUwieMbxUhEp5iZeK50l7B2j+eGKRKkjxLlOFKM
 KYfuTOmb+Z5QS7a/OGqnWnfdxEc4aopfKdralnNdUrb8zDUG4ppvchIcOzB4HmVa8Uaa
 2/gfgiyJ4kwqKX5AJFsZdd5xkVljuTn0chhiyDgAQeoecATjOpr9QwL+CVjvwnOJHfnS
 77TiCFyeMrVADr9Ct1017dvI9ji8huAKyi9jZ1ksbX3JdJDIAM4D/G1H0hsS3sXA3kYd
 P4IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699520414; x=1700125214;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rfvt+EmrHZv1zbeX+XtXPk6Fy/0gOVGXRVeJ603Il6c=;
 b=xU+WTU38H6ydCOTjMS9WT3pFV1BQ3h3hDZMppTkIT8EZZVJcmZTo15/+bLCT3azkmt
 ySEL18H1JxPlrQxPWKdJpIX8P/aa+Dw8p9VIm5aen5yb/N2CFpAMJHAj1VIbkbFKvp4f
 zMEJmV0Jo0po8x0FuM8aHJhewHPHgvgwonbJSpUmdfQUzCWRkuHnbpUAQ+58UqkN70ML
 Nsas5aDv2DFjYMSkiZ7sJd1VFkmxSau/Epgi/8PQ/xX/GLT3rZL9PkPOHSPqAp3YQ8Yg
 KN9q8jcW7+BDbXTdynHP3WDKkC31Pej/OitOZvGRq1KEk4n1B9cWaDsXcvlg4wXhLTgK
 Oivg==
X-Gm-Message-State: AOJu0YxktanKLt+hgiuEwe+UZ3FLyET7ZSRPEPdggZV3SyQqZA/y4RPX
 YYfTjEkYZQu7D25GVLlrOYRJEA==
X-Google-Smtp-Source: AGHT+IHbarTLeXs1xRLnlOEthFHXQkLlQGddJUwWyZGyU3T60ayER/TL09SkJXBO48qJCeZljgsIWA==
X-Received: by 2002:ac2:551b:0:b0:507:a8d1:6e56 with SMTP id
 j27-20020ac2551b000000b00507a8d16e56mr833623lfk.35.1699520413701; 
 Thu, 09 Nov 2023 01:00:13 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ay36-20020a05600c1e2400b0040472ad9a3dsm1428484wmb.14.2023.11.09.01.00.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Nov 2023 01:00:13 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 09 Nov 2023 10:00:02 +0100
Subject: [PATCH v8 01/12] dt-bindings: clk: g12a-clkc: add CTS_ENCL clock ids
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-1-81e4aeeda193@linaro.org>
References: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org>
In-Reply-To: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=761;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=OBDzXE6zqX89kc7pvzy4CIEH7gf5glqDzs5WzIgtsF0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlTJ+VapgP8WHcdrQgPiETykwQUlKVRqJ/4wVyCchQ
 YXz0F9aJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZUyflQAKCRB33NvayMhJ0RxQD/
 9C5ZGRPwcExahOsQp+FbfoxjpmIQhQTF166bZMrK4X3DXIHdj0XEIJf/stW+d9s8ZED+E350vg/VsN
 R5OhSGMemZL0MEM4w7cjd3pFBN1RXfzpt9UtYGdxkppLZsu/SgvZTnk+q7XTdimznCiJSl0+E5t4Wo
 R2/R7NbBSM147jSdi5bBeuREcm1exIjb2l48Atuw/a5Ab6EVXu/5nB4ieAkIpDuLLUztCGY8Pk118m
 yUKm8QsIcqitnSbhrG1pOnfHVmGPpptcLSxZPoG7P0eIJX2EcIFWz+kRo7VKBJpivZ5OJ+KnLoyD4r
 GI/QJgiVg7cnWNLkw5e+IW/9VCcxsxVcqXOzAl6i2f3NGq+T9IgsJ8I03z5Ppd3do1WshntIh4YMvE
 gstl29N0lvUGXR0jo3JZ3TVCMSwinf2AUgLS2oibuDIY0k3kdGG3ZuRevRpxjE/UNxSWWqmubUEnTd
 KtBi/TH3ACCcAsGTGh0VX7resg8xpbrCS7jFKxz3JEVMGa8wQ9Z9zNUcyizV/IvVu911b4KKruocfe
 DhBLWNPgLVBn2Xl8cAXuQJH3Jmz134RfvYj0UIzLHdbyrTkOB7RIOPUABuwP2jaTj/nD+P2F0OmKFm
 Ul0YEj/8PhtnUUoDwHdpk51cLMTTq+YhdJsUqgkgsOND5UV3glOI14ooO0ig==
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
 Conor Dooley <conor.dooley@microchip.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

