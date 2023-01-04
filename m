Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A2865DEF8
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 22:18:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE09C10E066;
	Wed,  4 Jan 2023 21:18:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF72910E066
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jan 2023 21:17:58 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so27559338wms.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jan 2023 13:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BjZiQKW7JCOFzqgOyS6k+bhKhdMfGwklslyWULuWzUk=;
 b=XEXPRhfZUFHUyEGuGcMUhUgYnbODEdWOcV/t0I26SEK+UN++z6sDbKrHfZezKvH3/h
 OVbtnnLfVH3gpETyI++yEeWa9uW5yp3714F7Q7robJahN+hBozVq9sVeEC5gxhIwb6QK
 W6+Au4skslGXsZCZ05nF4h3L2vjewKI1anUJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BjZiQKW7JCOFzqgOyS6k+bhKhdMfGwklslyWULuWzUk=;
 b=QPZng51OotZImUowYc/pTBi/hsp1LKCE+MuELG7cUk8E4QwDyDMi6lQiSq/Ni86GIm
 3uqX5BsWPibjwzpQ9SwvkgKLU6D4R6QpaNINuZ9eMhjCj6y1z0JoVq7TcHvVQi2sf60R
 hRnIUDwZ4HGC5IoZyiIUAayWsdPiYkgCiqcc2rlDOxpl4cB76MnGYkrAcGdFL9wg4+7+
 LEYPJmt9jGzcKqKlQ9H4jfOfUmuAj/FY7vYo88QCsW3rYczImiIiSu411PZYDSBSeur4
 obEHQOL3qWn1oqOu77BW2/XlpFoUXrL/1k6oGC/I9WFFZWMuFi8j17mktcbArrS5p4NL
 Wa1Q==
X-Gm-Message-State: AFqh2kpUDirCQohj4R2pil/4QA/wT09XEzdqUl3XxV9JMrK5psYP5wVd
 Uryb/AU1iI0dwHj+hQ3ff+b36upV3mdxfcM5
X-Google-Smtp-Source: AMrXdXveZCMsUkcTibf+jD1ckJ0R46gcZ3arWr0XJFL/fn8j+Uv4SWp7fnZ1gKStkDdP+6qz5RUkvQ==
X-Received: by 2002:a7b:c447:0:b0:3c6:e63d:adaf with SMTP id
 l7-20020a7bc447000000b003c6e63dadafmr35380252wmi.31.1672867077478; 
 Wed, 04 Jan 2023 13:17:57 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 m185-20020a1c26c2000000b003c6f1732f65sm51040610wmm.38.2023.01.04.13.17.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 13:17:56 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm: document better that drivers shouldn't use drm_minor
 directly
Date: Wed,  4 Jan 2023 22:17:54 +0100
Message-Id: <20230104211754.1967591-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.37.2
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
ideally.

Motvated by some discussion with Rodrigo on irc about how drm/xe
should lay out its sysfs interfaces.

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
index 9923c7a6885e..b40e07e004ee 100644
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
+	 * directly. debugfs interface can be registered with
+	 * drm_debugfs_add_file(), and sysfs should be directly added on the
+	 * hardwire struct device @dev.
+	 */
 	struct drm_minor *primary;
 
-	/** @render: Render node */
+	/**
+	 * @render:
+	 *
+	 * Render node. Drivers should not interact with this directly ever.
+	 * Drivers should not expose any additional interfaces in debugfs or
+	 * sysfs on thise node.
+	 */
 	struct drm_minor *render;
 
 	/**
-- 
2.37.2

