Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA9247F693
	for <lists+dri-devel@lfdr.de>; Sun, 26 Dec 2021 12:25:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1094410E951;
	Sun, 26 Dec 2021 11:25:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9686510E952;
 Sun, 26 Dec 2021 11:25:19 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id j18so26537903wrd.2;
 Sun, 26 Dec 2021 03:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=udzgSr2XOO8m43wZrlgxQCrOrIrYf8SlPUnoZjFzTYk=;
 b=aCJzevHTBUPOKcQPw7hm+UB6JT/t1Fj3BW8O/jb392wnD0zkTkz+ZRTgelV2Yqg4MX
 W56GKzMk7Dzv9jaWuj28ZGU0lVkjYx9uNQh/0FadJ8JoyS4D8EWW4CIAYW1tl0U9P7Lu
 lOPPBpLonGHs296MrSx6PHecvp6ye/GIP5RQ4mgs54meCrWhzDzzmfoqLTwl5T4r5ib9
 Pu/3qMSp+gxIEeM+eE+BXjRwq2tGWwY7trJ/lA3Gq2QHZqATUNoI4JMtTWT95wDJflmL
 miGdPBFBHeeWcNJEd7MBupYAO07XGQ5e+OUbtSazNCYnC5IefApuP8gZt5MQQnVdZSo+
 V4aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=udzgSr2XOO8m43wZrlgxQCrOrIrYf8SlPUnoZjFzTYk=;
 b=YqMN3hxjGl2FEE4SJGY4wQBliT5XTCu+htwIUW+fEZRljjopNNtdKPhvCN3AcmwrmQ
 2A4IyVOK65I8jBPAh65jqBCTntgBJ8Fjo5LwqpAJgf6l+mkHYm5wWZNvigjr5EuAECkM
 8QsPAzQth+r2or/NDHBZoE76E4kGU7uVp8Y83Hm4k02/LB7iP8mn87UXDckgU7kzki6Y
 ZxnDWRhlxKjEsMo37CjFoDz61+DwuaD1sqmV6iDbEquVbzXB62W/BUnmZb9O5JhOWTAu
 lDfL8A03xvDaECZBDrGd25XiUc/psxq4GLGEpsGziPk3QTyiTEHgrR/5Rgdi03lGnJmI
 vAYA==
X-Gm-Message-State: AOAM530JwtOwy7NubWTCtIbNzaMLWwCcFy4JtBmveGIjAsxtclLJ+phC
 YcclAJYyFP2ZVJU3Fkt5yJA=
X-Google-Smtp-Source: ABdhPJxUGkExUZ7jGhhIux0K+s4/ECaFhn9zxSixHZY9ABIuQhk4H3r2v0oZ1KM30IAWTvYNQ1yqjg==
X-Received: by 2002:a05:6000:1845:: with SMTP id
 c5mr9492151wri.499.1640517918125; 
 Sun, 26 Dec 2021 03:25:18 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id g12sm13654743wrd.71.2021.12.26.03.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Dec 2021 03:25:17 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: contact@emersion.fr
Subject: [PATCH v3 3/6] drm/simple-kms: Drop format_mod_supported function
Date: Sun, 26 Dec 2021 12:25:00 +0100
Message-Id: <20211226112503.31771-4-jose.exposito89@gmail.com>
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
 drivers/gpu/drm/drm_simple_kms_helper.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm/drm_simple_kms_helper.c
index 72989ed1baba..2c6aa67c6956 100644
--- a/drivers/gpu/drm/drm_simple_kms_helper.c
+++ b/drivers/gpu/drm/drm_simple_kms_helper.c
@@ -284,13 +284,6 @@ static void drm_simple_kms_plane_cleanup_fb(struct drm_plane *plane,
 	pipe->funcs->cleanup_fb(pipe, state);
 }
 
-static bool drm_simple_kms_format_mod_supported(struct drm_plane *plane,
-						uint32_t format,
-						uint64_t modifier)
-{
-	return modifier == DRM_FORMAT_MOD_LINEAR;
-}
-
 static const struct drm_plane_helper_funcs drm_simple_kms_plane_helper_funcs = {
 	.prepare_fb = drm_simple_kms_plane_prepare_fb,
 	.cleanup_fb = drm_simple_kms_plane_cleanup_fb,
@@ -339,7 +332,6 @@ static const struct drm_plane_funcs drm_simple_kms_plane_funcs = {
 	.reset			= drm_simple_kms_plane_reset,
 	.atomic_duplicate_state	= drm_simple_kms_plane_duplicate_state,
 	.atomic_destroy_state	= drm_simple_kms_plane_destroy_state,
-	.format_mod_supported   = drm_simple_kms_format_mod_supported,
 };
 
 /**
-- 
2.25.1

