Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E0B9F3645
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 17:41:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0694310E3EC;
	Mon, 16 Dec 2024 16:41:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="gtREOcAP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4627C8926F
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 16:41:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B290CE0002;
 Mon, 16 Dec 2024 16:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1734367268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=trb/73fr8oplgOFNAbd36nCrZAk6oSoc9zUaNRyfOSY=;
 b=gtREOcAPR0Sa0uNd7CyF/HGlB9KIuf97MfeAeY7kA9HiphnbKKNZnR7lue8fSwoQmP4Agi
 /9NsLDwQu7/wKyQZIYFNmhz6Zy1ePTHiBU6qjhFZm1044Sm17GnsK+rIAu+DK9rDH/0E7F
 g/+Je1FZIu1VfRBFs9VvotZMtng1BtR/7Ob0wxixhMNCzKMvG9a6QRrwrhQX6q4wLtNFuW
 Gi+NPAT/UjuAcRS//wLhBSxTLDJJUOd8lwJ4XccEiQ+2Y6Pvm6YtTK8uX5EAV3V6DvVHLO
 fN+DPsFplnijmxOTWRF+S5rFGtv0+h8nGALXOFSG5qvubQP3l/cjWHDLMEuV8Q==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH RESEND v3 0/4] DRM: small improvements
Date: Mon, 16 Dec 2024 17:40:47 +0100
Message-Id: <20241216-drm-small-improvements-v3-0-78bbc95ac776@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
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

This series brings small improvements to the DRM documentation, logging and
a warning on an incorrect code path.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Changes in v3:
- patch 3: various fixes suggested by Jani Nikula and kernel test robot
- Updated reviewed-by tags
- Link to v2: https://lore.kernel.org/r/20241106-drm-small-improvements-v2-0-f6e2aef86719@bootlin.com

Changes in v2:
- Added patches 3 and 4
- Updated reviewed-by tags
- Link to v1: https://lore.kernel.org/r/20241018-drm-small-improvements-v1-0-cc316e1a98c9@bootlin.com

---
Luca Ceresoli (4):
      drm/drm_mode_object: fix typo in kerneldoc
      drm/atomic-helper: improve CRTC enabled/connectors mismatch logging message
      drm/mode_object: add drm_mode_object_read_refcount()
      drm/connector: warn when cleaning up a refcounted connector

 drivers/gpu/drm/drm_atomic_helper.c |  5 +++--
 drivers/gpu/drm/drm_connector.c     |  6 ++++++
 drivers/gpu/drm/drm_mode_object.c   | 17 +++++++++++++++++
 include/drm/drm_mode_object.h       |  3 ++-
 4 files changed, 28 insertions(+), 3 deletions(-)
---
base-commit: 42f7652d3eb527d03665b09edac47f85fb600924
change-id: 20241018-drm-small-improvements-1d104cc10280

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

