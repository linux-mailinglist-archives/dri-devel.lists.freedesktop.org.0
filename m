Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEE03F1822
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 13:23:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72BFA6E8B8;
	Thu, 19 Aug 2021 11:23:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E74B6E8B2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 11:23:11 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id f5so8494910wrm.13
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 04:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BdAGUCyYQ4noYy9BmzZUbXym0YMYKVh78nm2c4sCaNo=;
 b=dh0h2hzZb2yroUpq/SL+knwkJ21CNnxU/3mS7j6DNE7Y2XImBRQOxf0N0hBLYWNCzT
 ffd8uBCBYXnuFu61ChDmzfYshuGB2BFxSbB0Y4M+JE/21wxCUsxQtSS9jBkeoj9xjwUy
 VXSZxmMRTuoqIUSOkDLjT/NqApdoMI5s7YXUgkR0HinZS5eRWOD1Dhva+0hy2miSuRf3
 gSjc62iWfD1MZMHgyw8T7V09Pd8V0M0QBAbog2hiDoxlTY0MqReCsnGHQT8YCo9UvHGc
 0Ej6DOcy0aewKCnzR085IyLr3xXNKkoKaWertz6jsUDOKnfcN+369p911UROvaIuIvyH
 5yyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BdAGUCyYQ4noYy9BmzZUbXym0YMYKVh78nm2c4sCaNo=;
 b=iGZU8L7QzGNlIvGHI1qmeYMv+O55cik5EL0fovtJS2z0srWlenS5F5wKrLwxYE026i
 LnolZUaW0dyt3xzpEWsGldsczTeOacg91ix5IsXPAV134DUQY4gjdr4yKXu7nlz6tfyn
 zr3vuYNFqsjyh92AVMJKUNrV6Yevq9IIamgVFEA9HzWa8o4fXLXVJip8xIp5G0sk1pIg
 Y4N5H8xg5X1nNx2Mw+gtdb5nQY4cs22pi/N0frDkpRS2fEI4iqNCbHjNS400IX1HYs7e
 dsBCp6HR3cZTsCdelrt3UFpZcVf8SbfVDrxpPeGvrBDHnFzV0GGlsmRZQNXCQsAwqKv5
 UbrQ==
X-Gm-Message-State: AOAM530GYOV/oFhC0QEKQDblCO+BnWO7yCJsurwQy0G3PD1GuFwzDeUo
 ey4oX2KyGKlPJrx7kLmsBCA=
X-Google-Smtp-Source: ABdhPJz+nHXkVSWGA9lE/VQL6I22gEojvvk17S+GegjyVvKGMS14tNYNEWxpb3EtYyN5IiPOsZL4Kw==
X-Received: by 2002:adf:e889:: with SMTP id d9mr3103968wrm.223.1629372189558; 
 Thu, 19 Aug 2021 04:23:09 -0700 (PDT)
Received: from localhost.localdomain (arl-84-90-178-246.netvisao.pt.
 [84.90.178.246])
 by smtp.gmail.com with ESMTPSA id r1sm2700388wrt.24.2021.08.19.04.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 04:23:09 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Emma Anholt <emma@anholt.net>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH v2 5/5] drm: omap: remove obsolete selection of OMAP2_DSS in
 config DRM_OMAP
Date: Thu, 19 Aug 2021 13:22:53 +0200
Message-Id: <20210819112253.16484-6-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210819112253.16484-1-lukas.bulwahn@gmail.com>
References: <20210819112253.16484-1-lukas.bulwahn@gmail.com>
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

