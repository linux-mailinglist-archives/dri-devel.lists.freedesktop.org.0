Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 883E0D1591D
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 23:26:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DCBA10E176;
	Mon, 12 Jan 2026 22:26:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="PKj03Xzg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4505610E152
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 22:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1768256794;
 bh=TgYUCidDKWv6b2I1M6WbhdnXeMuTPT1duM24nQAyZlg=;
 h=From:Subject:Date:To:Cc:From;
 b=PKj03XzgkwC/BaGrdJQaZl6lDTjl55mcEilEjibuY9NQaAqwg1A5mxKXN/5DzHlZR
 KivywoZZhIejOUv8q0Pmt+AXkay99Eo8lbFfhA+cvPR81ZiexTFwVzB9+EQSgU3ksx
 ic02rfNz/jgGtSqLr7jYQyilr+oa4Fn0oYIFQ3taR9TBf9NRIc5QM5Znq3WmgQSAYW
 46v5ZNtQQMo9g4vao4t5bPxcmrlWWoVocAhKYbf3yYFpx5mO1lUlZ8lhNr7JyO9y5A
 wb2bRH/IvEcf+lp4wNICVe3Slmd9clOckC3kshh9ARHydFwxDWxRta64hoXG+aA5tW
 Lb/VSnZnb7vGw==
Received: from localhost (unknown [82.79.138.145])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 7A67217E0A49;
 Mon, 12 Jan 2026 23:26:34 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v2 0/4] Add HDMI 2.0 support to DW HDMI QP TX
Date: Tue, 13 Jan 2026 00:26:17 +0200
Message-Id: <20260113-dw-hdmi-qp-scramb-v2-0-ae7b2c58d24d@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAp1ZWkC/32NTQ6CMBBGr0Jm7Zi2yO/KexgW7bTIJECxNagh3
 N3KAVy+l3zv2yC6wC5Cm20Q3MqR/ZxAnTKgQc93h2wTgxKqkErkaF842InxsWCkoCeDZI2tTVE
 R9Q2k3RJcz++jeesSDxyfPnyOi1X+7L/aKlFgnZe9qy5C6rK5kh9HbXzQZ/ITdPu+fwFEpJprt
 gAAAA==
X-Change-ID: 20251203-dw-hdmi-qp-scramb-cdbd8b57ccf9
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Diederik de Haas <diederik@cknow-tech.com>, 
 Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.14.3
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

This patch series provides the missing support for high TMDS clock ratio
and scrambling to DW HDMI QP TX library, required for handling HDMI 2.0
display modes on RK3576 & RK3588 SoCs.

In order to allow addressing the SCDC status lost on sink disconnects,
it adds an atomic variant of the drm_bridge_funcs.detect callback and a
new drm_bridge_detect_ctx() helper, which is further used in
drm_bridge_connector to switch to ->detect_ctx hook.

Furthermore, it optimizes HPD event handling in dw_hdmi_qp Rockchip
platform driver to run the detect cycle on the affected connector only.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Changes in v2:
- Collected Tested-by tags from Diederik and Maud
- Rebased onto latest drm-misc-next
- Ensured the recently introduced 'no-hpd' support for dealing with
  unconnected/repurposed/broken HPD pin is limited to HDMI 1.4 rates
- Link to v1: https://lore.kernel.org/r/20251203-dw-hdmi-qp-scramb-v1-0-836fe7401a69@collabora.com

---
Cristian Ciocaltea (4):
      drm/bridge: Add ->detect_ctx hook and drm_bridge_detect_ctx()
      drm/bridge-connector: Switch to using ->detect_ctx hook
      drm/bridge: dw-hdmi-qp: Add high TMDS clock ratio and scrambling support
      drm/rockchip: dw_hdmi_qp: Do not send HPD events for all connectors

 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c   | 184 ++++++++++++++++++++++---
 drivers/gpu/drm/display/drm_bridge_connector.c |  73 +++++-----
 drivers/gpu/drm/drm_bridge.c                   |  58 ++++++++
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c |  44 +++---
 include/drm/drm_bridge.h                       |  30 ++++
 5 files changed, 313 insertions(+), 76 deletions(-)
---
base-commit: 38feb171b3f92d77e8061fafb5ddfffc2c13b672
change-id: 20251203-dw-hdmi-qp-scramb-cdbd8b57ccf9

