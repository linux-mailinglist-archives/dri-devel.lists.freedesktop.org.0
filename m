Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF4BB058D9
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 13:31:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7119B10E597;
	Tue, 15 Jul 2025 11:31:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="WF4FH3Px";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 344 seconds by postgrey-1.36 at gabe;
 Tue, 15 Jul 2025 11:31:31 UTC
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDB4510E597
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 11:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1752579089;
 bh=sGnlcbGkTpVe+jRIfMZ3RjpXeqeQnWzdixj31SR4Fb0=;
 h=From:To:Subject:Date:Message-Id;
 b=WF4FH3PxfV7nhvTC9XWPUurl6EVyMmHgEsOT75PRsVVFV+VA5EnXo9zPjZKkpnDLn
 kLbh0r7c0jBUlX0LfL8j/PR2xY1w7z+LH2MWqlghO2JcUMZ9gs9sim1O3mc4f/jZ9p
 MCqm1caDKYwfq2a7Lx8Ou8xvQIaSJ0NRcV9LnUV4=
X-QQ-mid: zesmtpsz3t1752578706tf14436e8
X-QQ-Originating-IP: uovcXhhJiGiAlXUvswW9NV/gOyyyF7ZPgZz7Ciqcoww=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 15 Jul 2025 19:25:04 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10341645025017690004
From: Chaoyi Chen <kernel@airkyi.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Amit Sunil Dhamne <amitsd@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 0/5] Add Type-C DP support for RK3399 EVB IND board
Date: Tue, 15 Jul 2025 19:24:51 +0800
Message-Id: <20250715112456.101-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: NAeO0+xU6W76d5kq9LLvslwjguL2xeraIg95JXLjdwWhVeBFgUPf0IXo
 dmGzjg25kOW5Xj5hwGL8hp4lykLLrCIGSmADpp9ViG98T9RLgGXNWp4TLGvbc+s2c2HTEqH
 kLw7ISNUKEekGBncpAiXOW7BRvu2q8OJhIGkUBmJZaQVDF/TLBaBZzzniN0oGzVBG+yYGtt
 BaV2g4WeXodkbKglVtg90shL1TLjlwrrQGAUpS5aqZJMdBMMMacgxdcELO1WS5kjRqNHW3w
 GaMoecx9CVN2RC0knnwdYCQ1Ls0xK1wCGGI8JgLKsq1511Ly2mvPa4/CHzhj+eQVOxJB+sZ
 HbOXqindKCKiqmhrxjdQ8v65ZogExjlBIMjH2Tg7+NVceFZWyeE6OwGhGRbL6eKisI70ptX
 PaYxyWjXsHNwYltjhybeNh9NYEqxrcP/pxgg7FbAM+Z24sJ7U729+7B/Rwzw9khCdyghKTN
 88KfFqL0afT+aDZpyQSYHWRHw1Gitd/QO74Kwpg1DEfb/x+0plWeRntozWbs6gn/7dcoHEO
 q7Wtn6r3w9FdjHewGmP2/oQpwuv56tPQOBH8HXc4KA5U9JNwigPTiu0V5JjVzOi30WUkYWk
 vOLubWuaShxTWrotbi8C2aBhclg4yvCkRovNxzmDWzP/f6B2OdD3W7EBCfGqZq7YraniRXU
 1OeKyw+VvL65qCgdS0Tcln56rcTjkseM+TiQYsLvXmNMk5RsSf4Tu5KoeiMLrly/XnUbqo+
 aF78WWpMPCMu3RByyF2GLneoZJWRa/fF8YBMyWjtVmKXf2n5z9QKirNmCjOyvrQWodD0klx
 ViMMq3vrhFaRQ563J6SCAUTHGQGTZryZmQeodRWyzofXhVGnCWddl6KW22doIaBKCWDBMja
 Uj2M4x2xoHk6YmPQhn3c2aTmzZL1Tmq7j9ZYfaqEuTkmUuX8zl+ps6zuHVzq4n2cnQiTKdH
 +Z72bX4wPg7AIMm9b4GTturAAr6MsDRf+6yOz2RlHsR4fOw==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

The RK3399 EVB IND board has a Type-C interface DisplayPort. It use
fusb302 chip as Type-C controller.

This series focuses on adding TCPM support for USBDP PHY and DP driver.
Before this, the USBDP PHY and DP controller of RK3399 sensed state
changes through extcon, and devices such as the RK3399 Gru-Chromebook
rely on them. This series should not break them.

Patch1 add missing "displayport" prop for USB connector binding.
Patch2 add new Type-C mode/orientation switch for RK3399 USBDP phy
binding.
Patch3 add TCPM support for RK3399 USBDP PHY.
Patch4 add TCPM support for CDN-DP.
Patch5 add Type-C DP support for RK3399 EVB IND board.

Chaoyi Chen (5):
  dt-bindings: connector: Add displayport connector for hotplug notify
  dt-bindings: phy: rockchip: rk3399-typec-phy: Support mode/orientation
    switch
  phy: rockchip: phy-rockchip-typec: Add support for Type-C TCPM
  drm/rockchip: cdn-dp: Add support for Type-C TCPM
  arm64: dts: rockchip: rk3399-evb-ind: Add support for DisplayPort

 .../bindings/connector/usb-connector.yaml     |   4 +
 .../phy/rockchip,rk3399-typec-phy.yaml        |  14 +
 .../boot/dts/rockchip/rk3399-evb-ind.dts      | 119 +++++++
 drivers/gpu/drm/rockchip/cdn-dp-core.c        |  37 +-
 drivers/phy/rockchip/phy-rockchip-typec.c     | 335 +++++++++++++++++-
 5 files changed, 482 insertions(+), 27 deletions(-)

-- 
2.49.0


