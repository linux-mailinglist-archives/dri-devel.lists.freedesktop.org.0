Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD8147CEC6
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 10:06:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3BA71128C7;
	Wed, 22 Dec 2021 09:06:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E86661128B9;
 Wed, 22 Dec 2021 09:06:03 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id a9so3454737wrr.8;
 Wed, 22 Dec 2021 01:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2sH9LpoHKM1nYuCNdjrxssHqCL8Z5G+nLzADIXmtmn8=;
 b=UipR0N0vfloKnycnLvsHhkmUXID+a0gQSazt/YOOR2lytH2a1gIPVbSVGExE0igs+r
 jekZBCIM4ERZoOESF8YT+xqxsPxjJX6ao8gc3DLIgEz6u4VxUZKP/QWvVLh2/k1tTFVF
 RqZI7l0W9CaC7Is+KWojXzkwg6U0Zk4C0Swdg3QHsoP9hxcvBAG6FSDnmL+KljKT0Vhu
 utXR9E+GV0l9WHj+A+wj+gZz8oUo7US1imEVJt0zSOfEv8XdF9HYFeplt3JgJSXAOc13
 MQmKMU48hY+PocHZHlpYKnPWsE8PE0yiIUICdSV12SyCW2C+NB/bdWoMn+k6XUlky22m
 uEXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2sH9LpoHKM1nYuCNdjrxssHqCL8Z5G+nLzADIXmtmn8=;
 b=kQPCKxR9E/9CWuA7e8mpEKubyZzq4HOjwA25Oqc2awSX4vl6QPRv2D9PF77rppMPC8
 zuvwe3DC7g7FL8FyYI21xHQZ8zhhzdudP3qrX2phw4neKmGovmXr2O8rAHs6FrDsUkJ9
 gebqZrDw8SeTkQkSnbCVHRP86BEqkd1lEKwe7oLy6R7Acfsd7IOsgZZ3EysY9iwnWtEg
 5LZji7oLK0M4Gv02xY4HZ/wDr0zLTomQAyr5etz84+rCWRng4r+i4HW0Bc1zlj/7Uby6
 taUoOzsFwB7yU1ndBQC0xoD1ycNTmDZ7LoMoDOFZ3z0L6mfhGvEBuxITRbGV75cGHFCG
 tG3g==
X-Gm-Message-State: AOAM532o8bb/tyZp+kqhHmLyQFvs7wXvYlUQORPBCx98NUD4pDLuNyDt
 2+wdTeBVpQuVn3LgwzZi++k=
X-Google-Smtp-Source: ABdhPJw8+ku6Bbt0pa4KdLw4youWpS/O8Jg1GVf6A0XhbJGF74Z2ipnLZF9sGtjl6ocwS7qMUyGAzA==
X-Received: by 2002:adf:e0c8:: with SMTP id m8mr1505861wri.113.1640163962523; 
 Wed, 22 Dec 2021 01:06:02 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id a22sm1139775wme.19.2021.12.22.01.06.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 01:06:02 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: contact@emersion.fr
Subject: [PATCH v2 4/6] drm/i915/display: Drop format_mod_supported function
Date: Wed, 22 Dec 2021 10:05:50 +0100
Message-Id: <20211222090552.25972-5-jose.exposito89@gmail.com>
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

