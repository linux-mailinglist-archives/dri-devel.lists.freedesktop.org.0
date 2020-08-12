Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DCA243498
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 09:13:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7A046E544;
	Thu, 13 Aug 2020 07:12:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id DFE0B6E123
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 14:02:50 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.76,304,1592838000"; d="scan'208";a="54444312"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 12 Aug 2020 23:02:49 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 5B8704007553;
 Wed, 12 Aug 2020 23:02:46 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH 0/9] r8a774e1 add support for DU, HDMI and LVDS
Date: Wed, 12 Aug 2020 15:02:08 +0100
Message-Id: <20200812140217.24251-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Thu, 13 Aug 2020 07:12:31 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

This patch series adds support for DU, HDMI and LVDS to RZ/G2H SoC.

Cheers,
Prabhakar

Lad Prabhakar (1):
  arm64: dts: renesas: r8a774e1-hihope-rzg2h: Setup DU clocks

Marian-Cristian Rotariu (8):
  dt-bindings: display: renesas,du: Document r8a774e1 bindings
  drm: rcar-du: Add support for R8A774E1 SoC
  arm64: dts: renesas: r8a774e1: Populate DU device node
  dt-bindings: display: renesas,lvds: Document r8a774e1 bindings
  dt-bindings: display: renesas,dw-hdmi: Add r8a774e1 support
  arm64: dts: renesas: r8a774e1: Populate HDMI encoder node
  drm: rcar-du: lvds: Add support for R8A774E1 SoC
  arm64: dts: renesas: r8a774e1: Add LVDS device node

 .../display/bridge/renesas,dw-hdmi.txt        |  1 +
 .../bindings/display/bridge/renesas,lvds.txt  |  1 +
 .../bindings/display/renesas,du.txt           |  2 +
 .../dts/renesas/r8a774e1-hihope-rzg2h.dts     | 11 ++++
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi     | 61 ++++++++++++++++++-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c         | 30 +++++++++
 drivers/gpu/drm/rcar-du/rcar_lvds.c           |  1 +
 7 files changed, 104 insertions(+), 3 deletions(-)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
