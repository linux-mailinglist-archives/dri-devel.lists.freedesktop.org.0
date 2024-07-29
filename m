Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F77693EDDC
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 09:03:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DD6610E30A;
	Mon, 29 Jul 2024 07:03:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46EFA10E30A
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 07:03:07 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=ratatoskr.trumtrar.info)
 by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <s.trumtrar@pengutronix.de>)
 id 1sYKP2-0003xR-K1; Mon, 29 Jul 2024 09:02:40 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: [PATCH v2 0/2] drm/panel: simple: add Innolux G070ACE-LH3
Date: Mon, 29 Jul 2024 09:02:37 +0200
Message-Id: <20240729-b4-v6-10-topic-innolux-v2-0-27d32c766ce5@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI0+p2YC/4WNQQqDMBBFryKz7pRJlApd9R7FhTETHSiJJBoU8
 e5NvUCX78F//4DEUTjBszogcpYkwRfQtwqGqfcjo9jCoEk31CqNpsH8QEW4hFkGFO/DZ92wdsS
 OHNvGKCjjObKT7Qq/u8KTpCXE/frJ6mf/JrNCQmOoH5xua0v2NbMf1yUGL9vdMnTneX4BmGcMi
 MEAAAA=
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 kernel@pengutronix.de, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

This series adds support for the Innolux G070ACE-LH3 to the panel-simple
driver and adds the according compatible to the devicetree bindings.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
Changes in v2:
- add acked-by
- update [vh]blank min/max values

- Link to v1: https://lore.kernel.org/r/20240712-b4-v6-10-topic-innolux-v1-0-bb0acf273d0d@pengutronix.de

---
Steffen Trumtrar (2):
      dt-bindings: display: simple: Document support for Innolux G070ACE-LH3
      drm/panel: simple: add Innolux G070ACE-LH3 LVDS display support

 .../bindings/display/panel/panel-simple.yaml       |  2 ++
 drivers/gpu/drm/panel/panel-simple.c               | 35 ++++++++++++++++++++++
 2 files changed, 37 insertions(+)
---
base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
change-id: 20240712-b4-v6-10-topic-innolux-3f0ef0fed4b1

Best regards,
-- 
Steffen Trumtrar <s.trumtrar@pengutronix.de>

