Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAEB126680
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 17:17:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9DBD6E364;
	Thu, 19 Dec 2019 16:17:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ADDB6E364
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 16:17:30 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id j42so6535926wrj.12
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 08:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wlLgJbYtL7WOa403x3u73ssWnyNc/XsHcPNRo7xDrnI=;
 b=fVIHNQmPBzU/c8Y/Aj+y1UewpOdjpnpkqe5+IB27O+xPavayEajEOAIEI5tpCZMnyw
 DN9ZXAMgdSvj6aWd0Jk30YcvGOliygdoyD+yj7mUdQlybtPYwx3XHz2YDLE7BwhdqVon
 ZlfjmqJGWR7uC43xvpusR1YfRyGfoIraYRYyQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wlLgJbYtL7WOa403x3u73ssWnyNc/XsHcPNRo7xDrnI=;
 b=Ajq+6WpEtK0t1sZOW3KCYMzO4xWZDU8AWv8GhnIrRzJsFcPKRLgV4d7H5/0V4Vv2H8
 adD8ysINR2TQuSfP5AHo2DFQ/XCn1tDC4LDV4M9g+/jbGJRWhS+gQYC0/PBeB+j3E9Jv
 dp3j/R0BewMWCfJtozRXaI7XJQqVaSvwZ/Fyw2hrBwu1MocL54LwJetyL8nXCJRIdQbC
 F5eIMBiVd6gi/MYK0t5gSgrHR53KsG3gAtXH7Hy6KxHkg2ixc3w/bsZGVY/loJDhnlP/
 6rha34HpuWUqjYy8HhRfdUGxxPU8FozF4FS3Uo4DQwg6XWk6dU51rXHzvgOU1I+KhA8C
 14kw==
X-Gm-Message-State: APjAAAWttjOTbtOiGY3T+QbR6hqqEuZ385Mer+CMViVia13ga5SrKnyq
 6uD322o8KwILYI3y42EFmd2ZoXa+MVY=
X-Google-Smtp-Source: APXvYqytqhuos0Y25sJBKHj3gaR3CFSqXFuXnVlSDdNJ9J31tmEzD97RVg2bPvXR3pVI7NiKiuEJUA==
X-Received: by 2002:a5d:46c7:: with SMTP id g7mr10142209wrs.11.1576772248340; 
 Thu, 19 Dec 2019 08:17:28 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id m10sm6794577wrx.19.2019.12.19.08.17.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2019 08:17:27 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/todo: Updating logging todo
Date: Thu, 19 Dec 2019 17:17:22 +0100
Message-Id: <20191219161722.2779994-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
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
Cc: Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Sean Paul <sean@poorly.run>, Daniel Vetter <daniel.vetter@intel.com>,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Jani has merged a new set of logging functions, which we hope to be
the One True solution now, pinky promises:

commit fb6c7ab8718eb2543695d77ad8302ff81e8e1e32
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue Dec 10 14:30:43 2019 +0200

    drm/print: introduce new struct drm_device based logging macros

Update the todo entry to match the new preference.

Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Wambui Karuga <wambui.karugax@gmail.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 Documentation/gpu/todo.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 2d85f37284a1..017f3090f8a1 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -142,13 +142,13 @@ Contact: Daniel Vetter, respective driver maintainers
 
 Level: Advanced
 
-Convert instances of dev_info/dev_err/dev_warn to their DRM_DEV_* equivalent
-----------------------------------------------------------------------------
+Convert logging to drm_* functions with drm_device paramater
+------------------------------------------------------------
 
 For drivers which could have multiple instances, it is necessary to
 differentiate between which is which in the logs. Since DRM_INFO/WARN/ERROR
 don't do this, drivers used dev_info/warn/err to make this differentiation. We
-now have DRM_DEV_* variants of the drm print macros, so we can start to convert
+now have drm_* variants of the drm print functions, so we can start to convert
 those drivers back to using drm-formwatted specific log messages.
 
 Before you start this conversion please contact the relevant maintainers to make
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
