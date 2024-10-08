Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EAB994278
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 10:45:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4A7F10E4A8;
	Tue,  8 Oct 2024 08:45:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08C9910E4A8;
 Tue,  8 Oct 2024 08:45:36 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 4988bIfR622174; Tue, 8 Oct 2024 14:07:18 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 4988bH4B622173;
 Tue, 8 Oct 2024 14:07:17 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Sameer Lattannavar <sameer.lattannavar@intel.com>,
 =?UTF-8?q?Jonas=20=C3=85dahl?= <jadahl@redhat.com>
Subject: [PATCH v1 2/2] drm: fix doc warning for height and width of plane
Date: Tue,  8 Oct 2024 14:07:10 +0530
Message-Id: <20241008083710.622153-2-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241008083710.622153-1-sunil.khatri@amd.com>
References: <20241008083710.622153-1-sunil.khatri@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Fixes:
include/uapi/drm/drm_mode.h:869:
warning: Function parameter or struct member
'width' not described in 'drm_plane_size_hint'

include/uapi/drm/drm_mode.h:869:
warning: Function parameter or struct member
'height' not described in 'drm_plane_size_hint'

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Sameer Lattannavar <sameer.lattannavar@intel.com>
Cc: Jonas Ådahl <jadahl@redhat.com>
---
 include/uapi/drm/drm_mode.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index d390011b89b4..ea07fbbde425 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -862,6 +862,8 @@ struct drm_color_lut {
  *
  * The plane SIZE_HINTS property blob contains an
  * array of struct drm_plane_size_hint.
+ * @width: Plane width hint
+ * @height: Plane height hint
  */
 struct drm_plane_size_hint {
 	__u16 width;
-- 
2.34.1

