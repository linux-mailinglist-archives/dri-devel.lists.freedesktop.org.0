Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E3447CEC5
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 10:06:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 403CB10FCDE;
	Wed, 22 Dec 2021 09:06:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BEF01128F1;
 Wed, 22 Dec 2021 09:06:05 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id i12so1087168wmq.4;
 Wed, 22 Dec 2021 01:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3uC+zpueN0jaqztWM7eUqBfpEMbmsR8tb66iIJAnvGU=;
 b=DN/hezu8BpvlioFiGvPzdpBnLgh7II07BN9W7INVCzSlG/W+L+9oRlBVBOiyDVwRzN
 BxgyMTO/wmtmvNY2yXs/gCKyTnr8BxUmdvjzLD3hV1ZGJ2BdB+8MLPEPziAae6wboQaN
 ct81mDMbeL8K1H6rjhaTxYKOMQmxKDQyYUYXFmLa6yleKnfY7pur/hrESfd4/7lXHtR0
 67vFJ1qpR18/R1lSFtZJYGFK26vg4J3pntLCw3ctkAYE+u2xLA95KJ0zfx6oMhr99A2L
 qFh4JurVj8/5urKMAIyJ7sljhjX2t06BNLt5+W0Mw36NQiXYgzUd/f17GYlA+Edw5nP8
 5XPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3uC+zpueN0jaqztWM7eUqBfpEMbmsR8tb66iIJAnvGU=;
 b=yaThkAUy/ZBpVB/yOlto/dPvAqWexido9MQN++mHQBiR3ZzvNptbrtO0xm8oCAfZAe
 T/wCdwAjPib/UIW8GXsCdme+2W/4NsUdJSIeD9XwJNK77Pm3SrwP2/FoNF6qFltC5rvk
 hGThJTofsCpoYX81zwQCqoF4pUXsEtoH4fW6UuLeqShCsjDGvqR+awvvql22MhjOHPCr
 JhzkQvkoj7BI212VbaorLUmYfKWwLMD/yn/ds2tfZ1bv5ow1NKtzVNcqnsnWol0aZ3/5
 1MdPFeEfWkL2NCd/deYuL9DC23sGnTsBdQv6rCobBF3x7HgS9KPlr3S5sToMEVZRXZoS
 x8vg==
X-Gm-Message-State: AOAM53225kJmWoqltxAlVZVuwOY529XPlHrpAOw90GitzABZyOuHsgIR
 BmLOhweGRYLkKm8YWNwWhvk=
X-Google-Smtp-Source: ABdhPJwjkqCU2eOiLPDiEpUgnr87YSHM9DTy3lNdv7hPr78L5Q1Nuo13SkbxfvjjlDc4nJ6/guabtA==
X-Received: by 2002:a05:600c:296:: with SMTP id 22mr208645wmk.11.1640163964078; 
 Wed, 22 Dec 2021 01:06:04 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id a22sm1139775wme.19.2021.12.22.01.06.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 01:06:03 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: contact@emersion.fr
Subject: [PATCH v2 5/6] drm: mxsfb: Drop format_mod_supported function
Date: Wed, 22 Dec 2021 10:05:51 +0100
Message-Id: <20211222090552.25972-6-jose.exposito89@gmail.com>
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

