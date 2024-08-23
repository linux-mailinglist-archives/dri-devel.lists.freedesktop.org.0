Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEF595CC3A
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 14:16:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 103CE10E549;
	Fri, 23 Aug 2024 12:16:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fmdc1PIx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90FAB10E549
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 12:16:54 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-5bef295a2b4so3131673a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 05:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724415413; x=1725020213; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=k4jqcyPYPviNvzc22wHcy+G7CO3Izw5qaIhoXnNG/Do=;
 b=fmdc1PIxskSNtYM3m3WuYcD5tMtEmB2NbTGj2HDo3mND74u5M01FggWo/7eGO0v3Zx
 wtiTWzwe9r7wSqtt86aD2NGE+f27bO6zUD73UxcXnr2E1TpM7XxtyzaEmLsoq+RL+8qX
 AWtFwfy7sK96AVHrJkWASGW3gsGUFHrUKs+QX2jQ9faVeGlwFt888H2qDiGDG7GDSHWU
 t2A9/Ru2+cQqCjyZBfeJxFHSFQ5E0uW6r2XHbz3mc+i0Dn1mOdicRj9mCZliMQO3Zg+j
 e9XcycY7E7s/chWGzFkLeplRiuSY6LiYmWzH2mJDQIWGBrDf6yB3PxvV8ppXBIfedT0g
 nN7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724415413; x=1725020213;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k4jqcyPYPviNvzc22wHcy+G7CO3Izw5qaIhoXnNG/Do=;
 b=fqAJXZ73oW5cuptcaRPck8fvuGc6UbNQnPU7vAssPStNReLNvkBSgLV3Cee/FiYwxC
 hsV04VhgAMElC8VauanJ/aoZgu+WM7AxDW+IX3wKOZzcCgrgsJ7Mz52AQorOV9jK7qqr
 MGXdsPW+Cs1j81vQAUCkR/UpU8LFUTBvhh3XxQlHkkWUJWclHDmFcYC47UZE7YZk94wg
 mt8C/HQKqKhMvlDR1OlvnzLtJdvdsnGPQ0zrYLkzGzYz1H0G1vOHm5RR9UhjGlwYR/Tw
 iLN5xmHqJjTDvQ5foT49JIb2W0HFcbFD/SQ4rmmhWs3UHGdVA3E02ivTt5m94dk+GD24
 1doQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGR293fD9GwfhEtuTndUXsjZJXnt38OO3AZUHWEGEA2EioPfxBlss5n0MuEfK2wmFKiNkwBHLLmOQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwbCEcvHII5Hvfn4lbFOIiOIOfNqMQwNmTD0tJiK5AFX+da/JJI
 7GJcUYPmyEqcdhhZWKliNgkkud7se1tJ9BxZOTGmr158rPBQ3CrzRLkQJK31FJA=
X-Google-Smtp-Source: AGHT+IG92QLTsCPe+kjIiyPB4rgSuURcZx+5MoV2DAob+IU0NbCTX+8Mz4OYOAHiDABjZnejlhmBTQ==
X-Received: by 2002:a05:6402:4022:b0:5c0:8ea7:3971 with SMTP id
 4fb4d7f45d1cf-5c08ea73a22mr986178a12.18.1724415412747; 
 Fri, 23 Aug 2024 05:16:52 -0700 (PDT)
Received: from [127.0.1.1] ([82.79.186.176]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c044ddc6afsm1993346a12.14.2024.08.23.05.16.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2024 05:16:52 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Fri, 23 Aug 2024 15:16:46 +0300
Subject: [PATCH] drm/panel-edp: add BOE NE140WUM-N6G panel entry
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240823-drm-panel-edp-add-boe-ne140wum-n6g-v1-1-7bdd3c003514@linaro.org>
X-B4-Tracking: v=1; b=H4sIAK19yGYC/x3NywrCMBBG4Vcps3YgjWmpvoq4GJ0/dcCmIcELl
 L67weW3OWejimKodO42KnhbtTU19IeO7g9JM9i0mbzzwU3+yFoWzpLwZGhmUeXbCk7og/u8Fk7
 jzBhiHMMwyUmFWigXRPv+J5frvv8A5pjWkHQAAAA=
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1309; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=4DC97yxJeXEdzHMLZMXkYAU0ZNbEVEeDGKGhuV0RtgM=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmyH2vnRgfiMfes4bKqmJ6e6TiZhJL98fXzERjX
 CZ/gJuW0dWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZsh9rwAKCRAbX0TJAJUV
 Vun7EACiWpqGOOnI1lmm2WvxDcohOKf67CM5K6lRzUpHawdGBVSaQV/QOgFO05xyoEBsBbWenE4
 Co1OCcUflDJ14EzhqRG0pnkmVnRUfCr4skiGbtSVXsag5AluGkER+TpZpWNlBFkTH5K+n8Cpves
 vPzGfEjZGfX/QZbo3NsSBq1NBsAWpG2BZJIfJVDDw+gIPVW2FMtyl1mKr/ysyDBAKjVkipFxLy6
 JpwsgiyA3TK9Pqpk9z1mzqtCidpEHx5lDFZERUBOMc1twUrgPsO1zGhywBSp72nBbvdkb6nv3bt
 XLCF+jawU/3n6oHaJWocc1Rq6sRQTsE1GdYeOXymvtQKO0ZlvKMb8KxRAu3Imo2730/oK1fIdqi
 9MI31AzDNZ58OWQgoHLpQp6HYqRWxlhP2xhv54I2G1Z7wVlxuawebo5tuqQnlW5dzuQ2o5RYyV0
 FdoKPoldPIrDOcU5KsxWYgFjxdyZ1oIb10jpFwoslUX6La0E2IRmdrb43lRL86W4W4iK8ZiCfh2
 eT0jUgrUuwgcPd4YWj1jlGNTQ1grQMQ+qx89Mp5FjA7wnPvV+NTdzlHgKAU5RohIl4bvnbfxtME
 IiLqyxoscRcJNhVa/syUuuQYwkNr0I1KwzdSn1kn9TOaRfNlZ/Q9b2DkzePF6bHknj1kO788lqb
 gxrlNYNN4YwrLDA==
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

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
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

