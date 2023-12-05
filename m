Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9E0804520
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 03:41:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A96510E469;
	Tue,  5 Dec 2023 02:41:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 983D210E0EA
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 02:41:08 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-544-2mzi4511N1KI3JvboE3Xpg-1; Mon,
 04 Dec 2023 21:41:05 -0500
X-MC-Unique: 2mzi4511N1KI3JvboE3Xpg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 517113C025C8;
 Tue,  5 Dec 2023 02:41:05 +0000 (UTC)
Received: from dreadlord.lan (unknown [10.64.136.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5243240C6EB9;
 Tue,  5 Dec 2023 02:41:04 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] nouveau/gsp: drop some acpi related debug
Date: Tue,  5 Dec 2023 12:41:02 +1000
Message-ID: <20231205024102.788908-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
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
Cc: nouveau@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These were leftover debug, if we need to bring them back do so
for debugging later.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/d=
rm/nouveau/nvkm/subdev/gsp/r535.c
index 6c0a8fbf0061..1dba7c49bd9a 100644
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

