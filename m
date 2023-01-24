Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF396794EF
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 11:13:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1BD710E650;
	Tue, 24 Jan 2023 10:13:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3954E10E650
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 10:13:16 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30OACdf1062044;
 Tue, 24 Jan 2023 04:12:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1674555159;
 bh=gviSn9vb49cpzvtHbSo3QRdOijS+3xM9ZngoeJVs8kI=;
 h=From:To:CC:Subject:Date;
 b=XHy9sHQVFuVI/50lkjqrIOB2PTooqm1ouxm0BMDtL9onNCKMNq88bZnnYfcwNH6tu
 6sWasbP4AioszP0Bhn5dMVHRImYTXAk948WGmfVrYx2+edOz/7e0eJDe/4shKlBWvp
 2uhU7Zkq+NfGoyRw74a/ywEyl5/Yy+5dCHEMhFOw=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30OACd22038297
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 24 Jan 2023 04:12:39 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 24
 Jan 2023 04:12:39 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 24 Jan 2023 04:12:39 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30OACc7f005965;
 Tue, 24 Jan 2023 04:12:39 -0600
From: Aradhya Bhatia <a-bhatia1@ti.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Tomi Valkeinen <tomba@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime@cerno.tech>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Matthias Brugger <matthias.bgg@gmail.com>, Guo Ren
 <guoren@kernel.org>
Subject: [PATCH v2 0/4] dt-bindings: Introduce dual-link panels & panel-vendors
Date: Tue, 24 Jan 2023 15:42:34 +0530
Message-ID: <20230124101238.4542-1-a-bhatia1@ti.com>
X-Mailer: git-send-email 2.39.0
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
 Jayesh Choudhary <j-choudhary@ti.com>, Jai Luthra <j-luthra@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Aradhya Bhatia <a-bhatia1@ti.com>,
 Linux Mediatek List <linux-mediatek@lists.infradead.org>,
 Linux C-SKY Arch List <linux-csky@vger.kernel.org>,
 Linux RISC-V List <linux-riscv@lists.infradead.org>,
 Linux ARM Kernel List <linux-arm-kernel@lists.infradead.org>,
 Rahul T R <r-ravikumar@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

Microtips Technology Solutions USA, and Lincoln Technology Solutions are
2 display panel vendors, and the first 2 patches add their vendor
prefixes.

The third patch introduces a dt-binding for generic dual-link LVDS
panels. These panels do not have any documented constraints, except for
their timing characteristics. Further, these panels have 2 pixel-sinks.
In a dual-link connection between an LVDS encoder and the panel, one
sink accepts the odd set of LVDS pixels and the other, the even set.

The fourth patch introduces driver support for the 'panel-dual-lvds'
in the panel-lvds driver, by adding the compatible.

A lot of this has been based from the Advantech,idk-2121wr dual-link
panel[1] and Maxime's patches for generic LVDS panels[2] (which are
single-link by default.) and the discussions that happened before they
were finally merged.

Thank you!

[1]: https://patchwork.freedesktop.org/patch/357122/
[2]: https://patchwork.freedesktop.org/patch/471228/

Changes in V2:
==============
  - Rebased to latest linux-next.
  - Made dt-binding syntax corrections in Patch 3/4, based on comments
    by Krzysztof Kozlowski and Laurent Pinchart.

V1: https://lore.kernel.org/all/20230103064615.5311-1-a-bhatia1@ti.com/

Aradhya Bhatia (4):
  dt-bindings: vendor-prefixes: Add microtips
  dt-bindings: vendor-prefixes: Add lincolntech
  dt-bindings: panel: Introduce dual-link LVDS panel
  drm: panel-lvds: Introduce dual-link panels

 .../display/panel/panel-dual-lvds.yaml        | 149 ++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   4 +
 MAINTAINERS                                   |   1 +
 drivers/gpu/drm/panel/panel-lvds.c            |   1 +
 4 files changed, 155 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-dual-lvds.yaml

-- 
2.39.0

