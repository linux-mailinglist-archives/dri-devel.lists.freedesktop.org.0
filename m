Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6DD47F696
	for <lists+dri-devel@lfdr.de>; Sun, 26 Dec 2021 12:25:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACB5710E954;
	Sun, 26 Dec 2021 11:25:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A6AD10E952;
 Sun, 26 Dec 2021 11:25:21 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 g7-20020a7bc4c7000000b00345c4bb365aso6755542wmk.4; 
 Sun, 26 Dec 2021 03:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2sH9LpoHKM1nYuCNdjrxssHqCL8Z5G+nLzADIXmtmn8=;
 b=mAetoydiC9DFErqK91+G/B0kP4LJaIEX6wTtFjgxIx2puQBkWT35g7OEs0I6Wxm4eT
 DIS4O5D0u43xloptLbFpnamIbkbZp4QW1A5pN+Ad2pADFD6SEdOMQyLza03nFZ8lW8/3
 Eesto4lZJ3IicDl5rRiAAttyieCY8P8S5nM1MM/+1js3SzqevyK2awp22JsgoAOcP7eZ
 OptHCawHlqbW35aAG3+Wq4go/qCvwqqXt16SSXCJoYAnFMvUPqjB4E0JWPAhZRvtpJr8
 /sV2Bn9XrAl+tgezM0TeuEPuu3A4TNULvoMGSlh58yjiIkGU3uZ6N06sfsiT5q/eDeSa
 /v2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2sH9LpoHKM1nYuCNdjrxssHqCL8Z5G+nLzADIXmtmn8=;
 b=eyxmBHkJF5DeJmIE1WmfU5k1Ce5rEUO9hOFJCU4nHe2BPu9q+wAumkOeb//HbI1zNA
 iwzJCcSc7Ce9qflx5F3nKW7eO0NSm+HWncqQ+K9tv6V0ottuJWI9106P4Gfqk8ZbyAr9
 NHiphYd6z/bQSPC3T2qa0FJBBwsI4K49bAviFpodu5PBWXAdWM2Sv31KPtm3D5AHG6Md
 urJ7ExUrwwHuSdHL0wQjT4LIl/66kXsH6/eGuxkX5IYjbzWpnqNGLo4rcoKawBizX8Ui
 Qpwu9qO3dplGqMGOTA4tYXzC/n0MPpNmcGKYsLgCWHmssXeHwYFuGlIn5pO9epZyG7g9
 cpvw==
X-Gm-Message-State: AOAM532y2MkXVsaUJRkXkaAGZ6sYMo67Rq7TqauGT+wraa+EbO7JcWIR
 B0SEdqW1D46hPq4PnfhdD0k=
X-Google-Smtp-Source: ABdhPJz4lUyJV89AeASjgwh8PQuZGePew9x5IF62xdHwLSvNvHxbwPsKoabWCJpDvO3twBCqWu015Q==
X-Received: by 2002:a05:600c:3787:: with SMTP id
 o7mr10046954wmr.110.1640517919698; 
 Sun, 26 Dec 2021 03:25:19 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id g12sm13654743wrd.71.2021.12.26.03.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Dec 2021 03:25:19 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: contact@emersion.fr
Subject: [PATCH v3 4/6] drm/i915/display: Drop format_mod_supported function
Date: Sun, 26 Dec 2021 12:25:01 +0100
Message-Id: <20211226112503.31771-5-jose.exposito89@gmail.com>
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
 drivers/gpu/drm/i915/display/intel_cursor.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index 11842f212613..6a5e022f5e21 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -602,13 +602,6 @@ static bool i9xx_cursor_get_hw_state(struct intel_plane *plane,
 	return ret;
 }
 
-static bool intel_cursor_format_mod_supported(struct drm_plane *_plane,
-					      u32 format, u64 modifier)
-{
-	return modifier == DRM_FORMAT_MOD_LINEAR &&
-		format == DRM_FORMAT_ARGB8888;
-}
-
 static int
 intel_legacy_cursor_update(struct drm_plane *_plane,
 			   struct drm_crtc *_crtc,
@@ -745,7 +738,6 @@ static const struct drm_plane_funcs intel_cursor_plane_funcs = {
 	.destroy = intel_plane_destroy,
 	.atomic_duplicate_state = intel_plane_duplicate_state,
 	.atomic_destroy_state = intel_plane_destroy_state,
-	.format_mod_supported = intel_cursor_format_mod_supported,
 };
 
 struct intel_plane *
-- 
2.25.1

