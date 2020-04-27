Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 083901BBE08
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 14:47:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34F756E3C7;
	Tue, 28 Apr 2020 12:46:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.HINET-IP.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD84689ACC
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 09:32:07 +0000 (UTC)
IronPort-SDR: 03tNGgORm4fYJDbu4RNLVwBLIPVqQqd9fHfvk56lkvOModc0w26hJvlRnmRqBNxqFJ+g0Mmyrj
 12/d/rTrCqgg==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 27 Apr 2020 17:32:05 +0800
Received: from CSBMAIL1.internal.ite.com.tw (csbmail1.internal.ite.com.tw
 [192.168.65.58]) by mse.ite.com.tw with ESMTP id 03R9W1f1045929;
 Mon, 27 Apr 2020 17:32:01 +0800 (GMT-8)
 (envelope-from allen.chen@ite.com.tw)
Received: from allen-VirtualBox.internal.ite.com.tw (192.168.70.14) by
 CSBMAIL1.internal.ite.com.tw (192.168.65.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1713.5; Mon, 27 Apr 2020 17:32:00 +0800
From: allen <allen.chen@ite.com.tw>
To: 
Subject: [PATCH v9 0/3] IT6505 cover letter
Date: Mon, 27 Apr 2020 17:16:51 +0800
Message-ID: <1587979103-5630-1-git-send-email-allen.chen@ite.com.tw>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [192.168.70.14]
X-ClientProxiedBy: CSBMAIL1.internal.ite.com.tw (192.168.65.58) To
 CSBMAIL1.internal.ite.com.tw (192.168.65.58)
X-TM-SNTS-SMTP: FF59412277EA3E11F0A6463377A2F20CD0C999F653F3C73A7397EFBC782DDE7E2000:8
X-MAIL: mse.ite.com.tw 03R9W1f1045929
X-Mailman-Approved-At: Tue, 28 Apr 2020 12:46:22 +0000
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
Cc: "open list:OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Stephan Gerhold <stephan@gerhold.net>,
 Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>, Allen Chen <allen.chen@ite.com.tw>,
 Jonas Karlman <jonas@kwiboo.se>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM
 DRIVERS" <dri-devel@lists.freedesktop.org>, Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Pi-Hsun Shih <pihsun@chromium.org>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Sam Ravnborg <sam@ravnborg.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The IT6505 is a high-performance DisplayPort 1.1a transmitter, fully compliant with DisplayPort 1.1a, HDCP 1.3 specifications. The IT6505 supports color depth of up to 36 bits (12 bits/color) and ensures robust transmission of high-quality uncompressed video content, along with uncompressed and compressed digital audio content.

This series contains document bindings, revert commit, add vendor prefix, Kconfig to control the function enable or not.

Allen Chen (1):
  WIP: drm/bridge: add it6505 driver

allen (2):
  dt-bindings: Add vendor prefix for ITE Tech. Inc.
  WIP: dt-bindings: Add binding for IT6505.

 .../bindings/display/bridge/ite,it6505.yaml        |   91 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +-
 drivers/gpu/drm/bridge/Kconfig                     |    7 +
 drivers/gpu/drm/bridge/Makefile                    |    1 +
 drivers/gpu/drm/bridge/ite-it6505.c                | 3136 ++++++++++++++++++++
 5 files changed, 3236 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml
 create mode 100644 drivers/gpu/drm/bridge/ite-it6505.c

-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
