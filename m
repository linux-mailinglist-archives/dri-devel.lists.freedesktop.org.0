Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9A865F6AF
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 23:25:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28FDD10E817;
	Thu,  5 Jan 2023 22:25:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender-of-o50.zoho.in (sender-of-o50.zoho.in [103.117.158.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16CE510E817
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 22:25:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1672957509; cv=none; d=zohomail.in; s=zohoarc; 
 b=RmEZYZTTZ+n9uss18sU3rIltLzJrCKx61PtiH8FE/9rJNFFc4360JEH+lDUbaVplNeq1pUue1ssrlOJzINq7PSnEufzGkoqqH0DSwF8FJkiaQ/dX3QQ/SMmURfhet9W/yE/ubsIQsutRHxpM0NVKwO4N1uyWM9qBo/4X8625QrI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1672957509;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=8m3UiIpaqwhxOnubafQnfgDXsOIquhP+SlU1ixmnv+8=; 
 b=A/unJIuimFwtpf6sClwSI4IwDSe0jVSsEVC9VZECS1g9+yRE1MzOXLTaqeDLO1iZUYrt0M5a8Y70xFz7bEMvgs3JWgfxD7HLn+LyRa3n6Epfw+kOuj4UuayK8X4I7MHJe5+C7kdq3yUpFn4KaLZw0YIF7rHaQJGQsxchlWhOQh8=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1672957509; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=8m3UiIpaqwhxOnubafQnfgDXsOIquhP+SlU1ixmnv+8=;
 b=RDuXqehOf3S1hiI4cakCQa4MevmZ7QWt0nW0pV+xXQcKRHDQjOPPY6OiI6A9T0D2
 3ZiPScseo0PZekpvqsAxzr7I7h7Ukp6g592OZDxraSs8Lcqy9H/llvZSCirgTPIjYnn
 H16XKNb5sWnX2VnKIuGPmpTEwADJQPS9H8h8CJzw=
Received: from kampyooter.. (110.226.31.37 [110.226.31.37]) by mx.zoho.in
 with SMTPS id 1672957507254842.5520703240902;
 Fri, 6 Jan 2023 03:55:07 +0530 (IST)
From: Siddh Raman Pant <code@siddh.me>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Simon Ser <contact@emersion.fr>,
 Jim Cromie <jim.cromie@gmail.com>
Message-ID: <4b4e45033e7980669d34467ad9b2c361822c0218.1672957022.git.code@siddh.me>
Subject: [PATCH v4 03/10] drm: Remove usage of deprecated DRM_NOTE
Date: Fri,  6 Jan 2023 03:54:54 +0530
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1672957022.git.code@siddh.me>
References: <cover.1672957022.git.code@siddh.me>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Content-Type: text/plain; charset=utf8
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

drm_print.h says DRM_NOTE is deprecated in favor of drm_notice().

Signed-off-by: Siddh Raman Pant <code@siddh.me>
---
 drivers/gpu/drm/drm_displayid.c         | 2 +-
 drivers/gpu/drm/drm_kms_helper_common.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_displayid.c b/drivers/gpu/drm/drm_displayi=
d.c
index 38ea8203df45..67fed6cee9e9 100644
--- a/drivers/gpu/drm/drm_displayid.c
+++ b/drivers/gpu/drm/drm_displayid.c
@@ -26,7 +26,7 @@ static int validate_displayid(const u8 *displayid, int le=
ngth, int idx)
 =09for (i =3D 0; i < dispid_length; i++)
 =09=09csum +=3D displayid[idx + i];
 =09if (csum) {
-=09=09DRM_NOTE("DisplayID checksum invalid, remainder is %d\n", csum);
+=09=09drm_notice(NULL, "DisplayID checksum invalid, remainder is %d\n", cs=
um);
 =09=09return -EINVAL;
 =09}
=20
diff --git a/drivers/gpu/drm/drm_kms_helper_common.c b/drivers/gpu/drm/drm_=
kms_helper_common.c
index 0bf0fc1abf54..7a41373b67dc 100644
--- a/drivers/gpu/drm/drm_kms_helper_common.c
+++ b/drivers/gpu/drm/drm_kms_helper_common.c
@@ -41,7 +41,7 @@ MODULE_LICENSE("GPL and additional rights");
 /* Backward compatibility for drm_kms_helper.edid_firmware */
 static int edid_firmware_set(const char *val, const struct kernel_param *k=
p)
 {
-=09DRM_NOTE("drm_kms_helper.edid_firmware is deprecated, please use drm.ed=
id_firmware instead.\n");
+=09drm_notice(NULL, "drm_kms_helper.edid_firmware is deprecated, please us=
e drm.edid_firmware instead.\n");
=20
 =09return __drm_set_edid_firmware_path(val);
 }
--=20
2.39.0


