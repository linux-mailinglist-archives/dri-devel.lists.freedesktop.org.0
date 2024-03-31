Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B81358935DA
	for <lists+dri-devel@lfdr.de>; Sun, 31 Mar 2024 22:29:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9310410EA37;
	Sun, 31 Mar 2024 20:29:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SW9BnOpc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C07710E9F2
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Mar 2024 20:29:17 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-513d23be0b6so3821736e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Mar 2024 13:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711916955; x=1712521755; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+v9GTIZDIAWX08FzKTARGqVQVzeSJaMCtOVkVitqgmc=;
 b=SW9BnOpcYjlw9S/2k+K/5rJbdWtalYiqxsVRkKP2zRVplNR0Qu5tBq5q6pCV14YEDP
 5q250NSN77fW4UtonwTgDoO2LOI1oLBSfvrAngf8oUl3Yx+M7FVTdp7ggRAVhhcpfAem
 sR5SyjRcylYreSthy5payMeUjhUthwQZeRMUmXKqE3p1mbh7FRApBMJJxaJFzXr4L2+h
 9TRJPpZWS+dwoVeD4yEfpztHHj4OnnDbzBRGVPwHBGvzzi/vnRVv1HFJPco4sFXpcfOo
 /w+/ged11E9M2ZNVXByedb7BnFCOIu7VbX9H+qEkFshcARj6np2RK0xXRybEL2J7Uv/X
 Qp/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711916955; x=1712521755;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+v9GTIZDIAWX08FzKTARGqVQVzeSJaMCtOVkVitqgmc=;
 b=FiKLo4Pz00t/5TYv+f8dypkrZEw5WR45wLUr+vCr6bqww9IJSJmmtimSvJmzRAMkxq
 GJtD7zy0ZHomzBsigNqTxbFwJeNf7bTKiNKlxVmgtlaIY2pAWI7AJr4DY0O3eaw5gXqZ
 aH/8BGGK8mNTqdYDTfy0cwCiuNKEn/KOl9J7n/LdT/1EVBisiBbnbFPiL9VTO1sKQfMn
 OR3GaOgck2kHy/sqLdNw9QnlTK17bdP1f56FD4YygTA0i+xJb0Tg8XreKzleuMq3Elw5
 9K2N+DaVm4qAt2xIiTyLuzhsl8bRVoxSGovLuB6brgXampEImj1GCX7JvhI/rO8BBbl2
 Hzpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsP2zspu0T12D8Y1Cp+oKkkqRq/zyu6FmRanBv4S9NLd+9TLA0AKvlBXDkK52rQfnNb8mgnRwpYqsecElyQrnMjxDIYOT70gZZHotKqfF6
X-Gm-Message-State: AOJu0YyEyxyhqG6ZuHkWMTMH7vezQ11ApwhLXU69w9PVlN7tFshJ+hDM
 fw0Ukd8tAt3iEqZ3sksXH+sI29NmpbfT/SAX/SCE/08Pg0Hq8PUqreYJcvxXSl8=
X-Google-Smtp-Source: AGHT+IE3dsaZsU0ynBFh7eT7zhvlqvKfwqYNj4h+qdo+iuTj8Q2UMpieGDvwPHTYdOFd6ciMJdrZ9A==
X-Received: by 2002:ac2:51a5:0:b0:515:c615:ce23 with SMTP id
 f5-20020ac251a5000000b00515c615ce23mr5780599lfk.22.1711916955358; 
 Sun, 31 Mar 2024 13:29:15 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 y25-20020a197519000000b00513cfc2a7aesm1237276lfe.71.2024.03.31.13.29.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Mar 2024 13:29:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 31 Mar 2024 23:29:09 +0300
Subject: [PATCH v2 12/12] drm/imx: move imx_drm_connector_destroy to
 imx-tve
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240331-drm-imx-cleanup-v2-12-d81c1d1c1026@linaro.org>
References: <20240331-drm-imx-cleanup-v2-0-d81c1d1c1026@linaro.org>
In-Reply-To: <20240331-drm-imx-cleanup-v2-0-d81c1d1c1026@linaro.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Chris Healy <cphealy@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2503;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=5YQu6iei1O3icFERDmvk1l0kTnnJ0t2qf5um+94Fdg0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmCceQDf+olRh9QfALPc+aBKfyzH5lo75neZO7G
 9G/c0G65EuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgnHkAAKCRCLPIo+Aiko
 1a3kB/9PCf+qZk6BU9uNm4Mq6b6l9aQ1snWLpd5Ocn28EkiTCxoVc7+x/jVRyrbJOf4CizSpcN4
 ahurpK9t+VYswcda71cQTvEEn0yhiUyWAuDObsaFkm5tzVSAuS91s1JFeU+ya3lffWXzV6RqgGY
 CLSiOEl9XV1T6ncjZPjgioIMS7a+2QnMvzCaobKIqdp58Ku/IyhAdOk2CqnZEd6XjG1dNoeZacb
 qbGt9CrEp7uvvf7znqrphQ7pFAu1EjhOBPJqCLV8wJgJsgAwlOqyGLzVnjkyvEJF/gJp46VRISr
 C813XA47F0iXhSoBO/vRA3tmI3DiCh+Gb88qe3xGNAFnNCSn
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

The imx-tve driver is the only remaining user of
imx_drm_connector_destroy(). Move the function to imx-tve.c

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/imx/ipuv3/imx-drm-core.c | 7 -------
 drivers/gpu/drm/imx/ipuv3/imx-drm.h      | 2 --
 drivers/gpu/drm/imx/ipuv3/imx-tve.c      | 8 +++++++-
 3 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
index 4cfabcf7375a..189d395349b8 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
@@ -34,13 +34,6 @@ module_param(legacyfb_depth, int, 0444);
 
 DEFINE_DRM_GEM_DMA_FOPS(imx_drm_driver_fops);
 
-void imx_drm_connector_destroy(struct drm_connector *connector)
-{
-	drm_connector_unregister(connector);
-	drm_connector_cleanup(connector);
-}
-EXPORT_SYMBOL_GPL(imx_drm_connector_destroy);
-
 static int imx_drm_atomic_check(struct drm_device *dev,
 				struct drm_atomic_state *state)
 {
diff --git a/drivers/gpu/drm/imx/ipuv3/imx-drm.h b/drivers/gpu/drm/imx/ipuv3/imx-drm.h
index e01f026047de..0c85bf83ffbf 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-drm.h
+++ b/drivers/gpu/drm/imx/ipuv3/imx-drm.h
@@ -25,8 +25,6 @@ extern struct platform_driver ipu_drm_driver;
 int imx_drm_encoder_parse_of(struct drm_device *drm,
 	struct drm_encoder *encoder, struct device_node *np);
 
-void imx_drm_connector_destroy(struct drm_connector *connector);
-
 int ipu_planes_assign_pre(struct drm_device *dev,
 			  struct drm_atomic_state *state);
 
diff --git a/drivers/gpu/drm/imx/ipuv3/imx-tve.c b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
index b49bddb85535..a5118504b522 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-tve.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
@@ -307,9 +307,15 @@ static int imx_tve_atomic_check(struct drm_encoder *encoder,
 	return 0;
 }
 
+static void imx_tve_connector_destroy(struct drm_connector *connector)
+{
+	drm_connector_unregister(connector);
+	drm_connector_cleanup(connector);
+}
+
 static const struct drm_connector_funcs imx_tve_connector_funcs = {
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = imx_drm_connector_destroy,
+	.destroy = imx_tve_connector_destroy,
 	.reset = drm_atomic_helper_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,

-- 
2.39.2

