Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B39A365A4E8
	for <lists+dri-devel@lfdr.de>; Sat, 31 Dec 2022 15:27:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76BD210E02B;
	Sat, 31 Dec 2022 14:27:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6C3710E02B
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Dec 2022 14:27:30 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 fm16-20020a05600c0c1000b003d96fb976efso15351400wmb.3
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Dec 2022 06:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VtovjFbpNrrJC+tTeD4MlQddSoN69F0yZoac9F9bQi0=;
 b=Lrr38/Y60W7DN0if/geXJh4j+Q2PtT7ixBA/cqXrBamdfKn2j2bmYI5vxaYiYamg/U
 3uLGuOdR8zup6qsxsjKqvKyRUD6v9mTEfuyT1hi8qdQEaXgRyqxMX+Vm4VFqkclLaCZm
 kGUm7pxiCZMHc9KF0lvw6DNKKTAh/+GD5+SfvXuPqLv+MTYu7NadpC67tpKo30YJ7eKj
 m7LumKtae0WgD1Wk90nRpxJRi2VyrYuX199pdZT94ScZTPcXumfuvWPYplv2lLsEw9c5
 eQrf2gXRA7+rMwZykIjlh5xgsQDBcszS/Gsd86uWrxA/VLqXHrgaF5IktNN9Tk1G5WOk
 qRuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VtovjFbpNrrJC+tTeD4MlQddSoN69F0yZoac9F9bQi0=;
 b=fZiJQ0b9lKEnjLF3NPCTEHhtnzAqMJ7IQSUM040BU/SjMlzlmesTxfEC9731vRX90N
 KaFu8z3c1U+crgrzqoClgWJg5lRJXEXhFhAGT6O+K9k87n4PnJ2tByxZ0fgvnHa31usw
 rqh2KnmR8seYqOAilShS2oCBCJPHGMDy+eOlPVjtPFM5+vSdyQsh8rAZNaEa6dkLzgX2
 AIlHf1LLZLoyOB+O487ckHlMSpn0JhYWMZiEhuhx5vW5cFpPzULnn8T+Mtp7tuDcnK0A
 LJYBhqPdGHO94MRFQ1mQJ8+yi66srrHusHZ0yVhwG9zJaKUelXSesAcDvPiUcs82hdQu
 x2FA==
X-Gm-Message-State: AFqh2koQ06YP+MNV56CUZmW5GcBUHqexYXNoQBzCIwNwf5iZ9nerUQMF
 1rKDnp6wmN3r2RV0n0E9pROecw==
X-Google-Smtp-Source: AMrXdXsGss0K1YKS6YAbGVQWHOwoui+21Zkk8ItLoec+rqhWxAjmZGtnSMSeaj3ter0pA7UCOFpnPg==
X-Received: by 2002:a1c:790a:0:b0:3d6:b691:b814 with SMTP id
 l10-20020a1c790a000000b003d6b691b814mr24817611wme.1.1672496849351; 
 Sat, 31 Dec 2022 06:27:29 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99]) by smtp.gmail.com with ESMTPSA id
 bg12-20020a05600c3c8c00b003d1e34bcbb2sm35729697wmb.13.2022.12.31.06.27.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Dec 2022 06:27:28 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
To: Douglas Anderson <dianders@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Steev Klimaszewski <steev@kali.org>
Subject: [PATCH 1/2] drm/panel-edp: fix name for IVO product id 854b
Date: Sat, 31 Dec 2022 16:27:20 +0200
Message-Id: <20221231142721.338643-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Johan Hovold <johan@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The actual name is R133NW4K-R0.

Fixes: 0f9fa5f58c784 ("drm/panel-edp: add IVO M133NW4J-R3 panel entry")
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---

Assuming the information from here is correct:
https://raw.githubusercontent.com/linuxhw/EDID/master/DigitalDisplay.md

 drivers/gpu/drm/panel/panel-edp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 5cb8dc2ebe18..ef70928c3ccb 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1891,7 +1891,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1247, &delay_200_500_e80_d50, "N120ACA-EA1"),
 
 	EDP_PANEL_ENTRY('I', 'V', 'O', 0x057d, &delay_200_500_e200, "R140NWF5 RH"),
-	EDP_PANEL_ENTRY('I', 'V', 'O', 0x854b, &delay_200_500_p2e100, "M133NW4J-R3"),
+	EDP_PANEL_ENTRY('I', 'V', 'O', 0x854b, &delay_200_500_p2e100, "R133NW4K-R0"),
 
 	EDP_PANEL_ENTRY('K', 'D', 'B', 0x0624, &kingdisplay_kd116n21_30nv_a010.delay, "116N21-30NV-A010"),
 	EDP_PANEL_ENTRY('K', 'D', 'B', 0x1120, &delay_200_500_e80_d50, "116N29-30NK-C007"),
-- 
2.34.1

