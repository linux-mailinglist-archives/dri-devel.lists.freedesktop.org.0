Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EED739BE4A6
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 11:48:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5FE310E6B5;
	Wed,  6 Nov 2024 10:48:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="JOOw3ts1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A059810E1D7
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 10:48:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2403360002;
 Wed,  6 Nov 2024 10:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1730890122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qQtv4VNS8GSV+B6ud5SuNizwVsMdAG4YsmaGw7hcdAk=;
 b=JOOw3ts1T2+jEEJzyarhzDU3+/RZ+Laym8+gunVhWUr7nQe3PgIxootN9IkgEO0+vP6T25
 kPAISDCM1Grfrx/kFyqZLr2sVAiZL9kiWoLQBoZ9mCbJ3h+AtxMss2l9R9d9p3fCP+vr4i
 ynbBaAgUXOeBDPw2r/0GMWiHb4Xbs+n3dlyz/RornfkeXtf0kV3028JTACAanaoef6Zc70
 N1SOcSN5MSwzQUamkJc6dzLjOf7xlWglnNtf0vRPitUzac+HvRAd7suvcu4m6THh11G36H
 0IZt//A7+ebXtpF6Z4XWWNhOrtYrYkfDamVfIOdgmnkBeGtX3gNOzFjcWmPYTQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v2 0/4] DRM: small improvements
Date: Wed, 06 Nov 2024 11:48:23 +0100
Message-Id: <20241106-drm-small-improvements-v2-0-f6e2aef86719@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHdJK2cC/4WNQQ6CMBBFr0Jm7ZhOJQZceQ/CAodRJqEtaUmjI
 dzdygVcvpf89zdIElUS3KoNomRNGnwBe6qAp8G/BHUsDNbYmgw1OEaHyQ3zjOqWGLI48WtCGsn
 UzGRsY6CMlyhPfR/hri88aVpD/Bw/mX72bzITGmS+0FVoaBtu748Q1ln9mYODft/3L6uivOO+A
 AAA
X-Change-ID: 20241018-drm-small-improvements-1d104cc10280
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
 drivers/gpu/drm/drm_mode_object.c   | 20 ++++++++++++++++++++
 include/drm/drm_mode_object.h       |  3 ++-
 4 files changed, 31 insertions(+), 3 deletions(-)
---
base-commit: 42f7652d3eb527d03665b09edac47f85fb600924
change-id: 20241018-drm-small-improvements-1d104cc10280

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

