Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9DB89221D
	for <lists+dri-devel@lfdr.de>; Fri, 29 Mar 2024 18:02:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E5C310E2B3;
	Fri, 29 Mar 2024 17:02:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="V9EU/QtD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8F32310F71B;
 Fri, 29 Mar 2024 17:02:16 +0000 (UTC)
Received: from rrs24-12-35.corp.microsoft.com (unknown [131.107.147.137])
 by linux.microsoft.com (Postfix) with ESMTPSA id 139CD20E6F4C;
 Fri, 29 Mar 2024 10:02:16 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 139CD20E6F4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1711731736;
 bh=10QUIiHAlv9I6vQcGTCyRQwtIGq1JOGHzw/GbEWkjZ8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=V9EU/QtD7YjVWs7Rf1Y6NCTvJ90Erzdt3jGzDOOOJxaMRNV6JDsb7FyeIUH+qxPRB
 ae/egRfHYWa45J1dFxqs39V87C2GGQmXtnkcs6DAPy4TkNM0nzv2DR5NN2FqEfSrr7
 fM4ULK4Qq6R9xLTgWgp8saHdjd260GfyiGqcmbT4=
From: Easwar Hariharan <eahariha@linux.microsoft.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-media@vger.kernel.org (open list:COBALT MEDIA DRIVER),
 linux-kernel@vger.kernel.org (open list)
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list),
 intel-gfx@lists.freedesktop.org (open list:INTEL DRM DISPLAY FOR XE AND I915
 DRIVERS), 
 intel-xe@lists.freedesktop.org (open list:INTEL DRM DISPLAY FOR XE AND I915
 DRIVERS), 
 nouveau@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO
 GPUS), linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM HOST DRIVERS),
 linux-media@vger.kernel.org (open list:BTTV VIDEO4LINUX DRIVER),
 linux-fbdev@vger.kernel.org (open list:FRAMEBUFFER LAYER),
 Easwar Hariharan <eahariha@linux.microsoft.com>
Subject: [PATCH v0 05/14] media: cobalt: Make I2C terminology more inclusive
Date: Fri, 29 Mar 2024 17:00:29 +0000
Message-Id: <20240329170038.3863998-6-eahariha@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240329170038.3863998-1-eahariha@linux.microsoft.com>
References: <20240329170038.3863998-1-eahariha@linux.microsoft.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I2C v7, SMBus 3.2, and I3C specifications have replaced "master/slave"
with more appropriate terms. Inspired by and following on to Wolfram's
series to fix drivers/i2c/[1], fix the terminology for users of
I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
in the specification.

Compile tested, no functionality changes intended

[1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/

Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
---
 drivers/media/pci/cobalt/cobalt-i2c.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/cobalt/cobalt-i2c.c b/drivers/media/pci/cobalt/cobalt-i2c.c
index 10c9ee33f73e..d2963370f949 100644
--- a/drivers/media/pci/cobalt/cobalt-i2c.c
+++ b/drivers/media/pci/cobalt/cobalt-i2c.c
@@ -45,10 +45,10 @@ struct cobalt_i2c_regs {
 /* I2C stop condition */
 #define M00018_CR_BITMAP_STO_MSK	(1 << 6)
 
-/* I2C read from slave */
+/* I2C read from client */
 #define M00018_CR_BITMAP_RD_MSK		(1 << 5)
 
-/* I2C write to slave */
+/* I2C write to client */
 #define M00018_CR_BITMAP_WR_MSK		(1 << 4)
 
 /* I2C ack */
@@ -59,7 +59,7 @@ struct cobalt_i2c_regs {
 
 /* SR[7:0] - Status register */
 
-/* Receive acknowledge from slave */
+/* Receive acknowledge from client */
 #define M00018_SR_BITMAP_RXACK_MSK	(1 << 7)
 
 /* Busy, I2C bus busy (as defined by start / stop bits) */
-- 
2.34.1

