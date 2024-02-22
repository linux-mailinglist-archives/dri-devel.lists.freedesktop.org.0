Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC904860D29
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 09:48:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBBD710EB41;
	Fri, 23 Feb 2024 08:48:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=pm.me header.i=@pm.me header.b="pxu8i3m+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4327.protonmail.ch (mail-4327.protonmail.ch [185.70.43.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2557A10EA60
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 20:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
 s=protonmail3; t=1708634778; x=1708893978;
 bh=37hKk11wdEdosUk5Mox6IYZzpVB1nuBp0yHYCiPBiCA=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=pxu8i3m+Mw5DqxTZQTJj3lDuH4cgmbiJq2hfROBMQ0i7fGOyf9eUx3oOvJndtz16l
 3CUcjVzf86CogNH5P8xztDkYeooEDdqTONXoifVk19Hpax+4UBXMCJGmgttN9Il53Z
 jbQgkbac1twDweKW5DgflduMUPJNeIOCZqE5nqshnngluYViQZjgH8PLwjeI/y48hR
 hWH5FxJLG4ppl0tixrE+TOdrlajcPhDIIrxcTKEuiWsNnhlRiJpqHXIC23LX0WoUnt
 1dppLRm6tqcf8Wi9V6QKwUUl7li4t76IeV37czrb8qUkEVWDxL8JjJpThBKVKpt2oK
 rNEvck5V5xzJA==
Date: Thu, 22 Feb 2024 20:46:09 +0000
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
From: Nicolas <ndevos-dev@pm.me>
Cc: Nicolas <ndevos-dev@pm.me>
Subject: [PATCH] gpu/drm: Fix several checkpatch warnings
Message-ID: <20240222204450.7943-1-ndevos-dev@pm.me>
Feedback-ID: 76711691:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 23 Feb 2024 08:48:22 +0000
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

This commit includes several checkpatch for drm_connector.c:
- SPDX license
- Spaces before tabs
- Unnecessary brackets
- unsigned int is preferred over unsigned
---
 drivers/gpu/drm/drm_connector.c | 142 ++++++++++++++++----------------
 1 file changed, 71 insertions(+), 71 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connecto=
r.c
index b0516505f7ae..4e6c910e339b 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
 /*
  * Copyright (c) 2016 Intel Corporation
  *
@@ -313,9 +314,8 @@ static int __drm_connector_init(struct drm_device *dev,
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
@@ -1150,70 +1150,70 @@ static const u32 dp_colorspaces =3D
  * DRM connectors have a few standardized properties:
  *
  * EDID:
- * =09Blob property which contains the current EDID read from the sink. Th=
is
- * =09is useful to parse sink identification information like vendor, mode=
l
- * =09and serial. Drivers should update this property by calling
- * =09drm_connector_update_edid_property(), usually after having parsed
- * =09the EDID using drm_add_edid_modes(). Userspace cannot change this
- * =09property.
- *
- * =09User-space should not parse the EDID to obtain information exposed v=
ia
- * =09other KMS properties (because the kernel might apply limits, quirks =
or
- * =09fixups to the EDID). For instance, user-space should not try to pars=
e
- * =09mode lists from the EDID.
+ *=09Blob property which contains the current EDID read from the sink. Thi=
s
+ *=09is useful to parse sink identification information like vendor, model
+ *=09and serial. Drivers should update this property by calling
+ *=09drm_connector_update_edid_property(), usually after having parsed
+ *=09the EDID using drm_add_edid_modes(). Userspace cannot change this
+ *=09property.
+ *
+ *=09User-space should not parse the EDID to obtain information exposed vi=
a
+ *=09other KMS properties (because the kernel might apply limits, quirks o=
r
+ *=09fixups to the EDID). For instance, user-space should not try to parse
+ *=09mode lists from the EDID.
  * DPMS:
- * =09Legacy property for setting the power state of the connector. For at=
omic
- * =09drivers this is only provided for backwards compatibility with exist=
ing
- * =09drivers, it remaps to controlling the "ACTIVE" property on the CRTC =
the
- * =09connector is linked to. Drivers should never set this property direc=
tly,
- * =09it is handled by the DRM core by calling the &drm_connector_funcs.dp=
ms
- * =09callback. For atomic drivers the remapping to the "ACTIVE" property =
is
- * =09implemented in the DRM core.
- *
- * =09Note that this property cannot be set through the MODE_ATOMIC ioctl,
- * =09userspace must use "ACTIVE" on the CRTC instead.
- *
- * =09WARNING:
- *
- * =09For userspace also running on legacy drivers the "DPMS" semantics ar=
e a
- * =09lot more complicated. First, userspace cannot rely on the "DPMS" val=
ue
- * =09returned by the GETCONNECTOR actually reflecting reality, because ma=
ny
- * =09drivers fail to update it. For atomic drivers this is taken care of =
in
- * =09drm_atomic_helper_update_legacy_modeset_state().
- *
- * =09The second issue is that the DPMS state is only well-defined when th=
e
- * =09connector is connected to a CRTC. In atomic the DRM core enforces th=
at
- * =09"ACTIVE" is off in such a case, no such checks exists for "DPMS".
- *
- * =09Finally, when enabling an output using the legacy SETCONFIG ioctl th=
en
- * =09"DPMS" is forced to ON. But see above, that might not be reflected i=
n
- * =09the software value on legacy drivers.
- *
- * =09Summarizing: Only set "DPMS" when the connector is known to be enabl=
ed,
- * =09assume that a successful SETCONFIG call also sets "DPMS" to on, and
- * =09never read back the value of "DPMS" because it can be incorrect.
+ *=09Legacy property for setting the power state of the connector. For ato=
mic
+ *=09drivers this is only provided for backwards compatibility with existi=
ng
+ *=09drivers, it remaps to controlling the "ACTIVE" property on the CRTC t=
he
+ *=09connector is linked to. Drivers should never set this property direct=
ly,
+ *=09it is handled by the DRM core by calling the &drm_connector_funcs.dpm=
s
+ *=09callback. For atomic drivers the remapping to the "ACTIVE" property i=
s
+ *=09implemented in the DRM core.
+ *
+ *=09Note that this property cannot be set through the MODE_ATOMIC ioctl,
+ *=09userspace must use "ACTIVE" on the CRTC instead.
+ *
+ *=09WARNING:
+ *
+ *=09For userspace also running on legacy drivers the "DPMS" semantics are=
 a
+ *=09lot more complicated. First, userspace cannot rely on the "DPMS" valu=
e
+ *=09returned by the GETCONNECTOR actually reflecting reality, because man=
y
+ *=09drivers fail to update it. For atomic drivers this is taken care of i=
n
+ *=09drm_atomic_helper_update_legacy_modeset_state().
+ *
+ *=09The second issue is that the DPMS state is only well-defined when the
+ *=09connector is connected to a CRTC. In atomic the DRM core enforces tha=
t
+ *=09"ACTIVE" is off in such a case, no such checks exists for "DPMS".
+ *
+ *=09Finally, when enabling an output using the legacy SETCONFIG ioctl the=
n
+ *=09"DPMS" is forced to ON. But see above, that might not be reflected in
+ *=09the software value on legacy drivers.
+ *
+ *=09Summarizing: Only set "DPMS" when the connector is known to be enable=
d,
+ *=09assume that a successful SETCONFIG call also sets "DPMS" to on, and
+ *=09never read back the value of "DPMS" because it can be incorrect.
  * PATH:
- * =09Connector path property to identify how this sink is physically
- * =09connected. Used by DP MST. This should be set by calling
- * =09drm_connector_set_path_property(), in the case of DP MST with the
- * =09path property the MST manager created. Userspace cannot change this
- * =09property.
- *
- * =09In the case of DP MST, the property has the format
- * =09``mst:<parent>-<ports>`` where ``<parent>`` is the KMS object ID of =
the
- * =09parent connector and ``<ports>`` is a hyphen-separated list of DP MS=
T
- * =09port numbers. Note, KMS object IDs are not guaranteed to be stable
- * =09across reboots.
+ *=09Connector path property to identify how this sink is physically
+ *=09connected. Used by DP MST. This should be set by calling
+ *=09drm_connector_set_path_property(), in the case of DP MST with the
+ *=09path property the MST manager created. Userspace cannot change this
+ *=09property.
+ *
+ *=09In the case of DP MST, the property has the format
+ *=09``mst:<parent>-<ports>`` where ``<parent>`` is the KMS object ID of t=
he
+ *=09parent connector and ``<ports>`` is a hyphen-separated list of DP MST
+ *=09port numbers. Note, KMS object IDs are not guaranteed to be stable
+ *=09across reboots.
  * TILE:
- * =09Connector tile group property to indicate how a set of DRM connector
- * =09compose together into one logical screen. This is used by both high-=
res
- * =09external screens (often only using a single cable, but exposing mult=
iple
- * =09DP MST sinks), or high-res integrated panels (like dual-link DSI) wh=
ich
- * =09are not gen-locked. Note that for tiled panels which are genlocked, =
like
- * =09dual-link LVDS or dual-link DSI, the driver should try to not expose=
 the
- * =09tiling and virtualise both &drm_crtc and &drm_plane if needed. Drive=
rs
- * =09should update this value using drm_connector_set_tile_property().
- * =09Userspace cannot change this property.
+ *=09Connector tile group property to indicate how a set of DRM connector
+ *=09compose together into one logical screen. This is used by both high-r=
es
+ *=09external screens (often only using a single cable, but exposing multi=
ple
+ *=09DP MST sinks), or high-res integrated panels (like dual-link DSI) whi=
ch
+ *=09are not gen-locked. Note that for tiled panels which are genlocked, l=
ike
+ *=09dual-link LVDS or dual-link DSI, the driver should try to not expose =
the
+ *=09tiling and virtualise both &drm_crtc and &drm_plane if needed. Driver=
s
+ *=09should update this value using drm_connector_set_tile_property().
+ *=09Userspace cannot change this property.
  * link-status:
  *      Connector link-status property to indicate the status of link. The
  *      default value of link-status is "GOOD". If something fails during =
or
@@ -1247,9 +1247,9 @@ static const u32 dp_colorspaces =3D
  *      to how it might fail if a different screen has been connected in t=
he
  *      interim.
  * non_desktop:
- * =09Indicates the output should be ignored for purposes of displaying a
- * =09standard desktop environment or console. This is most likely because
- * =09the output device is not rectilinear.
+ *=09Indicates the output should be ignored for purposes of displaying a
+ *=09standard desktop environment or console. This is most likely because
+ *=09the output device is not rectilinear.
  * Content Protection:
  *=09This property is used by userspace to request the kernel protect futu=
re
  *=09content communicated over the link. When requested, kernel will apply
@@ -1399,7 +1399,7 @@ static const u32 dp_colorspaces =3D
  * Connectors also have one standardized atomic property:
  *
  * CRTC_ID:
- * =09Mode object ID of the &drm_crtc this connector should be connected t=
o.
+ *=09Mode object ID of the &drm_crtc this connector should be connected to=
.
  *
  * Connectors for LCD panels may also have one standardized property:
  *
@@ -1721,7 +1721,7 @@ EXPORT_SYMBOL(drm_connector_attach_content_type_prope=
rty);
=20
 /**
  * drm_connector_attach_tv_margin_properties - attach TV connector margin
- * =09properties
+ *=09properties
  * @connector: DRM connector
  *
  * Called by a driver when it needs to attach TV margin props to a connect=
or.
@@ -2076,7 +2076,7 @@ int drm_connector_attach_scaling_mode_property(struct=
 drm_connector *connector,
 =09struct drm_device *dev =3D connector->dev;
 =09struct drm_property *scaling_mode_property;
 =09int i;
-=09const unsigned valid_scaling_mode_mask =3D
+=09const unsigned int valid_scaling_mode_mask =3D
 =09=09(1U << ARRAY_SIZE(drm_scaling_mode_enum_list)) - 1;
=20
 =09if (WARN_ON(hweight32(scaling_mode_mask) < 2 ||
@@ -2817,9 +2817,9 @@ int drm_connector_set_obj_prop(struct drm_mode_object=
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


