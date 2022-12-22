Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADD8654DCE
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 09:46:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D351710E61B;
	Fri, 23 Dec 2022 08:45:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender-of-o50.zoho.in (sender-of-o50.zoho.in [103.117.158.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0BE810E533
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 15:40:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1671723650; cv=none; d=zohomail.in; s=zohoarc; 
 b=L0Mso4H09NMTWbLQuKSRtIani7ShsA8ryfjPJ15BYRvVvFW+RBMvaXw4l2W9TqlxC3w7w0osDyfd48eTlML9bxuGgYU6xwvJLZBnRAI5WIsSvdRP6LFyJzdQU+hh4GvrJx3GtCJadDxCTN0m05Z0gghuAdmDP3i9aa4BmLVONfE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1671723650;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=oY3981IrmoUdN5yimQiKjEoeQi+zVtf1CbGlFX5KcoU=; 
 b=K8YooLkXh6yy9WucGwhCLlnsd6N/ZukhILV+btogp2aXlRCseHJWNkt3nRKQRYqnQXaAppK94Y2MYqsMgVzpD+8WKpozFxJcKc3z+ck1SqUE5eECGeJ+2JGplmK+rQzLj4b3dcNZ5GZUGw1mbUmkyAOmJCtq5mWDMabCycWGvbM=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1671723650; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=oY3981IrmoUdN5yimQiKjEoeQi+zVtf1CbGlFX5KcoU=;
 b=O7aohhhWZcumu7PqKH1DWhrpFwKBjboMKMn4O47hxC0MKC9DR1e9thkqONI/sY26
 dIIcDpRL8KukzThb/R1adyUp7N1/XLtSbMWrbCRS3mn6kv7J8kf/myow9HfVFzc5AaM
 c0VtSkLgD+G9pDVf25Wg8sJHJJhrsuUx2F6v8w00=
Received: from kampyooter.. (110.226.31.37 [110.226.31.37]) by mx.zoho.in
 with SMTPS id 1671723649149737.4887777903457;
 Thu, 22 Dec 2022 21:10:49 +0530 (IST)
From: Siddh Raman Pant <code@siddh.me>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Simon Ser <contact@emersion.fr>
Message-ID: <5366b23e1e6761a303381fe1cccda2e41549113a.1671723195.git.code@siddh.me>
Subject: [PATCH v2 5/9] drm: Remove usage of deprecated DRM_DEBUG_DRIVER
Date: Thu, 22 Dec 2022 21:10:39 +0530
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1671723195.git.code@siddh.me>
References: <cover.1671723195.git.code@siddh.me>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Content-Type: text/plain; charset=utf8
X-Mailman-Approved-At: Fri, 23 Dec 2022 08:44:25 +0000
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
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_print.h says DRM_DEBUG_DRIVER is deprecated.
Thus, use newer drm_dbg_driver().

Also fix the deprecation comment in drm_print.h which
mentions drm_dbg() instead of drm_dbg_driver().

Signed-off-by: Siddh Raman Pant <code@siddh.me>
---
 drivers/gpu/drm/drm_mipi_dbi.c | 10 +++++-----
 include/drm/drm_print.h        |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.=
c
index 24af507bb687..6ad399f6ab03 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -69,11 +69,11 @@
 #define MIPI_DBI_DEBUG_COMMAND(cmd, data, len) \
 ({ \
 =09if (!len) \
-=09=09DRM_DEBUG_DRIVER("cmd=3D%02x\n", cmd); \
+=09=09drm_dbg_driver(NULL, "cmd=3D%02x\n", cmd); \
 =09else if (len <=3D 32) \
-=09=09DRM_DEBUG_DRIVER("cmd=3D%02x, par=3D%*ph\n", cmd, (int)len, data);\
+=09=09drm_dbg_driver(NULL, "cmd=3D%02x, par=3D%*ph\n", cmd, (int)len, data=
);\
 =09else \
-=09=09DRM_DEBUG_DRIVER("cmd=3D%02x, len=3D%zu\n", cmd, len); \
+=09=09drm_dbg_driver(NULL, "cmd=3D%02x, len=3D%zu\n", cmd, len); \
 })
=20
 static const u8 mipi_dbi_dcs_read_commands[] =3D {
@@ -632,7 +632,7 @@ bool mipi_dbi_display_is_on(struct mipi_dbi *dbi)
 =09    DCS_POWER_MODE_DISPLAY_NORMAL_MODE | DCS_POWER_MODE_SLEEP_MODE))
 =09=09return false;
=20
-=09DRM_DEBUG_DRIVER("Display is ON\n");
+=09drm_dbg_driver(NULL, "Display is ON\n");
=20
 =09return true;
 }
@@ -1168,7 +1168,7 @@ int mipi_dbi_spi_init(struct spi_device *spi, struct =
mipi_dbi *dbi,
=20
 =09mutex_init(&dbi->cmdlock);
=20
-=09DRM_DEBUG_DRIVER("SPI speed: %uMHz\n", spi->max_speed_hz / 1000000);
+=09drm_dbg_driver(NULL, "SPI speed: %uMHz\n", spi->max_speed_hz / 1000000)=
;
=20
 =09return 0;
 }
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 6d2d5c522e25..3f81f4edbe1d 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -582,7 +582,7 @@ void __drm_err(const char *format, ...);
 #define DRM_DEBUG(fmt, ...)=09=09=09=09=09=09\
 =09__drm_dbg(DRM_UT_CORE, fmt, ##__VA_ARGS__)
=20
-/* NOTE: this is deprecated in favor of drm_dbg(NULL, ...). */
+/* NOTE: this is deprecated in favor of drm_dbg_driver(NULL, ...). */
 #define DRM_DEBUG_DRIVER(fmt, ...)=09=09=09=09=09\
 =09__drm_dbg(DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
=20
--=20
2.35.1


