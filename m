Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A7C1CD24D
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 09:17:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7DD66E221;
	Mon, 11 May 2020 07:17:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pruto.48.io (48.io [37.205.10.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B78886E33E
 for <dri-devel@lists.freedesktop.org>; Sat,  9 May 2020 11:27:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by pruto.48.io (Postfix) with ESMTPSA id 2620B94C8C;
 Sat,  9 May 2020 13:18:10 +0200 (CEST)
DMARC-Filter: OpenDMARC Filter v1.3.2 pruto.48.io 2620B94C8C
Authentication-Results: pruto.48.io;
 dmarc=none (p=none dis=none) header.from=48.io
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=48.io; s=default;
 t=1589023090; bh=KARkDbiFWBw5fwU/CBmudfRgDCP3DX1QEy8rHToFI6w=;
 h=From:To:Cc:Subject:Date;
 b=TpYDnwlozMKCJmINVAMNyROL4vRGCGtwNP6WniI11KG05i8Vsb0n9UZ9E9lVXlRNX
 zh9RTmRj2cyjohHodu5zFNwQs2z9zRNEv8QrdY3SElPv7j/4SNe6I0wHTqisB9F+W7
 b8deqXBknDw0ZIQOWg/cP9UrEClkpaJx8ghg32WQ=
From: srk@48.io
To: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 0/2] Novena laptop: LVDS-to-eDP bridge
Date: Sat,  9 May 2020 13:17:30 +0200
Message-Id: <20200509111732.26102-1-srk@48.io>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 11 May 2020 07:17:27 +0000
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, Richard Marko <srk@48.io>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lubomir Rintel <lkundrak@v3.sk>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sean Cross <xobs@kosagi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Richard Marko <srk@48.io>

Contains updated patches I've received from Marek with the following
changes:

- yaml docs migration
- extended documentation

Tested on a Kosagi Novena laptop with imx6 display controller.

Based on v5.7-rc2, applies to drm-misc-next 5e6ed29d72d2

CC: Marek Vasut <marex@denx.de>
Cc: Sean Cross <xobs@kosagi.com>

Marek Vasut (2):
  dt-bindings: it6251: add bindings for IT6251 LVDS-to-eDP bridge
  drm/bridge: Add ITE IT6251 bridge driver

 .../bindings/display/bridge/ite,it6251.yaml   |  97 +++
 drivers/gpu/drm/bridge/Kconfig                |  12 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/ite-it6251.c           | 582 ++++++++++++++++++
 4 files changed, 692 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it6251.yaml
 create mode 100644 drivers/gpu/drm/bridge/ite-it6251.c


base-commit: ae83d0b416db002fe95601e7f97f64b59514d936
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
