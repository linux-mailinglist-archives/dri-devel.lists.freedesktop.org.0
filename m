Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9E8124709
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 13:39:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC4706E31D;
	Wed, 18 Dec 2019 12:39:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Wed, 18 Dec 2019 12:35:44 UTC
Received: from esa5.microchip.iphmx.com (esa5.microchip.iphmx.com
 [216.71.150.166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E085B6E02A
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 12:35:44 +0000 (UTC)
Received-SPF: Pass (esa5.microchip.iphmx.com: domain of
 Claudiu.Beznea@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
 envelope-from="Claudiu.Beznea@microchip.com";
 x-sender="Claudiu.Beznea@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
 include:servers.mcsv.net include:mktomail.com
 include:spf.protection.outlook.com ~all"
Received-SPF: None (esa5.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
 envelope-from="Claudiu.Beznea@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa5.microchip.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=Pass smtp.mailfrom=Claudiu.Beznea@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: mMhpzqDKffyOcoquQvlWs/uTrosHiQ7bIT/IryT2UMqI7ma5vJ2NJeK8pNZJ9N7JIXOfpvRzkV
 8+SsrubPp0iJsBWeYWFx1AdrDba0+//DCb2x0sLZ+rQQnB0SC4BKWeOD1Vp9Yx/2OVIk/McC9o
 4SLOMnDu6mXyqyTaIHO+fNpedRk8tJfdgYybV09Oru3BJvMvMAa3VzCHMmvwASCP65f2q5GDO+
 ILx+QKs+VqE6+FP5SBoNPOTv4a8DnakSnsXDy3BdI93M0vMRmMhJbH0D6g5SDdxuLcdTV1zvUF
 EYc=
X-IronPort-AV: E=Sophos;i="5.69,329,1571727600"; d="scan'208";a="59399379"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 18 Dec 2019 05:28:36 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 18 Dec 2019 05:28:34 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.85.251) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Wed, 18 Dec 2019 05:28:31 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <boris.brezillon@bootlin.com>, <airlied@linux.ie>,
 <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <lee.jones@linaro.org>, <sam@ravnborg.org>
Subject: [PATCH v3 0/6] fixes for atmel-hlcdc
Date: Wed, 18 Dec 2019 14:28:23 +0200
Message-ID: <1576672109-22707-1-git-send-email-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 18 Dec 2019 12:38:50 +0000
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
Cc: linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>, peda@axentia.se,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

Changes in v3:
- changes dev_err() message in patch 4/6
- collect Acked-by tags

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
