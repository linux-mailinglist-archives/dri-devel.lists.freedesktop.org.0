Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F02DB75389C
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 12:46:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C101D10E08E;
	Fri, 14 Jul 2023 10:46:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76C9D10E08E
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 10:46:09 +0000 (UTC)
Date: Fri, 14 Jul 2023 10:46:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1689331566; x=1689590766;
 bh=DY6x2Fh4B/JVNyCv47E1PVT/qIbnNcx2Fez2vh2dzN0=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=dyBGoTrp7bR/f5YPyCKPsvuPs21/a/w7KSasRgnDTHwhDkZtcA63iXXyo3tOJtoPv
 BYnjicyHi2HjcAVIuZi3ue4q1u5mVUMAKhmJ9/NydvwtE8eEFcCJgnPFqCU4X2ppgx
 ArXnj+5Q85PBB8RFrR1T9cB6Y0jlsLk+AiEKSyrCmPPlCgolc8uOS2xImYZP5fprIJ
 UykByOLofJ5DHJoH0kWIyznBfOsEdnU7pD+27gtrOSzEMDWTxqzNg67ZEgs7jFhNS8
 MqGqyEPaMwpDdHExMoPZb6zWyGm+SrYFHNphMZ1c0t+H0fqwd9wOY7EP9vjRTU1H1Q
 U18OOgZrg9HXQ==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH 2/3] drm/file: use explicit values for enum drm_minor_type
Message-ID: <20230714104557.518457-2-contact@emersion.fr>
In-Reply-To: <20230714104557.518457-1-contact@emersion.fr>
References: <20230714104557.518457-1-contact@emersion.fr>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?utf-8?Q?Marek_Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>,
 James Zhu <James.Zhu@amd.com>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This makes it clearer that the values cannot be changed because
they are ABI.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
Cc: James Zhu <James.Zhu@amd.com>
Cc: Marek Ol=C5=A1=C3=A1k <marek.olsak@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 include/drm/drm_file.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 966912053cb0..010239392adf 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -50,16 +50,16 @@ struct file;
  * header include loops we need it here for now.
  */
=20
-/* Note that the order of this enum is ABI (it determines
+/* Note that the values of this enum are ABI (it determines
  * /dev/dri/renderD* numbers).
  *
  * Setting DRM_MINOR_ACCEL to 32 gives enough space for more drm minors to
  * be implemented before we hit any future
  */
 enum drm_minor_type {
-=09DRM_MINOR_PRIMARY,
-=09DRM_MINOR_CONTROL,
-=09DRM_MINOR_RENDER,
+=09DRM_MINOR_PRIMARY =3D 0,
+=09DRM_MINOR_CONTROL =3D 1,
+=09DRM_MINOR_RENDER =3D 2,
 =09DRM_MINOR_ACCEL =3D 32,
 };
=20
--=20
2.41.0


