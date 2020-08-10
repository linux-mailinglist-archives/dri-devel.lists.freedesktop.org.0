Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF192416A1
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 08:59:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB7526E30D;
	Tue, 11 Aug 2020 06:58:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id DA5E489AEE
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 15:22:28 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.75,457,1589209200"; d="scan'208";a="54088449"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie6.idc.renesas.com with ESMTP; 11 Aug 2020 00:22:27 +0900
Received: from localhost.localdomain (unknown [172.29.52.120])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 539274001958;
 Tue, 11 Aug 2020 00:22:23 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 0/3] Add optional regulator support for LVDS codec.
Date: Mon, 10 Aug 2020 16:22:16 +0100
Message-Id: <20200810152219.6254-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Tue, 11 Aug 2020 06:58:41 +0000
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
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series add support for enabling optional regulator for LVDS
codec bridge driver that may be used as VCC source.

Ref:https://patchwork.kernel.org/patch/11705819/

Biju Das (3):
  dt-bindings: display: bridge: lvds-codec: Document vcc-supply property
  drm/bridge: lvds-codec: Add support for regulator
  ARM: dts: iwg20d-q7-common: Fix touch controller probe failure

 .../bindings/display/bridge/lvds-codec.yaml   |  3 ++
 arch/arm/boot/dts/iwg20d-q7-common.dtsi       | 14 +++++++++
 drivers/gpu/drm/bridge/lvds-codec.c           | 29 +++++++++++++++++++
 3 files changed, 46 insertions(+)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
