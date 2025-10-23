Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AFEC00F7D
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 14:05:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20B7310E3E9;
	Thu, 23 Oct 2025 12:05:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="g6TRkIlg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3BC010E3E6
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 12:05:16 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-378d50e1c77so6830841fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 05:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761221115; x=1761825915; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PT2hY47s1RjHjMjR+FqOEH03YMoMMWni/+Svf2+bi04=;
 b=g6TRkIlgn2MPr1ofdPtvU/PglZEGNbqIdLL2J7/I63bMbuVRY1OXyLP+YbfVIewO0e
 ZR13boWJi+0EmDuLMnaqxoOc2Y2+jb1OLTkVJuD58Il1Dxkv3OmKn0LgP7XATOvIuOks
 oewzHXdz7zE5FXW/I6XP0db8rMLv6BGTMsm6Bp0p/50mIvBziiBw0LTpVsrnRCcNAKhs
 3Ge7HXvFePNOLr+iRmjnOJVz19KBKD1NTMARr6gNig1x6ZT6sRvVWnui2tWA9mhTsvLc
 PT8906pA39N3+EMGdu5tmmmywgXtpKBDpxXb71RlzAwU8ztyo+FozFqs5iXt8QZ4XsL6
 0X8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761221115; x=1761825915;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PT2hY47s1RjHjMjR+FqOEH03YMoMMWni/+Svf2+bi04=;
 b=rb17s5pSRmQA9BWLZudoNQY8UkIYnoyo3ihFrFws6vCK6DbBm1Z6I3u9ejhjG1ZNlw
 yyrwWCeWxwC7G29PNufkhoJ4f93W0CIpECRA+DBI0d+34LV+iEPc2a8YJ289FWx6CdQr
 UWn9lSX2t1doVE6CpwoO0cZo4rRMcXcz3MpNqpmtlgdJycOelVnH85W15WEU/gYAQBnF
 BsxoFNK+f3TlMW0mcgUHgq/mvT0a8Yga0EEdoaTeQqpK3qFKRTMdVV+hD5W1+j/YVY8n
 Xw4OzJmo6dNuBhx+/qfjfMtNGqC4uv0u05qrr7n4gJS7LNqvY23pidRePsL3B314ew9t
 ST/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUczrhTjgsHAgWIdaeu0SrHiLXy/0k80uPCFOVwhT8/VJ33a3xEvAX8cGVvSaCemQv0z5Gc8mnKEfY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZstv1QSGkYtma2BYcwvdFny683wDol2bNEPW5DvnPBQ2c6P3Y
 nvRrtq5nfQnHIvd33sXGlw/TVXOr436fDZTyi7KsliooZ126eCUnTD8zpFFF/aXJKto=
X-Gm-Gg: ASbGncv0lw4tFi1fvGcOcjOGrCt32a+g9Lr5uup0MFmvUOr6tzF2Tz1NcHiSOnEAxRe
 t9iO7cNkW/IJkESTyg6dRom6lfRAw0gadZtQaWdFFVkDhlWuxzhpT4gXncWDXEj4oNfmF30JRRM
 Ajzn59PbEcEwzOvLdQX2ZFlNBBt580hQmid83cIpMcC8dioJ79nTP3UXYeXEvL6zQBHRKQwGPBF
 dnb7Dejg18Tcin+osj0J+2AGSVAzzpS3Idvd5w7q7acQ5Ivq4Cfv3PdDgREoH5JbR4/1Zflo0TQ
 NYsW/Fy48zzk45RwQ1DtXWVODkOw9UuUhp666YHOw4agPnyf+fBfLkQQ6j0Ozw/TBaUMeqbx7GT
 H0huacPQwpB5lQiFWxL2k5UUBRoTm3JywJXzr21X/5xxLhM6PUvg4VtpAH3SLNzH62jbohKL19i
 WXt6gYGj1Ung/FPTyzaL7B8/7QfkXBUyFINMN9VumZ2UXU4U+UaLSFrKE=
X-Google-Smtp-Source: AGHT+IHB130nVHBVY+KzzEZkYC50Q1JA+1cpq++R5bYpaOJisntPAAZ7ykeZJXwnMn2Db0IeW/Zlww==
X-Received: by 2002:a05:651c:2119:b0:36e:93a3:979d with SMTP id
 38308e7fff4ca-37797936441mr75398871fa.19.1761221114951; 
 Thu, 23 Oct 2025 05:05:14 -0700 (PDT)
Received: from [192.168.1.2] (c-92-34-217-190.bbcust.telenor.se.
 [92.34.217.190]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-378d680322dsm4070701fa.47.2025.10.23.05.05.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 05:05:13 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 23 Oct 2025 14:05:11 +0200
Subject: [PATCH 3/4] drm: panel: nt35560: Move DSI commands to enable/disable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-fix-mcde-drm-regression-v1-3-ed9a925db8c7@linaro.org>
References: <20251023-fix-mcde-drm-regression-v1-0-ed9a925db8c7@linaro.org>
In-Reply-To: <20251023-fix-mcde-drm-regression-v1-0-ed9a925db8c7@linaro.org>
To: Aradhya Bhatia <a-bhatia1@ti.com>, 
 Stefan Hansson <newbyte@postmarketos.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 dri-devel@lists.freedesktop.org
Cc: Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.3
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

Due to semantic changes in the bridge core, panels cannot send
any DSI commands in the prepare/unprepare callbacks: there is
no guarantee that the DSI transmitter is available at this
point.

Cc: Aradhya Bhatia <a-bhatia1@ti.com>
Fixes: c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable and post-disable")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/panel/panel-novatek-nt35560.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35560.c b/drivers/gpu/drm/panel/panel-novatek-nt35560.c
index 561e6643dcbb..b0b11d3e26fe 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt35560.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt35560.c
@@ -278,16 +278,18 @@ static void nt35560_power_off(struct nt35560 *nt)
 }
 
 static int nt35560_prepare(struct drm_panel *panel)
+{
+	struct nt35560 *nt = panel_to_nt35560(panel);
+
+	return nt35560_power_on(nt);
+}
+
+static int nt35560_enable(struct drm_panel *panel)
 {
 	struct nt35560 *nt = panel_to_nt35560(panel);
 	struct mipi_dsi_multi_context dsi_ctx = {
 		.dsi = to_mipi_dsi_device(nt->dev)
 	};
-	int ret;
-
-	ret = nt35560_power_on(nt);
-	if (ret)
-		return ret;
 
 	nt35560_read_id(&dsi_ctx);
 
@@ -317,7 +319,7 @@ static int nt35560_prepare(struct drm_panel *panel)
 	return dsi_ctx.accum_err;
 }
 
-static int nt35560_unprepare(struct drm_panel *panel)
+static int nt35560_disable(struct drm_panel *panel)
 {
 	struct nt35560 *nt = panel_to_nt35560(panel);
 	struct mipi_dsi_multi_context dsi_ctx = {
@@ -332,12 +334,18 @@ static int nt35560_unprepare(struct drm_panel *panel)
 
 	msleep(85);
 
+	return 0;
+}
+
+static int nt35560_unprepare(struct drm_panel *panel)
+{
+	struct nt35560 *nt = panel_to_nt35560(panel);
+
 	nt35560_power_off(nt);
 
 	return 0;
 }
 
-
 static int nt35560_get_modes(struct drm_panel *panel,
 			     struct drm_connector *connector)
 {
@@ -369,6 +377,8 @@ static int nt35560_get_modes(struct drm_panel *panel,
 static const struct drm_panel_funcs nt35560_drm_funcs = {
 	.unprepare = nt35560_unprepare,
 	.prepare = nt35560_prepare,
+	.enable = nt35560_enable,
+	.disable = nt35560_disable,
 	.get_modes = nt35560_get_modes,
 };
 

-- 
2.51.0

