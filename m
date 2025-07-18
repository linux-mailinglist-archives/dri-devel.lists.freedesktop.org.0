Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC0EB09B6E
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 08:29:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9E0B10E8D0;
	Fri, 18 Jul 2025 06:29:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="bjTwLlWE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.74.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B3CF10E8CC
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 06:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1752820179;
 bh=67zBKAFFwPEqpjYU6DUQenOYYuvrA+r8ErnMRmV64A0=;
 h=From:To:Subject:Date:Message-Id;
 b=bjTwLlWEftam4MfNrvl1DuZ7QDOOz5pnmnkYu4+UX8ICTCwU/KnymVOFJ27Of82O4
 dbbnDRKOIJt4wAsloIgLXFP+FsScgdPFQAJZfdsJrm+t6KS5HyVEwA/seFYq98MTM9
 uBUoam4oQnwfggEsQ+lzNcTcqv+ugnQSBirAVcrM=
X-QQ-mid: zesmtpgz7t1752819986td7cbe615
X-QQ-Originating-IP: r5wfY5yuY9UU3ArV/GPId12LkrXTc5e4liuG9amroX4=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Fri, 18 Jul 2025 14:26:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13786534937215164042
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
 Diederik de Haas <didi.debian@cknow.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/5] Add Type-C DP support for RK3399 EVB IND board
Date: Fri, 18 Jul 2025 14:26:14 +0800
Message-Id: <20250718062619.99-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: NAeO0+xU6W76d5kq9LLvslzDLftxRS/cNW2x2heHC3866cTZHfIjj3w6
 yDGCiFwAYuncq9LW9pJGT8VJNLxsR+tzOOb7/mYdH5MVEJH4Aj2W6mrSZ0YUm7keUZoJo+O
 5p+O5Id41bxuWPySLgmoJvV3BSht4TldnlM6tvRxPhhr0HOVgH7Puhzgq2GWmE07CXGDMUA
 wkWW+I0OJvRpcO63A+g4lA1qpDH37+Rko4Spm+ve0jh8xCXHyoCHgIW7jYBpJMsTYKQ2vz1
 sj9mT0UOuVB0cKBx40+3p1vSyyx8S6+Ny/h+EyE7ry2h2k7pxOu0d1EU8osGDOVftvvMv54
 EUsECqToRDdrRdIVeytSP5pIRqkfzTWMizSsWlNsx93Kas6UPYlKRJxeFms2Evf2hAoYuu1
 7jfpyuFfoxS4Zzs6D5XB4poE1XCfhbxnUY8gh+Ij3zbaDl7c8/rj+Oapc1HkGpfWvpaUoT6
 KPnf31Z8MoGKg5ZKnAJdiMlIZYt+hdvP6SE6Qq2ELIHsbYaXKqnXgaTfDTjtFMPabmeT22h
 734B5tg1LHrXBiR0bdmKWh/vcvgVkRBV3Rn69QqGu7k0fx0CHAmRzo8d40pKSAuPPM4kA9s
 bgYgcPh5VxMgjllVIfxk9hyAHA0NZCUxlaiUsWqhcymPfRNEgh+VL17sL/i5s83Z9PvVzv8
 DOVSYZspGx7rJk6M/xOnjs3r4gMoHAMFC0zMKgdvmwIk1Jc/6EG6Wqtpkcf/lDEYbvehfK+
 QEXMPL/uUxi0fyJ1IgfRNLa6T+cVIQnDPSSnGL+zxGfhBbL40Dr9sdV1yx/9AQlD1HTKiqZ
 bBSmmB34bWUYgtkK+T8SAlNhGQnsCD1CpQO6/QX41hY0debn1GMu4HkvPEce9DkzFsphMcM
 owKSUmqsymGX82ikcsMd9G0SrIYKT2Sn5Lh1SELZNUAiKgi9mosK+2CJGuKPbXvpwPQHP78
 8ccObCO6UeIAEv0VsSnVTBCBFNyE6KbKh+bjHtlsfbA72Ya900JvE7ikT
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
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

The RK3399 has two USB/DP combo PHY and one CDN-DP controller. And
the CDN-DP can be switched to output to one of the PHYs. For USB
Type-C interfaces, an external chip assists the PHY in handling
altmode switching and orientation switching.

Their connection diagram is shown below:

external Type-C Chip0 ---> USB/DP PHY0 ---+
                                          | <----> CDN-DP controller
external Type-C Chip1 ---> USB/DP PHY1 ---+

The RK3399 EVB IND board has a Type-C interface DisplayPort. It use
fusb302 chip as Type-C controller. The connection diagram is shown below:

fusb302 chip ---> USB/DP PHY0 <----> CDN-DP controller

This series focuses on adding TCPM support for USBDP PHY and DP driver.
Before this, the USBDP PHY and DP controller of RK3399 sensed state
changes through extcon, and devices such as the RK3399 Gru-Chromebook
rely on them. This series should not break them.

BTW, one of the important things to do is to implement extcon-like
notifications. I found include/drm/bridge/aux-bridge.h , but if the
aux-bridge is used, the bridge chain would look like this:

PHY0 aux-bridge ---+
                   | ----> CDN-DP bridge
PHY1 aux-bridge ---+

Oh, CDN-DP bridge has two previous aux-bridge!

Now, I try to use drm_connector_oob_hotplug_event() to notify HPD
state between PHY and CDN-DP controller.

Patch1 add new Type-C mode switch for RK3399 USBDP phy binding.
Patch2 add typec_mux and typec_switch for RK3399 USBDP PHY.
Patch3 drops CDN-DP's extcon dependency when Type-C is present.
Patch4 add missing dp_out port for RK3399 CDN-DP.
Patch5 add Type-C DP support for RK3399 EVB IND board.

Changes in v2:
- Link to V1: https://lore.kernel.org/all/20250715112456.101-1-kernel@airkyi.com/
- Reuse dp-port/usb3-port in rk3399-typec-phy binding.
- Fix compile error when CONFIG_TYPEC is not enabled.
- Notify DP HPD state by USB/DP PHY.
- Ignore duplicate HPD events.
- Add endpoint to link DP PHY and DP controller.
- Fix devicetree coding style.

Chaoyi Chen (5):
  dt-bindings: phy: rockchip: rk3399-typec-phy: Support mode-switch
  phy: rockchip: phy-rockchip-typec: Add typec_mux/typec_switch support
  drm/rockchip: cdn-dp: Support handle lane info and HPD without extcon
  arm64: dts: rockchip: Add missing dp_out port for RK3399 CDN-DP
  arm64: dts: rockchip: rk3399-evb-ind: Add support for DisplayPort

 .../phy/rockchip,rk3399-typec-phy.yaml        |   4 +
 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi |  12 +-
 .../boot/dts/rockchip/rk3399-evb-ind.dts      | 133 ++++++
 drivers/gpu/drm/rockchip/cdn-dp-core.c        |  37 +-
 drivers/phy/rockchip/phy-rockchip-typec.c     | 403 +++++++++++++++++-
 5 files changed, 564 insertions(+), 25 deletions(-)

-- 
2.49.0


