Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 262A9662B91
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 17:46:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8657B10E441;
	Mon,  9 Jan 2023 16:46:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0934810E441
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 16:46:08 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 g19-20020a05600c4ed300b003d9eb1dbc0aso4469863wmq.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 08:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=l1g5c7G4M7Xy6TWfrTWWamOKap/k5YDhQy+aHR2h+88=;
 b=MEXK6Bij6ONshchOemaJ/mNKdOKQ40W5DYH9pCAO8W4AO0KBpIuH6yHCqFnpjMKl92
 xpy0vzM1LJbfW6OOUl2MmH1yZo9O2w79Ib3QN+cpzwqcL8iLSKu6XMYY+JO/LOP04hd0
 Ju3NEgw75ipAerX4ivxyKY5yIM2fsWhLX9CK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l1g5c7G4M7Xy6TWfrTWWamOKap/k5YDhQy+aHR2h+88=;
 b=MCZyHPy8xSQcd7I0rn1quzq7PNAlF/HBHIGzimRsFca/r8Llln2bwW4LV32fghEHTu
 LKjWvVOYytmSOyOEvHFwoY9fcLHCfLoRp0gPbYMzx9aUcK3yohGjN6Q1/JOQWwwRZd1n
 0PSJnkeaWbDgNvjaIjXhVYSWnaB4b/eduK4h/hmPPuywO2l7S2/MvfjqWPGUp2kQnWjx
 6YeXKwbSJ31VsyXX1O3gHkz6vjjMN6A06L5JTibWHX7gbHm7OCuz8/f48lkt7ekefyLE
 14yRCqhnIZSUXUVMXb+VJR/MqXD8eUX6aGGC3AZxqsJvtQpfZhkWUKcYb+eQa3k8lU4O
 RYYg==
X-Gm-Message-State: AFqh2kouUU9b9KgzKhGcksj5mQmWZehjC1dcJPISbHIEVUtG5UXLRu4w
 q1DCTdykzGi78vgJQgNJrJVXdMHT73ESDx90
X-Google-Smtp-Source: AMrXdXuRDjBlO0OIOpqY8Pdnyv8XlqBXIAqOghKdqJPTXMdinJYo0RVF5bjkgYtS4SbOF+mJu4Djig==
X-Received: by 2002:a05:600c:601e:b0:3c6:e61e:ae71 with SMTP id
 az30-20020a05600c601e00b003c6e61eae71mr56611275wmb.1.1673282767252; 
 Mon, 09 Jan 2023 08:46:07 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 g14-20020a05600c310e00b003cf5ec79bf9sm13099478wmo.40.2023.01.09.08.46.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 08:46:06 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm: document better that drivers shouldn't use drm_minor
 directly
Date: Mon,  9 Jan 2023 17:46:04 +0100
Message-Id: <20230109164604.3860862-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.39.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Maxime Ripard <maxime@cerno.tech>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Wambui Karuga <wambui.karugax@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The documentation for struct drm_minor already states this, but that's
not always that easy to find.

Also due to historical reasons we still have the minor-centric (like
drm_debugfs_create_files), but since this is now getting fixed we can
put a few more pointers in place as to how this should be done
ideally. Note that debugfs isn't there yet for all cases (debugfs
files on kms objects like crtc/connector aren't supported, neither
debugfs files with full fops), so the debugfs side of this is still
rather aspirational and more for new users than converting everything
existing. todo.rst covers the additional work needed already.

Motivated by some discussion with Rodrigo on irc about how drm/xe
should lay out its sysfs interfaces.

v2: Make the debugfs situation clearer in the commit message, but
don't elaborate more in the actual kerneldoc to avoid distracting from
the main message around sysfs (Jani)

Also fix some typos.

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Melissa Wen <mwen@igalia.com>
Reviewed-by: Maíra Canal <mcanal@igalia.com>
Acked-by: Maxime Ripard <maxime@cerno.tech>
Acked-by: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Wambui Karuga <wambui.karugax@gmail.com>
Cc: Maíra Canal <mcanal@igalia.com>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Melissa Wen <mwen@igalia.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 include/drm/drm_device.h | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index a68c6a312b46..7cf4afae2e79 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -87,10 +87,23 @@ struct drm_device {
 	 */
 	void *dev_private;
 
-	/** @primary: Primary node */
+	/**
+	 * @primary:
+	 *
+	 * Primary node. Drivers should not interact with this
+	 * directly. debugfs interfaces can be registered with
+	 * drm_debugfs_add_file(), and sysfs should be directly added on the
+	 * hardware (and not character device node) struct device @dev.
+	 */
 	struct drm_minor *primary;
 
-	/** @render: Render node */
+	/**
+	 * @render:
+	 *
+	 * Render node. Drivers should not interact with this directly ever.
+	 * Drivers should not expose any additional interfaces in debugfs or
+	 * sysfs on this node.
+	 */
 	struct drm_minor *render;
 
 	/** @accel: Compute Acceleration node */
-- 
2.39.0

