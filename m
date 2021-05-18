Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE85387739
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 13:14:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 853E96EB24;
	Tue, 18 May 2021 11:14:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 165026EB24
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 11:14:55 +0000 (UTC)
Date: Tue, 18 May 2021 11:14:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1621336492;
 bh=8XMfq4CqtnBobSgQRyEyKjLE/6Nl9N9MeTSzZZ7pxNU=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=Af+HztBJdaSLbcWaCTlCKQsVNVofC+8wgN/UdxvXti8KDdHbSvNPI1AS2SN4h8thH
 M3aamc1j2ywFhhggQM6MWapAHVTEzTTOitQustkj7uam8yGXuKrqzSXvQr9gAI/yy0
 9lq8AAeegRFTXhe+2HImXXT3rdGAln77E0tfwacbhqQ5nK7QzZvQJzVau/tivjD4ix
 myHZIiAcMz6zRjFSBAhZ8BFYPFkYL8T+oZkBaLZyCc6DKBVECUe8siUZ8hnDlRhTcp
 am0Q6Biyw8m/X6UDjwIScbrHT23KAi69HgtQhxAziwFaY8mpdDOluocG83yUyOjtEy
 DMPQSgP9pGhKA==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH 1/3] drm: reference mode flags in DRM_CLIENT_CAP_* docs
Message-ID: <Yjo91Qsg0kYg3xGZAkEOSYjNm3YGkjElS6wObR59vz0@cp4-web-027.plabs.ch>
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
Cc: Daniel Stone <daniels@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the docs for DRM_CLIENT_CAP_STEREO_3D and
DRM_CLIENT_CAP_ASPECT_RATIO, reference the DRM_MODE_FLAG_* defines
that get set when the cap is enabled.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Daniel Stone <daniels@collabora.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
---
 include/uapi/drm/drm.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 67b94bc3c885..1c947227f72b 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -777,9 +777,9 @@ struct drm_get_cap {
 /**
  * DRM_CLIENT_CAP_STEREO_3D
  *
- * if set to 1, the DRM core will expose the stereo 3D capabilities of the
+ * If set to 1, the DRM core will expose the stereo 3D capabilities of the
  * monitor by advertising the supported 3D layouts in the flags of struct
- * drm_mode_modeinfo.
+ * drm_mode_modeinfo. See ``DRM_MODE_FLAG_3D_*``.
  */
 #define DRM_CLIENT_CAP_STEREO_3D=091
=20
@@ -804,6 +804,7 @@ struct drm_get_cap {
  * DRM_CLIENT_CAP_ASPECT_RATIO
  *
  * If set to 1, the DRM core will provide aspect ratio information in mode=
s.
+ * See ``DRM_MODE_FLAG_PIC_AR_*``.
  */
 #define DRM_CLIENT_CAP_ASPECT_RATIO    4
=20
--=20
2.31.1


