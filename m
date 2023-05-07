Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3094E6F9A8D
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 19:26:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F02CD10E2B5;
	Sun,  7 May 2023 17:26:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1224610E22A
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 17:26:42 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4f13d8f74abso4167106e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 07 May 2023 10:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683480401; x=1686072401;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OAm0fHWvZXawjpAUyRwOXQx+EvRB/1EinuOPZ1kLIwc=;
 b=gJM9tor04Arq2XU3MFDXCoytmr3TbsCM5CILB96dG7zTGH6Ax2+zaovR8tncyIXN0y
 kPhLAW1TTuGGUxQPPLthe2YL/imtLTQtYsQLq07TW04Zi5ULOD0yf7YWv5BJ6TUqMXfN
 dHpgqbtrErAcwT33JYaSpOPDB5c6Eh52SW8j9PD3o4I+7pO2s+nk+inp1cLvFR6E747l
 mc8wQUqu3jjOQlUnWNmylvSVQYZ/QxGefjCk5t5ss3hknHweEIdtg4UiFf8Ku/VBgR73
 lV7nwAhYrzltoN33cdXsAXiLerf/HX1Sxt98l2TCYf0xosmKl3jdM8kf362r3LoUY1Zh
 SYPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683480401; x=1686072401;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OAm0fHWvZXawjpAUyRwOXQx+EvRB/1EinuOPZ1kLIwc=;
 b=XTvx/CB2hDkvUiXjEVYAzuIjYCcFg0qwTsRkQrixYgxfRigm1tdNG53clCddr3VEid
 0QFe9Vzj+t1EgbdiGjAHoorT10Gcvq1zfSSRuOGbKjRhs1Wggxin7oS0Ehxl9NxWa/3z
 DVoSTN0juCScwcv2r4nS7r7DBlDK6zNRq+amrWsJot57A/dn+FSmbcWRkxo3TSWjGhRH
 0EqgDeZxaFXMiRO6ydkf0T/rA02FwWCIsLRQhc3hbGpG9eoNKvtzz9YjjelNKoNq2U36
 sxMpEgRblTO7dgts8Syy0l289f5eiwkgQop1mtxT74HDDrX76gJxbv6Rqp21+Dv/gRvV
 0a2w==
X-Gm-Message-State: AC+VfDz2w4qSx8LwbzlfBftouBQAP/sVc+CEsgBZEbTsFSlcwKf/G6dh
 nbyQ4zmEroOAuFOjpT/PCyO8rg==
X-Google-Smtp-Source: ACHHUZ66yu9UG/L6vOqmZgfHrg7EfxR1Tb9kIfyEqyyo+vOIsKp+YhvOWwY0wppVLS9j5r12eCap5A==
X-Received: by 2002:a05:6512:517:b0:4ed:bf01:3ff3 with SMTP id
 o23-20020a056512051700b004edbf013ff3mr2261226lfb.43.1683480400934; 
 Sun, 07 May 2023 10:26:40 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::ab2]) by smtp.gmail.com with ESMTPSA id
 s17-20020ac25fb1000000b004f14898d18esm1023994lfe.85.2023.05.07.10.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 May 2023 10:26:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/2] drm/panel: sharp-ls043t1le01: drop dummy functions and
 data fields
Date: Sun,  7 May 2023 20:26:39 +0300
Message-Id: <20230507172639.2320934-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507172639.2320934-1-dmitry.baryshkov@linaro.org>
References: <20230507172639.2320934-1-dmitry.baryshkov@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop sharp_nt_panel_disable() and sharp_nt_panel_enable(), which bear no
useful code. Also drop sharp_nt_panel::enable and sharp_nt_panel::mode
fields which also provide no use now.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/panel/panel-sharp-ls043t1le01.c   | 32 -------------------
 1 file changed, 32 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
index ef148504cf24..855e64444daa 100644
--- a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
+++ b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
@@ -28,9 +28,6 @@ struct sharp_nt_panel {
 	struct gpio_desc *reset_gpio;
 
 	bool prepared;
-	bool enabled;
-
-	const struct drm_display_mode *mode;
 };
 
 static inline struct sharp_nt_panel *to_sharp_nt_panel(struct drm_panel *panel)
@@ -97,19 +94,6 @@ static int sharp_nt_panel_off(struct sharp_nt_panel *sharp_nt)
 	return 0;
 }
 
-
-static int sharp_nt_panel_disable(struct drm_panel *panel)
-{
-	struct sharp_nt_panel *sharp_nt = to_sharp_nt_panel(panel);
-
-	if (!sharp_nt->enabled)
-		return 0;
-
-	sharp_nt->enabled = false;
-
-	return 0;
-}
-
 static int sharp_nt_panel_unprepare(struct drm_panel *panel)
 {
 	struct sharp_nt_panel *sharp_nt = to_sharp_nt_panel(panel);
@@ -179,18 +163,6 @@ static int sharp_nt_panel_prepare(struct drm_panel *panel)
 	return ret;
 }
 
-static int sharp_nt_panel_enable(struct drm_panel *panel)
-{
-	struct sharp_nt_panel *sharp_nt = to_sharp_nt_panel(panel);
-
-	if (sharp_nt->enabled)
-		return 0;
-
-	sharp_nt->enabled = true;
-
-	return 0;
-}
-
 static const struct drm_display_mode default_mode = {
 	.clock = (540 + 48 + 32 + 80) * (960 + 3 + 10 + 15) * 60 / 1000,
 	.hdisplay = 540,
@@ -227,10 +199,8 @@ static int sharp_nt_panel_get_modes(struct drm_panel *panel,
 }
 
 static const struct drm_panel_funcs sharp_nt_panel_funcs = {
-	.disable = sharp_nt_panel_disable,
 	.unprepare = sharp_nt_panel_unprepare,
 	.prepare = sharp_nt_panel_prepare,
-	.enable = sharp_nt_panel_enable,
 	.get_modes = sharp_nt_panel_get_modes,
 };
 
@@ -239,8 +209,6 @@ static int sharp_nt_panel_add(struct sharp_nt_panel *sharp_nt)
 	struct device *dev = &sharp_nt->dsi->dev;
 	int ret;
 
-	sharp_nt->mode = &default_mode;
-
 	sharp_nt->supply = devm_regulator_get(dev, "avdd");
 	if (IS_ERR(sharp_nt->supply))
 		return PTR_ERR(sharp_nt->supply);
-- 
2.39.2

