Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE19840281A
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 13:58:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03C5E89804;
	Tue,  7 Sep 2021 11:58:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asav21.altibox.net (asav21.altibox.net [109.247.116.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EDC389733
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 11:58:08 +0000 (UTC)
Received: from localhost.localdomain (211.81-166-168.customer.lyse.net
 [81.166.168.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: noralf.tronnes@ebnett.no)
 by asav21.altibox.net (Postfix) with ESMTPSA id A60958004C;
 Tue,  7 Sep 2021 13:58:02 +0200 (CEST)
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: dri-devel@lists.freedesktop.org
Cc: peter@stuge.se, linus.walleij@linaro.org,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: [PATCH v2 0/7] drm/gud: Add some more pixel formats
Date: Tue,  7 Sep 2021 13:57:45 +0200
Message-Id: <20210907115752.6181-1-noralf@tronnes.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=EbzmvsuC c=1 sm=1 tr=0
 a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
 a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=BwSw2eQfq7Ym0XXCHCoA:9
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This adds some more pixel formats and gives the user the ability to
choose the xrgb8888 emulation format.

Pixel formats:
R8: For greyscale e-ink displays
RGB332: For e-ink displays and some niche displays
RGB888: Same color depth as XRGB8888 but the smaller buffer gives better
fps

Changes since first version:
- RGB332: Support Big Endian in the emulation (Daniel)

Noralf.


Noralf Trønnes (7):
  drm/fourcc: Add R8 to drm_format_info
  drm/format-helper: Add drm_fb_xrgb8888_to_rgb332()
  drm/format-helper: Add drm_fb_xrgb8888_to_rgb888()
  drm/gud: Add GUD_PIXEL_FORMAT_R8
  drm/gud: Add GUD_PIXEL_FORMAT_RGB332
  drm/gud: Add GUD_PIXEL_FORMAT_RGB888
  drm/gud: Add module parameter to control emulation: xrgb8888

 drivers/gpu/drm/drm_format_helper.c | 88 +++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_fourcc.c        |  1 +
 drivers/gpu/drm/gud/gud_drv.c       | 19 ++++++-
 drivers/gpu/drm/gud/gud_internal.h  | 12 ++++
 drivers/gpu/drm/gud/gud_pipe.c      |  6 ++
 include/drm/drm_format_helper.h     |  4 ++
 include/drm/gud.h                   |  6 +-
 7 files changed, 131 insertions(+), 5 deletions(-)

-- 
2.32.0

