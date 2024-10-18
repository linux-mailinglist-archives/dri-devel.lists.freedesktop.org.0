Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B799A424F
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 17:27:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E6D010E958;
	Fri, 18 Oct 2024 15:27:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="WsssNF1X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6422710E967
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 15:26:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6D9DE1BF203;
 Fri, 18 Oct 2024 15:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1729265213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TG8RWBSK2bTH646gRr6lFAfcbscaoDUNNoOIg1fRYxM=;
 b=WsssNF1XcVNWqmT7zIazglhReTSN6CXdg+ZQtruMu56/PjqTn6YnSiYLcrbjNYiRkk1dnV
 bVdX5FZULyxT39aHYjLiWsFJ1YvtNQ8BronV+vm2wP6RsTZLbEtI2b8byWu+2x4H9mR36f
 SLzcCBJHny1buuP8018BMLo3gyDHJUaO/wbebug5Y0r6K8aCuVEa0AGG+SO/28nnMHLZfL
 cAejsmp1nVSMQWAsqQGjNt2SxQiF89xppL2ktN19PwNCFSLJa2lIdNBohHf7Bs97ij4zs9
 OFjDzNfpQzrZmO6Z8yFAhn+yd4Reybama+slUxHK6yG2zTCLYOSgyXX60nZd6A==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH 0/2] DRM: small improvements
Date: Fri, 18 Oct 2024 17:26:50 +0200
Message-Id: <20241018-drm-small-improvements-v1-0-cc316e1a98c9@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADp+EmcC/x3MQQqEMAxA0atI1gaS4kLmKoMLaeNMwFZJRATp3
 S0u3+L/G1xMxeHT3WByqutWGrjvIP7n8hPU1AyBwsDEIybL6HleV9S823ZKlnI4cmIaYmQKI0G
 Ld5NFr3f8nWp9AKYjWNFoAAAA
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

This series brings two small improvements to the DRM documentation and
logging.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Luca Ceresoli (2):
      drm/drm_mode_object: fix typo in kerneldoc
      drm/atomic-helper: improve CRTC enabled/connectors mismatch logging message

 drivers/gpu/drm/drm_atomic_helper.c | 5 +++--
 include/drm/drm_mode_object.h       | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)
---
base-commit: 75aa74d52f43e75d0beb20572f98529071b700e5
change-id: 20241018-drm-small-improvements-1d104cc10280

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

