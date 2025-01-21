Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 978EBA17C2F
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 11:48:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3096810E55A;
	Tue, 21 Jan 2025 10:48:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="VlQzKOzy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A01BF10E557
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 10:48:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 55FB3240007;
 Tue, 21 Jan 2025 10:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737456497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JJaae2di248INTyIxrbFsGIlO3L32V5gEL21XGT13do=;
 b=VlQzKOzyrDbPxUHrXVVP+aIaFNDMnt8IfU0zmEcWf4q1cGUzbTdNPdYNBNpwLJaU+HtRWC
 0pJ7EMcwQtfr1Vulf+kagcxVzdkeYqjmIaOMZBw9sE3S0M/3OZE+A8baUburtKeV/YpEV5
 rQpc18aW3Tba2aE2nPDeVfDmz6KRHKAVEMrrSURjcb0/ZWVrNEgUJK55AbJD0qEv0FH5Qj
 WlIcmLGr3oUJeikDp7fIV58sfao94d/kdr3ep9W8GtNwVjlOSg2nFciNZtLRKakHQV56+q
 ZVKbVm2ZkCGLewnc46yogtk92mHeJxjGSiPe1OfYRGrehmTfacyh5XpSGmH0+w==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 21 Jan 2025 11:48:05 +0100
Subject: [PATCH v16 4/7] drm: Export symbols to use in tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250121-yuv-v16-4-a61f95a99432@bootlin.com>
References: <20250121-yuv-v16-0-a61f95a99432@bootlin.com>
In-Reply-To: <20250121-yuv-v16-0-a61f95a99432@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, rdunlap@infradead.org, 
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>, 
 pekka.paalanen@haloniitty.fi, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com, 
 nicolejadeyee@google.com, linux-doc@vger.kernel.org, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1319;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=zI9PBYaXL9n8tKDCycFK0oO5/fSOH1r4rcy6X4UZ82E=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnj3tppTuMKoBTd270uJuoPtxkhHJ/jo5Nwk3k4
 scVkVCSARKJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ497aQAKCRAgrS7GWxAs
 4ixkD/4pSZYD+j+DfrMajMvsPrmSkfli7JPwCuvgySG96Bk7/RkL949aDltE7o0/sMiahOLWeVk
 GKJ4h8K/eIyjlNJ5kuo2g9Eo4he732O2lyRAM4Nyp91P61+JSYv4e87+/QK5R0yd7z4WuO0tlSm
 62DyQhb27l+JmQvdPpstknpku+ibnejDjdSXII434WaF3PceUvywyHDluOe7gKTl1eNqXLpWQwi
 h35vIEUi/4bSP1sKaWvZYhJg2nAd6h9poT6gcmkDCIrUI9kJshYLoNVUa61wjTtDjMHdovDV05s
 NTY6blbKxm6sC/GfzX1nYAw6q3mP/lCvCS8R+u3NafhR2VfAZp5cS1MltxEvFEPFD6mJo+04tR8
 /GnOBX/pFMQ1Ty6v6Jcfy2xQzF+NqarP4kka9hz7nJLiATsLUnztdcDiK65hUEUiPRay+pJOzK1
 SoNeThXwvJaHU4nrHDZlUX6w3E++RbgvFiWm+ro2R7+GVqNyZ5YZs0FPOIXSZSRD37WvtED63OY
 ESGJuF1cKAN9Eh5560tDR7EZRk9kGoYgsK0KU7hrk9t4/aApISOvsGORea4HT4lShZMm1voOYvZ
 IogqGfFbMe6BomTC3zU4PURKIvOqMHXtH4s+Yabj+ZDdsBshjg8gqLK9IP3qPQHJGqfojyt790H
 uEkV3hnmdFBn8RA==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com
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

The functions drm_get_color_encoding_name and drm_get_color_range_name
are useful for clarifying test results. Therefore, export them so they
can be used in tests built as modules.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_color_mgmt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index 3969dc548cff605cbdd3d56dceafb2ca00a5c886..b73a998352d175a26c69e0878da28a6288cfc8b7 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -28,6 +28,7 @@
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_print.h>
+#include <kunit/visibility.h>
 
 #include "drm_crtc_internal.h"
 
@@ -494,6 +495,7 @@ const char *drm_get_color_encoding_name(enum drm_color_encoding encoding)
 
 	return color_encoding_name[encoding];
 }
+EXPORT_SYMBOL_IF_KUNIT(drm_get_color_encoding_name);
 
 /**
  * drm_get_color_range_name - return a string for color range
@@ -509,6 +511,7 @@ const char *drm_get_color_range_name(enum drm_color_range range)
 
 	return color_range_name[range];
 }
+EXPORT_SYMBOL_IF_KUNIT(drm_get_color_range_name);
 
 /**
  * drm_plane_create_color_properties - color encoding related plane properties

-- 
2.47.1

