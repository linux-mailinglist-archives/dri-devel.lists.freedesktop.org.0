Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1AF131992
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 21:46:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62A5E6E51B;
	Mon,  6 Jan 2020 20:46:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-oln040092068102.outbound.protection.outlook.com [40.92.68.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 536506E516
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 20:46:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EBlq8OP77AVE023E3kEtFqs0Whl8Gjj9sgHYYE9B7gVr307RwGxvzdxptgz935RboZ8vQM92PSNdc1e6/RF/PZeyR71bIQuEflPn1jaU3aFTpjZVqBnROMvp1pBmCt5K4qkvTafbw3EN1AlslWH7HYCGJRN4Y+bPw8IvRjeSG9MbmtDbrkYWr2wXAIq+jOTXIh0EE/fE3jMkOhr5Vadh2/wXjQFowXTNbEuovDq8Z4CYPwbJy22tYYTI20SdFUDkRlRLhi6BiyxGDzyzDKasJf5gmFCKeN15lmmo3YX+kSoXTT3N3icHrbNIXO68uE3n45nL8vlE9Gjab4cImx6Ftw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ulw9p1L3gMXb4AJXqo5es4a5r/NKzxoZzWnYv91QgKo=;
 b=gsTyCXxvX7zFqsXqmcBievkLxprNO5c+PaMqW/VO+eliMK45aH0KsNU7EPejsC6a573nysmjH4H6fzXD48lpJ9S4WD7RENruwXiFVYHvquwNS3gIKBM82pCiCy1Y+ruTvZtYfPxiB0QhWkuBCWu98lX4L/t7zpJTSy3McNw8WIiTwr/vS8PNnWX7zn9YMwZ9N6ngOWHC5xIjmHySzQogVR9WKStF+wJ0cXbLYqXONYY4bGsJKN9ovuR3JqstkUummq1InNMX4sija6hyj5mNq6HFSdb24xTGQDylK76+Inm9q1g/W0RaetYxakaQTUfxtIppC0TnqHL9TTZIl7ERGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from VE1EUR02FT060.eop-EUR02.prod.protection.outlook.com
 (10.152.12.53) by VE1EUR02HT115.eop-EUR02.prod.protection.outlook.com
 (10.152.13.129) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.11; Mon, 6 Jan
 2020 20:46:02 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.12.60) by
 VE1EUR02FT060.mail.protection.outlook.com (10.152.13.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.11 via Frontend Transport; Mon, 6 Jan 2020 20:46:00 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b957:6908:9f62:c28b]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::b957:6908:9f62:c28b%5]) with mapi id 15.20.2602.015; Mon, 6 Jan 2020
 20:46:00 +0000
Received: from bionic.localdomain (98.128.173.80) by
 AM5PR0402CA0019.eurprd04.prod.outlook.com (2603:10a6:203:90::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.12 via Frontend
 Transport; Mon, 6 Jan 2020 20:45:59 +0000
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>
Subject: [PATCH 00/15] Support more HDMI modes on RK3228/RK3328
Thread-Topic: [PATCH 00/15] Support more HDMI modes on RK3228/RK3328
Thread-Index: AQHVxNJNNVZSJYLQbE2SQNKZv6GhtQ==
Date: Mon, 6 Jan 2020 20:46:00 +0000
Message-ID: <HE1PR06MB4011254424EDB4485617513CAC3C0@HE1PR06MB4011.eurprd06.prod.outlook.com>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM5PR0402CA0019.eurprd04.prod.outlook.com
 (2603:10a6:203:90::29) To HE1PR06MB4011.eurprd06.prod.outlook.com
 (2603:10a6:7:9c::32)
x-incomingtopheadermarker: OriginalChecksum:CC8E993C4D3FD8CA0CD71A9CD67E907DB6949CF8D3AAE82376CAEAA6CDF308A0;
 UpperCasedChecksum:A2CD90775FD91933196DC12F0B0931C91DB158E95D9BB2C2A02BB5C842F00F4E;
 SizeAsReceived:7981; Count:49
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-tmn: [+PzkEC5Sk+0gmq/B1zMjnaSoM5exaTwV]
x-microsoft-original-message-id: <20200106204544.5836-1-jonas@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 49
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: c69260a1-ddc4-4ef4-9f21-08d792e96ff1
x-ms-traffictypediagnostic: VE1EUR02HT115:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 81XcGKf1B3vW9CwbT8OKh7COlEBVNib5G4a80I+YXrLKvnnQGlwMtPPSbMATnG7lFEKVLxHBEtJnJ+0Et/elTI5TUI0yKw70Sw2hW4UxmIOXqnu8mJdmEU3ltkUjqf0vg0d/R/7zP3v6cV11avCWTD8OHUGz1rb6hTBJ6kTkrWyyreFOoL66GKfmJFTNlnas
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: c69260a1-ddc4-4ef4-9f21-08d792e96ff1
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2020 20:46:00.4572 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR02HT115
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
Cc: Mark Rutland <mark.rutland@arm.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 Rob Herring <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Zheng Yang <zhengyang@rock-chips.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series make it possible to use more HDMI modes on RK3328,
and presumably also on RK3228. It also prepares for a future YUV420 and
10-bit output series.

Part of this has been reworked from vendor BSP 4.4 kernel commits.

Patch 1-5 fixes issues and shortcomings in the inno hdmi phy driver.

Patch 6 filter out any mode having larger width then 3840 pixels,
e.g 4096x2304 modes, since limitations in the scaler code trigger an error
for a large console framebuffer.

Patch 7 prepares for use of high TMDS bit rates used with HDMI2.0 and
10-bit output modes.

Patch 8-14 changes rk3228/rk3328 to use mode_valid functions suited for
the inno hdmi phy instead of the dw-hdmi phy. This

Patch 15 adds support for more pixel clock rates in order to support
common DMT modes in addition to CEA modes.

Note: I have only been able to build test RK322x related changes
as I do not have any RK322x device to test on.

All modes, including fractal modes, has been tested with modetest on
a RK3328 Rock64 device.

  modetest -M rockchip -s 39:3840x2160-29.97

Regards,
Jonas

Algea Cao (1):
  phy/rockchip: inno-hdmi: Support more pre-pll configuration

Huicong Xu (1):
  phy/rockchip: inno-hdmi: force set_rate on power_on

Jonas Karlman (12):
  phy/rockchip: inno-hdmi: use correct vco_div_5 macro on rk3328
  phy/rockchip: inno-hdmi: remove unused no_c from rk3328 recalc_rate
  phy/rockchip: inno-hdmi: do not power on rk3328 post pll on reg write
  drm/rockchip: vop: limit resolution width to 3840
  drm/rockchip: dw-hdmi: allow high tmds bit rates
  drm/rockchip: dw-hdmi: require valid vpll clock rate on rk3228/rk3328
  clk: rockchip: set parent rate for DCLK_VOP clock on rk3228
  arm64: dts: rockchip: increase vop clock rate on rk3328
  arm64: dts: rockchip: add vpll clock to hdmi node on rk3328
  ARM: dts: rockchip: add vpll clock to hdmi node on rk3228
  drm/rockchip: dw-hdmi: limit tmds to 340mhz on rk3228/rk3328
  drm/rockchip: dw-hdmi: remove unused plat_data on rk3228/rk3328

Zheng Yang (1):
  phy/rockchip: inno-hdmi: round fractal pixclock in rk3328 recalc_rate

 arch/arm/boot/dts/rk322x.dtsi                 |   4 +-
 arch/arm64/boot/dts/rockchip/rk3328.dtsi      |   6 +-
 drivers/clk/rockchip/clk-rk3228.c             |   2 +-
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c   |  47 ++++++--
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c   |  10 ++
 drivers/phy/rockchip/phy-rockchip-inno-hdmi.c | 110 ++++++++++++------
 6 files changed, 130 insertions(+), 49 deletions(-)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
