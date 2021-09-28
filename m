Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D6541A969
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 09:09:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F8976E0C6;
	Tue, 28 Sep 2021 07:09:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 635 seconds by postgrey-1.36 at gabe;
 Tue, 28 Sep 2021 03:08:04 UTC
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23A386E0A8
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 03:08:03 +0000 (UTC)
Received: from twspam01.aspeedtech.com (localhost [127.0.0.2] (may be forged))
 by twspam01.aspeedtech.com with ESMTP id 18S2apx9072756
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 10:36:51 +0800 (GMT-8)
 (envelope-from tommy_huang@aspeedtech.com)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 18S2aTCb072684;
 Tue, 28 Sep 2021 10:36:29 +0800 (GMT-8)
 (envelope-from tommy_huang@aspeedtech.com)
Received: from tommy0527-VirtualBox.aspeedtech.com (192.168.2.141) by
 TWMBX02.aspeed.com (192.168.0.24) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Sep 2021 10:57:10 +0800
From: tommy-huang <tommy_huang@aspeedtech.com>
To: <joel@jms.id.au>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <robh+dt@kernel.org>, <andrew@aj.id.au>,
 <linux-aspeed@lists.ozlabs.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <BMC-SW@aspeedtech.com>
Subject: [PATCH 0/6] *** Add AST2600 GFX node ***
Date: Tue, 28 Sep 2021 10:56:57 +0800
Message-ID: <20210928025703.10909-1-tommy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.2.141]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 18S2aTCb072684
X-Mailman-Approved-At: Tue, 28 Sep 2021 07:09:22 +0000
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

Add AST2600 GFX support first.

Joel Stanley (5):
  ARM: dts: aspeed: Add GFX node to AST2600
  ARM: dts: aspeed: ast2600-evb: Enable GFX device
  drm/aspeed: Add AST2600 support
  HACK: drm/aspeed: INTR_STS hadndling
  HACK: drm/aspeed: Paramterise modes

tommy-huang (1):
  dt-bindings: gpu: Add ASPEED GFX bindings document

 .../devicetree/bindings/gpu/aspeed-gfx.txt     |  1 +
 arch/arm/boot/dts/aspeed-ast2600-evb.dts       | 13 +++++++++++++
 arch/arm/boot/dts/aspeed-g6.dtsi               | 11 +++++++++++
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c        | 18 +++++++++++++-----
 4 files changed, 38 insertions(+), 5 deletions(-)

-- 
2.17.1

