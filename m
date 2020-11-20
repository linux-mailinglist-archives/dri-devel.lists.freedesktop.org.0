Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AA42BA679
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 10:46:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FE3C6E897;
	Fri, 20 Nov 2020 09:46:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C1E06E897
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 09:46:37 +0000 (UTC)
Date: Fri, 20 Nov 2020 09:46:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1605865595;
 bh=qQ0mBDKtOr93uz3osM1tlQ1rgvAnZ+jwjNuHVPmxfRk=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=lrhe8c184Kpdq5WfdBLaR0TnEc0ak+gm72b20lIy38RZw74QDhmDG1KO+53ZATLO0
 IELe+A2wcqTsGFymdVsfSH/8r+EhVnU1hOM+AgsQtpqifIvwdoItKNMt2lPJE0lYf0
 uIMfvjgsgALa9rDu1/9mWakEmpedgZauMaC71Xtov3I8Pw5Xh6zEENnbkiICs5zBAp
 39V4+akEW2AisG0FDy1trNvEyZ9yhd6KnM3SsUb1t/zLHz0gk5LNNxUXw9iAhBvO0+
 4svFXPsYK+ZFeCCtvTYZd+jLNx1rqZvGYRFGcRowHT3q54Bi4KptKRdz2aYSx35GF+
 vfQFRgcZHrWUw==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH] drm: document drm_mode_modeinfo
Message-ID: <BBtyuxgs3DvcrMtbRyb7KBEWUviGy1dtWO61eB4@cp3-web-016.plabs.ch>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This allows `struct drm_mode_modeinfo` references to be linkified.

Some descriptions are borrowed from struct drm_display_mode.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 include/uapi/drm/drm_mode.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 3979389fcc4f..900b6f87d5c8 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -218,6 +218,24 @@ extern "C" {
 #define DRM_MODE_CONTENT_PROTECTION_DESIRED     1
 #define DRM_MODE_CONTENT_PROTECTION_ENABLED     2
 
+/**
+ * struct drm_mode_modeinfo - Display mode information.
+ * @clock: pixel clock in kHz
+ * @hdisplay: horizontal display size
+ * @hsync_start: horizontal sync start
+ * @hsync_end: horizontal sync end
+ * @htotal: horizontal total size
+ * @hskew: horizontal skew
+ * @vdisplay: vertical display size
+ * @vsync_start: vertical sync start
+ * @vsync_end: vertical sync end
+ * @vtotal: vertical total size
+ * @vscan: vertical scan
+ * @vrefresh: approximate vertical refresh rate in Hz
+ * @flags: bitmask of misc. flags, see DRM_MODE_FLAG_* defines
+ * @type: bitmask of type flags, see DRM_MODE_TYPE_* defines
+ * @name: string describing the mode resolution
+ */
 struct drm_mode_modeinfo {
 	__u32 clock;
 	__u16 hdisplay;
-- 
2.29.2


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
