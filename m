Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 915C04929D0
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 16:44:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B99710E1A0;
	Tue, 18 Jan 2022 15:44:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35B5C10E1A0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 15:44:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D56651F3BB;
 Tue, 18 Jan 2022 15:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1642520661; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=BGHzlxiS19GPfCXsEtRhvRf0r5x26P0DtRlGlbIZrv8=;
 b=GWXCW4SGw6Yjd8vOs3T6O5cnSpge9NM+mtWRPoSnL2shfGHFieDSCcqYKKxovHfWMNBmNt
 PPOTDET60L8ivNc7grHLBAZioMgrxdIExYbe+0lDeb6TmcOYdax+p3FGQgx1ToExntzXiT
 v4s2BtfQMzla1j/jtUSgcNjvnfWwx1s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1642520661;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=BGHzlxiS19GPfCXsEtRhvRf0r5x26P0DtRlGlbIZrv8=;
 b=hCW2f3DRe2ggjis/qCMDXaX+BimdyHGQdv3kQkzYXSHP8XC35c7ls2a/VT49nGdHCk3wYn
 osR2ZSqyPB2W7LCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A9A8713AB7;
 Tue, 18 Jan 2022 15:44:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id jhF2KFXg5mE/awAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 18 Jan 2022 15:44:21 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lyude@redhat.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
Subject: [PATCH] drm/selftests: Select DRM_DP_HELPER
Date: Tue, 18 Jan 2022 16:44:18 +0100
Message-Id: <20220118154418.25932-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.1
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Resolve warnings about non-existing symbols by selecting DRM_DP_HELPER.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: adb9d5a2cc77 ("drm/dp: Move DisplayPort helpers into separate helper module")
Reported-by: kernel test robot <lkp@intel.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 91f54aeb0b7c..65897777d931 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -68,6 +68,7 @@ config DRM_DEBUG_SELFTEST
 	depends on DRM
 	depends on DEBUG_KERNEL
 	select PRIME_NUMBERS
+	select DRM_DP_HELPER
 	select DRM_LIB_RANDOM
 	select DRM_KMS_HELPER
 	select DRM_EXPORT_FOR_TESTS if m
-- 
2.34.1

