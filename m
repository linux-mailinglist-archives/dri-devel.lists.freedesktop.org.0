Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D654B515409
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 20:52:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FFE610F03B;
	Fri, 29 Apr 2022 18:52:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C9AE10E507
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 18:52:02 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id y32so15595924lfa.6
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 11:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=egoM2XNXIqCFT4+22sOj5Td+05iys3AKcQL89KtNa7Y=;
 b=skwtRUUkWT/EYLdN443is8LXG02fqfEXAigHCT4YqvC/QvQc0HjYZKLkJHNxf1V9QV
 jP6pCTYXh9TTvGYLBRzsUanMufNk1twjqWHMNyKtXDiKWKGkY3jDz6+OZDGypy/TJTqa
 +fDQN6wPUEU4PAxtUbg4jb0C1ylEo6KsPEOoKOSOX3paEMpfsT9/guSG9JBnDhYxwHOg
 ITKXhlGnYZvGD3GdaZM8SB6YHUj+Jka06c4nrqf1R7siWQq1v3NSWNQzHfesx9+JM5P4
 6b/48SP2xRRbHdZQNdhRZStKmFm2v/lCdUnFSehFsx11G2lAbChaAo5GrJj78ulN/Lxu
 eQfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=egoM2XNXIqCFT4+22sOj5Td+05iys3AKcQL89KtNa7Y=;
 b=a93NrVjhptnhJ1pCHPBl/y2Dx5WxTUpL2YqV5ONgsSNaNSv7z53q6i8q1nMmsI9mUn
 a9SPw8euUFrZliMmuGWklUludo1Tu5b7A85fnbBgc5ifPtOaYh4uDxIPkw9c5hG0gwb5
 /AGtGlTZlFZQZ6oVhdbBZSsuTKtDAL0/pmdMyBfsU662lEmBfOLRfJb88hKyjeyMXrme
 J8GD1xwuoCKCO4djWrBM6uvySSUnSB3KW0lb17L04mMimYKztaLnYi0F5a/BhoHCebZs
 VYWHICkVwu/FiXL/Sbx+0DiO186hdeuUYpTiQ5rseMBLXs3e8i8Oy4/X50TJtRrsJy6A
 xGhg==
X-Gm-Message-State: AOAM533Ge1DpolCd4JcUTGDQM1GV17nPBESQkUQ++T/UAdgEqOEkFukN
 lTtDiz/iAb2afLAbCdavA340cQ==
X-Google-Smtp-Source: ABdhPJyjCsbQEtPyBhi3kbQoUQtQQ4PYG8E9Jw9FZt0MDn+fGgl5lwgg1u2usJx/LpkmGJqDdvO7ag==
X-Received: by 2002:a05:6512:3290:b0:472:b9c:751 with SMTP id
 p16-20020a056512329000b004720b9c0751mr394067lfe.591.1651258320849; 
 Fri, 29 Apr 2022 11:52:00 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 z25-20020a19e219000000b00472230888a5sm295313lfg.121.2022.04.29.11.52.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 11:52:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Tomi Valkeinen <tomba@kernel.org>
Subject: [PATCH v1 1/7] drm/poll-helper: merge drm_kms_helper_poll_disable()
 and _fini()
Date: Fri, 29 Apr 2022 21:51:51 +0300
Message-Id: <20220429185157.3673633-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429185157.3673633-1-dmitry.baryshkov@linaro.org>
References: <20220429185157.3673633-1-dmitry.baryshkov@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Merge drm_kms_helper_poll_disable() and drm_kms_helper_poll_fini() code
into a common helper function.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_probe_helper.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 682359512996..204f6999113f 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -754,6 +754,17 @@ bool drm_kms_helper_is_poll_worker(void)
 }
 EXPORT_SYMBOL(drm_kms_helper_is_poll_worker);
 
+static void drm_kms_helper_poll_disable_fini(struct drm_device *dev, bool fini)
+{
+	if (!dev->mode_config.poll_enabled)
+		return;
+
+	if (fini)
+		dev->mode_config.poll_enabled = false;
+
+	cancel_delayed_work_sync(&dev->mode_config.output_poll_work);
+}
+
 /**
  * drm_kms_helper_poll_disable - disable output polling
  * @dev: drm_device
@@ -770,9 +781,7 @@ EXPORT_SYMBOL(drm_kms_helper_is_poll_worker);
  */
 void drm_kms_helper_poll_disable(struct drm_device *dev)
 {
-	if (!dev->mode_config.poll_enabled)
-		return;
-	cancel_delayed_work_sync(&dev->mode_config.output_poll_work);
+	drm_kms_helper_poll_disable_fini(dev, false);
 }
 EXPORT_SYMBOL(drm_kms_helper_poll_disable);
 
@@ -810,11 +819,7 @@ EXPORT_SYMBOL(drm_kms_helper_poll_init);
  */
 void drm_kms_helper_poll_fini(struct drm_device *dev)
 {
-	if (!dev->mode_config.poll_enabled)
-		return;
-
-	dev->mode_config.poll_enabled = false;
-	cancel_delayed_work_sync(&dev->mode_config.output_poll_work);
+	drm_kms_helper_poll_disable_fini(dev, true);
 }
 EXPORT_SYMBOL(drm_kms_helper_poll_fini);
 
-- 
2.35.1

