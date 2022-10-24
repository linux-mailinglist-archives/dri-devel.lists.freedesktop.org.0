Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9254760AF41
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 17:40:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B60DF10E892;
	Mon, 24 Oct 2022 15:39:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D9CD10E87B
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 15:39:32 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id bs14so13307797ljb.9
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 08:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jshUQGH4UtEAs7tQmmFEpIMJkGozvqVnz1M3FYmS5xY=;
 b=tpjysAKOJ5VaFAPzmTJB/VM/VOuNF+MS6KNYzrqn6q9OuyQoxkmq9iayhnfoqRdYRP
 W3+YJycr9GYEwQZHeI4+a3MZ30C7NI1iETRhOHMVdXV1qUOzx8962R2dwNfRMSVAK0PP
 uuq2AHiqP+R5Yzq71Huizl57+nOYDicAur6FtnR1DERXhusyU1y1KXB1ubKrYVCk5luf
 ykWHt5FglTIRCvKdm9ydlpRZ3guNoa+wlj3wsLtQ3+b6c10PsdRRGBczM4eeMMOEHBRZ
 WXKEL1vrBZkh9nYm8AuR+TkwoYnpIDGIsrtXD6It2CSJ/18Ce8K4PqvwdCfIbBgpE+bH
 p+uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jshUQGH4UtEAs7tQmmFEpIMJkGozvqVnz1M3FYmS5xY=;
 b=RPUGqHZa+yZBCZOSCdcE0VZXnZvLsq7xjA1Y9hs/PbcKgut45bGUsou47irlLPJVVb
 w2a62hAuYsPsoepMrXFu28FiED57A3AP9TUVQsfSCYCuRTT3EW7aYu5L2za5BFnacaVe
 a9yilgZB10Xynzehzcd3O0FpslbgqJIhUX5E1S1yepsGDP0uTK8Ba763P2SRFmO+jkLt
 7zRbFPrAe8YEADbyr5SmGJ2YUIUyDChFNBCClkySDanhhAYIqbsJ3bHwT+Wew9sCeQDN
 bbywuUWn2YxzMf7t7q0y9k8m7CUarFVPry+tchaelcmJgu46jrqbSs2mUhkpcsrhXcnT
 qJow==
X-Gm-Message-State: ACrzQf0+771WYavxwp3OkuyYqviPUd3hXyUshq/3WeQH1wC/QG6YOXHe
 bgDsrMzh5ca/uemoh9y+WKsFVw==
X-Google-Smtp-Source: AMsMyM79q8/bozlYbdMbYTfc4ZQ/uK1sOv8g0duf81dQ5KIoiK1riaEhzTxB4eepVuG/nr/YlUA6uw==
X-Received: by 2002:a05:651c:12c6:b0:26f:c55a:a59b with SMTP id
 6-20020a05651c12c600b0026fc55aa59bmr12126668lje.281.1666625971780; 
 Mon, 24 Oct 2022 08:39:31 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 f23-20020a19ae17000000b00497b198987bsm452181lfc.26.2022.10.24.08.39.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 08:39:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
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
Subject: [PATCH v2 5/7] drm/msm/hdmi: stop using
 drm_bridge_connector_en/disable_hpd()
Date: Mon, 24 Oct 2022 18:39:24 +0300
Message-Id: <20221024153926.3222225-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221024153926.3222225-1-dmitry.baryshkov@linaro.org>
References: <20221024153926.3222225-1-dmitry.baryshkov@linaro.org>
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

The functionality of drm_bridge_connector_enable_hpd() and
drm_bridge_connector_disable_hpd() is provided automatically by the
drm_kms_poll helpers. Stop calling these functions manually.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 93fe61b86967..a540c45d4fd3 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -348,8 +348,6 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 		goto fail;
 	}
 
-	drm_bridge_connector_enable_hpd(hdmi->connector);
-
 	ret = msm_hdmi_hpd_enable(hdmi->bridge);
 	if (ret < 0) {
 		DRM_DEV_ERROR(&hdmi->pdev->dev, "failed to enable HPD: %d\n", ret);
-- 
2.35.1

