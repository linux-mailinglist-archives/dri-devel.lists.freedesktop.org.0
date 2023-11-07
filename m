Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 553C17E4A04
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 21:46:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB3CB10E150;
	Tue,  7 Nov 2023 20:46:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE49610E150
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 20:46:20 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-1efabc436e4so3572846fac.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Nov 2023 12:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1699389980; x=1699994780;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i41FF+96jxQO4vU9afEGpgkE+iKipgdZiL7y6ifmJls=;
 b=PiR7dwXK5FW/ltqnaqGHAD1ga4ftgSI9cB7vvqUzk3txFLr7XP3VOUATmQl6GnhVov
 NH108DCUDwtl3rZqp62fj2FxlXgCo59f8Z0cNvHnEwoUPmg8AtLVyZT0K32g4SOAYaDb
 4kJ6zM1sdjsgKSFCrvcueZvxga/lzs1qKoyeA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699389980; x=1699994780;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i41FF+96jxQO4vU9afEGpgkE+iKipgdZiL7y6ifmJls=;
 b=R+bO3waIHi5jE1TYNtAdFR/vgq4+EV0LJKmG8G1jkRAjgJ5zde1JkQJkRSnJsqzk4d
 Nfls1Y1UccCb/gmH+YOMlXLAPGGl7jEfa81Ho1m4UqC+yqroZFrUjPc5CvmKN70+AaJj
 +msBp+VkEae+2jQJ7PY+BLjYBX2hGYxHzCf8UeC/utP8eB9xJz78oFnAn/LM5XNG9ucW
 O90AcBXmxNT2jnUi+lqXBF2OZI9l6hi55P39qtc3WwHMIPZmO0uQ96ypF4ban7Cuiz/9
 zTfYDy4rPPyaKRSqaX3Rte5dQRgbnliC13XIvOmeErv1jC3g/rJRJtBky8AINTv9HW8f
 GBWg==
X-Gm-Message-State: AOJu0YwsDBnxaw+JR8cCYlIboFPNWOlKuloLGoO1z1xHhfj22VgP1L1u
 nPaDRMvJPJu3uVYau91ygHucuw==
X-Google-Smtp-Source: AGHT+IEOYtRda4YV3C9U3Tghr/ogU7feGJsqqa94Akf8g04V9mLzXLDXBiz0ZBVMNFxEnBunA5AcfA==
X-Received: by 2002:a05:6870:4c85:b0:1ea:131f:5fb7 with SMTP id
 pi5-20020a0568704c8500b001ea131f5fb7mr4815336oab.26.1699389979943; 
 Tue, 07 Nov 2023 12:46:19 -0800 (PST)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:586c:80a1:e007:beb9])
 by smtp.gmail.com with ESMTPSA id
 e7-20020a630f07000000b005ab46970aaasm1750211pgl.17.2023.11.07.12.46.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Nov 2023 12:46:19 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v6 2/5] drm/panel-edp: drm/panel-edp: Fix AUO B116XTN02 name
Date: Tue,  7 Nov 2023 12:41:52 -0800
Message-ID: <20231107204611.3082200-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
In-Reply-To: <20231107204611.3082200-1-hsinyi@chromium.org>
References: <20231107204611.3082200-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, stable@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rename AUO 0x235c B116XTN02 to B116XTN02.3 according to decoding edid.

Fixes: 3db2420422a5 ("drm/panel-edp: Add AUO B116XTN02, BOE NT116WHM-N21,836X2, NV116WHM-N49 V8.0")
Cc: stable@vger.kernel.org
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
v5->v6: split to 2 patches.
---
 drivers/gpu/drm/panel/panel-edp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 2fba7c1f49ce..d41d205f7f5b 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1871,7 +1871,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x145c, &delay_200_500_e50, "B116XAB01.4"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x1e9b, &delay_200_500_e50, "B133UAN02.1"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x1ea5, &delay_200_500_e50, "B116XAK01.6"),
-	EDP_PANEL_ENTRY('A', 'U', 'O', 0x235c, &delay_200_500_e50, "B116XTN02"),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0x235c, &delay_200_500_e50, "B116XTN02.3"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B116XAK01.0"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x582d, &delay_200_500_e50, "B133UAN01.0"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x615c, &delay_200_500_e50, "B116XAN06.1"),
-- 
2.42.0.869.gea05f2083d-goog

