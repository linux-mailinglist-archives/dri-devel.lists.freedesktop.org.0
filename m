Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECEC381EA2
	for <lists+dri-devel@lfdr.de>; Sun, 16 May 2021 14:13:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1498E6E505;
	Sun, 16 May 2021 12:13:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9203E89C48;
 Sun, 16 May 2021 12:13:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 153B1B12C;
 Sun, 16 May 2021 12:13:18 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, alexander.deucher@amd.com, christian.koenig@amd.com,
 sakari.ailus@linux.intel.com
Subject: [PATCH 4/4] drm/fourcc: Remove struct drm_format_buf_name
Date: Sun, 16 May 2021 14:13:15 +0200
Message-Id: <20210516121315.30321-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210516121315.30321-1-tzimmermann@suse.de>
References: <20210516121315.30321-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The structure is unused. Remove it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 include/drm/drm_fourcc.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/include/drm/drm_fourcc.h b/include/drm/drm_fourcc.h
index 3ea17b8a79d3..3b138d4ae67e 100644
--- a/include/drm/drm_fourcc.h
+++ b/include/drm/drm_fourcc.h
@@ -135,14 +135,6 @@ struct drm_format_info {
 	bool is_yuv;
 };
 
-/**
- * struct drm_format_name_buf - name of a DRM format
- * @str: string buffer containing the format name
- */
-struct drm_format_name_buf {
-	char str[32];
-};
-
 /**
  * drm_format_info_is_yuv_packed - check that the format info matches a YUV
  * format with data laid in a single plane
-- 
2.31.1

