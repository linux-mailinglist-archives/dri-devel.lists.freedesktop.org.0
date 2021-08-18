Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C8D3F03E3
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 14:41:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C9456E59D;
	Wed, 18 Aug 2021 12:41:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49BA26E59F
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 12:41:33 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 j12-20020a05600c1c0c00b002e6d80c902dso1681197wms.4
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 05:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BdAGUCyYQ4noYy9BmzZUbXym0YMYKVh78nm2c4sCaNo=;
 b=QYgwx9dlaH3RyUx/fnHN4Y6omSMw5U3O0ah91g35q7jVcI4dHVdFaNlCAdci13bVeR
 suo33HFIYdKFnq4fJ4fe46eLIB0DEHfW0gQnunFK9UotHj+5C6KGF12/5QBzbiS3jZ2y
 SVCHPCM+ztoxWXAZEzGNQgqBpc58ZaKALwgm6IBzLYv6HDimXgIBNTwo//C71fOLZlAn
 nK2XD5wDJEFm7z1KFGODM6Cm2Dwk4eb8pq5hH05OTNlMSqKAH0lLMvYmJx+uU6orLu7x
 wUTLsYC51JHA00/WP57cFAUcyotGJsTNCjdZy2QSY24l4JotdNC4vwjc6WdVuXGB/aiw
 aNfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BdAGUCyYQ4noYy9BmzZUbXym0YMYKVh78nm2c4sCaNo=;
 b=L7ml0f7T9B0b+dTi2id4EQv4qd5x07+v9kvxqTX264itO6Li2MqOwIkQwC9fOjCUxn
 2EUEYCOPJwsv3DUMgYKKYz21G3/XMiC6KSBIVhIVu2tK2iuAp/y42aXDF8m/aXBDGujy
 3MFC53z6NC1JZxsGa3/4O7YgBaVqbID6hVR5KYKz23pdpxAB5ZpkcL6WDEzgeWfnH0Ya
 rdbtUkP3ap5fvKUJzxtg8TTr527vcWsVfh8DwttnZS2WiED2/mmtEgM9cZeplcK2Ogwn
 SKHhS3Ac263tkU6XH8iuYk4zxWtVYM/3ZmToOVFowTBQrLfeeUH4rHZMHbI411C/9nwu
 qX4A==
X-Gm-Message-State: AOAM532lPq6wj4imAfiSH+LeMapl5Q9MrXrLWQpVs94t3V5SoasaUcIs
 6ZUj8dItfYAesduRRAxoeng=
X-Google-Smtp-Source: ABdhPJyZRhqaYkeCZQae/8p1e2NVcwuFX4TMTiDaEpXsViXU87cjD/bV2wjYHtpTMOTxNDHl4WsObQ==
X-Received: by 2002:a05:600c:4ba4:: with SMTP id
 e36mr8524581wmp.82.1629290491753; 
 Wed, 18 Aug 2021 05:41:31 -0700 (PDT)
Received: from localhost.localdomain (arl-84-90-178-246.netvisao.pt.
 [84.90.178.246])
 by smtp.gmail.com with ESMTPSA id a11sm5720454wrq.6.2021.08.18.05.41.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 05:41:31 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Emma Anholt <emma@anholt.net>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH 5/5] drm: omap: remove obsolete selection of OMAP2_DSS in
 config DRM_OMAP
Date: Wed, 18 Aug 2021 14:41:14 +0200
Message-Id: <20210818124114.28545-6-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210818124114.28545-1-lukas.bulwahn@gmail.com>
References: <20210818124114.28545-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 55b68fb856b5 ("drm/omap: squash omapdrm sub-modules into one")
removes the config OMAP2_DSS in ./drivers/gpu/drm/omapdrm/dss/Kconfig,
while moving the other configs into./drivers/gpu/drm/omapdrm/Kconfig, but
misses to remove an obsolete selection of OMAP2_DSS in config DRM_OMAP.

Hence, ./scripts/checkkconfigsymbols.py warns:

OMAP2_DSS
Referencing files: drivers/gpu/drm/omapdrm/Kconfig

Remove this reference in an obsolete selection.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 drivers/gpu/drm/omapdrm/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/omapdrm/Kconfig b/drivers/gpu/drm/omapdrm/Kconfig
index e7281da5bc6a..d6e4df291d6f 100644
--- a/drivers/gpu/drm/omapdrm/Kconfig
+++ b/drivers/gpu/drm/omapdrm/Kconfig
@@ -3,7 +3,6 @@ config DRM_OMAP
 	tristate "OMAP DRM"
 	depends on DRM
 	depends on ARCH_OMAP2PLUS || ARCH_MULTIPLATFORM
-	select OMAP2_DSS
 	select DRM_KMS_HELPER
 	select VIDEOMODE_HELPERS
 	select HDMI
-- 
2.26.2

