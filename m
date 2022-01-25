Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F7149BABC
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 18:57:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 011C310E3C1;
	Tue, 25 Jan 2022 17:57:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asav22.altibox.net (asav22.altibox.net [109.247.116.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECB2910E31C
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 17:57:24 +0000 (UTC)
Received: from localhost.localdomain (211.81-166-168.customer.lyse.net
 [81.166.168.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: noralf.tronnes@ebnett.no)
 by asav22.altibox.net (Postfix) with ESMTPSA id 4EC0B20CD4;
 Tue, 25 Jan 2022 18:57:21 +0100 (CET)
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: robh+dt@kernel.org,
	thierry.reding@gmail.com
Subject: [PATCH v2 0/3] drm/panel: Add MIPI DBI compatible SPI driver
Date: Tue, 25 Jan 2022 18:56:57 +0100
Message-Id: <20220125175700.37408-1-noralf@tronnes.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f6Fm+t6M c=1 sm=1 tr=0
 a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
 a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=VwQbUJbxAAAA:8 a=SJz97ENfAAAA:8
 a=1LP9cTVIc-Moe54IzosA:9 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22
 a=vFet0B0WnEQeilDPIY6i:22
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
Cc: devicetree@vger.kernel.org, david@lechnology.com,
 dave.stevenson@raspberrypi.com, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>, maxime@cerno.tech,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This patchset adds a driver that will work with most MIPI DBI compatible
SPI panels out there.

It's a follow up on 'drm/tiny/st7735r: Match up with staging/fbtft
driver'[1] which aimed at making the st7735r driver work with all panels
adding DT properties.

Maxime gave[2] a good overview of the situation with these displays and
proposed to make a driver that works with all MIPI DBI compatible
controllers and use a firmware file to provide the controller setup for
a particular panel.

Main change since previous version:
- Drop model property and use the compatible property instead (Rob)

Noralf.

[1] https://lore.kernel.org/dri-devel/20211124150757.17929-1-noralf@tronnes.org/
[2] https://lore.kernel.org/dri-devel/20211129093946.xhp22mvdut3m67sc@houat/


Noralf Trønnes (3):
  dt-bindings: display: add bindings for MIPI DBI compatible SPI panels
  drm/mipi-dbi: Add driver_private member to struct mipi_dbi_dev
  drm/panel: Add MIPI DBI compatible SPI driver

 .../display/panel/panel-mipi-dbi-spi.yaml     |  59 +++
 MAINTAINERS                                   |   8 +
 drivers/gpu/drm/panel/Kconfig                 |  11 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-mipi-dbi.c        | 394 ++++++++++++++++++
 include/drm/drm_mipi_dbi.h                    |   2 +
 6 files changed, 475 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-mipi-dbi.c

-- 
2.33.0

