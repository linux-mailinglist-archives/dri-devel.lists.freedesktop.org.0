Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACD341CC6A
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 21:12:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8E146E209;
	Wed, 29 Sep 2021 19:12:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asav22.altibox.net (asav22.altibox.net [109.247.116.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E33126E200
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 19:12:15 +0000 (UTC)
Received: from localhost.localdomain (211.81-166-168.customer.lyse.net
 [81.166.168.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: noralf.tronnes@ebnett.no)
 by asav22.altibox.net (Postfix) with ESMTPSA id 55B0220866;
 Wed, 29 Sep 2021 21:12:13 +0200 (CEST)
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: dri-devel@lists.freedesktop.org
Cc: peter@stuge.se,
	=?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: [PATCH v3 0/6] drm/gud: Add some more pixel formats
Date: Wed, 29 Sep 2021 21:11:55 +0200
Message-Id: <20210929191201.34456-1-noralf@tronnes.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=NPX7BXyg c=1 sm=1 tr=0
 a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
 a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=cSiGOJZ3cUtkHXy_8BgA:9
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

I'd appreciate if someone could review the 3 small driver patches.

Changes since version 2:
- Drop the patch adding module parameter 'xrgb8888'. Both Daniel and
Thomas had some comments that eventually led me to to drop this for now.

Noralf.


Noralf Trønnes (6):
  drm/fourcc: Add R8 to drm_format_info
  drm/format-helper: Add drm_fb_xrgb8888_to_rgb332()
  drm/format-helper: Add drm_fb_xrgb8888_to_rgb888()
  drm/gud: Add GUD_PIXEL_FORMAT_R8
  drm/gud: Add GUD_PIXEL_FORMAT_RGB332
  drm/gud: Add GUD_PIXEL_FORMAT_RGB888

 drivers/gpu/drm/drm_format_helper.c | 88 +++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_fourcc.c        |  1 +
 drivers/gpu/drm/gud/gud_drv.c       |  6 ++
 drivers/gpu/drm/gud/gud_internal.h  | 12 ++++
 drivers/gpu/drm/gud/gud_pipe.c      |  6 ++
 include/drm/drm_format_helper.h     |  4 ++
 include/drm/gud.h                   |  6 +-
 7 files changed, 121 insertions(+), 2 deletions(-)

-- 
2.32.0

