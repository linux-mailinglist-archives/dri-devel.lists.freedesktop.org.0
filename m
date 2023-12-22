Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA2F81C3E3
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 05:33:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 699C910E731;
	Fri, 22 Dec 2023 04:33:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ED8410E3CD
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 04:33:19 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-619-HzOKHCq5PdunjRZGhFYVyg-1; Thu,
 21 Dec 2023 23:33:15 -0500
X-MC-Unique: HzOKHCq5PdunjRZGhFYVyg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F480380606C;
 Fri, 22 Dec 2023 04:33:15 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.64.136.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 70A952026D66;
 Fri, 22 Dec 2023 04:33:14 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH 02/11] nouveau/gsp: drop some acpi related debug
Date: Fri, 22 Dec 2023 14:31:51 +1000
Message-ID: <20231222043308.3090089-3-airlied@gmail.com>
In-Reply-To: <20231222043308.3090089-1-airlied@gmail.com>
References: <20231222043308.3090089-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252; x-default=true
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

These were leftover debug, if we need to bring them back do so
for debugging later.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c | 7 -------
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c  | 9 ---------
 2 files changed, 16 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c b/drivers/gpu/=
drm/nouveau/nvkm/engine/disp/r535.c
index 298035070b3a..1c8c4cca0957 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c
@@ -1465,8 +1465,6 @@ r535_disp_oneinit(struct nvkm_disp *disp)
 =09=09=09=09bool nvhg =3D acpi_check_dsm(handle, &NVHG_DSM_GUID, NVHG_DSM_=
REV,
 =09=09=09=09=09=09           1ULL << 0x00000014);
=20
-=09=09=09=09printk(KERN_ERR "bl: nbci:%d nvhg:%d\n", nbci, nvhg);
-
 =09=09=09=09if (nbci || nvhg) {
 =09=09=09=09=09union acpi_object argv4 =3D {
 =09=09=09=09=09=09.buffer.type    =3D ACPI_TYPE_BUFFER,
@@ -1479,9 +1477,6 @@ r535_disp_oneinit(struct nvkm_disp *disp)
 =09=09=09=09=09if (!obj) {
 =09=09=09=09=09=09acpi_handle_info(handle, "failed to evaluate _DSM\n");
 =09=09=09=09=09} else {
-=09=09=09=09=09=09printk(KERN_ERR "bl: obj type %d\n", obj->type);
-=09=09=09=09=09=09printk(KERN_ERR "bl: obj len %d\n", obj->package.count);
-
 =09=09=09=09=09=09for (int i =3D 0; i < obj->package.count; i++) {
 =09=09=09=09=09=09=09union acpi_object *elt =3D &obj->package.elements[i];
 =09=09=09=09=09=09=09u32 size;
@@ -1491,12 +1486,10 @@ r535_disp_oneinit(struct nvkm_disp *disp)
 =09=09=09=09=09=09=09else
 =09=09=09=09=09=09=09=09size =3D 4;
=20
-=09=09=09=09=09=09=09printk(KERN_ERR "elt %03d: type %d size %d\n", i, elt=
->type, size);
 =09=09=09=09=09=09=09memcpy(&ctrl->backLightData[ctrl->backLightDataSize],=
 &elt->integer.value, size);
 =09=09=09=09=09=09=09ctrl->backLightDataSize +=3D size;
 =09=09=09=09=09=09}
=20
-=09=09=09=09=09=09printk(KERN_ERR "bl: data size %d\n", ctrl->backLightDat=
aSize);
 =09=09=09=09=09=09ctrl->status =3D 0;
 =09=09=09=09=09=09ACPI_FREE(obj);
 =09=09=09=09=09}
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/d=
rm/nouveau/nvkm/subdev/gsp/r535.c
index 7f831f41b598..365dda6c002a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -1100,16 +1100,12 @@ r535_gsp_acpi_caps(acpi_handle handle, CAPS_METHOD_=
DATA *caps)
 =09if (!obj)
 =09=09return;
=20
-=09printk(KERN_ERR "nvop: obj type %d\n", obj->type);
-=09printk(KERN_ERR "nvop: obj len %d\n", obj->buffer.length);
-
 =09if (WARN_ON(obj->type !=3D ACPI_TYPE_BUFFER) ||
 =09    WARN_ON(obj->buffer.length !=3D 4))
 =09=09return;
=20
 =09caps->status =3D 0;
 =09caps->optimusCaps =3D *(u32 *)obj->buffer.pointer;
-=09printk(KERN_ERR "nvop: caps %08x\n", caps->optimusCaps);
=20
 =09ACPI_FREE(obj);
=20
@@ -1136,9 +1132,6 @@ r535_gsp_acpi_jt(acpi_handle handle, JT_METHOD_DATA *=
jt)
 =09if (!obj)
 =09=09return;
=20
-=09printk(KERN_ERR "jt: obj type %d\n", obj->type);
-=09printk(KERN_ERR "jt: obj len %d\n", obj->buffer.length);
-
 =09if (WARN_ON(obj->type !=3D ACPI_TYPE_BUFFER) ||
 =09    WARN_ON(obj->buffer.length !=3D 4))
 =09=09return;
@@ -1147,7 +1140,6 @@ r535_gsp_acpi_jt(acpi_handle handle, JT_METHOD_DATA *=
jt)
 =09jt->jtCaps =3D *(u32 *)obj->buffer.pointer;
 =09jt->jtRevId =3D (jt->jtCaps & 0xfff00000) >> 20;
 =09jt->bSBIOSCaps =3D 0;
-=09printk(KERN_ERR "jt: caps %08x rev:%04x\n", jt->jtCaps, jt->jtRevId);
=20
 =09ACPI_FREE(obj);
=20
@@ -1233,7 +1225,6 @@ r535_gsp_acpi_dod(acpi_handle handle, DOD_METHOD_DATA=
 *dod)
 =09=09dod->acpiIdListLen +=3D sizeof(dod->acpiIdList[0]);
 =09}
=20
-=09printk(KERN_ERR "_DOD: ok! len:%d\n", dod->acpiIdListLen);
 =09dod->status =3D 0;
 }
 #endif
--=20
2.43.0

