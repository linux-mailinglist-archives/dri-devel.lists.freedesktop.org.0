Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F94630FCD
	for <lists+dri-devel@lfdr.de>; Sat, 19 Nov 2022 18:31:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B071110E270;
	Sat, 19 Nov 2022 17:31:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C85D110E223
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Nov 2022 17:30:43 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2AJHULL5025948;
 Sat, 19 Nov 2022 11:30:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1668879021;
 bh=8+Dq0WAc1bNc62nRfuh2tOK1pVafWhkJvKRgbeBBi3w=;
 h=From:To:CC:Subject:Date;
 b=NZZckdXP227hZUhwqFC3fGg1mX1E8P7EcHFwk/vBlI8+48sOqTiUofLwQzoKxASY5
 1oR0K91WNJDrIu2K6aUh9+l5z02DQOo6csLGS88AX32NyENLJvfR9bdLzS2oa19M69
 oK+GAUF7y51XMfgu0t/jVNFMXJycYL+H1gjQR7Vk=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2AJHULpu093871
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sat, 19 Nov 2022 11:30:21 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Sat, 19
 Nov 2022 11:30:21 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Sat, 19 Nov 2022 11:30:21 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2AJHUKnw055604;
 Sat, 19 Nov 2022 11:30:21 -0600
From: Aradhya Bhatia <a-bhatia1@ti.com>
To: Tomi Valkeinen <tomba@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>, Rob
 Herring <robh+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v6 0/5] Add DSS support for AM625 SoC
Date: Sat, 19 Nov 2022 23:00:14 +0530
Message-ID: <20221119173019.15643-1-a-bhatia1@ti.com>
X-Mailer: git-send-email 2.38.1
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
 Jayesh Choudhary <j-choudhary@ti.com>, Rahul T R <r-ravikumar@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Aradhya Bhatia <a-bhatia1@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series adds a new compatible for the Display SubSyetem
controller on TI's AM625 SoC. It further adds the required support for
the same in the tidss driver.

The AM625-DSS is a newer version of the DSS from the AM65X version with
the major change being the addition of another OLDI TX. With the help of
2 OLDI TXes, the AM625 DSS can support dual-linked OLDI displays with a
resolution of upto 2K or WUXGA (1920x1200@60fps) at half the OLDI clock
frequency or even cloned video outputs on each of the TXes.

TODO:
  - The pixel clock for the OLDI VP passes through a clock divider, which
    was being explicitly set in previous versions, but that was not the
    right way. That patch was dropped and a newer implementation is in
    works.

Note:
  - The roots of this patch set can be found in the following series.
    https://patchwork.kernel.org/project/dri-devel/list/?series=660970&state=%2A&archive=both

    The changes in the above-mentioned series forced some re-works in
    this series, and since all the patches were better understood as a
    single set, both the series were combined.

  - The previous patch series couldn't take into account OLDI bridges
    that worked with Clone / Dual Link Mode. That has been rectified in
    this patch set. This became possible because the OLDI mode discovery
    was separated from the panel/bridge discovery loop during modeset
    initialization.

Changelog:
V6:
  - Rebase for current merge window.
  - Add 'allOf:' condition in the DT binding.
  - Address Tomi Valkeinen's comments
    1. Combine DT binding patches for new compatible and 3rd DSS port.
    2. Further separate DSS VPs and output ports.
    3. Separate OLDI mode discovery logic from the panel/bridge discovery
       (which allowed support for OLDI bridges as well.)
    4. Organize OLDI IO control regsiter macros platform wise.

V5:
  - Rebase for current merge window
  - Add max DT ports in DSS features
  - Combine the OLDI support series

(Changes from OLDI support series v1)
  - Address Tomi Valkeinen's comments
    1. Update the OLDI link detection approach
    2. Add port #3 for 2nd OLDI TX
    3. Configure 2 panel-bridges for cloned panels
    4. Drop the OLDI clock set patch
    5. Drop rgb565-to-888 patch

V4:
  - Rebase for current merge window
  - Add acked and reviewed by tags

V3:
  - Change yaml enum in alphabetical order
  - Correct a typo

V2:
  - Remove redundant regsiter array

Aradhya Bhatia (5):
  dt-bindings: display: ti,am65x-dss: Add support for am625 dss
  drm/tidss: Add support for AM625 DSS
  drm/tidss: Add support to configure OLDI mode for am625-dss.
  drm/tidss: Add IO CTRL and Power support for OLDI TX in am625
  drm/tidss: Enable Dual and Duplicate Modes for OLDI

 .../bindings/display/ti/ti,am65x-dss.yaml     |  23 ++-
 drivers/gpu/drm/tidss/tidss_dispc.c           | 171 ++++++++++++++--
 drivers/gpu/drm/tidss/tidss_dispc.h           |  24 ++-
 drivers/gpu/drm/tidss/tidss_dispc_regs.h      |  37 +++-
 drivers/gpu/drm/tidss/tidss_drv.c             |   1 +
 drivers/gpu/drm/tidss/tidss_drv.h             |   8 +-
 drivers/gpu/drm/tidss/tidss_encoder.c         |   4 +-
 drivers/gpu/drm/tidss/tidss_encoder.h         |   3 +-
 drivers/gpu/drm/tidss/tidss_irq.h             |   2 +-
 drivers/gpu/drm/tidss/tidss_kms.c             | 188 ++++++++++++++++--
 10 files changed, 400 insertions(+), 61 deletions(-)

-- 
2.38.1

