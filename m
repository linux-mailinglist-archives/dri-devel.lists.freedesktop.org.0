Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9DA368662
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 20:10:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E055A6E550;
	Thu, 22 Apr 2021 18:10:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 366186E546
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 18:10:30 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2804:431:e7dd:973e:7b9c:c7cc:e902:8df9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: leandrohrb)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 8097F1F436A7;
 Thu, 22 Apr 2021 19:10:27 +0100 (BST)
From: Leandro Ribeiro <leandro.ribeiro@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/1] drm/doc: document drm_mode_get_plane
Date: Thu, 22 Apr 2021 15:10:04 -0300
Message-Id: <20210422181004.34247-2-leandro.ribeiro@collabora.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210422181004.34247-1-leandro.ribeiro@collabora.com>
References: <20210422181004.34247-1-leandro.ribeiro@collabora.com>
MIME-Version: 1.0
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
Cc: airlied@linux.ie, pekka.paalanen@collabora.co.uk, kernel@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a small description and document struct fields of
drm_mode_get_plane.

Signed-off-by: Leandro Ribeiro <leandro.ribeiro@collabora.com>
---
 include/uapi/drm/drm_mode.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index a5e76aa06ad5..3e85de928db9 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -312,16 +312,32 @@ struct drm_mode_set_plane {
 	__u32 src_w;
 };

+/**
+ * struct drm_mode_get_plane - Get plane metadata.
+ *
+ * Userspace can perform a GETPLANE ioctl to retrieve information about a
+ * plane.
+ */
 struct drm_mode_get_plane {
+	/** @plane_id: Object ID of the plane. */
 	__u32 plane_id;

+	/** @crtc_id: Object ID of the current CRTC. */
 	__u32 crtc_id;
+	/** @fb_id: Object ID of the current fb. */
 	__u32 fb_id;

+	/** @possible_crtcs: Bitmask of CRTC's compatible with the plane. */
 	__u32 possible_crtcs;
+	/** @gamma_size: Size of the legacy gamma table. */
 	__u32 gamma_size;

+	/** @count_format_types: Number of formats. */
 	__u32 count_format_types;
+	/**
+	 * @format_type_ptr: Pointer to ``__u32`` array of formats that are
+	 * supported by the plane. These formats do not require modifiers.
+	 */
 	__u64 format_type_ptr;
 };

--
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
