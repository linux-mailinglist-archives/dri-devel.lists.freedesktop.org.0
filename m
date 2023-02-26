Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1206A2EBE
	for <lists+dri-devel@lfdr.de>; Sun, 26 Feb 2023 08:22:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1134C10E0C7;
	Sun, 26 Feb 2023 07:22:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender-of-o50.zoho.in (sender-of-o50.zoho.in [103.117.158.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8777E10E0C6
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Feb 2023 07:22:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1677396130; cv=none; d=zohomail.in; s=zohoarc; 
 b=KxddhieU05Ln4k1acieltQY7v0EoaLjC60fmQKJEmH3vOg2rDE98vLCdFsxajRFzRrgQARJGG0AyAbEjBk1dq6e0FQ6NV9lMYyAxhAgBP2Fc2hgLWiIZrvsQ9rRaRG4Thh4/gnXA0PEkoMAERiTT9TDMtzRhnQYNWrIcTcZMmcs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1677396130;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=8G/F/eygNJ3r9G90eWZBfkKRI/vHqXgYNYardtRrrwk=; 
 b=NIPJMHX52JXzcej7jDIbJ7xo+IByYy/I+VqquURN2YMANf3chidykb3PxuJSNWcZQMAHUiBrPhDl3mS1WhjYUOSUqSGJ6UjE5FCuuUuowBaEXQpWgcC9AQFSssAMsyND416MkcQxsEDgeII4QExaZB9PFe1fUDVgIY/oIwXV5Hc=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1677396130; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=8G/F/eygNJ3r9G90eWZBfkKRI/vHqXgYNYardtRrrwk=;
 b=LCZPCXDv4ycYlMgR8K8wtZdCgx7hbLG1+ug7V9FXnb3im7D5sQRZdo6YXilFh80z
 9zsKwmJLqYhenz21JnA3bm+CjRuHVlvFjqOiLZ4Txhvwa44VWwOpqA9NKEYEiKx6RvC
 fdp4mgiofe6YoFgnYNia0w73NX+poOkA/xshRbHY=
Received: from kampyooter.. (122.170.64.102 [122.170.64.102]) by mx.zoho.in
 with SMTPS id 1677396128649235.6112975918394;
 Sun, 26 Feb 2023 12:52:08 +0530 (IST)
From: Siddh Raman Pant <code@siddh.me>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jim Cromie <jim.cromie@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Message-ID: <496db3221937d0955e1771016f24489872737ffb.1677395403.git.code@siddh.me>
Subject: [PATCH v7 3/7] drm: Remove usage of deprecated DRM_NOTE
Date: Sun, 26 Feb 2023 12:51:50 +0530
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1677395403.git.code@siddh.me>
References: <cover.1677395403.git.code@siddh.me>
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
2.39.1


