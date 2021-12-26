Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE4147F695
	for <lists+dri-devel@lfdr.de>; Sun, 26 Dec 2021 12:25:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AD3510E955;
	Sun, 26 Dec 2021 11:25:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61C4210E954;
 Sun, 26 Dec 2021 11:25:24 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id a9so26462465wrr.8;
 Sun, 26 Dec 2021 03:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3w0cyRxbnflG1Lzaa+D9LFgBBXj2WLi8B2+0IaB0cco=;
 b=PwXLZV+6O9zswzpPoQeLANPNLyAa5j9TTefYDsBvxzJHw7hsiT7vgEJO67viIuaBiK
 joS9USvBHQU7W3SIlSlVlgL1mYDZ9GdAj6OOVHGzOLhwrXOtxouH24D1FvTOcNPBx1hu
 cgYJFZ0JNDK45DRlTqL7+hohi4LKCBmpHJMZ7FYsBeaLfb3+QvZpNbnybehWxIYzAW9A
 zIdhrscxtU7zpauASJezylBL9be5Gt7PrhZ4YGNwtTDe/dk3r/8eHOBjzyS88i2wv2vz
 I6dy2YgPWM+zzpAj2FRI6ftDhWK37okU082jWiQr1P8b2ZnvThZubK2qMqrpGqHTwjcb
 AcZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3w0cyRxbnflG1Lzaa+D9LFgBBXj2WLi8B2+0IaB0cco=;
 b=e5sxsSBV8f/zG2WRSOqjURPEVHCodY3HiF7fP/xCSg9gospQ6J4K+JnUkAn80I0JBe
 mphW1ZSODNA652cDdxCRGP3QHVyprIGOsLixdtG4WmU+fhO5dFODeKDj1hA+pSbPcfh1
 g3H2TvEdVCeNBySGuTgjXjbESpLsHKu0bQgqfnqj6LuztreUHWqKBlTqZ/MRdlhGK8y2
 Slv3L/D9mLt4z0F1lRK7yb8ylO3C6jIZ5fEUeROn7RR8n3My852yM8NDhTvTjgaT+uoR
 peC5xbw/f4/mbSNydF9hBYDpm7lj2qDaNCVqbAHSU00G5+XG8pAu6LKLAwkhIZb2rJdX
 jtgg==
X-Gm-Message-State: AOAM532D7Z+mebfpcGw671qZc7HMEfj5iBZDkLk1gqbOGlTsVrxJn2UW
 JfNhY0Bsfyx+zpfXdF7ZcUg=
X-Google-Smtp-Source: ABdhPJyMMwBvN0I/TVcPJvi99lJUbcE0uky0CFSE//bOHq3fI8piG76lCpdID1rhkzRsL/yanK1mSw==
X-Received: by 2002:a5d:638b:: with SMTP id p11mr9352371wru.241.1640517922894; 
 Sun, 26 Dec 2021 03:25:22 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id g12sm13654743wrd.71.2021.12.26.03.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Dec 2021 03:25:22 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: contact@emersion.fr
Subject: [PATCH v3 6/6] drm/stm: ltdc: Drop format_mod_supported function
Date: Sun, 26 Dec 2021 12:25:03 +0100
Message-Id: <20211226112503.31771-7-jose.exposito89@gmail.com>
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
 drivers/gpu/drm/stm/ltdc.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index dbdee954692a..ef909e50f0e4 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -925,16 +925,6 @@ static void ltdc_plane_atomic_print_state(struct drm_printer *p,
 	fpsi->counter = 0;
 }
 
-static bool ltdc_plane_format_mod_supported(struct drm_plane *plane,
-					    u32 format,
-					    u64 modifier)
-{
-	if (modifier == DRM_FORMAT_MOD_LINEAR)
-		return true;
-
-	return false;
-}
-
 static const struct drm_plane_funcs ltdc_plane_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
@@ -943,7 +933,6 @@ static const struct drm_plane_funcs ltdc_plane_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
 	.atomic_print_state = ltdc_plane_atomic_print_state,
-	.format_mod_supported = ltdc_plane_format_mod_supported,
 };
 
 static const struct drm_plane_helper_funcs ltdc_plane_helper_funcs = {
-- 
2.25.1

