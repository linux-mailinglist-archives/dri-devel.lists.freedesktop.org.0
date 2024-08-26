Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFC895F176
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 14:38:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62DD910E1F7;
	Mon, 26 Aug 2024 12:38:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vSXWkING";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 590F010E1FD
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2024 12:38:55 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-a866d3ae692so235443166b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2024 05:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724675934; x=1725280734; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6bKw6ncLyi+fm5o3G3Satq2KEYMjjZZXHTYXpkPSF7g=;
 b=vSXWkINGfNeRlHDCMdXspcfxoPwQkjNafGR0pyuhpAa4GOSPpfiNsw4cDxJhoBLfg1
 U0lCwzbSkn1V490x4Xp+Lr1lX/a7qlOnln2GJVq6ubUTWS7BCupzJSdO1GuZesKNidtK
 F7KxX80jfwG5H6CfFS9lSefJmZ7f2I10cb+mGUBtMENafMaKbh6JjmHxlJNMAD4hqH7Y
 4cRyzwSAnK8KGfW3o/aN+3X7a9qQscOIefppi0nrBZfRVbwPx69vf39EXjmgmxacpUNn
 vexyN/W88d8q2+S4hk0GA0GVGncrtpK1lzE/cLypo0x+62f+nfT1GJ97P3L+lEFuI2Es
 GmLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724675934; x=1725280734;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6bKw6ncLyi+fm5o3G3Satq2KEYMjjZZXHTYXpkPSF7g=;
 b=QtGTo79WYMJTIXpDUQzIOnCGg9Fh/HLPPwrw02W61fjUdoYKIGyph5YTbTo+rHkPe+
 ZlhWt2NlUqr2hIOKy7/HVLhpG3ZpioHbEYRLLW7XyH9OlPCplYy6qGK72AffGptrXkeY
 vd0NOKvRUNYUMr2QgQEWKhVVyMn9rQhl+He4jXC0vyj0/CumH6OMOXr0Mzs5zH2IuHPe
 vfNPF8rf8EGOt0IDZUXOjOe7hKD6U7Bcz5KnD56mfDAO9zPtV9BnqYwZaztC9CELpElb
 v/7f57lOtXzN26YXTP4nfrThHfyeOwLrTejeKBUDzCqcdGKY4RdOUKbFJvAoEF6uPils
 LN/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnCvhPDiqkflsGGOlIn18ADNt24AKUfL21pdrGH6SxT1xJdJBmILoNQLmYPgk9ZyhHtKf/M4c/N2Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwerETDzhmSUdRlC8MbrigmGuFQx7xLjoLceIRRd1YeYcDthbiy
 LWbjoBMMx1xeYQYRFsLk31NwRjMz7Y+Bv73bJ/IMl1Ea4K/717XxsmN/f9mvLxc=
X-Google-Smtp-Source: AGHT+IEBiaR65UU0z1BHj73azi65/R2fj1moYsCYZxrHobqHOKYOiVkDl8d1vGon3RAihTXLKfLT0g==
X-Received: by 2002:a05:6402:42cf:b0:5be:fc2e:b7ce with SMTP id
 4fb4d7f45d1cf-5c0891756cemr9202177a12.19.1724675933498; 
 Mon, 26 Aug 2024 05:38:53 -0700 (PDT)
Received: from [127.0.1.1] ([82.79.186.176]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c04a3ca499sm5570303a12.34.2024.08.26.05.38.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2024 05:38:53 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 26 Aug 2024 15:38:46 +0300
Subject: [PATCH v2] drm/panel-edp: add BOE NE140WUM-N6G panel entry
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240826-drm-panel-edp-add-boe-ne140wum-n6g-v2-1-2758e8574842@linaro.org>
X-B4-Tracking: v=1; b=H4sIAFV3zGYC/5WNQQ6CMBAAv0J6dk1bCiIn/2E4FHaBJtCSraKG8
 HcrP/A4c5jZRCR2FEWdbYJpddEFn0CfMtGN1g8EDhMLLbWRlc4BeYbFepqAcAGLCG0g8KSMfD1
 n8OUAVPR9aYrKXtGKFFqYevc+Jvcm8ejiI/DneK7qZ//KrwoUXFrEvJMyL5S5Tc5bDufAg2j2f
 f8C8TI8z9UAAAA=
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2013; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=+e10XPuiMARtA5K0eNcePXnpWtDd9Uk/clN3e+gYM28=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmzHdYh4YAWlD4N0kK5iLViuZUR+oCvuLo/s7MM
 GCQdjlsXkeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZsx3WAAKCRAbX0TJAJUV
 VmLcD/4gypKM5C1JYdc14QZe0uLHbSTUjGzO9mE2vNqryh2TmtOoJpNFrDpIXk4ZprdBOC1EcSx
 amg41MF+/CGrVucipzlsYtdej3+2NL32LUse9TFbfzQbFizbBD697DaB4ceqCEJ+c6EDnElIQ9L
 HGD1z2PIrzkT/+JZz9mM9qFei07TVk4Hgk8DZoDF4vtWA92H6lZyTjz8Nb16YNm3Hju3bZQEXqy
 o4BHJhwSgCJ6WEcr+XoVF7fy+QEtodZnUmvhf5i2Mfq0nU3zwdL7MsYRZrn+gOEekVHD8048FKb
 oAAHwJFd3zCA1nm/1FJ6WYEvmkkxCp5yi4ORLR9N/LeHM7644A+30laT4DYs0A3ZqPZNmxByekj
 zvsIVAhI60j0pdfAAUOC8wJx0xR6/8BtOXOOeap1KTWeOTqSvc/GR+WWrn3Z9UQT9DWa3VLhADt
 3tXz0c4rMnJpHlPaB3cXCwIrNPoTAKFcfiCTiJeHTCnj5MMfGiv6IB/ppVr07NIbAhR5aLnTubb
 LyhU4nZYzdzhgLFfaRUxn312W5Oc11JCMrcQtov6DUyYE0Mb/apZLSG41XGcCbViUd9nIKi7U4q
 yQZWuYP9UcuQ2MYT2s1x3C+Il90OZLu6dnc2i6T/9qr5bQYMWzLynupUS6aeIq4gSDUEe3AScIR
 nUhV58TNj/ex0BQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
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

Add an eDP panel entry for BOE NE140WUM-N6G.

Due to lack of documentation, use the delay_200_500_e80 timings like
some other BOE entries for now.

The raw edid of the panel is:

00 ff ff ff ff ff ff 00 09 e5 66 0b 00 00 00 00
1a 20 01 04 a5 1e 13 78 07 01 5f a7 54 4c 9b 24
11 51 56 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 9c 3e 80 c8 70 b0 3c 40 30 20
36 00 2e bc 10 00 00 1a 16 32 80 c8 70 b0 3c 40
30 20 36 00 2e bc 10 00 00 1a 00 00 00 fd 00 1e
3c 4c 4c 10 01 0a 20 20 20 20 20 20 00 00 00 fe
00 4e 45 31 34 30 57 55 4d 2d 4e 36 47 0a 00 dc

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v2:
- Added raw EDID to commit message, as per Doug's reguest
- Picked up Doug's R-b tag
- Link to v1: https://lore.kernel.org/r/20240823-drm-panel-edp-add-boe-ne140wum-n6g-v1-1-7bdd3c003514@linaro.org
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 7183df267777..f6102ceaf0a7 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1911,6 +1911,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b34, &delay_200_500_e80, "NV122WUM-N41"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b43, &delay_200_500_e200, "NV140FHM-T09"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b56, &delay_200_500_e80, "NT140FHM-N47"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b66, &delay_200_500_e80, "NE140WUM-N6G"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c20, &delay_200_500_e80, "NT140FHM-N47"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cb6, &delay_200_500_e200, "NT116WHM-N44"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cfa, &delay_200_500_e50, "NV116WHM-A4D"),

---
base-commit: 6a7917c89f219f09b1d88d09f376000914a52763
change-id: 20240823-drm-panel-edp-add-boe-ne140wum-n6g-e5ff6458a9da

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

