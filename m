Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5525794E9
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 10:09:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB55111A17D;
	Tue, 19 Jul 2022 08:09:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 075B411A1DD
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 08:09:10 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26J88kMU036283;
 Tue, 19 Jul 2022 03:08:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1658218126;
 bh=DuFyLCMUk/Qs07FIPBTpfWRXvD7dog3AOY97yovabG8=;
 h=From:To:CC:Subject:Date;
 b=nVoUt9F1Rv5ueGb0GgQz7YXD6764teima/q94fglPnoDx2O1m0FF4kcapDQBX5Whk
 GUVMqfaUL36ngnWuKg9kk3a6UyokBM8wNJ/fWd6EMTucCQs2CTyDtE44tSzSqs4r4k
 MX+C/Jg+IvI5cWq47dRek9XR7i/2KpWYpVMH5LBY=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26J88kNY022568
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 19 Jul 2022 03:08:46 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 19
 Jul 2022 03:08:46 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 19 Jul 2022 03:08:46 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26J88jHg077284;
 Tue, 19 Jul 2022 03:08:46 -0500
From: Aradhya Bhatia <a-bhatia1@ti.com>
To: Tomi Valkeinen <tomba@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>, Rob
 Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: sFrom b69208b75f7ae8e223c81783afb04fecd2f5faf8 Mon Sep 17 00:00:00
 2001
Date: Tue, 19 Jul 2022 13:38:37 +0530
Message-ID: <20220719080845.22122-1-a-bhatia1@ti.com>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Nishanth Menon <nm@ti.com>, Devicetree List <devicetree@vger.kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Darren Etheridge <detheridge@ti.com>, Rahul T R <r-ravikumar@ti.com>,
 Krunal Bhargav <k-bhargav@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series adds the required support for enabling OLDI display on
boards having SoCs with am625 compatible Display SubSystem.

The 2 OLDI TXes on am625-dss allow a 3 different types of panel
connections with the board.

1. Single Link / Single Mode on OLDI TX 0 OR 1.
2. Single Link / Duplicate Mode on OLDI TX 0 and 1.
3. Dual Link / Single Mode on OLDI TX 0 and 1.

The 3rd combination allows the DSS to be connected to LVDS panels of
resolutions upto 2K.

This patch series further adds support for boards, with HDMI bridges
supporting only 24bit RGB color space, to be able to explicitly output
16bit RGB data when only 16 DPI output pins have been connected from SoC
to bridge.

Note:
These patches require the new compatible "ti,am625-dss" and its support
in tidss driver. Those patches have been previously posted and can be
found on the following link:

https://patchwork.kernel.org/project/dri-devel/list/?series=654214&archive=both


Aradhya Bhatia (8):
  dt-bindings: display: ti,am65x-dss: Add port properties for DSS
  dt-bindings: display: ti,am65x-dss: Add IO CTRL property for AM625
    OLDI
  drm/tidss: Add support for DSS port properties
  drm/tidss: Add support for Dual Link LVDS Bus Format
  drm/tidss: dt property to force 16bit VP output to a 24bit bridge
  drm/tidss: Add IO CTRL and Power support for OLDI TX in am625
  drm/tidss: Fix clock request value for OLDI videoports
  drm/tidss: Enable Dual and Duplicate Modes for OLDI

 .../bindings/display/ti/ti,am65x-dss.yaml     |  46 +++-
 drivers/gpu/drm/tidss/tidss_dispc.c           | 220 +++++++++++++++---
 drivers/gpu/drm/tidss/tidss_dispc.h           |   8 +
 drivers/gpu/drm/tidss/tidss_dispc_regs.h      |   6 +
 4 files changed, 246 insertions(+), 34 deletions(-)

-- 
2.37.0

