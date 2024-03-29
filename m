Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7B3892220
	for <lists+dri-devel@lfdr.de>; Fri, 29 Mar 2024 18:02:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D04110E50E;
	Fri, 29 Mar 2024 17:02:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="b+Tl2nhY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9EBA710E88E;
 Fri, 29 Mar 2024 17:02:20 +0000 (UTC)
Received: from rrs24-12-35.corp.microsoft.com (unknown [131.107.147.137])
 by linux.microsoft.com (Postfix) with ESMTPSA id EE6F520E6F4C;
 Fri, 29 Mar 2024 10:02:19 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com EE6F520E6F4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1711731740;
 bh=t49SSijH5qcn8ATNHvvOtx0aTbYoWILOcpPZfTIIf5A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=b+Tl2nhYCHS6FtKRbxbOukN4V4yufNBRXQxXpxjRy4FT1iMF4FHj0kmCEY9/iOGP9
 810vjByH634Jjyhi4F8eZTuQ50mz0N6b170peelO1xcWydhYP8ZJSDBDr3oRMLSwXY
 TfEm2CpowjnlO3jIW88+wusfcxhSkotAZmFp6RhQ=
From: Easwar Hariharan <eahariha@linux.microsoft.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Easwar Hariharan <eahariha@linux.microsoft.com>,
 linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)), 
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
 linux-fbdev@vger.kernel.org (open list:FRAMEBUFFER LAYER)
Subject: [PATCH v0 07/14] media: cx25821: Make I2C terminology more inclusive
Date: Fri, 29 Mar 2024 17:00:31 +0000
Message-Id: <20240329170038.3863998-8-eahariha@linux.microsoft.com>
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
 drivers/media/pci/cx25821/cx25821-i2c.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/cx25821/cx25821-i2c.c b/drivers/media/pci/cx25821/cx25821-i2c.c
index 0ef4cd6528a0..bad8fb9f5319 100644
--- a/drivers/media/pci/cx25821/cx25821-i2c.c
+++ b/drivers/media/pci/cx25821/cx25821-i2c.c
@@ -33,7 +33,7 @@ do {									\
 #define I2C_EXTEND  (1 << 3)
 #define I2C_NOSTOP  (1 << 4)
 
-static inline int i2c_slave_did_ack(struct i2c_adapter *i2c_adap)
+static inline int i2c_client_did_ack(struct i2c_adapter *i2c_adap)
 {
 	struct cx25821_i2c *bus = i2c_adap->algo_data;
 	struct cx25821_dev *dev = bus->dev;
@@ -85,7 +85,7 @@ static int i2c_sendbytes(struct i2c_adapter *i2c_adap,
 		if (!i2c_wait_done(i2c_adap))
 			return -EIO;
 
-		if (!i2c_slave_did_ack(i2c_adap))
+		if (!i2c_client_did_ack(i2c_adap))
 			return -EIO;
 
 		dprintk(1, "%s(): returns 0\n", __func__);
@@ -174,7 +174,7 @@ static int i2c_readbytes(struct i2c_adapter *i2c_adap,
 		cx_write(bus->reg_ctrl, bus->i2c_period | (1 << 2) | 1);
 		if (!i2c_wait_done(i2c_adap))
 			return -EIO;
-		if (!i2c_slave_did_ack(i2c_adap))
+		if (!i2c_client_did_ack(i2c_adap))
 			return -EIO;
 
 		dprintk(1, "%s(): returns 0\n", __func__);
-- 
2.34.1

