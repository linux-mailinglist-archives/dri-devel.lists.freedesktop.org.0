Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E499F9C3E81
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 13:36:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 671C210E4A5;
	Mon, 11 Nov 2024 12:36:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="c+gEJNaP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF05210E49F
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2024 12:36:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1291A1BF205;
 Mon, 11 Nov 2024 12:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1731328586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lEuh5s/boyvsj4t0oSTEvebQYcCGEo5tXwMo58H8NSk=;
 b=c+gEJNaPPByhBM/jbh1R2MB577WMJS78OPLv4pyQ3UKT52lBNxOwIscQTFD6MrVLj63IA4
 E4m/nOff1S39jBi8g52TmEVu0XITVsfbBhFrIyydAH7iZ6zAK18Hbdl91DBnD6MH8f0uOK
 fX/BFT7VhWUYtnmrlJ+JT6GqGajZDlfkOPI9ZlSXajQESpPWEQ/8cRfOxzYvtLUn/jnEK6
 TFRyOAX2HLYJLPhHCwycEIhGGSdnPB79lWuZNiD0ZA2Q71QNRtPJKGqUc58b5PXYfUZYe2
 TH8Hkt2rmB3L715b2H3F78gWfypjYkWiyfjzOb/aVAHVI5NNzxQz1wKCouaFfw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 11 Nov 2024 13:36:20 +0100
Subject: [PATCH v3 1/4] drm/drm_mode_object: fix typo in kerneldoc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241111-drm-small-improvements-v3-1-a9f576111b41@bootlin.com>
References: <20241111-drm-small-improvements-v3-0-a9f576111b41@bootlin.com>
In-Reply-To: <20241111-drm-small-improvements-v3-0-a9f576111b41@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: luca.ceresoli@bootlin.com
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

Remove unintended extra word.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 include/drm/drm_mode_object.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_mode_object.h b/include/drm/drm_mode_object.h
index 08d7a7f0188fea79e2d8ad5ee6cc5044300f1a26..c68edbd126d04d51221f50aa2b4166475543b59f 100644
--- a/include/drm/drm_mode_object.h
+++ b/include/drm/drm_mode_object.h
@@ -35,7 +35,7 @@ struct drm_file;
  * @id: userspace visible identifier
  * @type: type of the object, one of DRM_MODE_OBJECT\_\*
  * @properties: properties attached to this object, including values
- * @refcount: reference count for objects which with dynamic lifetime
+ * @refcount: reference count for objects with dynamic lifetime
  * @free_cb: free function callback, only set for objects with dynamic lifetime
  *
  * Base structure for modeset objects visible to userspace. Objects can be

-- 
2.34.1

