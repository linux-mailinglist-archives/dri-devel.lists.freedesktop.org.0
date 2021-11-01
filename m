Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4939D441A5A
	for <lists+dri-devel@lfdr.de>; Mon,  1 Nov 2021 12:01:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6C1089C05;
	Mon,  1 Nov 2021 11:01:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A60E189BF4
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Nov 2021 11:01:48 +0000 (UTC)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 1A1AcdKM037900;
 Mon, 1 Nov 2021 18:38:39 +0800 (GMT-8)
 (envelope-from tommy_huang@aspeedtech.com)
Received: from tommy0527-VirtualBox.aspeedtech.com (192.168.2.141) by
 TWMBX02.aspeed.com (192.168.0.24) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 1 Nov 2021 19:01:23 +0800
From: tommy-huang <tommy_huang@aspeedtech.com>
To: <joel@jms.id.au>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <robh+dt@kernel.org>, <andrew@aj.id.au>,
 <linux-aspeed@lists.ozlabs.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/4] Add Aspeed AST2600 soc display support
Date: Mon, 1 Nov 2021 19:01:03 +0800
Message-ID: <20211101110107.29010-1-tommy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.2.141]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 1A1AcdKM037900
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

The Aspeed AST2600 soc diaplay support is added in this patch.
Because some hw designed is changed in this version, add them 
in this patch.

v2:
  Remove some unnecessary patch.
  Refine for reviwer request.

v1:
  First add patch.

Joel Stanley (2):
  ARM: dts: aspeed: Add GFX node to AST2600
  ARM: dts: aspeed: ast2600-evb: Enable GFX device

tommy-huang (2):
  drm/aspeed: Update INTR_STS handling
  dt-bindings: gpu: Add ASPEED GFX bindings document

 .../devicetree/bindings/gpu/aspeed-gfx.txt    |  1 +
 arch/arm/boot/dts/aspeed-ast2600-evb.dts      | 18 +++++++++++++
 arch/arm/boot/dts/aspeed-g6.dtsi              | 11 ++++++++
 drivers/gpu/drm/aspeed/aspeed_gfx.h           |  2 ++
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c       | 26 ++++++++++++++++---
 5 files changed, 55 insertions(+), 3 deletions(-)

-- 
2.17.1

