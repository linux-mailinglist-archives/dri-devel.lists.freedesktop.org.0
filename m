Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9462B944077
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 04:06:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5A2710E871;
	Thu,  1 Aug 2024 02:06:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="JVXAorcy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7BE110E6C3
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 02:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1722477973;
 bh=8ac2r6zPKGWSHuh+tztXRaB0ZOzFaDNys78QgSc5GpQ=;
 h=From:Subject:Date:To:Cc:From;
 b=JVXAorcyrS7ElLGDbx4UY8CBn5IOFXY75Y03rOjYsrxkbEgX5R/5y06idDTEZbrqd
 myr2PvY8DUVOw+BrDhLveWANdg3ch4nNkRFNldVXviCXB0ZNztQOBGCGd5FK5lRSGn
 Plcp+yjbouRtQE7oZbfH+8ybOJd1qlS6a3GnGdwkdHzmNMfTC8sUo2B3WcT7xBaSJR
 H++RhyUvfteit7MSF2DP6Ci8ncvxS/ikbHqQEGBCI27PTvsdSdXG18waE2n7ydNatC
 9a3YwTTLEd+2CLQQwwW5MztS+ub3s91febTskdQ7kcGMfjHwGzJkHohJQYhg63GLE0
 4UQoxy+gnIgjA==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 06B003780BDB;
 Thu,  1 Aug 2024 02:06:13 +0000 (UTC)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH 0/2] Initial support for Synopsys DW HDMI QP TX Controller
Date: Thu, 01 Aug 2024 05:05:13 +0300
Message-Id: <20240801-dw-hdmi-qp-tx-v1-0-148f542de5fd@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFrtqmYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDCwND3ZRy3YyU3EzdwgLdkgpdSxNjS0sjc2NDU3MDJaCegqLUtMwKsHn
 RsbW1AG+VgSlfAAAA
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Alexandre ARNOUD <aarnoud@me.com>, 
 Luis de Arquer <ldearquer@gmail.com>, Algea Cao <algea.cao@rock-chips.com>
X-Mailer: b4 0.14.1
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

The Synopsys DesignWare HDMI 2.1 Quad-Pixel (QP) TX Controller IP can
found on the Rockchip RK3588 SoC family and supports the following
features, among others:

* Fixed Rate Link (FRL)
* Display Stream Compression (DSC)
* 4K@120Hz and 8K@60Hz video modes
* Variable Refresh Rate (VRR) including Quick Media Switching (QMS)
* Fast Vactive (FVA)
* Multi-stream audio
* Enhanced Audio Return Channel (EARC)

This patch series provides just the basic support, i.e. RGB output up to
4K@60Hz, without audio, CEC or any HDMI 2.1 related functionality.

Please note it is a reworked version of [1], which relied on a
commonized dw-hdmi approach.  Since the overall consensus was to handle
it as an entirely new IP, I dropped all references and dependencies to
the existing dw-hdmi driver code.

This has been submitted as a separate patchset, as suggested by Neil;
the Rockchip platform specific glue code enabling HDMI output for RK3588
will be send as v2 of the initial patch series [2].

Some additional changes worth mentioning:
* Making use of the new bridge HDMI helpers indicated by Dmitry
* Dropped connector creation to ensure driver does only support
  DRM_BRIDGE_ATTACH_NO_CONNECTOR
* Updated I2C segment handling to properly handle connected DVI displays
  (reported and fixed by Heiko)

[1]: https://lore.kernel.org/lkml/20240601-b4-rk3588-bridge-upstream-v1-13-f6203753232b@collabora.com/
[2]: https://lore.kernel.org/lkml/20240601-b4-rk3588-bridge-upstream-v1-0-f6203753232b@collabora.com/

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Cristian Ciocaltea (2):
      dt-bindings: display: bridge: Add schema for Synopsys DW HDMI QP TX IP
      drm/bridge: synopsys: Add DW HDMI QP TX Controller driver

 .../display/bridge/synopsys,dw-hdmi-qp.yaml        |  66 ++
 drivers/gpu/drm/bridge/synopsys/Kconfig            |   8 +
 drivers/gpu/drm/bridge/synopsys/Makefile           |   2 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       | 748 ++++++++++++++++++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h       | 834 +++++++++++++++++++++
 include/drm/bridge/dw_hdmi_qp.h                    |  37 +
 6 files changed, 1695 insertions(+)
---
base-commit: 8400291e289ee6b2bf9779ff1c83a291501f017b
change-id: 20240801-dw-hdmi-qp-tx-943992731570

