Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 917A147CECE
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 10:06:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D25E10FCCE;
	Wed, 22 Dec 2021 09:06:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0047D10F8FA;
 Wed, 22 Dec 2021 09:06:06 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id v7so3408910wrv.12;
 Wed, 22 Dec 2021 01:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3w0cyRxbnflG1Lzaa+D9LFgBBXj2WLi8B2+0IaB0cco=;
 b=NEDNLzUZDalAufNqiXzyuBQjnHZxUNBoilJQwQfvSmQgK0oXmC8vKCNkZDGX7QCj8f
 xtZzyOs2a4ZO48mM3oad8CfwltMMFIcPiw9yaL8xg/9DpqRIV3FNDYB0GPJABPvceZxx
 kb+Svls2Iyso/lECdtqN+cvpmhawKQYVVZBpiMmFxjnQmU2NcVbyHJ7NupEKBwKFI3ho
 D613SYOBjc53L3M2O+EvZ0JjMLv4xGMQSBGRP/udeR4ro3C7u0wcSuBmhIeGYE9Ll4AG
 aluM0K2Z0cWEqEmiUFyd6NsKVRlaxKgjp7izy4Q/4SvDFUhBRVosqYT/SgjFJ8S7hF33
 7VHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3w0cyRxbnflG1Lzaa+D9LFgBBXj2WLi8B2+0IaB0cco=;
 b=HvkD+XxdyNAH94a9S+U3d9LQB7j1iO9Zuwo2NvrvmjHPWtNpiIhLhu7Cu2g8BLbny/
 As4lPe0IbEGWtZ3RXUYVsfvHaI1rcMTRNLImsGcT1FTxEshQM3m/z9mMxwFGwHFKfJ3n
 s5sfG4SF8Wtb62DQF/+afOAXcVcjKckXvtm/K4V3Xj6eS1j09nfIRpMcc58WM7rcTvRm
 aFznAuzgPvhe/OfcTc8whm9c198G0cZ6CqNUQT4WC5yIEcKOYDXTIoNl5E+EF0+z4s4l
 8awDkeuMoIk1X1bpkAiXRRqBFI7A64wQFoFANbm+qAuxo11RpMsyUIDpuD3veBtzZZEM
 /zjw==
X-Gm-Message-State: AOAM530XVdo67hPHSWwahZVhBUy7DkBu5jzhDOzHMTw/t7IaMOI63ggu
 7o1fEj0pgbRdkalELBXdhLE=
X-Google-Smtp-Source: ABdhPJwXgYqNw9Ycsv3CDZ5xTjRbry7kIK14E/x21CpPObe+VU0LvZpNi+zwa4CuFTHChyhAaxTF8Q==
X-Received: by 2002:a5d:51c9:: with SMTP id n9mr1419745wrv.694.1640163965465; 
 Wed, 22 Dec 2021 01:06:05 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id a22sm1139775wme.19.2021.12.22.01.06.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 01:06:05 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: contact@emersion.fr
Subject: [PATCH v2 6/6] drm/stm: ltdc: Drop format_mod_supported function
Date: Wed, 22 Dec 2021 10:05:52 +0100
Message-Id: <20211222090552.25972-7-jose.exposito89@gmail.com>
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

