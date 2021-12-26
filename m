Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0924F47F691
	for <lists+dri-devel@lfdr.de>; Sun, 26 Dec 2021 12:25:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40B3810E950;
	Sun, 26 Dec 2021 11:25:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73F6210E951;
 Sun, 26 Dec 2021 11:25:16 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 a83-20020a1c9856000000b00344731e044bso6946317wme.1; 
 Sun, 26 Dec 2021 03:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9LTDPcsLit3ZltGpmydxyhDaBvNBfOjBIIApsVidYlU=;
 b=ejlSnBRYPWQDz4Nz+pf/Ob69zbAjcqMfijxXsTWcXhySEQRzUT3JCExyZ5Q1SIvA3c
 kQEyhuRzvpXKwr0S+/rKlCIT/w8ncJ+aQzdm7jpMBRPCQQr/da5ZGlqL/VYyn43hxxCv
 CHtfylV68MCTsg4AhrkoS7zKdwb4IMm7OEpKDU3FaIoEA3fCSGm4fcRNK4c54Tcqvr6/
 zq9E1bBZJSI6Mp+0nnb2zUxeSOTTcaPXWRQkOYUc5TBf57vUoysacqIO7xX3ytpTmfP5
 OepQvrBjQUOgumuDejvOFTQ3kmvegmDblhp3SxIv7Bir6Vv/VhSt9Mkh5t4Y/gKXUW3F
 iQmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9LTDPcsLit3ZltGpmydxyhDaBvNBfOjBIIApsVidYlU=;
 b=7/FHMxO5Cz8fw21vy64Ee0kzYe5glbJ9OyVmBOuAcwGWzN6tJ5nNkp96GPpCypyEKI
 FMtJHttGbjCo+1pE4ji8vDZmRBkrF5zDDfKRrwSZyZAVZ0LxmkLl7DVETRS4rZ2c2Wm/
 C2KwlcaK+ZncQbQmDAqRduvAw4q2rK7cKVgGfDWZem9m+4Dp/qwM4f1t6iUV6m3VE981
 tZnC9iv5j2sw9LV3DBJu0tHJPTvhEtLdq+HEp02pH7sJPls13cZV/mnlajc3x/ciJl05
 UDJ90J3/UzqUGz0q56AqAF6Jn468vc6U9LJMTSZzuUDw3CosCgVfwQAwlzMsteiVAqV3
 b0KQ==
X-Gm-Message-State: AOAM530D04rLiXl8oYLoem3SgsagdVMnHLMhuAzOUAYJtv2odZ7LF6ah
 KSA/nKbRi1ByiNdgp3GEQ/E=
X-Google-Smtp-Source: ABdhPJxzOeTdg3Sm90f1frrXzLRCNKL4Q9YDL0ikNej0GhBsklk2qdNprmmmNirl5P7CW0Jv6ObHPQ==
X-Received: by 2002:a05:600c:209:: with SMTP id
 9mr10183053wmi.145.1640517915050; 
 Sun, 26 Dec 2021 03:25:15 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id g12sm13654743wrd.71.2021.12.26.03.25.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Dec 2021 03:25:14 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: contact@emersion.fr
Subject: [PATCH v3 1/6] =?UTF-8?q?drm/plane:=20Make=20format=5Fmod=5Fsuppo?=
 =?UTF-8?q?rted=20truly=C2=A0optional?=
Date: Sun, 26 Dec 2021 12:24:58 +0100
Message-Id: <20211226112503.31771-2-jose.exposito89@gmail.com>
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

The documentation for "drm_plane_funcs.format_mod_supported" reads:

  This *optional* hook is used for the DRM to determine if the given
  format/modifier combination is valid for the plane. This allows the
  DRM to generate the correct format bitmask (which formats apply to
  which modifier), and to validate modifiers at atomic_check time.

  *If not present*, then any modifier in the plane's modifier
  list is allowed with any of the plane's formats.

However, where the function is not present, an invalid IN_FORMATS blob
property with modifiers but no formats is exposed to user-space.

This breaks the latest Weston [1]. For testing purposes, I extracted the
affected code to a standalone program [2].

Make "create_in_format_blob" behave as documented.

[1] https://gitlab.freedesktop.org/wayland/weston/-/blob/9.0/libweston/backend-drm/kms.c#L431
[2] https://github.com/JoseExposito/drm-sandbox/blob/main/in_formats.c

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
Reviewed-by: Simon Ser <contact@emersion.fr>

---

v2:

 - Remove unused "done:" label to fix compile warning
   Reported-by: kernel test robot <lkp@intel.com>

 - Add Reviewed-by (thanks to Simon Ser)
---
 drivers/gpu/drm/drm_plane.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 82afb854141b..deeec60a3315 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -202,17 +202,13 @@ static int create_in_format_blob(struct drm_device *dev, struct drm_plane *plane
 
 	memcpy(formats_ptr(blob_data), plane->format_types, formats_size);
 
-	/* If we can't determine support, just bail */
-	if (!plane->funcs->format_mod_supported)
-		goto done;
-
 	mod = modifiers_ptr(blob_data);
 	for (i = 0; i < plane->modifier_count; i++) {
 		for (j = 0; j < plane->format_count; j++) {
-			if (plane->funcs->format_mod_supported(plane,
+			if (!plane->funcs->format_mod_supported ||
+			    plane->funcs->format_mod_supported(plane,
 							       plane->format_types[j],
 							       plane->modifiers[i])) {
-
 				mod->formats |= 1ULL << j;
 			}
 		}
@@ -223,7 +219,6 @@ static int create_in_format_blob(struct drm_device *dev, struct drm_plane *plane
 		mod++;
 	}
 
-done:
 	drm_object_attach_property(&plane->base, config->modifiers_property,
 				   blob->base.id);
 
-- 
2.25.1

