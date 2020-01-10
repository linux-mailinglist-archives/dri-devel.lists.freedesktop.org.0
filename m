Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EA713866A
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jan 2020 13:37:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC0F36E530;
	Sun, 12 Jan 2020 12:36:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from olimex.com (olimex.com [IPv6:2001:470:0:1f2::b869:4820])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A22789FDD
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2020 14:12:07 +0000 (UTC)
Received: from localhost.localdomain ([94.155.250.134])
 by olimex.com with ESMTPSA
 (ECDHE-RSA-AES128-GCM-SHA256:TLSv1.2:Kx=ECDH:Au=RSA:Enc=AESGCM(128):Mac=AEAD)
 (SMTP-AUTH username stefan@olimex.com, mechanism PLAIN)
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2020 06:11:56 -0800
From: Stefan Mavrodiev <stefan@olimex.com>
To: Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list),
 dmaengine@vger.kernel.org (open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM),
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi SoC
 support), 
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR ALLWINNER A10)
Subject: [PATCH 0/2] Add support for sun4i HDMI audio
Date: Fri, 10 Jan 2020 16:11:38 +0200
Message-Id: <20200110141140.28527-1-stefan@olimex.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Sun, 12 Jan 2020 12:36:09 +0000
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
Cc: linux-sunxi@googlegroups.com, Stefan Mavrodiev <stefan@olimex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series add support for HDMI audio for sun4i HDMI encored.
The code uses some parts from the Allwinners's BSP kernel.

Currently cyclic DMA transfers are disabled. The first patch permits them
as they are required for the audio.

The patch is tested on A20 chip. For the other chips, only the addresses
of the registers are checked.

Stefan Mavrodiev (2):
  dmaengine: sun4i: Add support for cyclic requests with dedicated DMA
  drm: sun4i: hdmi: Add support for sun4i HDMI encoder audio

 drivers/dma/sun4i-dma.c                  |  45 +--
 drivers/gpu/drm/sun4i/Kconfig            |   1 +
 drivers/gpu/drm/sun4i/Makefile           |   1 +
 drivers/gpu/drm/sun4i/sun4i_hdmi.h       |  30 ++
 drivers/gpu/drm/sun4i/sun4i_hdmi_audio.c | 375 +++++++++++++++++++++++
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c   |   4 +
 6 files changed, 435 insertions(+), 21 deletions(-)
 create mode 100644 drivers/gpu/drm/sun4i/sun4i_hdmi_audio.c

-- 
2.17.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
