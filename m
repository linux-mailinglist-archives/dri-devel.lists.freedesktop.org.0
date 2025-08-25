Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEF0B33C27
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 12:08:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 545BD10E416;
	Mon, 25 Aug 2025 10:08:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="SjKxfUdO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC5B10E252
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 10:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1756116522;
 bh=it5FFa21DEVOmToBYVfJbzv1d4wyjQlQ0/n5ky7NZLE=;
 h=From:Subject:Date:To:Cc:From;
 b=SjKxfUdOsmc74i2wI3UDREW4VtozOBQigB4OrN2p1Ox3OHsiVvNh4YMhlhrVg4IUd
 LQZ5LBDkmEIK9TlMnATchDCUejCHiEqy1xTQo0EUS/CGnlm1acqUgTvYluvN7J4gIo
 CcYVCcO+hpbf8eEQXb2QuUyxDPJ4x8A/2+7HJylLmuIYtyVKs75/M8wgz204pBUWMf
 fyNTxv/EA7u7Xkhr1bW2CatPQX7SQtpIJEBe6BrYdsrbxdZj0qvDsibHqh3nP25MZ2
 +xGvGBOCzCiMt6WLKdcIFVN6s43BwRGm2CFdBG8I6gH73sAwtrp/lAcsEsXq+k4VfC
 0qG9qnplbw6EQ==
Received: from localhost (unknown [82.79.138.60])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id A0A8817E053B;
 Mon, 25 Aug 2025 12:08:42 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v2 0/5] High color depth support for RK3576/RK3588 HDMI output
Date: Mon, 25 Aug 2025 13:08:31 +0300
Message-Id: <20250825-rk3588-10bpc-v2-0-955622d16985@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB82rGgC/3WOMQ7CMAxFr1Jlxih1GwiduAdiSFOHRtAGklKBE
 HfHBCEmBg/f0n//PUSi6CmJpniISLNPPowccFEI25vxQOA7zgIlKrnGEuKxUlpDKduzBa2cqy2
 iplUluHKO5Pwt43Z7zr1PU4j3TJ/L9/cPaC5BAm2UqU1rXa1xa8PpZNoQzdKGQeyfH3qky5Udp
 8/ET5GNM1dWX27fDR4sWT6jncKqY2wzZ83WJALGDn5qipFuE+S2RsVDzxfd3dG/FAEAAA==
X-Change-ID: 20250721-rk3588-10bpc-85ff4c228e63
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
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

Since both Rockchip RK3576 and RK3588 SoCs are capable of handling 10
bpc color depth HDMI output and we've already landed the required HDPTX
PHY driver changes to support the setup, let's add the missing bits and
pieces to VOP2, DW HDMI QP encoder and bridge library.

Please note this conflicts with the HDMI CEC series [1], hence I added
that as a b4-managed dependency.

[1] https://lore.kernel.org/all/20250825-rk3588-hdmi-cec-v3-0-95324fb22592@collabora.com/

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Changes in v2:
- Replaced patch 'drm/rockchip: vop2: Add high color depth support' with
  'drm/rockchip: vop2: Check bpc before switching DCLK source'
- Rebased series onto next-20250825 while adding the HDMI CEC series as
  a dependency
- Link to v1: https://lore.kernel.org/r/20250721-rk3588-10bpc-v1-0-e95a4abcf482@collabora.com

---
Cristian Ciocaltea (5):
      drm/rockchip: vop2: Check bpc before switching DCLK source
      drm/bridge: dw-hdmi-qp: Handle platform supported formats and color depth
      drm/rockchip: dw_hdmi_qp: Switch to phy_configure()
      drm/rockchip: dw_hdmi_qp: Use bit macros for RK3576 regs
      drm/rockchip: dw_hdmi_qp: Add high color depth support

 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c   |  11 ++-
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 113 ++++++++++++++++++-------
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c   |  60 +++++++------
 include/drm/bridge/dw_hdmi_qp.h                |   4 +
 4 files changed, 130 insertions(+), 58 deletions(-)
---
base-commit: 0c5416a62c0e4df1b3f79b5c74c03cd48df51357
change-id: 20250721-rk3588-10bpc-85ff4c228e63
prerequisite-change-id: 20250703-rk3588-hdmi-cec-cea8f523df48:v3
prerequisite-patch-id: 6d0ed574c38c15e66677e704b2d0260226430d78
prerequisite-patch-id: 014adacca1c18f77c1cd80cf6877aa5d653b8f48
prerequisite-patch-id: 79fd783c35b5979cc99f3f0420309f63ac49ad01
prerequisite-patch-id: 4e7d4735f222b9fabfff3987c578c5d954579ae5
prerequisite-patch-id: 7960aba70d8916b60e81187cfa0253025b532774
prerequisite-patch-id: 2f0338d330aee42e0acc62fb815f08a3eeef58aa

