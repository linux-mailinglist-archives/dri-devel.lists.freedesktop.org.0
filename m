Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAA047CEC7
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 10:06:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADD3010F8FA;
	Wed, 22 Dec 2021 09:06:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 745D51128BD;
 Wed, 22 Dec 2021 09:06:02 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 bg2-20020a05600c3c8200b0034565c2be15so3421747wmb.0; 
 Wed, 22 Dec 2021 01:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=udzgSr2XOO8m43wZrlgxQCrOrIrYf8SlPUnoZjFzTYk=;
 b=E3MxQbgD6jp8QTL0eeprZVCT29X4TsAZ9rSxABqoJKJws7UxtL3y3Rb2aRJp575Ctn
 hesvkKOolE8pblgflzdy9N9arwD4TLsVdHjcz4j1NzcMqlx9cge1sYvwMWt+PDGrEnZv
 Y5i0OTQsxOJNGvY9tnt72sq1D1nlChs/Dlk7DLlupN28xGHToNFRR3dsa0SwxLOuKQbY
 5utUtrQy+t8z0vA8wy2xlzgyZq7k4kWhzakGbvKVtthnxoUy3g+/ce/GXp3eUfCWGNTv
 3YHSQ7vjPxoH+APQRxDnNB3K64KnRQzbtCWTUulgJeyw5GEOzsGQN3ujO/QZQbujfoWg
 PFhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=udzgSr2XOO8m43wZrlgxQCrOrIrYf8SlPUnoZjFzTYk=;
 b=tAwpO8bPqxM6RNVQCueNwYto5rJ9gX70q2yK7B8eDsAQ9HTb8x0GWPyGvX132DDO4J
 IY+a3srXAcg0JbfuBB/D9Rzlb/7oJjfCKx9oQOl4haQ1r7znJKnWMe+WbYQkQBijs/cP
 OURDSlXKVKdzpvmCrjq9U0k6RR0lJIe1p7p9UCug37w+yGTJCdGN9FHyWYCk+azwaAui
 ef7uRJHigQY58BvrMsMSR+Lx8VWlV2OJfI0GnZ7AuyIvbQeJ+v5vEDVIiQ3P9Vps05Yf
 GS3O/I263i5CG7nuSfZ9GqNg2uXgbDJFoitzX2Bv7ZkX2YvIjs2kIiv5m6vJrNbHBrSj
 u8Gw==
X-Gm-Message-State: AOAM532dYxRxqR6Akyz24IM/30k3Ld8xxtVC19H/QWOvazbJtQAwE+3D
 MREHMBdET+N3FtkaP8CnUNY=
X-Google-Smtp-Source: ABdhPJyucSE6tLj1nZatpMDhi96s0rRJ4voGBbwV+cnaaT+IgfOg7RVHe2BjZm9f/hkIq7HlprLhNQ==
X-Received: by 2002:a1c:440a:: with SMTP id r10mr226427wma.4.1640163961031;
 Wed, 22 Dec 2021 01:06:01 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id a22sm1139775wme.19.2021.12.22.01.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 01:06:00 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: contact@emersion.fr
Subject: [PATCH v2 3/6] drm/simple-kms: Drop format_mod_supported function
Date: Wed, 22 Dec 2021 10:05:49 +0100
Message-Id: <20211222090552.25972-4-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211222090552.25972-1-jose.exposito89@gmail.com>
References: <20211222090552.25972-1-jose.exposito89@gmail.com>
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
 tzimmermann@suse.de, s.hauer@pengutronix.de, rodrigo.vivi@intel.com,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, yannick.fertre@foss.st.com,
 linux-kernel@vger.kernel.org, philippe.cornu@foss.st.com,
 mcoquelin.stm32@gmail.com, dmitry.baryshkov@linaro.org,
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

