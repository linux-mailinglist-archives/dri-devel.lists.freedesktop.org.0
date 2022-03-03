Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 566A84CC3A3
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 18:24:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58AFC10E1D8;
	Thu,  3 Mar 2022 17:24:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6113510EC74
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 17:24:46 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id d3so8941360wrf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Mar 2022 09:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=krlo5s1H1nq87wng/O6VqLU57YxMUUe2fMcieUmiq1Q=;
 b=OD0dV5gPLfQvYYRZAc5cVAP6tZg8/nyZg70DG4K7bqyasRT/tRRkrd98KW5Vr9rHkA
 /VbO/PDAkx+i0y9V7AbxUdsOny2BiXIUvt+I8KhXaX3eES8endopgsxHOHe8gb+sX6hd
 wXo0f0brHlGvDcuC1vfupeL9bEd7B9hYp6yT29bFqyXqaXuvWTlE5dn5/620iPm5kcZO
 jNTIEYhUrCnXsHwIXcCgKUM+2X2yJuUtb82Bis/LBEd8nawPmEbmkSCA+/sZEg821AeX
 bSIOKpRVv1HHWondZjBMo5Y6DV1iTkdtykN2gLmIz+3ejiSI7pEZc2hLBMQDJ0f0QX56
 9syA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=krlo5s1H1nq87wng/O6VqLU57YxMUUe2fMcieUmiq1Q=;
 b=JIKaqtjdHpbGCmTyl1953UejtNH7MdjB3rlv4rnlc4OUw32j38SewMMY8EAI80ZInK
 tMZ970gkbrEW/zLTkK7d+ISEWjUzMRhU9hDqaNME6x2HBeHtaUyITXBqt36McsfFjv4Y
 7hpq5wDTcrSz7Apqh3zMoHmrbs3LX4ms4PbMPZdogWBaVsqQI4SDdXd5ePp2CiMFh9uY
 C9Ha7M4wfkJP+QlhdZr8ajZZ/v8Rr/mpC9N/utr8TOjUQs19mapzVcQxFxvsIe/LTfxY
 3eb5SmyB9RqJ4ZusX6P5v3D1BRW4YNwWMI4melvQ8ZrbABOvsmraNEtUM01EJqAD6scY
 DglQ==
X-Gm-Message-State: AOAM532m/cLZf1QOnDMFRiDhmh6nPJr/ZIRObozWxDklV+3JPpZClFPa
 ZYSzkneim99+K8YNcSmWHpE=
X-Google-Smtp-Source: ABdhPJxCSYXo9SsS/ztE96ehrjJTQOpq2jfebSApjHnWjpv/ubUMDvDXTC0ED453w5xxSfXXqFMLtg==
X-Received: by 2002:a5d:4dce:0:b0:1ed:9fd1:53a2 with SMTP id
 f14-20020a5d4dce000000b001ed9fd153a2mr27031845wru.212.1646328284912; 
 Thu, 03 Mar 2022 09:24:44 -0800 (PST)
Received: from localhost.localdomain ([94.73.33.246])
 by smtp.gmail.com with ESMTPSA id
 n15-20020a05600c500f00b003814673f202sm10298928wmr.47.2022.03.03.09.24.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 09:24:44 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: marex@denx.de
Subject: [PATCH drm-misc-next 2/2] drm: mxsfb: Drop format_mod_supported
 function
Date: Thu,  3 Mar 2022 18:24:18 +0100
Message-Id: <20220303172418.12565-3-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303172418.12565-1-jose.exposito89@gmail.com>
References: <20220303172418.12565-1-jose.exposito89@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@linux.ie,
 s.hauer@pengutronix.de, linux-kernel@vger.kernel.org, linux-imx@nxp.com,
 kernel@pengutronix.de,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The "drm_plane_funcs.format_mod_supported" can be removed in favor of
the default implementation.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
Reviewed-by: Simon Ser <contact@emersion.fr>
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

