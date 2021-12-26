Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CECA47F697
	for <lists+dri-devel@lfdr.de>; Sun, 26 Dec 2021 12:25:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DFFF10E95B;
	Sun, 26 Dec 2021 11:25:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B4010E953;
 Sun, 26 Dec 2021 11:25:22 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id v11so26499463wrw.10;
 Sun, 26 Dec 2021 03:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3uC+zpueN0jaqztWM7eUqBfpEMbmsR8tb66iIJAnvGU=;
 b=RwDE0YPkDLqtqo7Dvnlm/ydiYanOQlnAMem2isy3ndgorcODT7JcvNFIyr443LTwSg
 WliRTsg8U5K6xpvrcgejsyGKhya4NPPV1Uea3wAuINZpe69Qi4Co3GCY8+RCvB5zICJN
 79sCOX7fKsf0zNbAvzhCEj30xYFAmhu4mxWkaRe0EvJkW/pW8fygcR8ybIZ/WTrgKhBW
 WcMktKG4ZIskNlW/H43GfZIK16XeZawEhw7iKEf6idJrc9oK20T4+HFBD3es+GpMVzr9
 czP8Xc5f78UoC+IsRP3PfKQz9Rc6Zl71pPJ9HwZfuNpEHKkQuf3Bn8gfrACtKdQA8/At
 oNXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3uC+zpueN0jaqztWM7eUqBfpEMbmsR8tb66iIJAnvGU=;
 b=Lx1iPFsobjOJGaIatNfrO4a8bmx8wQaawc2hY7bh2PonVN98q0mzY6gxz9wFL1vI3Y
 rSEMGl3qi3od8bQ8CYzD6VkcUv4F2FXIBwEekaJQsSVEaunx4r0MAHBRJuXwRbDKavhN
 zvRn7FcpUN5RKZ4GtEgHe3QZopn/NhTLaEAklyo9O5oX4IvDhlM2EuBkKUDUTFRQI0eu
 jVDygJak0V0qNvmgl/Qsfx/Bm+ihfv1nR/HUZ5xyPa6ITAbqU0iI+Zjj1MbnKUK9EOY5
 PRR2IEXuyvgIOcp1okFvYk4l/VyXYi/2jpyRGAVhdacKlR73iccQoBK8qk7vT/nRhr5U
 /wuQ==
X-Gm-Message-State: AOAM531+E1hXlhTRmPjX+Wd7F4ciQDaB7oFTDr8Zf+xrz8qm0Ffkk4+g
 KFojVVFJEY/PptXoJVMYC1Q=
X-Google-Smtp-Source: ABdhPJwPiaAlI5ue8SBY/hNuXdX5I1LiZxPv2bA/DypMkY+1VW51yINEbKM/DxTgrTs1AI5TJvkxhw==
X-Received: by 2002:adf:9004:: with SMTP id h4mr9898117wrh.593.1640517921215; 
 Sun, 26 Dec 2021 03:25:21 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id g12sm13654743wrd.71.2021.12.26.03.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Dec 2021 03:25:20 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: contact@emersion.fr
Subject: [PATCH v3 5/6] drm: mxsfb: Drop format_mod_supported function
Date: Sun, 26 Dec 2021 12:25:02 +0100
Message-Id: <20211226112503.31771-6-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211226112503.31771-1-jose.exposito89@gmail.com>
References: <20211226112503.31771-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: airlied@linux.ie, alexandre.torgue@foss.st.com,
 benjamin.gaignard@linaro.org, linux-stm32@st-md-mailman.stormreply.com,
 marex@denx.de, linux-imx@nxp.com, intel-gfx@lists.freedesktop.org,
 s.hauer@pengutronix.de, rodrigo.vivi@intel.com, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, yannick.fertre@foss.st.com, linux-kernel@vger.kernel.org,
 philippe.cornu@foss.st.com, mcoquelin.stm32@gmail.com,
 dmitry.baryshkov@linaro.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The "drm_plane_funcs.format_mod_supported" can be removed in favor of
the default implementation.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/mxsfb/mxsfb_kms.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index 0655582ae8ed..df32e1c3cc5d 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -554,13 +554,6 @@ static void mxsfb_plane_overlay_atomic_update(struct drm_plane *plane,
 	writel(ctrl, mxsfb->base + LCDC_AS_CTRL);
 }
 
-static bool mxsfb_format_mod_supported(struct drm_plane *plane,
-				       uint32_t format,
-				       uint64_t modifier)
-{
-	return modifier == DRM_FORMAT_MOD_LINEAR;
-}
-
 static const struct drm_plane_helper_funcs mxsfb_plane_primary_helper_funcs = {
 	.atomic_check = mxsfb_plane_atomic_check,
 	.atomic_update = mxsfb_plane_primary_atomic_update,
@@ -572,7 +565,6 @@ static const struct drm_plane_helper_funcs mxsfb_plane_overlay_helper_funcs = {
 };
 
 static const struct drm_plane_funcs mxsfb_plane_funcs = {
-	.format_mod_supported	= mxsfb_format_mod_supported,
 	.update_plane		= drm_atomic_helper_update_plane,
 	.disable_plane		= drm_atomic_helper_disable_plane,
 	.destroy		= drm_plane_cleanup,
-- 
2.25.1

