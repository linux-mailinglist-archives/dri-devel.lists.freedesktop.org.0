Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C10DAADBBF
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 11:43:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A95A10E779;
	Wed,  7 May 2025 09:43:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sL4zD3nZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15E0B10E381
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 09:43:45 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-43edecbfb94so56843205e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 02:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746611023; x=1747215823; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=n/gSpmbWvjgkcNdrY1WKdprpB3gyYXuEvjoOoiV/7ms=;
 b=sL4zD3nZMcaP/Q9HmxzqN3gylArNqw6jRm01Jm5Wv3r557ARQVz17z6QLRtJgnVnWK
 JOSIWULidvzjUbd48bmSzmZXzhVnucwAroqGVndQyNhei2AxZp8AD2T8CjqG8l/5jiTg
 5AezCS2tZ/1jIivvPgjX/1vjL/wAxib7FDP/xzb6/jkPtVNCdKQ2muXkeKTp4Sdk+blD
 XoecUPp59yCB4GzCKnIijPoOI92REKhtkhhx/cUjQ6IVi5QeV7l38Svu47ATZcHteWlx
 HAhglDbSOIjDC3hRbjzjgaBXxYKkzpZ4psiJDFt6C6NloB/EBdhxmvJ0UbPDKIP0tgtL
 Bfaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746611023; x=1747215823;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n/gSpmbWvjgkcNdrY1WKdprpB3gyYXuEvjoOoiV/7ms=;
 b=Va2CN18YVozcxT9bG9zFDdnCfWgFU8h3qOdIvAhcGTynZLrqI3nsfB8piaJQRou7gA
 xV+c06db/lL2cEfjv5EdctunqS4SmGQLFXqfG74HxqNObHkY0lSculAJOgsKR4GxY59I
 ktBkw8EE/heU9hJKQTJM7D8O5/qU7G4LuEIEX2tk/RCvNbtwJYiwMj4Vl7eAuebO4ZQI
 KiNmopqyYw8EtADq3dQRiv2+PWMejLIC1DekAQxSZyrnIzUBOAwCavopDvsBiN/YV2l+
 9XwZu6ND6HRAc9WP4VWt2m+CqwCW+y7cECCldgYEnteLBAzGQUa0+Efw7alrOwSzz2a1
 wvhQ==
X-Gm-Message-State: AOJu0Yz/PHRcUQpxJPbjloanbOb03HUGkt+K+YPJvR9+UP/hbHD0Bjif
 IeX9eFwiw3WFBuCuOQA229R4tvsffg0XEamJLhkESiLeSKS2ykhyhtT6jGY8ZTI=
X-Gm-Gg: ASbGncsOc4YIyLdxr6y+HpExY31jlH8A/ALDO+bCwshT6ScJJMdWdwPttA8IpoZQw+/
 WdwyPZsxD7xXh2puNoGvw7QMtrTDgw1hOKMY6Ma813dl4zATkz5reT+lxCayCtbQapiNBxykaZ/
 0tYUFCALErlWf9HVMKQu415p7luhwMzb64t1sGMOU0b3DpSX65ygU9iawNob8o6ZE2vRc/H55Cs
 +84n4vmg2azJMbG9CObeFo19gURqH+OA/Im6tJnkRFOybka+tlfVJ9kDopY3sx57sJtaMPDC7GO
 PMUAQlanNGU7sEOTfeMbgizQlNDcCyvo9H8zq/f+OhTgK9T/wBamu/EBnhH+8g==
X-Google-Smtp-Source: AGHT+IEm8BgUqGZrw1zLlRThgRwiJgz4BelsCMzk5pztRY9TYmsM52embh9LADedc1vQY45xcoZxyA==
X-Received: by 2002:a05:600c:3ca1:b0:43d:aed:f7d0 with SMTP id
 5b1f17b1804b1-441d44d8107mr15642645e9.28.1746611023516; 
 Wed, 07 May 2025 02:43:43 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441d434670csm25360095e9.15.2025.05.07.02.43.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 02:43:43 -0700 (PDT)
From: neil.armstrong@linaro.org
Date: Wed, 07 May 2025 11:43:39 +0200
Subject: [PATCH 2/2] drm/panel: visionox-rm69299: support the variant found
 in the SHIFT6mq
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-topic-misc-shift6-panel-v1-2-64e8e98ff285@linaro.org>
References: <20250507-topic-misc-shift6-panel-v1-0-64e8e98ff285@linaro.org>
In-Reply-To: <20250507-topic-misc-shift6-panel-v1-0-64e8e98ff285@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Casey Connolly <casey.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Caleb Connolly <caleb@connolly.tech>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=13354;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=iZyxe2gtz6gDZ/m7r5rFm9ErL1GKstu0GKoJm/5SdWQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBoGytMjP54D1wjjf/ucwBd4SmGC6F0GBURqvvD3Q5t
 S0vBwIaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaBsrTAAKCRB33NvayMhJ0UapD/
 0ZF/Y16WJn3RyU5tp2ZDL+jQ2enblf8CCD69NaJ8uPmmd1XoQgxS1nBwKUCQezmE6wJO6OpR4ntNeE
 ZggjvFXzler4LEhCgUSCDMUNJGnXAT2nB85paFPwdsBd6DP8S8XgnaYkZCFJChdp9OWfr7gQhKv4r1
 YhEyc43AdPLdpX02tWDEdW47Cl46O8qypU8HX1EBNuFGvlRaYfs3e8OZ1i1wm9LMdDsIFMvfpYrofH
 8YRqxOrXGY/ejoq/Vy/r/FddBihtI4QsVLN4E9qZU7RUCRzESjoizFI7LUseIJ+B92WGXLXIJsueSE
 OUVvciiPakFm9uCP+64/F2W1w73YGTbqJMHWpWRIYEsbpQgCDVbsoHobrAf0e40kmka+sTCKtZBpza
 l2PqUJ1LRg5HpluwRMcMJBCk9xqK+s3+Xk7pYNsCNdRELPx/RquASvugvFFesYxWIDfNe2rVd6LwAz
 MdjjDAQssJBBs6bghLkLUdJgM5Z4e/1AnpUM+vp0vSd8LGKCw5GTOC/4qr87RN29pk/7M2G5IydT1F
 jmETsBp4tRPXaXtM21pUOS2h1WMp4X75hksWkaEqrgV/eUNFAnd251OS518NaiSy5BM9xsvWKqU0Rv
 dJxfEdSVByWSQy9WlYeCHBHvvByG9xeL1Tar5ef2Wh5Nz5Y1R874WnEqvuZQ==
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

From: Caleb Connolly <caleb@connolly.tech>

Add support for another variant of the rm69299 panel. This panel is
1080x2160 and is found in the shift-axolotl (SHIFT6mq).

Signed-off-by: Caleb Connolly <caleb@connolly.tech>
[narmstrong: removed cosmetic changes, fixed to apply, use enums to select mode]
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/panel/panel-visionox-rm69299.c | 221 ++++++++++++++++++++++---
 1 file changed, 195 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
index be3a9797fbced5222b313cf83f8078b919e2c219..26a79ab517723f23b7dc333235b81de264b5f30a 100644
--- a/drivers/gpu/drm/panel/panel-visionox-rm69299.c
+++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
@@ -5,6 +5,7 @@
 
 #include <linux/delay.h>
 #include <linux/module.h>
+#include <linux/property.h>
 #include <linux/mod_devicetable.h>
 #include <linux/gpio/consumer.h>
 #include <linux/regulator/consumer.h>
@@ -15,11 +16,17 @@
 #include <drm/drm_modes.h>
 #include <drm/drm_panel.h>
 
+enum visionox_rm69299_modes {
+	VISIONOX_RM69299_MODE_1080X2248_60HZ = 0,
+	VISIONOX_RM69299_MODE_1080X2160_60HZ
+};
+
 struct visionox_rm69299 {
 	struct drm_panel panel;
 	struct regulator_bulk_data supplies[2];
 	struct gpio_desc *reset_gpio;
 	struct mipi_dsi_device *dsi;
+	enum visionox_rm69299_modes mode;
 };
 
 static inline struct visionox_rm69299 *panel_to_ctx(struct drm_panel *panel)
@@ -81,10 +88,123 @@ static int visionox_rm69299_unprepare(struct drm_panel *panel)
 	return ret;
 }
 
+#define VISIONOX_RM69299_SHIFT_INIT_SEQ_LEN 432
+
+static const u8 visionox_rm69299_1080x2248_60hz_init_seq[VISIONOX_RM69299_SHIFT_INIT_SEQ_LEN][2] = {
+	{ 0xFE, 0x40 }, { 0x05, 0x04 }, { 0x06, 0x08 }, { 0x08, 0x04 },
+	{ 0x09, 0x08 }, { 0x0A, 0x07 }, { 0x0B, 0xCC }, { 0x0C, 0x07 },
+	{ 0x0D, 0x90 }, { 0x0F, 0x87 }, { 0x20, 0x8D }, { 0x21, 0x8D },
+	{ 0x24, 0x05 }, { 0x26, 0x05 }, { 0x28, 0x05 }, { 0x2A, 0x05 },
+	{ 0x2D, 0x28 }, { 0x2F, 0x28 }, { 0x30, 0x32 }, { 0x31, 0x32 },
+	{ 0x37, 0x80 }, { 0x38, 0x30 }, { 0x39, 0xA8 }, { 0x46, 0x48 },
+	{ 0x47, 0x48 }, { 0x6B, 0x10 }, { 0x6F, 0x02 }, { 0x74, 0x2B },
+	{ 0x80, 0x1A }, { 0xFE, 0x40 }, { 0x93, 0x10 }, { 0x16, 0x00 },
+	{ 0x85, 0x07 }, { 0x84, 0x01 }, { 0x86, 0x0F }, { 0x87, 0x05 },
+	{ 0x8C, 0x00 }, { 0x88, 0x2E }, { 0x89, 0x2E }, { 0x8B, 0x09 },
+	{ 0x95, 0x00 }, { 0x91, 0x00 }, { 0x90, 0x00 }, { 0x8D, 0xD0 },
+	{ 0x8A, 0x03 }, { 0xFE, 0xA0 }, { 0x13, 0x00 }, { 0x33, 0x00 },
+	{ 0x0B, 0x33 }, { 0x36, 0x1E }, { 0x31, 0x88 }, { 0x32, 0x88 },
+	{ 0x37, 0xF1 }, { 0xFE, 0x50 }, { 0x00, 0x00 }, { 0x01, 0x00 },
+	{ 0x02, 0x00 }, { 0x03, 0xE9 }, { 0x04, 0x00 }, { 0x05, 0xF6 },
+	{ 0x06, 0x01 }, { 0x07, 0x2C }, { 0x08, 0x01 }, { 0x09, 0x62 },
+	{ 0x0A, 0x01 }, { 0x0B, 0x98 }, { 0x0C, 0x01 }, { 0x0D, 0xBF },
+	{ 0x0E, 0x01 }, { 0x0F, 0xF6 }, { 0x10, 0x02 }, { 0x11, 0x24 },
+	{ 0x12, 0x02 }, { 0x13, 0x4E }, { 0x14, 0x02 }, { 0x15, 0x70 },
+	{ 0x16, 0x02 }, { 0x17, 0xAF }, { 0x18, 0x02 }, { 0x19, 0xE2 },
+	{ 0x1A, 0x03 }, { 0x1B, 0x1F }, { 0x1C, 0x03 }, { 0x1D, 0x52 },
+	{ 0x1E, 0x03 }, { 0x1F, 0x82 }, { 0x20, 0x03 }, { 0x21, 0xB6 },
+	{ 0x22, 0x03 }, { 0x23, 0xF0 }, { 0x24, 0x04 }, { 0x25, 0x1F },
+	{ 0x26, 0x04 }, { 0x27, 0x37 }, { 0x28, 0x04 }, { 0x29, 0x59 },
+	{ 0x2A, 0x04 }, { 0x2B, 0x68 }, { 0x30, 0x04 }, { 0x31, 0x85 },
+	{ 0x32, 0x04 }, { 0x33, 0xA2 }, { 0x34, 0x04 }, { 0x35, 0xBC },
+	{ 0x36, 0x04 }, { 0x37, 0xD8 }, { 0x38, 0x04 }, { 0x39, 0xF4 },
+	{ 0x3A, 0x05 }, { 0x3B, 0x0E }, { 0x40, 0x05 }, { 0x41, 0x13 },
+	{ 0x42, 0x05 }, { 0x43, 0x1F }, { 0x44, 0x05 }, { 0x45, 0x1F },
+	{ 0x46, 0x00 }, { 0x47, 0x00 }, { 0x48, 0x01 }, { 0x49, 0x43 },
+	{ 0x4A, 0x01 }, { 0x4B, 0x4C }, { 0x4C, 0x01 }, { 0x4D, 0x6F },
+	{ 0x4E, 0x01 }, { 0x4F, 0x92 }, { 0x50, 0x01 }, { 0x51, 0xB5 },
+	{ 0x52, 0x01 }, { 0x53, 0xD4 }, { 0x58, 0x02 }, { 0x59, 0x06 },
+	{ 0x5A, 0x02 }, { 0x5B, 0x33 }, { 0x5C, 0x02 }, { 0x5D, 0x59 },
+	{ 0x5E, 0x02 }, { 0x5F, 0x7D }, { 0x60, 0x02 }, { 0x61, 0xBD },
+	{ 0x62, 0x02 }, { 0x63, 0xF7 }, { 0x64, 0x03 }, { 0x65, 0x31 },
+	{ 0x66, 0x03 }, { 0x67, 0x63 }, { 0x68, 0x03 }, { 0x69, 0x9D },
+	{ 0x6A, 0x03 }, { 0x6B, 0xD2 }, { 0x6C, 0x04 }, { 0x6D, 0x05 },
+	{ 0x6E, 0x04 }, { 0x6F, 0x38 }, { 0x70, 0x04 }, { 0x71, 0x51 },
+	{ 0x72, 0x04 }, { 0x73, 0x70 }, { 0x74, 0x04 }, { 0x75, 0x85 },
+	{ 0x76, 0x04 }, { 0x77, 0xA1 }, { 0x78, 0x04 }, { 0x79, 0xC0 },
+	{ 0x7A, 0x04 }, { 0x7B, 0xD8 }, { 0x7C, 0x04 }, { 0x7D, 0xF2 },
+	{ 0x7E, 0x05 }, { 0x7F, 0x10 }, { 0x80, 0x05 }, { 0x81, 0x21 },
+	{ 0x82, 0x05 }, { 0x83, 0x2E }, { 0x84, 0x05 }, { 0x85, 0x3A },
+	{ 0x86, 0x05 }, { 0x87, 0x3E }, { 0x88, 0x00 }, { 0x89, 0x00 },
+	{ 0x8A, 0x01 }, { 0x8B, 0x86 }, { 0x8C, 0x01 }, { 0x8D, 0x8F },
+	{ 0x8E, 0x01 }, { 0x8F, 0xB3 }, { 0x90, 0x01 }, { 0x91, 0xD7 },
+	{ 0x92, 0x01 }, { 0x93, 0xFB }, { 0x94, 0x02 }, { 0x95, 0x18 },
+	{ 0x96, 0x02 }, { 0x97, 0x4F }, { 0x98, 0x02 }, { 0x99, 0x7E },
+	{ 0x9A, 0x02 }, { 0x9B, 0xA6 }, { 0x9C, 0x02 }, { 0x9D, 0xCF },
+	{ 0x9E, 0x03 }, { 0x9F, 0x14 }, { 0xA4, 0x03 }, { 0xA5, 0x52 },
+	{ 0xA6, 0x03 }, { 0xA7, 0x93 }, { 0xAC, 0x03 }, { 0xAD, 0xCF },
+	{ 0xAE, 0x04 }, { 0xAF, 0x08 }, { 0xB0, 0x04 }, { 0xB1, 0x42 },
+	{ 0xB2, 0x04 }, { 0xB3, 0x7F }, { 0xB4, 0x04 }, { 0xB5, 0xB4 },
+	{ 0xB6, 0x04 }, { 0xB7, 0xCC }, { 0xB8, 0x04 }, { 0xB9, 0xF2 },
+	{ 0xBA, 0x05 }, { 0xBB, 0x0C }, { 0xBC, 0x05 }, { 0xBD, 0x26 },
+	{ 0xBE, 0x05 }, { 0xBF, 0x4B }, { 0xC0, 0x05 }, { 0xC1, 0x64 },
+	{ 0xC2, 0x05 }, { 0xC3, 0x83 }, { 0xC4, 0x05 }, { 0xC5, 0xA1 },
+	{ 0xC6, 0x05 }, { 0xC7, 0xBA }, { 0xC8, 0x05 }, { 0xC9, 0xC4 },
+	{ 0xCA, 0x05 }, { 0xCB, 0xD5 }, { 0xCC, 0x05 }, { 0xCD, 0xD5 },
+	{ 0xCE, 0x00 }, { 0xCF, 0xCE }, { 0xD0, 0x00 }, { 0xD1, 0xDB },
+	{ 0xD2, 0x01 }, { 0xD3, 0x32 }, { 0xD4, 0x01 }, { 0xD5, 0x3B },
+	{ 0xD6, 0x01 }, { 0xD7, 0x74 }, { 0xD8, 0x01 }, { 0xD9, 0x7D },
+	{ 0xFE, 0x60 }, { 0x00, 0xCC }, { 0x01, 0x0F }, { 0x02, 0xFF },
+	{ 0x03, 0x01 }, { 0x04, 0x00 }, { 0x05, 0x02 }, { 0x06, 0x00 },
+	{ 0x07, 0x00 }, { 0x09, 0xC4 }, { 0x0A, 0x00 }, { 0x0B, 0x04 },
+	{ 0x0C, 0x01 }, { 0x0D, 0x00 }, { 0x0E, 0x04 }, { 0x0F, 0x00 },
+	{ 0x10, 0x71 }, { 0x12, 0xC4 }, { 0x13, 0x00 }, { 0x14, 0x04 },
+	{ 0x15, 0x01 }, { 0x16, 0x00 }, { 0x17, 0x06 }, { 0x18, 0x00 },
+	{ 0x19, 0x71 }, { 0x1B, 0xC4 }, { 0x1C, 0x00 }, { 0x1D, 0x02 },
+	{ 0x1E, 0x00 }, { 0x1F, 0x00 }, { 0x20, 0x08 }, { 0x21, 0x66 },
+	{ 0x22, 0xB4 }, { 0x24, 0xC4 }, { 0x25, 0x00 }, { 0x26, 0x02 },
+	{ 0x27, 0x00 }, { 0x28, 0x00 }, { 0x29, 0x07 }, { 0x2A, 0x66 },
+	{ 0x2B, 0xB4 }, { 0x2F, 0xC4 }, { 0x30, 0x00 }, { 0x31, 0x04 },
+	{ 0x32, 0x01 }, { 0x33, 0x00 }, { 0x34, 0x03 }, { 0x35, 0x00 },
+	{ 0x36, 0x71 }, { 0x38, 0xC4 }, { 0x39, 0x00 }, { 0x3A, 0x04 },
+	{ 0x3B, 0x01 }, { 0x3D, 0x00 }, { 0x3F, 0x05 }, { 0x40, 0x00 },
+	{ 0x41, 0x71 }, { 0x83, 0xCE }, { 0x84, 0x02 }, { 0x85, 0x20 },
+	{ 0x86, 0xDC }, { 0x87, 0x00 }, { 0x88, 0x04 }, { 0x89, 0x00 },
+	{ 0x8A, 0xBB }, { 0x8B, 0x80 }, { 0xC7, 0x0E }, { 0xC8, 0x05 },
+	{ 0xC9, 0x1F }, { 0xCA, 0x06 }, { 0xCB, 0x00 }, { 0xCC, 0x03 },
+	{ 0xCD, 0x04 }, { 0xCE, 0x1F }, { 0xCF, 0x1F }, { 0xD0, 0x1F },
+	{ 0xD1, 0x1F }, { 0xD2, 0x1F }, { 0xD3, 0x1F }, { 0xD4, 0x1F },
+	{ 0xD5, 0x1F }, { 0xD6, 0x1F }, { 0xD7, 0x17 }, { 0xD8, 0x1F },
+	{ 0xD9, 0x16 }, { 0xDA, 0x1F }, { 0xDB, 0x0E }, { 0xDC, 0x01 },
+	{ 0xDD, 0x1F }, { 0xDE, 0x02 }, { 0xDF, 0x00 }, { 0xE0, 0x03 },
+	{ 0xE1, 0x04 }, { 0xE2, 0x1F }, { 0xE3, 0x1F }, { 0xE4, 0x1F },
+	{ 0xE5, 0x1F }, { 0xE6, 0x1F }, { 0xE7, 0x1F }, { 0xE8, 0x1F },
+	{ 0xE9, 0x1F }, { 0xEA, 0x1F }, { 0xEB, 0x17 }, { 0xEC, 0x1F },
+	{ 0xED, 0x16 }, { 0xEE, 0x1F }, { 0xEF, 0x03 }, { 0xFE, 0x70 },
+	{ 0x5A, 0x0B }, { 0x5B, 0x0B }, { 0x5C, 0x55 }, { 0x5D, 0x24 },
+	{ 0xFE, 0x90 }, { 0x12, 0x24 }, { 0x13, 0x49 }, { 0x14, 0x92 },
+	{ 0x15, 0x86 }, { 0x16, 0x61 }, { 0x17, 0x18 }, { 0x18, 0x24 },
+	{ 0x19, 0x49 }, { 0x1A, 0x92 }, { 0x1B, 0x86 }, { 0x1C, 0x61 },
+	{ 0x1D, 0x18 }, { 0x1E, 0x24 }, { 0x1F, 0x49 }, { 0x20, 0x92 },
+	{ 0x21, 0x86 }, { 0x22, 0x61 }, { 0x23, 0x18 }, { 0xFE, 0x40 },
+	{ 0x0E, 0x10 }, { 0xFE, 0xA0 }, { 0x04, 0x80 }, { 0x16, 0x00 },
+	{ 0x26, 0x10 }, { 0x2F, 0x37 }, { 0xFE, 0xD0 }, { 0x06, 0x0F },
+	{ 0x4B, 0x00 }, { 0x56, 0x4A }, { 0xFE, 0x00 }, { 0xC2, 0x09 },
+	{ 0x35, 0x00 }, { 0xFE, 0x70 }, { 0x7D, 0x61 }, { 0x7F, 0x00 },
+	{ 0x7E, 0x4E }, { 0x52, 0x2C }, { 0x49, 0x00 }, { 0x4A, 0x00 },
+	{ 0x4B, 0x00 }, { 0x4C, 0x00 }, { 0x4D, 0xE8 }, { 0x4E, 0x25 },
+	{ 0x4F, 0x6E }, { 0x50, 0xAE }, { 0x51, 0x2F }, { 0xAD, 0xF4 },
+	{ 0xAE, 0x8F }, { 0xAF, 0x00 }, { 0xB0, 0x54 }, { 0xB1, 0x3A },
+	{ 0xB2, 0x00 }, { 0xB3, 0x00 }, { 0xB4, 0x00 }, { 0xB5, 0x00 },
+	{ 0xB6, 0x18 }, { 0xB7, 0x30 }, { 0xB8, 0x4A }, { 0xB9, 0x98 },
+	{ 0xBA, 0x30 }, { 0xBB, 0x60 }, { 0xBC, 0x50 }, { 0xBD, 0x00 },
+	{ 0xBE, 0x00 }, { 0xBF, 0x39 }, { 0xFE, 0x00 }, { 0x51, 0x66 },
+};
+
 static int visionox_rm69299_prepare(struct drm_panel *panel)
 {
 	struct visionox_rm69299 *ctx = panel_to_ctx(panel);
-	int ret;
+	int ret, i;
 
 	ret = visionox_rm69299_power_on(ctx);
 	if (ret < 0)
@@ -92,28 +212,48 @@ static int visionox_rm69299_prepare(struct drm_panel *panel)
 
 	ctx->dsi->mode_flags |= MIPI_DSI_MODE_LPM;
 
-	ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]) { 0xfe, 0x00 }, 2);
-	if (ret < 0) {
-		dev_err(ctx->panel.dev, "cmd set tx 0 failed, ret = %d\n", ret);
-		goto power_off;
-	}
-
-	ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]) { 0xc2, 0x08 }, 2);
-	if (ret < 0) {
-		dev_err(ctx->panel.dev, "cmd set tx 1 failed, ret = %d\n", ret);
-		goto power_off;
-	}
-
-	ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]) { 0x35, 0x00 }, 2);
-	if (ret < 0) {
-		dev_err(ctx->panel.dev, "cmd set tx 2 failed, ret = %d\n", ret);
-		goto power_off;
-	}
-
-	ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]) { 0x51, 0xff }, 2);
-	if (ret < 0) {
-		dev_err(ctx->panel.dev, "cmd set tx 3 failed, ret = %d\n", ret);
-		goto power_off;
+	if (ctx->mode == VISIONOX_RM69299_MODE_1080X2160_60HZ) {
+		for (i = 0; i < VISIONOX_RM69299_SHIFT_INIT_SEQ_LEN; i++) {
+			ret = mipi_dsi_dcs_write_buffer(ctx->dsi,
+				visionox_rm69299_1080x2248_60hz_init_seq[i], 2);
+			if (ret < 0) {
+				dev_err(ctx->panel.dev,
+					"cmd set tx 0 failed, ret = %d\n", ret);
+				return ret;
+			}
+		}
+	} else {
+		ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]){ 0xfe, 0x00 },
+						2);
+		if (ret < 0) {
+			dev_err(ctx->panel.dev,
+				"cmd set tx 0 failed, ret = %d\n", ret);
+			return ret;
+		}
+
+		ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]){ 0xc2, 0x08 },
+						2);
+		if (ret < 0) {
+			dev_err(ctx->panel.dev,
+				"cmd set tx 1 failed, ret = %d\n", ret);
+			return ret;
+		}
+
+		ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]){ 0x35, 0x00 },
+						2);
+		if (ret < 0) {
+			dev_err(ctx->panel.dev,
+				"cmd set tx 2 failed, ret = %d\n", ret);
+			return ret;
+		}
+
+		ret = mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]){ 0x51, 0xff },
+						2);
+		if (ret < 0) {
+			dev_err(ctx->panel.dev,
+				"cmd set tx 3 failed, ret = %d\n", ret);
+			return ret;
+		}
 	}
 
 	ret = mipi_dsi_dcs_write(ctx->dsi, MIPI_DCS_EXIT_SLEEP_MODE, NULL, 0);
@@ -154,14 +294,38 @@ static const struct drm_display_mode visionox_rm69299_1080x2248_60hz = {
 	.flags = 0,
 };
 
+static const struct drm_display_mode visionox_rm69299_1080x2160_60hz = {
+	.clock = 158695,
+	.hdisplay = 1080,
+	.hsync_start = 1080 + 26,
+	.hsync_end = 1080 + 26 + 2,
+	.htotal = 1080 + 26 + 2 + 36,
+	.vdisplay = 2160,
+	.vsync_start = 2160 + 8,
+	.vsync_end = 2160 + 8 + 4,
+	.vtotal = 2160 + 8 + 4 + 4,
+	.flags = 0,
+};
+
 static int visionox_rm69299_get_modes(struct drm_panel *panel,
 				      struct drm_connector *connector)
 {
 	struct visionox_rm69299 *ctx = panel_to_ctx(panel);
+	const struct drm_display_mode *panel_mode;
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev,
-				  &visionox_rm69299_1080x2248_60hz);
+	switch (ctx->mode) {
+	case VISIONOX_RM69299_MODE_1080X2248_60HZ:
+		panel_mode = &visionox_rm69299_1080x2248_60hz;
+		break;
+	case VISIONOX_RM69299_MODE_1080X2160_60HZ:
+		panel_mode = &visionox_rm69299_1080x2160_60hz;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	mode = drm_mode_duplicate(connector->dev, panel_mode);
 	if (!mode) {
 		dev_err(ctx->panel.dev, "failed to create a new display mode\n");
 		return 0;
@@ -191,6 +355,8 @@ static int visionox_rm69299_probe(struct mipi_dsi_device *dsi)
 	if (!ctx)
 		return -ENOMEM;
 
+	ctx->mode = (enum visionox_rm69299_modes)device_get_match_data(dev);
+
 	mipi_dsi_set_drvdata(dsi, ctx);
 
 	ctx->dsi = dsi;
@@ -240,7 +406,10 @@ static void visionox_rm69299_remove(struct mipi_dsi_device *dsi)
 }
 
 static const struct of_device_id visionox_rm69299_of_match[] = {
-	{ .compatible = "visionox,rm69299-1080p-display", },
+	{ .compatible = "visionox,rm69299-1080p-display",
+	  .data = (void *)VISIONOX_RM69299_MODE_1080X2248_60HZ },
+	{ .compatible = "visionox,rm69299-shift",
+	  .data = (void *)VISIONOX_RM69299_MODE_1080X2160_60HZ },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, visionox_rm69299_of_match);

-- 
2.34.1

