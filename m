Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85ED3895FC8
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 00:49:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6819411212E;
	Tue,  2 Apr 2024 22:49:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=pm.me header.i=@pm.me header.b="WaSfnbwK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-41103.protonmail.ch (mail-41103.protonmail.ch
 [185.70.41.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F5C510EEB4
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 22:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
 s=protonmail3; t=1712097826; x=1712357026;
 bh=0FtEGd4MmokinMdwcnnrHLEq9ZEZJcFh+6iVS2zIfJU=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=WaSfnbwKIFhzpOw66WKqxu7gC/3rrd7iRVDvJGKLqKY7bVIiR8QJGS0fpy2fptwuu
 pr1W5kFVCbEcVciqQVaR/L3V/qXE2jiFotdujciehOKyQlAdlzUIstDI1OzkiMsi1F
 0NgxypKbrjykZlS7n18QQD3XEKFAgj2uDGk2gzvgYBvRJFXDi93L8ZmYw1uSEiRqRR
 f8miPnzcJvhr3o3h/xTMa8BRkkpUjIVyVwJ6TSv9E1Op+4uFdXubrr4vOWo+9NH6mr
 uA8vd6CycFyyDm1JQ4ZqkjmfeBpN44z5JWqEPlMqm2KnUFVsOvHK5AogArKrQRs7V8
 Fo4bd5ARcaEHA==
Date: Tue, 02 Apr 2024 22:43:38 +0000
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
From: Nicolas Devos <ndevos-dev@pm.me>
Cc: Nicolas Devos <ndevos-dev@pm.me>
Subject: [PATCH 2/4] gpu/drm: Remove unnecessary braces
Message-ID: <20240402224320.12146-3-ndevos-dev@pm.me>
In-Reply-To: <20240402224320.12146-1-ndevos-dev@pm.me>
References: <20240402224320.12146-1-ndevos-dev@pm.me>
Feedback-ID: 76711691:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 02 Apr 2024 22:48:59 +0000
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

This commit fixes following checkpatch warnings:
WARNING: braces {} are not necessary for single statement blocks
WARNING: braces {} are not necessary for any arm of this statement

Signed-off-by: Nicolas Devos <ndevos-dev@pm.me>
---
 drivers/gpu/drm/drm_connector.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connecto=
r.c
index 40350256b1f6..6d8f0fc905f3 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -314,9 +314,8 @@ static int __drm_connector_init(struct drm_device *dev,
 =09=09=09=09   config->tile_property,
 =09=09=09=09   0);
=20
-=09if (drm_core_check_feature(dev, DRIVER_ATOMIC)) {
+=09if (drm_core_check_feature(dev, DRIVER_ATOMIC))
 =09=09drm_object_attach_property(&connector->base, config->prop_crtc_id, 0=
);
-=09}
=20
 =09connector->debugfs_entry =3D NULL;
 out_put_type_id:
@@ -2818,9 +2817,9 @@ int drm_connector_set_obj_prop(struct drm_mode_object=
 *obj,
 =09struct drm_connector *connector =3D obj_to_connector(obj);
=20
 =09/* Do DPMS ourselves */
-=09if (property =3D=3D connector->dev->mode_config.dpms_property) {
+=09if (property =3D=3D connector->dev->mode_config.dpms_property)
 =09=09ret =3D (*connector->funcs->dpms)(connector, (int)value);
-=09} else if (connector->funcs->set_property)
+=09else if (connector->funcs->set_property)
 =09=09ret =3D connector->funcs->set_property(connector, property, value);
=20
 =09if (!ret)
--=20
2.42.0


