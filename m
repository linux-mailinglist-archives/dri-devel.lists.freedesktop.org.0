Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFEE11F22D
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2019 15:44:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88BCE6E395;
	Sat, 14 Dec 2019 14:43:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa1.microchip.iphmx.com (esa1.microchip.iphmx.com
 [68.232.147.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C41E6E8CD
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 15:05:08 +0000 (UTC)
Received-SPF: Pass (esa1.microchip.iphmx.com: domain of
 Claudiu.Beznea@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Claudiu.Beznea@microchip.com";
 x-sender="Claudiu.Beznea@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
 include:servers.mcsv.net include:mktomail.com
 include:spf.protection.outlook.com ~all"
Received-SPF: None (esa1.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Claudiu.Beznea@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa1.microchip.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=Pass smtp.mailfrom=Claudiu.Beznea@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: /l3zNd7W8x5mGxD5D2YKoB1ZSgknSeaTBybraVXNXDLaHm0eK/6PWCZz5tbCMhBfosSQk99CMd
 sun3NtdDv8aYIoRGm4z0TPZ/CjWpJ9uiZz54nOAyE58fK2qAOiwinDmKSjahHddnQWWvvfetST
 ckayaBEyvavx3V+Kp+T9fDkeUaQyeJDbbtHiuZIPIrabWW6LqIRxB13GEMq5cdGQSZgwjzLScP
 o1lcMPyuTP/IHzWr7cWsZm8HA2xfjYrUqmWEtVoFw7TC++lzLZVf12NqSWfQmGy4T5C19yxMlF
 PRI=
X-IronPort-AV: E=Sophos;i="5.69,309,1571727600"; d="scan'208";a="61646956"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 13 Dec 2019 08:05:07 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 13 Dec 2019 08:05:06 -0700
Received: from m18063-ThinkPad-T460p.microchip.com (10.10.85.251) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Fri, 13 Dec 2019 08:05:02 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <sam@ravnborg.org>, <bbrezillon@kernel.org>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <ludovic.desroches@microchip.com>,
 <lee.jones@linaro.org>
Subject: [PATCH v2 0/6] fixes for atmel-hlcdc
Date: Fri, 13 Dec 2019 17:04:50 +0200
Message-ID: <1576249496-4849-1-git-send-email-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 14 Dec 2019 14:42:54 +0000
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
Cc: Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

I have few fixes for atmel-hlcdc driver in this series as well
as two reverts.
Revert "drm: atmel-hlcdc: enable sys_clk during initalization." is
due to the fix in in patch 2/5.

Thank you,
Claudiu Beznea

Changes in v2:
- introduce patch 3/6
- use dev_err() inpatch 4/6
- introduce patch 5/6 instead of reverting commit f6f7ad323461
  ("drm/atmel-hlcdc: allow selecting a higher pixel-clock than requested")

Claudiu Beznea (5):
  drm: atmel-hlcdc: use double rate for pixel clock only if supported
  drm: atmel-hlcdc: enable clock before configuring timing engine
  mfd: atmel-hlcdc: add struct device member to struct
    atmel_hlcdc_regmap
  mfd: atmel-hlcdc: return in case of error
  Revert "drm: atmel-hlcdc: enable sys_clk during initalization."

Peter Rosin (1):
  drm: atmel-hlcdc: prefer a lower pixel-clock than requested

 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c | 18 ++++++++++++------
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c   | 19 +------------------
 drivers/mfd/atmel-hlcdc.c                      | 18 ++++++++++++++----
 3 files changed, 27 insertions(+), 28 deletions(-)

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
