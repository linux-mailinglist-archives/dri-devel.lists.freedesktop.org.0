Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DA6B5554C
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 19:04:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D349310ECAC;
	Fri, 12 Sep 2025 17:04:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="K+lA6hZo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2455A10ECA6
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 17:04:18 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id BD0644E40C77;
 Fri, 12 Sep 2025 17:04:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9498D60638;
 Fri, 12 Sep 2025 17:04:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E88AE102F295C; 
 Fri, 12 Sep 2025 19:04:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1757696655; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=FEZ1jJCZv48VMdKDRQ5LuktGboUwlVW2TP9ATDwpDto=;
 b=K+lA6hZomSNp04H6VpspZHYqW2Do8s+o3GORlSlA20Ybs6R73nI+/+kren6RYxgXB9qp1R
 mw5/RxIt+tvg4uy4N5M3nTYRoeF8neTRNTkBdZQ4AVTEH+5YQSx1fiSPKAyCJ5hQovoD4o
 tNgzUoezVM6edlF0rf5aWw9LLUhWRJl4ecs6uMYizXvePc/9cH6SFKqbtR1LRUjBvRYnID
 cPR5er+66zR0eupKHcUK6q+V1eZtsHfZivsN19NRaHoQULzLeEsFFIR8ffIV3Nk/2QBVHi
 sjgkeg8w8TywstN66mdkcPxUV0TZ7saV3pwZbcC5WuZLiVxQ8jdovv5xaJVmOA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 12 Sep 2025 19:03:43 +0200
Subject: [PATCH v8 3/3] drm/bridge: adapt drm_bridge_add/remove() docs,
 mention the lingering list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250912-drm-bridge-debugfs-removed-v8-3-5c33d87ccb55@bootlin.com>
References: <20250912-drm-bridge-debugfs-removed-v8-0-5c33d87ccb55@bootlin.com>
In-Reply-To: <20250912-drm-bridge-debugfs-removed-v8-0-5c33d87ccb55@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
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

The role of drm_bridge_add/remove() is more complex now after having added
the lingering list. Update the kdoc accordingly.

Also stop mentioning the global list(s) in the first line of the docs: the
most important thing to mention here is that bridges are registered and
deregistered, lists are just the type of container used to implement such
(de)registration.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v8:
- extracted to an ad-hoc patch from the v7 patch "drm/bridge: add list of
  removed refcounted bridges"
---
 drivers/gpu/drm/drm_bridge.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index fccc42017fd4df6ecfb596325df2dc4d17566f39..9a3db8f5adc8a4d1265679335d7b05d0705194b7 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -296,10 +296,13 @@ void *__devm_drm_bridge_alloc(struct device *dev, size_t size, size_t offset,
 EXPORT_SYMBOL(__devm_drm_bridge_alloc);
 
 /**
- * drm_bridge_add - add the given bridge to the global bridge list
+ * drm_bridge_add - register a bridge
  *
  * @bridge: bridge control structure
  *
+ * Add the given bridge to the global list of bridges, where they can be
+ * found by users via of_drm_find_bridge().
+ *
  * The bridge to be added must have been allocated by
  * devm_drm_bridge_alloc().
  */
@@ -360,9 +363,14 @@ int devm_drm_bridge_add(struct device *dev, struct drm_bridge *bridge)
 EXPORT_SYMBOL(devm_drm_bridge_add);
 
 /**
- * drm_bridge_remove - remove the given bridge from the global bridge list
+ * drm_bridge_remove - unregister a bridge
  *
  * @bridge: bridge control structure
+ *
+ * Remove the given bridge from the global list of registered bridges, so
+ * it won't be found by users via of_drm_find_bridge(), and add it to the
+ * lingering bridge list, to keep track of it until its allocated memory is
+ * eventually freed.
  */
 void drm_bridge_remove(struct drm_bridge *bridge)
 {

-- 
2.51.0

