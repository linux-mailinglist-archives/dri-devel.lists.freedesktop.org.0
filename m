Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B406F40001A
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 15:00:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14C0C6E88F;
	Fri,  3 Sep 2021 13:00:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A6896E88D
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Sep 2021 13:00:30 +0000 (UTC)
Date: Fri, 03 Sep 2021 13:00:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1630674028;
 bh=yj1vPjXpuXfOLf5irnHdykDlpl0F5hwg9VHQTu+8H14=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=QSAs+uLpnFM0MRKOew76Onqohd57cLbtKmM1oVezcwltcIG5HTS2jkWT/PLGmDVPJ
 c+RrJy3OlFbunq9ZIjahXzH+QIl4WnNfzzbByO3AL9cbHhj/kCxJB/kOMgCns5foIW
 EmkznPOgCt9d4M2rZ2yLAJobss98rPqrmHEpqYf4EX18CHw/8wgEgyEl/z7a620GEQ
 7Dd7T2Ck5KTRuD5l+bkgMHpG1pYtijbalYpG24vYGNTGWnA0Zify9aziitGCgQR2RO
 KES+H5uuQhGVQLAlnmFzGKyDxt7S1fWbZtGNqkFue5IEPxSj6AYr9ZlKxOG7JVSVO6
 cglFUvNQem6sA==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Pekka Paalanen <pekka.paalanen@collabora.co.uk>,
 Keith Packard <keithp@keithp.com>
Subject: [PATCH v2 1/2] drm: document drm_mode_create_lease object requirements
Message-ID: <20210903130000.1590-1-contact@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

validate_lease expects one CRTC, one connector and one plane.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Pekka Paalanen <pekka.paalanen@collabora.co.uk>
Cc: Keith Packard <keithp@keithp.com>
---
 include/uapi/drm/drm_mode.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 90c55383f1ee..e4a2570a6058 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -1110,6 +1110,9 @@ struct drm_mode_destroy_blob {
  * struct drm_mode_create_lease - Create lease
  *
  * Lease mode resources, creating another drm_master.
+ *
+ * The @object_ids array must reference at least one CRTC, one connector a=
nd
+ * one plane if &DRM_CLIENT_CAP_UNIVERSAL_PLANES is enabled.
  */
 struct drm_mode_create_lease {
 =09/** @object_ids: Pointer to array of object ids (__u32) */
--=20
2.33.0


