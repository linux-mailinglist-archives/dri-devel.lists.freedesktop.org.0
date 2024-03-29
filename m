Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3685389222C
	for <lists+dri-devel@lfdr.de>; Fri, 29 Mar 2024 18:03:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B7D61127DC;
	Fri, 29 Mar 2024 17:03:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="XF4fNR3O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9F80D10F71B;
 Fri, 29 Mar 2024 17:02:20 +0000 (UTC)
Received: from rrs24-12-35.corp.microsoft.com (unknown [131.107.147.137])
 by linux.microsoft.com (Postfix) with ESMTPSA id B6D7220E6F3E;
 Fri, 29 Mar 2024 10:02:20 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B6D7220E6F3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1711731740;
 bh=nQsV4GOg2x3niy+ZAQMhUw9K0ZB96KvatJri7O7xATQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XF4fNR3Ozy3mJsPY6T+9mlhLoJGSBoyJzvpjeQ2h6xbGkQL+owP3a3WaVvSKmZMto
 kWUMIVxdwzXCaE2PU+EyG8eqT9bgmORlECAK0QExbKxFMfx2G9UJqlggPExNc+O+cl
 GgezOH/3fh17M0r4v8dvzTmwXBNEE1cC0TUhNBmo=
From: Easwar Hariharan <eahariha@linux.microsoft.com>
To: Andy Walls <awalls@md.metrocast.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-media@vger.kernel.org (open list:IVTV VIDEO4LINUX DRIVER),
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
Subject: [PATCH v0 08/14] media: ivtv: Make I2C terminology more inclusive
Date: Fri, 29 Mar 2024 17:00:32 +0000
Message-Id: <20240329170038.3863998-9-eahariha@linux.microsoft.com>
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
 drivers/media/pci/ivtv/ivtv-i2c.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/pci/ivtv/ivtv-i2c.c b/drivers/media/pci/ivtv/ivtv-i2c.c
index c052c57c6dce..967e6a025020 100644
--- a/drivers/media/pci/ivtv/ivtv-i2c.c
+++ b/drivers/media/pci/ivtv/ivtv-i2c.c
@@ -33,14 +33,14 @@
     Some more general comments about what we are doing:
 
     The i2c bus is a 2 wire serial bus, with clock (SCL) and data (SDA)
-    lines.  To communicate on the bus (as a master, we don't act as a slave),
+    lines.  To communicate on the bus (as a host, we don't act as a client),
     we first initiate a start condition (ivtv_start).  We then write the
     address of the device that we want to communicate with, along with a flag
-    that indicates whether this is a read or a write.  The slave then issues
+    that indicates whether this is a read or a write.  The client then issues
     an ACK signal (ivtv_ack), which tells us that it is ready for reading /
     writing.  We then proceed with reading or writing (ivtv_read/ivtv_write),
     and finally issue a stop condition (ivtv_stop) to make the bus available
-    to other masters.
+    to other hosts.
 
     There is an additional form of transaction where a write may be
     immediately followed by a read.  In this case, there is no intervening
@@ -379,7 +379,7 @@ static int ivtv_waitsda(struct ivtv *itv, int val)
 	return 0;
 }
 
-/* Wait for the slave to issue an ACK */
+/* Wait for the client to issue an ACK */
 static int ivtv_ack(struct ivtv *itv)
 {
 	int ret = 0;
@@ -407,7 +407,7 @@ static int ivtv_ack(struct ivtv *itv)
 	return ret;
 }
 
-/* Write a single byte to the i2c bus and wait for the slave to ACK */
+/* Write a single byte to the i2c bus and wait for the client to ACK */
 static int ivtv_sendbyte(struct ivtv *itv, unsigned char byte)
 {
 	int i, bit;
@@ -471,7 +471,7 @@ static int ivtv_readbyte(struct ivtv *itv, unsigned char *byte, int nack)
 	return 0;
 }
 
-/* Issue a start condition on the i2c bus to alert slaves to prepare for
+/* Issue a start condition on the i2c bus to alert clients to prepare for
    an address write */
 static int ivtv_start(struct ivtv *itv)
 {
@@ -534,7 +534,7 @@ static int ivtv_stop(struct ivtv *itv)
 	return 0;
 }
 
-/* Write a message to the given i2c slave.  do_stop may be 0 to prevent
+/* Write a message to the given i2c client.  do_stop may be 0 to prevent
    issuing the i2c stop condition (when following with a read) */
 static int ivtv_write(struct ivtv *itv, unsigned char addr, unsigned char *data, u32 len, int do_stop)
 {
@@ -558,7 +558,7 @@ static int ivtv_write(struct ivtv *itv, unsigned char addr, unsigned char *data,
 	return ret;
 }
 
-/* Read data from the given i2c slave.  A stop condition is always issued. */
+/* Read data from the given i2c client.  A stop condition is always issued. */
 static int ivtv_read(struct ivtv *itv, unsigned char addr, unsigned char *data, u32 len)
 {
 	int retry, ret = -EREMOTEIO;
-- 
2.34.1

