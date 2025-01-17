Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B69A154AF
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 17:48:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08FCA10EB37;
	Fri, 17 Jan 2025 16:48:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="S7vXiJnS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80BED10EB37
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 16:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1737132503;
 bh=84YKOZ/drOYfn0QtG1NOft6JVq2XEK+your1FhHrQ7E=;
 h=From:To:Cc:Subject:Date:From;
 b=S7vXiJnSSJ7FErDnG16gmqM9+gk4AuzJWPBItbC5yvkqT0+QS04iRUbNE4m8xJbwx
 4ublKRep++XH7UaGdAFLLAwXidFuJRyKtrIe0jfnSx4EN0q/RrdsVdCpiLmvoAA9fv
 ch2OqgMqx1cO/UIvglMkZFS2uVZx9c56bPnmzlqurWYnwbXOozpftMVMAY+052NCdt
 EtSgRQIskLGJxHltoogf0O0W+aAoPJiWB5LIc+zfsnM06ilf+XLYqXWcwy5610ooEd
 IBexNnjzobrX3+fbcIcCxKaWhGVcCdnrMq5hbc2GiDIcMM0Mbwis7q0kWjPWticnvf
 bT2RtUhj9RpQg==
Received: from earth.mtl.collabora.ca (mtl.collabora.ca [66.171.169.34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: detlev)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 386C217E0B9D;
 Fri, 17 Jan 2025 17:48:20 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Alexey Charkov <alchark@gmail.com>,
 Jianfeng Liu <liujianfeng1994@gmail.com>,
 Dragan Simic <dsimic@manjaro.org>, FUKAUMI Naoki <naoki@radxa.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Johan Jonker <jbx6244@gmail.com>, Kever Yang <kever.yang@rock-chips.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sugar Zhang <sugar.zhang@rock-chips.com>,
 Algea Cao <algea.cao@rock-chips.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: [PATCH v1 0/2] Add HDMI audio on the Radxa ROCK 5B
Date: Fri, 17 Jan 2025 11:46:56 -0500
Message-ID: <20250117164815.67253-1-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

To support HDMI audio on the rk3588 based devices, the generic HDMI
Codec framework is used in the dw-hdmi-qp DRM bridge driver.

The implementation is mainly based on the downstream driver, ported to the
generic HDMI Codec framework [1] recently merged in the DRM tree.
The parameters computation has been kept as is and the data stored in the
dw_hdmi_qp struct as been cleaned up.

The downstream kernel also implements a machine driver for HDMI audio but
it is doing exactly what the simple-audio-card driver does, so use that
instead in the ROCK 5B device tree.

Based on commit f1359f46f1f1 (tag: drm-misc-next-fixes-2025-01-16)

[1]: https://lore.kernel.org/all/20241224-drm-bridge-hdmi-connector-v10-0-dc89577cd438@linaro.org/

Detlev Casanova (1):
  arm64: dts: rockchip: Add HDMI0 audio output on rock-5b

Sugar Zhang (1):
  drm/bridge: synopsys: Add audio support for dw-hdmi-qp

 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |   1 +
 .../boot/dts/rockchip/rk3588-rock-5b.dts      |  19 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c  | 472 ++++++++++++++++++
 3 files changed, 492 insertions(+)

-- 
2.48.1

