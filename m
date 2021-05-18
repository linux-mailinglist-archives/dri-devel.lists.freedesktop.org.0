Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0970E38773B
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 13:15:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFC806EB26;
	Tue, 18 May 2021 11:15:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D466B6EB26
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 11:14:59 +0000 (UTC)
Date: Tue, 18 May 2021 11:14:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1621336497;
 bh=mXGdD0JZTVfsHYcdUVEkOkMKXOXSW2rB/j0ZWxKuPKo=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=uOWf6QDSa+G31h6jSuWwWJqcr6Uap53lmpBl4CNZBChgvPv8Jbcts4lxJx1vTv/aK
 ceqcGOqc+Vn00UEx6jGJn6JMYsTnqUC2hBbr8japvjLbAGnmplPRDPbYWSWB1PcJH9
 f4E6Sw5gVcwqGR5YEHudeJ5RJvr/7TVxHhAVOsoeeAm+z2F2tpgLRjVnWSb1bZLD4x
 HR3it3J7TH9cJCwljQXLw7wzq5KpaFxa45pRicUu8RaXFIIyPXYZ33ZmmKhpaP43z+
 b9uiYoAGHR4GL/ZrcKE95ai8jFHcxhD4xzenlZWOdZ5P0SejnNOLZgkW0NtVVW6JyI
 GPnrd2woQMmWg==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH 3/3] drm: document minimum kernel version for DRM_CLIENT_CAP_*
Message-ID: <8tBryxsjXiKtYZP4whnTumr2AsWx9X1xPmwFAdp5Nc@cp4-web-037.plabs.ch>
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

The kernel versions including the following commits are referenced:

DRM_CLIENT_CAP_STEREO_3D
61d8e3282541 ("drm: Add a STEREO_3D capability to the SET_CLIENT_CAP ioctl"=
)

DRM_CLIENT_CAP_UNIVERSAL_PLANES
681e7ec73044 ("drm: Allow userspace to ask for universal plane list (v2)")
c7dbc6c9ae5c ("drm: Remove command line guard for universal planes")

DRM_CLIENT_CAP_ATOMIC
88a48e297b3a ("drm: add atomic properties")
8b72ce158cf0 ("drm: Always enable atomic API")

DRM_CLIENT_CAP_ASPECT_RATIO
7595bda2fb43 ("drm: Add DRM client cap for aspect-ratio")

DRM_CLIENT_CAP_WRITEBACK_CONNECTORS
d67b6a206507 ("drm: writeback: Add client capability for exposing writeback=
 connectors")

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Daniel Stone <daniels@collabora.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
---
 include/uapi/drm/drm.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 87878aea4526..ec2b122cdcc5 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -780,6 +780,8 @@ struct drm_get_cap {
  * If set to 1, the DRM core will expose the stereo 3D capabilities of the
  * monitor by advertising the supported 3D layouts in the flags of struct
  * drm_mode_modeinfo. See ``DRM_MODE_FLAG_3D_*``.
+ *
+ * This capability is always supported starting from kernel version 3.13.
  */
 #define DRM_CLIENT_CAP_STEREO_3D=091
=20
@@ -788,6 +790,9 @@ struct drm_get_cap {
  *
  * If set to 1, the DRM core will expose all planes (overlay, primary, and
  * cursor) to userspace.
+ *
+ * This capability has been introduced in kernel version 3.15. Starting fr=
om
+ * kernel version 3.17, this capability is always supported.
  */
 #define DRM_CLIENT_CAP_UNIVERSAL_PLANES  2
=20
@@ -797,6 +802,13 @@ struct drm_get_cap {
  * If set to 1, the DRM core will expose atomic properties to userspace. T=
his
  * implicitly enables &DRM_CLIENT_CAP_UNIVERSAL_PLANES and
  * &DRM_CLIENT_CAP_ASPECT_RATIO.
+ *
+ * If the driver doesn't support atomic mode-setting, enabling this capabi=
lity
+ * will fail with -EOPNOTSUPP.
+ *
+ * This capability has been introduced in kernel version 4.0. Starting fro=
m
+ * kernel version 4.2, this capability is always supported for atomic-capa=
ble
+ * drivers.
  */
 #define DRM_CLIENT_CAP_ATOMIC=093
=20
@@ -805,6 +817,8 @@ struct drm_get_cap {
  *
  * If set to 1, the DRM core will provide aspect ratio information in mode=
s.
  * See ``DRM_MODE_FLAG_PIC_AR_*``.
+ *
+ * This capability is always supported starting from kernel version 4.18.
  */
 #define DRM_CLIENT_CAP_ASPECT_RATIO    4
=20
@@ -814,6 +828,9 @@ struct drm_get_cap {
  * If set to 1, the DRM core will expose special connectors to be used for
  * writing back to memory the scene setup in the commit. The client must e=
nable
  * &DRM_CLIENT_CAP_ATOMIC first.
+ *
+ * This capability is always supported for atomic-capable drivers starting=
 from
+ * kernel version 4.19.
  */
 #define DRM_CLIENT_CAP_WRITEBACK_CONNECTORS=095
=20
--=20
2.31.1


