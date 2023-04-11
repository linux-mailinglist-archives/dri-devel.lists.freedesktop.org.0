Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 878F06DD781
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 12:09:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD23C10E08B;
	Tue, 11 Apr 2023 10:09:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Tue, 11 Apr 2023 10:08:58 UTC
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id A0F7C10E08B
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 10:08:58 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.98,336,1673881200"; d="scan'208";a="155587889"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 11 Apr 2023 19:03:53 +0900
Received: from localhost.localdomain (unknown [10.226.93.123])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id EB88D400F2DA;
 Tue, 11 Apr 2023 19:03:48 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 0/8] Enable DSI and ADV7535 on RZ/G2{L,
 LC} and RZ/V2L platforms
Date: Tue, 11 Apr 2023 11:03:38 +0100
Message-Id: <20230411100346.299768-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series aims to Enable DSI by linking with ADV7535 on SMARC EVK
based on RZ/G2{L, LC} and RZ/V2L platforms.

patch#1 and #2 depend upon the binding patch [1]
[1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20230406171324.837247-1-biju.das.jz@bp.renesas.com/

patch #4 depend upon the binding patch [2]
[2] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20230406171324.837247-2-biju.das.jz@bp.renesas.com/

Biju Das (8):
  arm64: dts: renesas: r9a07g044: Add fcpvd node
  arm64: dts: renesas: r9a07g054: Add fcpvd node
  arm64: dts: renesas: r9a07g044: Add vspd node
  arm64: dts: renesas: r9a07g054: Add vspd node
  arm64: dts: renesas: r9a07g044: Add DSI node
  arm64: dts: renesas: r9a07g054: Add DSI node
  arm64: dts: renesas: rzg2l-smarc: Link DSI with ADV7535
  arm64: dts: renesas: rzg2lc-smarc: Link DSI with ADV7535

 arch/arm64/boot/dts/renesas/r9a07g044.dtsi    | 53 +++++++++++++
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi    | 54 +++++++++++++
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi  | 79 +++++++++++++++++++
 arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi | 79 +++++++++++++++++++
 4 files changed, 265 insertions(+)

-- 
2.25.1

