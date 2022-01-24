Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD900499D1A
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 23:16:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B7B410E17C;
	Mon, 24 Jan 2022 22:16:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54C7810E17C
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 22:16:43 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id r10so28139413edt.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 14:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GYQ5zPkJ5FigUEXqZ3wk8nj8GLXdQqgPsSEGa5Oq/xQ=;
 b=eBDYgCy4YY0PWjpP+SfSn/D8K/TI1SxwRoMcBmzWxOhbe5RFMdbF8XaN+MJZrViOqS
 RCnrLdY0/H4fl6va/FnX72Spg77rYBWHqDdgeD9fGNZEwiQLuV6U830DhtI++W+Do78/
 lDG1dUmF3P8vzoWHQlrpUAdcGGVQ8XOPv7aH4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GYQ5zPkJ5FigUEXqZ3wk8nj8GLXdQqgPsSEGa5Oq/xQ=;
 b=qmmbaG0R1gfJHNciBwMj/zdiSBSE92gRDbSzfrpXGRjjSYTrsrSb9XBJwTYafr0bF4
 lhiv3wS6lqTptO5kbW1vs1EA0bVNbbssuOZ7cyJOqm5gU6KrOe3w9kIwyB6N7IggeZ+t
 K755awkNJDBJYW5Gpf21uPBxvfu1NmyzRSJjohASijEBUThF8zHATs+qUFsifiM1S5Hq
 InZUO8YCDWxdgfw1GcheiTqt6//lKbT/9xPx0LdVWWLoQhqmdRxOCuToAQRWcoWYS/hC
 4tKryVVXeUHykxpVgu7K4Nb3DLm+1vXMpe9x6lktE/FBrZIGlPp5mfqZg0j14S4PrU0m
 54UQ==
X-Gm-Message-State: AOAM532+eMUd2ExpZ9udwhy+EgbnytcJAz+fUM3MBBuLJct4ng+gEUiB
 GyYtafM4DOkLt83TcVFcbV24TnAzc28xsg==
X-Google-Smtp-Source: ABdhPJwIjc0JR+J7irZsGsTafFzrF95vccqzieLEFK/IGbgT91TOzeeOr5DXX+AHtBLvm2EK6XEwiw==
X-Received: by 2002:a05:6402:5174:: with SMTP id
 d20mr17903753ede.21.1643062601896; 
 Mon, 24 Jan 2022 14:16:41 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id qf6sm5374315ejc.49.2022.01.24.14.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 14:16:41 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/docs: Document where the C8 color lut is stored
Date: Mon, 24 Jan 2022 23:16:33 +0100
Message-Id: <20220124221633.952374-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220124194706.930319-1-daniel.vetter@ffwll.ch>
References: <20220124194706.930319-1-daniel.vetter@ffwll.ch>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Also add notes that for atomic drivers it's really somewhere else and
no longer in struct drm_crtc.

Maybe we should put a bigger warning here that this is confusing,
since the pixel format is a plane property, but the GAMMA_LUT property
is on the crtc. But I think we can fix this if/when someone finds a
need for a per-plane CLUT, since I'm not sure such hw even exists. I'm
also not sure whether even hardware with a CLUT and a full color
correction pipeline with degamm/cgm/gamma exists.

Motivated by comments from Geert that we have a gap here.

v2: More names for color luts (Laurent).

Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/drm_color_mgmt.c |  4 ++++
 include/drm/drm_crtc.h           | 10 ++++++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index bb14f488c8f6..9079fbe21d2f 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -82,6 +82,10 @@
  *	driver boot-up state too. Drivers can access this blob through
  *	&drm_crtc_state.gamma_lut.
  *
+ *	Note that for mostly historical reasons stemming from Xorg heritage,
+ *	this is also used to store the color map (also sometimes color lut, CLUT
+ *	or color palette) for indexed formats like DRM_FORMAT_C8.
+ *
  * “GAMMA_LUT_SIZE”:
  *	Unsigned range property to give the size of the lookup table to be set
  *	on the GAMMA_LUT property (the size depends on the underlying hardware).
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 4d01b4d89775..a70baea0636c 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -285,6 +285,10 @@ struct drm_crtc_state {
 	 * Lookup table for converting pixel data after the color conversion
 	 * matrix @ctm.  See drm_crtc_enable_color_mgmt(). The blob (if not
 	 * NULL) is an array of &struct drm_color_lut.
+	 *
+	 * Note that for mostly historical reasons stemming from Xorg heritage,
+	 * this is also used to store the color map (also sometimes color lut,
+	 * CLUT or color palette) for indexed formats like DRM_FORMAT_C8.
 	 */
 	struct drm_property_blob *gamma_lut;
 
@@ -1075,12 +1079,18 @@ struct drm_crtc {
 	/**
 	 * @gamma_size: Size of legacy gamma ramp reported to userspace. Set up
 	 * by calling drm_mode_crtc_set_gamma_size().
+	 *
+	 * Note that atomic drivers need to instead use
+	 * &drm_crtc_state.gamma_lut. See drm_crtc_enable_color_mgmt().
 	 */
 	uint32_t gamma_size;
 
 	/**
 	 * @gamma_store: Gamma ramp values used by the legacy SETGAMMA and
 	 * GETGAMMA IOCTls. Set up by calling drm_mode_crtc_set_gamma_size().
+	 *
+	 * Note that atomic drivers need to instead use
+	 * &drm_crtc_state.gamma_lut. See drm_crtc_enable_color_mgmt().
 	 */
 	uint16_t *gamma_store;
 
-- 
2.33.0

