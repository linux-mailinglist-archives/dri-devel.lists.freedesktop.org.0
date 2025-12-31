Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B95A6CEB84C
	for <lists+dri-devel@lfdr.de>; Wed, 31 Dec 2025 09:23:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C31910E990;
	Wed, 31 Dec 2025 08:23:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="kgwuOlW/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F13810E990
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Dec 2025 08:23:23 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 91CAD4E41EAB;
 Wed, 31 Dec 2025 08:23:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 509DA60744;
 Wed, 31 Dec 2025 08:23:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2C3C1113B0755; Wed, 31 Dec 2025 09:23:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1767169400; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=1dqztIL+mezY/FHub8je7fMGsqx1sFeebpYowobp0I8=;
 b=kgwuOlW/Lzw4AbF0zcDjTOQQw5KAy7sBZrQ+amITfd6S7Fb660Gme7sgr9keXr0RBZYpi9
 qMMb/o2iClQW5c1X0ULOBlYBhvJFiOrGYJoSbG5LKC8IH6atY2sLW8WigaOZVMK9ZgJGBP
 Gl/MDr0M/nt2rE8ZxnRUyWrUkOifvCQrJV0kvwCfHsDBJz7oFzfqrwIGT9phCgIeOtU8lA
 IXKf3KfiZDgFCrtgKs9YjHgUUOreEM5yiVbUKqYDuAbC/leluRl8IJYoQeA3Jf4E9zwNCK
 FSU86ufezztAVh+vwNUAVy8n3YIFxuQN1NB8cplSKuzkicZAarGll8ezzNi5Ew==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 31 Dec 2025 09:22:47 +0100
Subject: [PATCH] drm/bridge: fix kdoc syntax
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-drm-bridge-alloc-getput-drm_of_find_bridge-kdoc-fix-v1-1-193a03f0609c@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAFfdVGkC/y2NUQrCMBAFr1L224UkGhCvIhLSZFMXa1KSVgqld
 +8qfs4MvLdBo8rU4NZtUOnDjUsW0KcOwtPngZCjMBhlrDZnjbG+sa8cpfhxLAEHmqdl/npXkku
 co/v3V5SceMXUKxWul2CN9SDLUyXRv9f7Y98PCm6AZoUAAAA=
X-Change-ID: 20251231-drm-bridge-alloc-getput-drm_of_find_bridge-kdoc-fix-fb00c84c525a
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
 kernel test robot <lkp@intel.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
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

Use the correct kdoc syntax for bullet list.

Fixes kdoc error and warning:

  Documentation/gpu/drm-kms-helpers:197: ./drivers/gpu/drm/drm_bridge.c:1519: ERROR: Unexpected indentation. [docutils]
  Documentation/gpu/drm-kms-helpers:197: ./drivers/gpu/drm/drm_bridge.c:1521: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202512302319.1PGGt3CN-lkp@intel.com/
Fixes: 9da0e06abda8 ("drm/bridge: deprecate of_drm_find_bridge()")
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/drm_bridge.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 6dcf8f6d3ecf..3b165a0d1e77 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1518,11 +1518,14 @@ EXPORT_SYMBOL(of_drm_find_and_get_bridge);
  * The bridge returned by this function is not refcounted. This is
  * dangerous because the bridge might be deallocated even before the caller
  * has a chance to use it. To use this function you have to do one of:
+ *
  * - get a reference with drm_bridge_get() as soon as possible to
  *   minimize the race window, and then drm_bridge_put() when no longer
  *   using the pointer
+ *
  * - not call drm_bridge_get() or drm_bridge_put() at all, which used to
  *   be the correct practice before dynamic bridge lifetime was introduced
+ *
  * - again, convert to of_drm_find_and_get_bridge(), which is the only safe
  *   thing to do
  *

---
base-commit: 40630210211a34f0714fe976530ccf1291e5ef78
change-id: 20251231-drm-bridge-alloc-getput-drm_of_find_bridge-kdoc-fix-fb00c84c525a

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

