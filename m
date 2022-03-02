Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B20A4C9BBF
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 04:07:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD26910E1E6;
	Wed,  2 Mar 2022 03:07:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05D1510E1E6
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 03:07:18 +0000 (UTC)
Received: from twspam01.aspeedtech.com (localhost [127.0.0.2] (may be forged))
 by twspam01.aspeedtech.com with ESMTP id 2222etdt029305
 for <dri-devel@lists.freedesktop.org>; Wed, 2 Mar 2022 10:40:55 +0800 (GMT-8)
 (envelope-from tommy_huang@aspeedtech.com)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 2222eJP7029206;
 Wed, 2 Mar 2022 10:40:19 +0800 (GMT-8)
 (envelope-from tommy_huang@aspeedtech.com)
Received: from tommy0527-VirtualBox.aspeedtech.com (192.168.2.141) by
 TWMBX02.aspeed.com (192.168.0.24) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Mar 2022 10:49:40 +0800
From: Tommy Haung <tommy_huang@aspeedtech.com>
To: <joel@jms.id.au>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <robh+dt@kernel.org>, <andrew@aj.id.au>,
 <linux-aspeed@lists.ozlabs.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 0/5] Add Aspeed AST2600 soc display support
Date: Wed, 2 Mar 2022 10:49:25 +0800
Message-ID: <20220302024930.18758-1-tommy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.2.141]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 2222eJP7029206
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
Cc: BMC-SW@aspeedtech.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v6:
  Remove some unnecessary reset patch.
  Refine patch format.
  Add detail explain of SOC display reset bits.

v5:
  Add lost reset define.

v4:
  Add necessary reset control for ast2600.
  Add chip caps for futher use.
  These code are test on AST2500 and AST2600 by below steps.

  1. Add below config to turn VT and LOGO on.

	CONFIG_TTY=y
	CONFIG_VT=y
	CONFIG_CONSOLE_TRANSLATIONS=y
	CONFIG_VT_CONSOLE=y
	CONFIG_VT_CONSOLE_SLEEP=y
	CONFIG_HW_CONSOLE=y
	CONFIG_VT_HW_CONSOLE_BINDING=y
	CONFIG_UNIX98_PTYS=y
	CONFIG_LDISC_AUTOLOAD=y
	CONFIG_DEVMEM=y
	CONFIG_DUMMY_CONSOLE=y
	CONFIG_FRAMEBUFFER_CONSOLE=y
	CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
	CONFIG_LOGO=y
	CONFIG_LOGO_LINUX_CLUT224=y

  2. The Linux logo will be shown on the screen, when the BMC boot in Linux.

v3:
  Refine the patch for clear separate purpose.
  Skip to send devicetree patch

v2:
  Remove some unnecessary patch.
  Refine for reviwer request.

v1:
  First add patch.

Joel Stanley (2):
  ARM: dts: aspeed: Add GFX node to AST2600
  ARM: dts: aspeed: ast2600-evb: Enable GFX device

Tommy Haung (3):
  drm/aspeed: Update INTR_STS handling
  drm/aspeed: Add AST2600 chip support
  ARM: dtsi: aspeed: Modified gfx reset control

 arch/arm/boot/dts/aspeed-ast2600-evb.dts | 18 ++++++++++++++++++
 arch/arm/boot/dts/aspeed-g6.dtsi         | 11 +++++++++++
 drivers/gpu/drm/aspeed/aspeed_gfx.h      |  1 +
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c  | 15 ++++++++++++++-
 4 files changed, 44 insertions(+), 1 deletion(-)

-- 
2.17.1

