Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B604C5B34
	for <lists+dri-devel@lfdr.de>; Sun, 27 Feb 2022 13:47:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F73010E8EA;
	Sun, 27 Feb 2022 12:47:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asav21.altibox.net (asav21.altibox.net [109.247.116.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B69EA10E602
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Feb 2022 12:47:41 +0000 (UTC)
Received: from localhost.localdomain (211.81-166-168.customer.lyse.net
 [81.166.168.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: noralf.tronnes@ebnett.no)
 by asav21.altibox.net (Postfix) with ESMTPSA id 59C7C80057;
 Sun, 27 Feb 2022 13:47:37 +0100 (CET)
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: robh+dt@kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 0/5] drm/tiny: Add MIPI DBI compatible SPI driver
Date: Sun, 27 Feb 2022 13:47:08 +0100
Message-Id: <20220227124713.39766-1-noralf@tronnes.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Adef4UfG c=1 sm=1 tr=0
 a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
 a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=RFe_aE2YmaUHG6hxem0A:9
 a=QEXdDO2ut3YA:10
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
Cc: devicetree@vger.kernel.org,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>, david@lechnology.com,
 dave.stevenson@raspberrypi.com, thierry.reding@gmail.com, maxime@cerno.tech,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This patchset adds a driver that will work with most MIPI DBI compatible
SPI panels out there.

One change this time: Fix indentation in the DT binding.

All patches are reviewed now so I will apply this after Rob's bot have
looked at the binding.

Thanks for reviewing!

Noralf.


Noralf Trønnes (5):
  dt-bindings: display: add bindings for MIPI DBI compatible SPI panels
  drm/modes: Remove trailing whitespace
  drm/modes: Add of_get_drm_panel_display_mode()
  drm/mipi-dbi: Add driver_private member to struct mipi_dbi_dev
  drm/tiny: Add MIPI DBI compatible SPI driver

 .../display/panel/panel-mipi-dbi-spi.yaml     | 126 ++++++
 MAINTAINERS                                   |   8 +
 drivers/gpu/drm/drm_modes.c                   |  51 ++-
 drivers/gpu/drm/tiny/Kconfig                  |  15 +
 drivers/gpu/drm/tiny/Makefile                 |   1 +
 drivers/gpu/drm/tiny/panel-mipi-dbi.c         | 398 ++++++++++++++++++
 include/drm/drm_mipi_dbi.h                    |   8 +
 include/drm/drm_modes.h                       |   8 +
 8 files changed, 614 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
 create mode 100644 drivers/gpu/drm/tiny/panel-mipi-dbi.c

-- 
2.33.0

