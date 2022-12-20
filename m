Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F79652DF0
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 09:30:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 351F810E435;
	Wed, 21 Dec 2022 08:30:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender-of-o50.zoho.in (sender-of-o50.zoho.in [103.117.158.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADC8510E3E4
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 20:17:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1671567419; cv=none; d=zohomail.in; s=zohoarc; 
 b=HfgL6Jue0Y0Rojcp5SehZwYQN0BTAlCvRulSiyHEocY1ejgx1Xoa5HBUsUN0zvFbXe+eJz0JlT6Bvlo76dguHABL5X3QwuZQpaNHamVD08sU9GwbQPkFwiMVZIcwKrICBXGu5hBTHQP24/eJpP7p1hInyO9mQyPpPydnvFqw1FI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1671567419;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=B4vywaIeLwwUL8wGjn4w5oeVMlLDAnoFbaWGpVzc6bA=; 
 b=NmdxvWTfCADXu8h23KHd6olXtR5IziDsuxL4iTyaWJN6nF37BTE/4zSinHg+5qzbpl329XOw7wTvgSpsVYncXizFmIYfuDwqMfEMW7osbGr9B5kkb+m+7ZItFC7M5eQsk7rn+GexC6HZ6Fh0beKM6mLiRBU8r/UXabbrrtND2vs=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1671567419; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=B4vywaIeLwwUL8wGjn4w5oeVMlLDAnoFbaWGpVzc6bA=;
 b=heY8VjP7cjsXz2je20S1ET3eBzTMeKTh0uG55VBqDW13Ub3hIC0KUWJEMTn5JJlw
 zAkawAg5qlEs/Ao0nNsROT7sKMOgrdf2UH+HZ3WEi8QNQN+8kB3N7G+p9P9zow3N5F/
 L2jGkAGYELZfqp53GI/YiyjH30iza0jkYDrhT2B0=
Received: from kampyooter.. (110.226.31.37 [110.226.31.37]) by mx.zoho.in
 with SMTPS id 1671567419224643.9504838203884;
 Wed, 21 Dec 2022 01:46:59 +0530 (IST)
From: Siddh Raman Pant <code@siddh.me>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Message-ID: <09fceb1bcb8721e7ff1801e62f016f09d8f3d287.1671566741.git.code@siddh.me>
Subject: [PATCH 02/10] drm: Remove usage of deprecated DRM_NOTE
Date: Wed, 21 Dec 2022 01:46:37 +0530
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1671566741.git.code@siddh.me>
References: <cover.1671566741.git.code@siddh.me>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Content-Type: text/plain; charset=utf8
X-Mailman-Approved-At: Wed, 21 Dec 2022 08:29:21 +0000
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

drm_print.h says DRM_NOTE is deprecated in favour of pr_notice().

Signed-off-by: Siddh Raman Pant <code@siddh.me>
---
 drivers/gpu/drm/drm_displayid.c         | 2 +-
 drivers/gpu/drm/drm_kms_helper_common.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_displayid.c b/drivers/gpu/drm/drm_displayi=
d.c
index 38ea8203df45..e8431da8238a 100644
--- a/drivers/gpu/drm/drm_displayid.c
+++ b/drivers/gpu/drm/drm_displayid.c
@@ -26,7 +26,7 @@ static int validate_displayid(const u8 *displayid, int le=
ngth, int idx)
 =09for (i =3D 0; i < dispid_length; i++)
 =09=09csum +=3D displayid[idx + i];
 =09if (csum) {
-=09=09DRM_NOTE("DisplayID checksum invalid, remainder is %d\n", csum);
+=09=09pr_notice("DisplayID checksum invalid, remainder is %d\n", csum);
 =09=09return -EINVAL;
 =09}
=20
diff --git a/drivers/gpu/drm/drm_kms_helper_common.c b/drivers/gpu/drm/drm_=
kms_helper_common.c
index 0bf0fc1abf54..bcb3dd62462c 100644
--- a/drivers/gpu/drm/drm_kms_helper_common.c
+++ b/drivers/gpu/drm/drm_kms_helper_common.c
@@ -41,7 +41,7 @@ MODULE_LICENSE("GPL and additional rights");
 /* Backward compatibility for drm_kms_helper.edid_firmware */
 static int edid_firmware_set(const char *val, const struct kernel_param *k=
p)
 {
-=09DRM_NOTE("drm_kms_helper.edid_firmware is deprecated, please use drm.ed=
id_firmware instead.\n");
+=09pr_notice("drm_kms_helper.edid_firmware is deprecated, please use drm.e=
did_firmware instead.\n");
=20
 =09return __drm_set_edid_firmware_path(val);
 }
--=20
2.35.1


