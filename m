Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FAF39ACF8
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 23:34:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F053F6E5A5;
	Thu,  3 Jun 2021 21:34:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2944C6E5A5
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 21:34:16 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id 11so3568246plk.12
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jun 2021 14:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v69IgdsCsz5jimImcAi+uYt7NyzzrYQV4j0d1x35Qb4=;
 b=j57ZIddYXmGmwLkqtQ9Tr1A+7q44vtjezSJ3lNJG28oH229LuWK8nHz4+dVGFE6gfF
 LfW9Bd2mW/4TWU6gkLYp0SdH2B2RIXspgMTyYRocLDZvefVjXR32M3XGl1UKHdIKoRhK
 2wpGSTeqhNcXekmizuoUKkgt2Dq9yFeLGj1yA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v69IgdsCsz5jimImcAi+uYt7NyzzrYQV4j0d1x35Qb4=;
 b=UXi0JOJfTXeiBekSFlY80jrOgB4PaVKlL+Np5vYsD4I6MfgoRjTXwFf35Dco2EUCi0
 TnT2ZMFSPY7Aanmveur3oKOxUKTqVuLZv/RuwsJiya6KZdugFbwgfuTkDgs+ZtlZms2M
 a/JkURK9gdJRogpKykAFJMCDeR9igyH3hQXG1rymeLtCSMOf25ErxS1E6MoE/rXXV/ZG
 NoHCRUVpm+iq3vfUrPGAWS8QSBT9WWy8fDkvpfMDkwti/8dZgWy/OPmLJUZ2ZlfVxITS
 1fMk+G/Y3cQuxx3rl5cUwjxs+eng/apMZRmhqD2HG80dgIxcULsr/ckM2hqxYNfJ2bNF
 5L/Q==
X-Gm-Message-State: AOAM531h/2FPc6lqeNA3ZnHVOPnqJi3aOY1425Em4Y6NwGUOdSyEWEvY
 bU7IISRYk32ncpYhQwXV9NYCfA==
X-Google-Smtp-Source: ABdhPJxm3z6rl3LYpawQ1DMY11WlwMDFoHOpcLj1ncYiepIEqdQ8bfZyEKGIcP88QEmlEO5kmbR8qA==
X-Received: by 2002:a17:90a:16c2:: with SMTP id
 y2mr1288913pje.236.1622756055797; 
 Thu, 03 Jun 2021 14:34:15 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id w27sm31153pfq.117.2021.06.03.14.34.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 14:34:15 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2] drm/pl111: Fix CONFIG_VEXPRESS_CONFIG depend
Date: Thu,  3 Jun 2021 14:34:12 -0700
Message-Id: <20210603213412.3903724-1-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; g=e33cd5178dd1fb9ee613d19f11eaa8a3a6bf439b;
 i=JzCVqk4AxoptI1McgDI6xvfqqLZfjQGjP6zAZW/BX7U=;
 m=NnCY7lv5WU4H2RRYGez6H5ZSQQpm4Mnshp2N7en1Rto=;
 p=2rHhv7G5hVZmfAbXUOZZGK2mZ3ASktEg+2OlHMTQ0V8=
X-Patch-Sig: m=pgp; i=keescook@chromium.org; s=0x0x8972F4DFDC6DC026;
 b=iQIzBAABCgAdFiEEpcP2jyKd1g9yPm4TiXL039xtwCYFAmC5StQACgkQiXL039xtwCaQ4A//VkK
 6m/frj+wBsE+WSZy5DUgyNCSP1GQQvnoak5D0m17047DU1n4VAK+BwQYgRZ50tC/UJHUImFcRLTdX
 u7du7tSizTOUD1EhUXEVQOIRLoRVIQRGM9gQ9Ssmt1Wc3EjkIMhw3uA2swJ791tKhpsfWLzQQLZ33
 il8l6Gs1NkOJpxtq7rLQSZjzAMiW7MsAnXVRjY8tfBnH2ZO6Gjf4ZRpote/2jXhv0P3JFU9hWZYMH
 TiTrXzW8+spvpdxd1rrr/1NfQPMhUyZgz9vPDqHvZnyilGjNdGq2moML0HxRPfYWqDOPOACTp1iWC
 4pWVvMpeSr9z5KMKp4RsyOd5QMhAr4pt87GOi8X3Fxwp9H5W9kVmFjvr8ho5sxc6ESMsxUA2IhZfa
 +hFgR7GXC7E8Wv4NdQaDJMkBbyH8IIjc9p/u7ruQ6KDDtsGOW2aqyD7baOvXS9ZSVx6Dps4no4VPP
 1ZmZms9SS59qVR8MvrEiX+uzwUs8u35lGJhvArAwdQPUUU6EUMRjLFD3Sul58aYI14l98pW2+UPmR
 /wJOVAlOw7kiuc2Ta29oFEx8Sy0Ax+w9fJnneLawGgoogwSgtjufHcAm9bHaCpHLlQ7jnNDbkBaDw
 ZNHQ2l+xMRokhx2IJCibgYNuj49ClGRQMUOgQzZdUsmvNAwYXiPle7ysdApl+8Ms=
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
Cc: Kees Cook <keescook@chromium.org>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Avoid randconfig build failures by requiring VEXPRESS_CONFIG either be
missing, built-in, or modular when pl111 is modular. Fixing this warning
when:

CONFIG_VEXPRESS_CONFIG=m
CONFIG_DRM_PL111=y

aarch64-linux-gnu-ld: drivers/gpu/drm/pl111/pl111_versatile.o: in function `pl111_vexpress_clcd_init':
pl111_versatile.c:(.text+0x220): undefined reference to `devm_regmap_init_vexpress_config'

Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/lkml/202105300926.fX0MYySp-lkp@intel.com/
Fixes: 826fc86b5903 ("drm: pl111: Move VExpress setup into versatile init")
Signed-off-by: Kees Cook <keescook@chromium.org>
---
v2: avoid forcing VEXPRESS_CONFIG be enabled
v1: https://lore.kernel.org/lkml/20210602215252.695994-4-keescook@chromium.org
---
 drivers/gpu/drm/pl111/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/pl111/Kconfig b/drivers/gpu/drm/pl111/Kconfig
index 80f6748055e3..b84879ca430d 100644
--- a/drivers/gpu/drm/pl111/Kconfig
+++ b/drivers/gpu/drm/pl111/Kconfig
@@ -3,6 +3,7 @@ config DRM_PL111
 	tristate "DRM Support for PL111 CLCD Controller"
 	depends on DRM
 	depends on ARM || ARM64 || COMPILE_TEST
+	depends on !VEXPRESS_CONFIG || VEXPRESS_CONFIG=DRM
 	depends on COMMON_CLK
 	select DRM_KMS_HELPER
 	select DRM_KMS_CMA_HELPER
-- 
2.25.1

