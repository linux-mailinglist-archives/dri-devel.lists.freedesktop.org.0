Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C788BB264
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 20:15:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 791CF1131B9;
	Fri,  3 May 2024 18:15:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="apvpODMR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6F4BD1131B3;
 Fri,  3 May 2024 18:15:31 +0000 (UTC)
Received: from rrs24-12-35.corp.microsoft.com (unknown [131.107.8.16])
 by linux.microsoft.com (Postfix) with ESMTPSA id 31868206B4F5;
 Fri,  3 May 2024 11:15:31 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 31868206B4F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1714760131;
 bh=Z9GjE1IijVrPbMsv9ksk7WfrB4MS5cJoIqAyVn8tuMQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=apvpODMRq9q6gy8ALQJTxZQ2wF8LZAPibdtjl3zYp6s653A05Np4a/AU9ja8U50Dm
 +C3U5NH2KekBTGKYOYh9vhczuvlfJGQe9Plv4FsE/2Ho4qZ/YykdNm2F49nFqTbLSU
 kC4Z+Y8eQnMUWEYHIB4G0rljbCzvhPcsBO/hgin8=
From: Easwar Hariharan <eahariha@linux.microsoft.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mariusz Bialonczyk <manio@skyboo.net>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
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
Subject: [PATCH v2 09/12] media: cx23885: Make I2C terminology more inclusive
Date: Fri,  3 May 2024 18:13:30 +0000
Message-Id: <20240503181333.2336999-10-eahariha@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240503181333.2336999-1-eahariha@linux.microsoft.com>
References: <20240503181333.2336999-1-eahariha@linux.microsoft.com>
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

I2C v7, SMBus 3.2, and I3C 1.1.1 specifications have replaced "master/slave"
with more appropriate terms. Inspired by and following on to Wolfram's
series to fix drivers/i2c/[1], fix the terminology for users of
I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
in the specification.

Compile tested, no functionality changes intended

[1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/

Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
---
 drivers/media/pci/cx23885/cx23885-core.c | 6 +++---
 drivers/media/pci/cx23885/cx23885-f300.c | 8 ++++----
 drivers/media/pci/cx23885/cx23885-i2c.c  | 6 +++---
 drivers/media/pci/cx23885/cx23885.h      | 2 +-
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/media/pci/cx23885/cx23885-core.c b/drivers/media/pci/cx23885/cx23885-core.c
index c8705d786cdd..0adbdf529cec 100644
--- a/drivers/media/pci/cx23885/cx23885-core.c
+++ b/drivers/media/pci/cx23885/cx23885-core.c
@@ -942,7 +942,7 @@ static int cx23885_dev_setup(struct cx23885_dev *dev)
 	dev->pci_slot = PCI_SLOT(dev->pci->devfn);
 	cx23885_irq_add(dev, 0x001f00);
 
-	/* External Master 1 Bus */
+	/* External Controller 1 Bus */
 	dev->i2c_bus[0].nr = 0;
 	dev->i2c_bus[0].dev = dev;
 	dev->i2c_bus[0].reg_stat  = I2C1_STAT;
@@ -952,7 +952,7 @@ static int cx23885_dev_setup(struct cx23885_dev *dev)
 	dev->i2c_bus[0].reg_wdata = I2C1_WDATA;
 	dev->i2c_bus[0].i2c_period = (0x9d << 24); /* 100kHz */
 
-	/* External Master 2 Bus */
+	/* External Controller 2 Bus */
 	dev->i2c_bus[1].nr = 1;
 	dev->i2c_bus[1].dev = dev;
 	dev->i2c_bus[1].reg_stat  = I2C2_STAT;
@@ -962,7 +962,7 @@ static int cx23885_dev_setup(struct cx23885_dev *dev)
 	dev->i2c_bus[1].reg_wdata = I2C2_WDATA;
 	dev->i2c_bus[1].i2c_period = (0x9d << 24); /* 100kHz */
 
-	/* Internal Master 3 Bus */
+	/* Internal Controller 3 Bus */
 	dev->i2c_bus[2].nr = 2;
 	dev->i2c_bus[2].dev = dev;
 	dev->i2c_bus[2].reg_stat  = I2C3_STAT;
diff --git a/drivers/media/pci/cx23885/cx23885-f300.c b/drivers/media/pci/cx23885/cx23885-f300.c
index ac1c434e8e24..2ef7454e0f61 100644
--- a/drivers/media/pci/cx23885/cx23885-f300.c
+++ b/drivers/media/pci/cx23885/cx23885-f300.c
@@ -92,7 +92,7 @@ static u8 f300_xfer(struct dvb_frontend *fe, u8 *buf)
 	f300_set_line(dev, F300_RESET, 0);/* begin to send data */
 	msleep(1);
 
-	f300_send_byte(dev, 0xe0);/* the slave address is 0xe0, write */
+	f300_send_byte(dev, 0xe0);/* the target address is 0xe0, write */
 	msleep(1);
 
 	temp = buf[0];
@@ -112,10 +112,10 @@ static u8 f300_xfer(struct dvb_frontend *fe, u8 *buf)
 	}
 
 	if (i > 7) {
-		pr_err("%s: timeout, the slave no response\n",
+		pr_err("%s: timeout, the target no response\n",
 								__func__);
-		ret = 1; /* timeout, the slave no response */
-	} else { /* the slave not busy, prepare for getting data */
+		ret = 1; /* timeout, the target no response */
+	} else { /* the target not busy, prepare for getting data */
 		f300_set_line(dev, F300_RESET, 0);/*ready...*/
 		msleep(1);
 		f300_send_byte(dev, 0xe1);/* 0xe1 is Read */
diff --git a/drivers/media/pci/cx23885/cx23885-i2c.c b/drivers/media/pci/cx23885/cx23885-i2c.c
index f51fad33dc04..ddafeccb2b0a 100644
--- a/drivers/media/pci/cx23885/cx23885-i2c.c
+++ b/drivers/media/pci/cx23885/cx23885-i2c.c
@@ -34,7 +34,7 @@ MODULE_PARM_DESC(i2c_scan, "scan i2c bus at insmod time");
 #define I2C_EXTEND  (1 << 3)
 #define I2C_NOSTOP  (1 << 4)
 
-static inline int i2c_slave_did_ack(struct i2c_adapter *i2c_adap)
+static inline int i2c_target_did_ack(struct i2c_adapter *i2c_adap)
 {
 	struct cx23885_i2c *bus = i2c_adap->algo_data;
 	struct cx23885_dev *dev = bus->dev;
@@ -84,7 +84,7 @@ static int i2c_sendbytes(struct i2c_adapter *i2c_adap,
 		cx_write(bus->reg_ctrl, bus->i2c_period | (1 << 2));
 		if (!i2c_wait_done(i2c_adap))
 			return -EIO;
-		if (!i2c_slave_did_ack(i2c_adap))
+		if (!i2c_target_did_ack(i2c_adap))
 			return -ENXIO;
 
 		dprintk(1, "%s() returns 0\n", __func__);
@@ -163,7 +163,7 @@ static int i2c_readbytes(struct i2c_adapter *i2c_adap,
 		cx_write(bus->reg_ctrl, bus->i2c_period | (1 << 2) | 1);
 		if (!i2c_wait_done(i2c_adap))
 			return -EIO;
-		if (!i2c_slave_did_ack(i2c_adap))
+		if (!i2c_target_did_ack(i2c_adap))
 			return -ENXIO;
 
 
diff --git a/drivers/media/pci/cx23885/cx23885.h b/drivers/media/pci/cx23885/cx23885.h
index 349462ee2c48..c2d7a95933d5 100644
--- a/drivers/media/pci/cx23885/cx23885.h
+++ b/drivers/media/pci/cx23885/cx23885.h
@@ -368,7 +368,7 @@ struct cx23885_dev {
 	 * AV core so we see nice clean and stable video and audio. */
 	u32                        clk_freq;
 
-	/* I2C adapters: Master 1 & 2 (External) & Master 3 (Internal only) */
+	/* I2C adapters: Controller 1 & 2 (External) & Controller 3 (Internal only) */
 	struct cx23885_i2c         i2c_bus[3];
 
 	int                        nr;
-- 
2.34.1

