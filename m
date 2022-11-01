Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C92416147CF
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 11:41:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEFFF10E379;
	Tue,  1 Nov 2022 10:40:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3068810E37A
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Nov 2022 10:40:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 70D4D1F90C;
 Tue,  1 Nov 2022 10:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1667299251; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fJmuCcYXCK1RMl/0E0HYeGZKRTs6L9t5L/wfgSYTO3k=;
 b=uuDx2LWzRMiOOrDViMIXsbLE8KcC/24k7bg/zAokkr7OI9bbKcikNio5BLrkUU7gahkiMs
 jm5gjHUKAAVR/vCXCz21PK6lgFt7sErHOrzNhbYvrhheIERZd6JsaBnvrGyAt5R0olZUC4
 enL8/r5Kk8tNHbxdqsk7MLbn35Djx/g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1667299251;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fJmuCcYXCK1RMl/0E0HYeGZKRTs6L9t5L/wfgSYTO3k=;
 b=NnzeKmTdojdKCjrkjwS8UMmZ16pGgBhLAmz5Cps94EU74T6NDsVTCxmx4p/tLbyo+RbIVu
 fZFUXUespqrrXACw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 39D701346F;
 Tue,  1 Nov 2022 10:40:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oxFKDbP3YGMhWwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 01 Nov 2022 10:40:51 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, daniel@ffwll.ch, airlied@gmail.com, maxime@cerno.tech
Subject: [PATCH] drm/ofdrm: Depend on CONFIG_MMU
Date: Tue,  1 Nov 2022 11:40:49 +0100
Message-Id: <20221101104049.15601-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.0
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
Cc: kernel test robot <lkp@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Danilo Krummrich <dakr@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Michal Suchanek <msuchanek@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a dependency on CONFIG_MMU to ofdrm. The driver uses GEM SHMEM
helpers, which require MMU support. A reported error message [1] is
shown below.

   arm-linux-gnueabi-ld: drivers/gpu/drm/drm_gem_shmem_helper.o: in function `drm_gem_shmem_fault':
   >> drivers/gpu/drm/drm_gem_shmem_helper.c:562: undefined reference to `vmf_insert_pfn'

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: c8a17756c425 ("drm/ofdrm: Add ofdrm for Open Firmware framebuffers")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: "Noralf Trønnes" <noralf@tronnes.org>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: Michal Suchanek <msuchanek@suse.de>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Link: https://lore.kernel.org/dri-devel/202210192029.ZFeJvqjv-lkp@intel.com/ # [1]
---
 drivers/gpu/drm/tiny/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
index a300b03a3c7a7..f6889f649bc18 100644
--- a/drivers/gpu/drm/tiny/Kconfig
+++ b/drivers/gpu/drm/tiny/Kconfig
@@ -53,7 +53,7 @@ config DRM_GM12U320
 
 config DRM_OFDRM
 	tristate "Open Firmware display driver"
-	depends on DRM && OF && (PPC || COMPILE_TEST)
+	depends on DRM && MMU && OF && (PPC || COMPILE_TEST)
 	select APERTURE_HELPERS
 	select DRM_GEM_SHMEM_HELPER
 	select DRM_KMS_HELPER
-- 
2.38.0

