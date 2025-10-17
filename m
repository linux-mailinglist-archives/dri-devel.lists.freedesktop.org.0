Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92729BE8796
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 13:54:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8BB410EBC6;
	Fri, 17 Oct 2025 11:54:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="cVJg5UcR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8AEE10EBC6
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 11:54:10 +0000 (UTC)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
 by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59HBrWol262957;
 Fri, 17 Oct 2025 06:53:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1760702012;
 bh=TwGywLCu02k7fKGwvP9vHvzJ/I432CRVJMIDMFaVut0=;
 h=From:To:CC:Subject:Date;
 b=cVJg5UcROrERPRFpYRcWldiRRwQ+ytlXtBzFbOFHrasT9Fg94FF6GdLSQgiIXqSR6
 NElrLhD2DLP2NGOmqj7g1buKIIiFdDbbY3N/m20HLiJkN0ioSv10wU09NEJQ82QKI5
 0gZ72/VnRKtPB2QJvsLI5GB1BTQhZthJ0mS9OF/U=
Received: from DFLE204.ent.ti.com (dfle204.ent.ti.com [10.64.6.62])
 by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59HBrWlo2385738
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 17 Oct 2025 06:53:32 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 17 Oct
 2025 06:53:32 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 17 Oct 2025 06:53:32 -0500
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [172.24.233.20])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59HBrPe81246573;
 Fri, 17 Oct 2025 06:53:26 -0500
From: Swamil Jain <s-jain1@ti.com>
To: <nm@ti.com>, <tomi.valkeinen@ideasonboard.com>, <robh@kernel.org>,
 <jyri.sarha@iki.fi>, <aradhya.bhatia@linux.dev>, <airlied@gmail.com>,
 <conor+dt@kernel.org>, <h-shenoy@ti.com>, <kristo@kernel.org>,
 <krzk+dt@kernel.org>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <simona@ffwll.ch>, <tzimmermann@suse.de>
CC: <devarsht@ti.com>, <praneeth@ti.com>, <u-kumar1@ti.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <s-jain1@ti.com>
Subject: [PATCH 0/2] Add SK-LCD1 support for AM62X
Date: Fri, 17 Oct 2025 17:23:23 +0530
Message-ID: <20251017115325.1942591-1-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

- Add overlay for SK-LCD1[1]
- Enable ILITEK touch sensor

Thie series depends on OLDI support enablement series[2]. Please apply
on top of the mentioned series.

Links:
[1]: https://www.ti.com/tool/SK-LCD1
[2]: https://lore.kernel.org/all/20250913064205.4152249-1-s-jain1@ti.com/

Aradhya Bhatia (1):
  arm64: dts: ti: Add Microtips OLDI SK-LCD1 Overlay for AM625-SK

Swamil Jain (1):
  arm64: defconfig: Enable ILITEK ILI21X & ILI25X family of touch
    sensors

 arch/arm64/boot/dts/ti/Makefile               |   4 +
 .../k3-am625-sk-microtips-mf101hie-panel.dtso | 121 ++++++++++++++++++
 arch/arm64/configs/defconfig                  |   1 +
 3 files changed, 126 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-sk-microtips-mf101hie-panel.dtso

