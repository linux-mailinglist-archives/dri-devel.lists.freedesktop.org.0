Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBEA9C3E7F
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 13:36:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 272A810E49C;
	Mon, 11 Nov 2024 12:36:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="G/lFo9Rk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C881E10E4A8
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2024 12:36:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 24BF91BF204;
 Mon, 11 Nov 2024 12:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1731328584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=trb/73fr8oplgOFNAbd36nCrZAk6oSoc9zUaNRyfOSY=;
 b=G/lFo9Rk29xrIml6PsnMC3ySH9Ao/M/QhGlQBXQIDKrsLFpm+Grjy2VB0hoUlQHbV17w0+
 UYFTtku4A3rJouRMgR6sjSMPYvQuq9qXYytYnWjwkaday+nJgasLVE5s41B23UPgHe0tlS
 pVrQLjtS4v91waVKQHXHvP/UPQIpQIOrnPqa//49geQWgFgDSGL0kTxAnw3vc1yPUVEgEu
 NhTAtcinBI1eaWmYv3Tr3ozu6vivLDKs/yesaRx54MLynDjvvQARpJyYpAMQOQI7AntreE
 KJ/KEZtV4D2+Lwy1kKdbkoI0O/a2+Rj7Fie+LaMLG4ffapiEwwknAMdFMs5brg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v3 0/4] DRM: small improvements
Date: Mon, 11 Nov 2024 13:36:19 +0100
Message-Id: <20241111-drm-small-improvements-v3-0-a9f576111b41@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEP6MWcC/4XNQQrCMBCF4auUrI1k0hJTV95DXMR0ageapCQlK
 KV3N+1GEMTl/2C+WVjCSJjYuVpYxEyJgi9RHypmB+MfyKkrzaSQDQjQvIuOJ2fGkZObYsjo0M+
 JQweisRaE1IKV4yliT88dvt5KD5TmEF/7nwzb+pfMwAW3tgaFYFpt28s9hHkkf7TBsQ3N8gOBU
 D8hWaBeoTTYa3WCL2hd1zd+sya5BwEAAA==
X-Change-ID: 20241018-drm-small-improvements-1d104cc10280
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

