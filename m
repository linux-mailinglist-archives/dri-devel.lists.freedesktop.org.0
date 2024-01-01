Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E67821558
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jan 2024 22:00:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E002910E0FB;
	Mon,  1 Jan 2024 21:00:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80C0910E0FB
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jan 2024 21:00:26 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-50e835800adso4954867e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jan 2024 13:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704142824; x=1704747624; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ZKO7t2hG9wQZbOuOZ2OBdmSsh90rgqQlCZCF6Y6YFcg=;
 b=BipKakr0eyteNrgemu2izjL6aWyFuJ+L7A/bNO9IVkjmPGVgd7qKPzQsfoupAc7xXE
 AHQ9TItNVCujLETsf92QdsnN8uTCnH/Di1c7uyXdF0aHp73rpSo2HWjzOAYNRjM8Z2Cy
 rTZJ6/c4jt8SOdtbPtHRAMPNCj9zUtmsFfPiRZlU8my3xTVjgupkWf8CS9NZzi1+jADR
 O8aP1EXvei/YYKZtqZu+pVCVeR+9wHbrrJLzzwzhF5bX6bYskbRpYXhnwmaJ7kcmTQf3
 uO5DzPc1OCnCnHZ3P2ev4pbpqKAR4rexLxTzbwJLnFaxeAzw8+OWic8ILO/3wO7LMsk9
 66YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704142824; x=1704747624;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZKO7t2hG9wQZbOuOZ2OBdmSsh90rgqQlCZCF6Y6YFcg=;
 b=YG6SEU91fUwLC8fMcdejzCjfQMhi8jjzp8YWW8wsV61cODDX+ixx2CSZo/hX5hSv+A
 vvHSE7GygsmC1Th5KYS9XqybobSk3H5WhhNiqxoj7FnWoXU3Hsr04QNBh7UlWQLhhm4T
 j0+yuY6NShZUPIejzBB4kIxHaPHR8gAFb/1eRmNlPHKzNKfeSRnXzJr7PqH+JU/2HtQA
 hCVlAuScb+lIUCVMqlr9IEFEh7bi5zCvfx0XQX+6uY+KwkDwsQiAIQo+8N9hg4+hYle8
 Gr1gbErfXf3W0X2IsaXSsXRvuSTjXa14elg0Vc+jEurc+vfZb3BBM2MN9t56R/i3iMZM
 RhoQ==
X-Gm-Message-State: AOJu0YzKvOT/ybYI2SKa287PiOIzMuisJujUw//KnXx2Ojmr14mDj3Vz
 Q0muE/xIQJNXQdNGsrzE60k=
X-Google-Smtp-Source: AGHT+IE86fSR+lttAonljpboKktMB8Ji41vcG9rV4MNjyxOno5Zp8U6svFT8fnkFNZxZ561m0wvtBA==
X-Received: by 2002:a05:6512:33d5:b0:50e:7e1c:9049 with SMTP id
 d21-20020a05651233d500b0050e7e1c9049mr4083434lfg.70.1704142824646; 
 Mon, 01 Jan 2024 13:00:24 -0800 (PST)
Received: from hex.my.domain (83.11.207.119.ipv4.supernova.orange.pl.
 [83.11.207.119]) by smtp.gmail.com with ESMTPSA id
 i15-20020a05640200cf00b0055404e08589sm15122045edu.85.2024.01.01.13.00.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jan 2024 13:00:23 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Mon, 01 Jan 2024 22:00:16 +0100
Subject: [PATCH 2/2] drm/panel: samsung-s6d7aa0: drop DRM_BUS_FLAG_DE_HIGH
 for lsl080al02
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240101-tab3-display-fixes-v1-2-887ba4dbd16b@gmail.com>
References: <20240101-tab3-display-fixes-v1-0-887ba4dbd16b@gmail.com>
In-Reply-To: <20240101-tab3-display-fixes-v1-0-887ba4dbd16b@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704142819; l=1047;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=pg28sLvX5GdC5bOF/yyzGASGCCoIgKs1qHIpKvHG7pQ=;
 b=V1bj5lEkTVkRcuqmS/0vog/IRKcLOnQ/VyKrfKyWkMBtEXBwTIYRhz1D8Isd2VzvjtsLbDXb0
 DvkWU1R5FlRBed5qaJ/SpcpwyEMKCETBnjzMpeIDR9/2JAqKyROVfsf
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Artur Weber <aweber.kernel@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It turns out that I had misconfigured the device I was using the panel
with; the bus data polarity is not high for this panel, I had to change
the config on the display controller's side.

Fix the panel config to properly reflect its accurate settings.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
index ea5a85779382..f23d8832a1ad 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
@@ -309,7 +309,7 @@ static const struct s6d7aa0_panel_desc s6d7aa0_lsl080al02_desc = {
 	.off_func = s6d7aa0_lsl080al02_off,
 	.drm_mode = &s6d7aa0_lsl080al02_mode,
 	.mode_flags = MIPI_DSI_MODE_VSYNC_FLUSH | MIPI_DSI_MODE_VIDEO_NO_HFP,
-	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
+	.bus_flags = 0,
 
 	.has_backlight = false,
 	.use_passwd3 = false,

-- 
2.43.0

