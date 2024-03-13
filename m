Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB0387ACE3
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 18:20:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B7BE10EF63;
	Wed, 13 Mar 2024 17:20:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="XzCOUfBo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 077CA10F50A
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 17:20:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5DB3F60006;
 Wed, 13 Mar 2024 17:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1710350424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ALphmlMJMXjWnAezL6iQbzO6NFcgXvLJ93zEeDxPP/U=;
 b=XzCOUfBojPliqqGwG1/5px2zHXOyYoIR/4C1B1yPMLdF7qEWnMYdFt4z/1HIsFAqcxeDvx
 Zy9vGtzScRdZWrE7j7c0bXfyHSvdwI7wTyy+qKmOduy/ZrZrszkFMy4mHaYeTJ8/0SjQ6B
 17GYllEJHIa6Uzw689W0CsL3NMIyhxdj8uwuv6yik/py/xGZT+PBqVUhqnqeHjAFtyF4wk
 e62DR3CjOjZpMfucaK7jU5krKYBRwJT9EQccEeFb7ZLa+1E3dSa/7Ujs/1P5My7S7gvLk6
 ya937VFo1pWt690F3jkENDIcGaU2ksgtB0FkpZROdD3+Rchd0/8RNzUOX804HQ==
From: =?UTF-8?q?J=C3=A9r=C3=A9mie=20Dautheribes?=
 <jeremie.dautheribes@bootlin.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Yen-Mei Goh <yen-mei.goh@keysight.com>,
 =?UTF-8?q?J=C3=A9r=C3=A9mie=20Dautheribes?= <jeremie.dautheribes@bootlin.com>
Subject: [PATCH v3 0/3] panel-simple: add support for Crystal Clear
 CMT430B19N00
Date: Wed, 13 Mar 2024 18:20:13 +0100
Message-Id: <20240313172016.387277-1-jeremie.dautheribes@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: jeremie.dautheribes@bootlin.com
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

Hello everyone,

This patch series add support for the Crystal Clear Technology
CMT430B19N00 4.3" 480x272 TFT-LCD panel.
It also adds Crystal Clear Technology to vendor-prefixes.yaml.

Please note that unfortunately there is no public datasheet available
for this panel.

Changes in v3:
  - PATCH 3/3: use display_timing structure instead of display_mode
  structure as suggested by Maxime Ripard.
  - Link to v2: https://lore.kernel.org/all/20240304160454.96977-1-jeremie.dautheribes@bootlin.com/

Changes in v2:
  - add link to the Crystal Clear Technology website in commit message, as
  suggested by Conor Dooley and Neil Armstrong.
  - Link to v1: https://lore.kernel.org/all/20240223134517.728568-1-jeremie.dautheribes@bootlin.com/

Regards,

Jérémie

Jérémie Dautheribes (3):
  dt-bindings: Add Crystal Clear Technology vendor prefix
  dt-bindings: display: simple: add support for Crystal Clear
    CMT430B19N00
  drm/panel: simple: add CMT430B19N00 LCD panel support

 .../bindings/display/panel/panel-simple.yaml  |  2 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 ++
 drivers/gpu/drm/panel/panel-simple.c          | 29 +++++++++++++++++++
 3 files changed, 33 insertions(+)

-- 
2.34.1
