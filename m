Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED64E9F35C3
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 17:21:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FF9E10E03E;
	Mon, 16 Dec 2024 16:21:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="IkTkBLd4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1671 seconds by postgrey-1.36 at gabe;
 Mon, 16 Dec 2024 16:21:43 UTC
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4083310E03E
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 16:21:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 23F0860009;
 Mon, 16 Dec 2024 16:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1734366101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=t1mh2dckR/amPlNQm3YVhlVqC5XhRzRpWGW62xADCBE=;
 b=IkTkBLd4/DVxLmXLHac44D051wZMPkIS6PddyzGN5OSNQ6UcCSNZQdUTy0Ia5kIoMEqfnu
 DAQnigY7Y5J6X+DvPRIuvN3T4ycAredKkHnDbRUz7KzqwTGEiaj5okALbnkBpamkcFjNj/
 fXcTiUr3dq9KxYkd9jfFXg6mjTHp/tNazDLTEmHk58FCCHNyolENiyn6vSnsrVZOEpcW8z
 e+CRwEiUYoJ1udsHrrhHULKmdT3Q8EfdVJtZ+Kq+cS9A/CUyvtxp074rfT2U25LuzwDd5z
 ceGxHIJDjBazuEadew49E+YFRl1/oH4LKCxY+EVAhtZNvQW38888rQj0zh2RgQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v2 0/2] drm/panel: simple: Add Tianma TM070JDHG34-00 DT
 bindings and driver support
Date: Mon, 16 Dec 2024 17:21:33 +0100
Message-Id: <20241216-tianma_tm070jdhg34-v2-0-0b319a0bac39@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI1TYGcC/32NQQ7CIBBFr9LMWsyAhKqr3sM0Bii0YywYII2m6
 d3FHsDle8l/f4XsErkM12aF5BbKFEMFcWjATjqMjtFQGQQKyQVHVkiHWd/LjC0+hmk8SabQmrO
 UaLiSUIev5Dy99+itrzxRLjF99o+F/+zf3MIZsos3rXfKKOuxMzGWJ4WjjTP027Z9AZj98lC2A
 AAA
X-Change-ID: 20241210-tianma_tm070jdhg34-60cb8440b164
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
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

This small series adds DT bindings and panel-simple implementation for the
Tianma TM070JDHG34-00 7" panel. Due to how the datasheet computes the
blanking time, a quirk is needed in the timing implementation. A comment
documents that in patch 2.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Changes in v2:
- Fix bindings patch
- add Reviewed-by tag
- Link to v1: https://lore.kernel.org/r/20241210-tianma_tm070jdhg34-v1-0-9fb7fe6b6cf0@bootlin.com

---
Luca Ceresoli (2):
      dt-bindings: display: simple: Add Tianma TM070JDHG34-00 panel
      drm/panel: simple: Add Tianma TM070JDHG34-00 panel support

 .../bindings/display/panel/panel-simple.yaml       |  2 ++
 drivers/gpu/drm/panel/panel-simple.c               | 42 ++++++++++++++++++++++
 2 files changed, 44 insertions(+)
---
base-commit: 2ade8304e5fce7b972ef46011946186f1466c9bf
change-id: 20241210-tianma_tm070jdhg34-60cb8440b164

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

