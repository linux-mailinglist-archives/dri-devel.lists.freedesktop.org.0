Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 400394CCDC5
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 07:32:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B81F110F2F8;
	Fri,  4 Mar 2022 06:32:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68A3D10E559
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 06:32:23 +0000 (UTC)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 2246MIea041904;
 Fri, 4 Mar 2022 14:22:18 +0800 (GMT-8)
 (envelope-from tommy_huang@aspeedtech.com)
Received: from tommy0527-VirtualBox.aspeedtech.com (192.168.2.141) by
 TWMBX02.aspeed.com (192.168.0.24) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Mar 2022 14:31:44 +0800
From: Tommy Haung <tommy_huang@aspeedtech.com>
To: <joel@jms.id.au>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <robh+dt@kernel.org>, <andrew@aj.id.au>,
 <linux-aspeed@lists.ozlabs.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 0/2] Add 1024x768 timing for AST2600
Date: Fri, 4 Mar 2022 14:31:35 +0800
Message-ID: <20220304063137.12970-1-tommy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.2.141]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 2246MIea041904
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

v1: 
  Add 1024x768@70Hz for AST2600 soc display timing selection.
  Add gfx flag for future usage.

Testing steps:

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
  3. Check the display mode is 1024x768@70Hz at AST2600.
  4. Check the display mode is 800x600@60Hz at AST2500.

Tommy Haung (2):
  drm/aspeed: Add gfx flags and clock selection for AST2600
  drm/aspeed: Add 1024x768 mode for AST2600

 drivers/gpu/drm/aspeed/aspeed_gfx.h      | 15 ++++++++++
 drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c | 35 ++++++++++++++++++++++++
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c  | 20 ++++++++++++--
 drivers/gpu/drm/aspeed/aspeed_gfx_out.c  | 14 +++++++++-
 4 files changed, 81 insertions(+), 3 deletions(-)

-- 
2.17.1

