Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8872402DF
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 09:37:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FBBB6E095;
	Mon, 10 Aug 2020 07:36:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 303 seconds by postgrey-1.36 at gabe;
 Fri, 07 Aug 2020 17:55:02 UTC
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4C6B96E165
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Aug 2020 17:55:02 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.75,446,1589209200"; d="scan'208";a="53937333"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie6.idc.renesas.com with ESMTP; 08 Aug 2020 02:49:57 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id F03A74004BA6;
 Sat,  8 Aug 2020 02:49:54 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/7] r8a7742: Enable DU and LVDS
Date: Fri,  7 Aug 2020 18:49:47 +0100
Message-Id: <20200807174954.14448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 10 Aug 2020 07:35:59 +0000
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
Cc: devicetree@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 linux-kernel@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

This patch series adds support for DU and LVDS to r8a7742
SoC and enables LCD support on r8a7742-iwg21d-q7 board.

This patch series applies on top of [1].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/
    renesas-devel.git/log/?h=renesas-arm-dt-for-v5.10

Cheers,
Prabhakar

Lad Prabhakar (7):
  dt-bindings: display: renesas,du: Document the r8a7742 bindings
  drm: rcar-du: Add r8a7742 support
  dt-bindings: display: renesas,lvds: Document r8a7742 bindings
  drm: rcar-du: lvds: Add r8a7742 support
  ARM: dts: r8a7742: Add DU support
  ARM: dts: r8a7742: Add LVDS support
  ARM: dts: r8a7742-iwg21d-q7: Add LCD support

 .../bindings/display/bridge/renesas,lvds.txt  |  1 +
 .../bindings/display/renesas,du.txt           |  2 +
 arch/arm/boot/dts/r8a7742-iwg21d-q7.dts       | 84 +++++++++++++++++
 arch/arm/boot/dts/r8a7742.dtsi                | 89 +++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_drv.c         |  5 +-
 drivers/gpu/drm/rcar-du/rcar_lvds.c           |  1 +
 6 files changed, 180 insertions(+), 2 deletions(-)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
