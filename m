Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A49BDA40DAA
	for <lists+dri-devel@lfdr.de>; Sun, 23 Feb 2025 10:33:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6827310E0B6;
	Sun, 23 Feb 2025 09:33:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="mEvbdRS1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E56410E03A
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 09:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1740303154;
 bh=IIbQtGdGs7/uoTW3BPrdz9oK55TicYM24n7b/K73gFU=;
 h=From:Subject:Date:To:Cc:From;
 b=mEvbdRS1VxG65ooVjFYOLU7F8HeB1To6Bi79Hb7N9zMDZvL8lbl0MX/6g2u6q+37U
 4x5ZNGK9SD7cpsNG0F6fw+hLOWhpFzQ8QhAKGzZA9xIPNEUuOTkCd3CGCfRzuKud9J
 2A2/3Ivu6OWh68VIRPentM+bXr74fL/vtOUmVa3v5GasPfr8Sp/Q1zlyCZpYppKyXj
 dHq/IWwK/uUtNquzGdqxqF9tP98nj9/pp+B3yGfoFtN32iCtHKBja5bzfoTdwFjmKH
 fzEAdLXjvhTTdOFstg4yAbIK54ARp6OQ2tXe8jayHVHC0juxHL22s0jyfrEhGBvRPe
 YRVRphvDUijLw==
Received: from localhost (unknown [188.27.58.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id CBB1117E00BD;
 Sun, 23 Feb 2025 10:32:33 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v2 0/5] Improve Rockchip VOP2 display modes handling on
 RK3588 HDMI1
Date: Sun, 23 Feb 2025 11:31:36 +0200
Message-Id: <20250223-vop2-hdmi1-disp-modes-v2-0-f4cec5e06fbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPjqumcC/4WNQQ6CMBBFr0K6dgwzEayuvIdhUdpRJgGGtKbRE
 O5u5QIu30v++6tJHIWTuVariZwlic4F6FAZP7j5ySChsKGampqwgawLwRAmQQiSFpg0cAJ2Nrg
 T2d5bNmW7RH7Ie+/eu8KDpJfGz36T8Wf/FTNCDRYvLbkzNhjam9dxdL1Gd/Q6mW7bti+VtVD5v
 gAAAA==
X-Change-ID: 20250215-vop2-hdmi1-disp-modes-ea8da428bc8e
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
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

As a followup to getting basic HDMI1 output support [1] merged upstream,
make use of the HDMI1 PHY PLL to provide better VOP2 display modes
handling for the second HDMI output port on RK3588 SoC, similarly to
what has been achieved recently for HDMI0 [2].

Please note Heiko's fix [3] in of_clk_get_hw_from_clkspec() is also
required for boards that do not provide HDMI0 output, that is to ensure
devm_clk_get_optional() returns NULL instead of ERR_PTR(-EPROBE_DEFER),
which otherwise would put rockchip-drm module in a permanent deferred
probe mode.

Additionally, enable HDMI1 output on Rockchip RK3588 EVB1.

[1] https://lore.kernel.org/lkml/20241211-rk3588-hdmi1-v2-0-02cdca22ff68@collabora.com/
[2] https://lore.kernel.org/lkml/20250204-vop2-hdmi0-disp-modes-v3-0-d71c6a196e58@collabora.com/
[3] https://lore.kernel.org/lkml/20250222223733.2990179-1-heiko@sntech.de/

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Changes in v2:
- Make use of dev_err_probe() for handling failures when trying to get
  pll_hdmiphy1 optional clock (Sebastian)
- Add a new patch to replace drm_err() calls in vop2_bind() and
  vop2_create_crtcs() with dev_err_probe(), to simplify error handling
  and improve consistency, along with some related fixes
- Link to v1: https://lore.kernel.org/r/20250215-vop2-hdmi1-disp-modes-v1-0-81962a7151d6@collabora.com

---
Cristian Ciocaltea (5):
      drm/rockchip: vop2: Improve display modes handling on RK3588 HDMI1
      drm/rockchip: vop2: Consistently use dev_err_probe()
      arm64: dts: rockchip: Enable HDMI1 PHY clk provider on RK3588
      arm64: dts: rockchip: Add HDMI1 PHY PLL clock source to VOP2 on RK3588
      arm64: dts: rockchip: Enable HDMI1 on rk3588-evb1

 arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts |  42 ++++++++-
 arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi   |  22 +++++
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c     | 108 +++++++++++++----------
 3 files changed, 123 insertions(+), 49 deletions(-)
---
base-commit: 0ae0fa3bf0b44c8611d114a9f69985bf451010c3
change-id: 20250215-vop2-hdmi1-disp-modes-ea8da428bc8e

