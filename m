Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA6B9A424C
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 17:27:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FA1B10E953;
	Fri, 18 Oct 2024 15:26:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="k3C16OyO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF28A10E95F
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 15:26:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 995021BF208;
 Fri, 18 Oct 2024 15:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1729265214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zgyO7dIQcIllwdnmEg0IQTCT+gft9OECU9gbzrUZIvU=;
 b=k3C16OyO1gVTsFWB4qndxTa3+HfEL16s0zitKtfOrC04mvJf5VIsbGGXZV8cxX6TD6Z9OO
 2RlbuywlOTkbbYdHJtp23rG//iFIJ19iLgHf1R5J5a0YyZc0ONNgFfHvtTnOHddabxOv/D
 ohttQBhkrreXff7T1WRWdheDFvMdDwg27MltzYJ1FKFcBRomBnN7xgt6YeBntJcPs9iLO1
 5WsnV3UZiRgK7xFKxVapTs9Y9R2M7BGbdfBFqrKqUdRon7V/oHe9BfvFm3QOSdOgwJ/jkv
 diy3VxLRsV83dYYfJItiY4tvkBcs6cqO0vLJRMj1rwmd9n+uHeHQtrfBgvStTg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 18 Oct 2024 17:26:51 +0200
Subject: [PATCH 1/2] drm/drm_mode_object: fix typo in kerneldoc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241018-drm-small-improvements-v1-1-cc316e1a98c9@bootlin.com>
References: <20241018-drm-small-improvements-v1-0-cc316e1a98c9@bootlin.com>
In-Reply-To: <20241018-drm-small-improvements-v1-0-cc316e1a98c9@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.1
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

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 include/drm/drm_mode_object.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_mode_object.h b/include/drm/drm_mode_object.h
index 08d7a7f0188f..c68edbd126d0 100644
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

