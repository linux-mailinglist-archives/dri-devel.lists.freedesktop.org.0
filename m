Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BBC44FD88
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 04:39:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D955089CF4;
	Mon, 15 Nov 2021 03:39:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2677089CF4
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 03:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=O37cFzy5U/nU5t/08MSG/K3BV1sQd+MXjUVeTg8sBqw=; b=UWTPuuY9QvSlhcSBb5X0H/tOE/
 VG78r9qCTN+FVq7bUEsBXWBT2X5nr0pXhtuc92jp9/FZF2ZFkGTJPQIvW/0JxwNgZyLb5fYFYY8TS
 C55ZDYPeTsHbso8BJ2ciPhkYH2c0UK3g0j/ogU/FeUNwTDC2Zwm+mDJTrrIWkTuMmm7LwETbnHf0K
 E2PLSmxYytjvXJBgEaWL7m5D1nINcXUyjABi9Am9c10lOWN+W0A4zDMCcETwU8UoW3D4Re7BXk8Nt
 rwHIcoW2/fesT0u1Z6yOXD6stT+BRgRsbqwEwNg2SFiC7vMbWXb7W/I339n5wsBVAuN/52QeRtPpn
 QpYYYpxA==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmSq6-00EJcD-Pt; Mon, 15 Nov 2021 03:39:26 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] backlight: ili922x: fix kernel-doc warnings & notation
Date: Sun, 14 Nov 2021 19:39:25 -0800
Message-Id: <20211115033925.22024-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.31.1
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 kernel test robot <lkp@intel.com>, Jingoo Han <jingoohan1@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org,
 Anatolij Gustschin <agust@denx.de>, Lee Jones <lee.jones@linaro.org>,
 Stefano Babic <sbabic@denx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert function-like macro comments to kernel-doc notation and
fix other kernel-doc warnings:

drivers/video/backlight/ili922x.c:85: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * START_BYTE(id, rs, rw)
drivers/video/backlight/ili922x.c:118: warning: expecting prototype for CHECK_FREQ_REG(spi_device s, spi_transfer x)(). Prototype was for CHECK_FREQ_REG() instead

ili922x.c:92: warning: contents before sections
ili922x.c:150: warning: No description found for return value of 'ili922x_read_status'
ili922x.c:193: warning: No description found for return value of 'ili922x_read'
ili922x.c:247: warning: No description found for return value of 'ili922x_write'
ili922x.c:353: warning: No description found for return value of 'ili922x_poweron'
ili922x.c:382: warning: No description found for return value of 'ili922x_poweroff'

Fixes: 4cfbfa971478 ("video: backlight: add ili922x lcd driver")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: Stefano Babic <sbabic@denx.de>
Cc: Anatolij Gustschin <agust@denx.de>
---
 drivers/video/backlight/ili922x.c |   29 ++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

--- linux-next-20211102.orig/drivers/video/backlight/ili922x.c
+++ linux-next-20211102/drivers/video/backlight/ili922x.c
@@ -82,13 +82,7 @@
 #define START_RW_READ		1
 
 /**
- * START_BYTE(id, rs, rw)
- *
- * Set the start byte according to the required operation.
- * The start byte is defined as:
- *   ----------------------------------
- *  | 0 | 1 | 1 | 1 | 0 | ID | RS | RW |
- *   ----------------------------------
+ * START_BYTE() - Set the start byte according to the required operation
  * @id: display's id as set by the manufacturer
  * @rs: operation type bit, one of:
  *	  - START_RS_INDEX	set the index register
@@ -96,14 +90,19 @@
  * @rw: read/write operation
  *	 - START_RW_WRITE	write
  *	 - START_RW_READ	read
+ *
+ * The start byte is defined as:
+ *   ----------------------------------
+ *  | 0 | 1 | 1 | 1 | 0 | ID | RS | RW |
+ *   ----------------------------------
  */
 #define START_BYTE(id, rs, rw)	\
 	(0x70 | (((id) & 0x01) << 2) | (((rs) & 0x01) << 1) | ((rw) & 0x01))
 
 /**
- * CHECK_FREQ_REG(spi_device s, spi_transfer x) - Check the frequency
- *	for the SPI transfer. According to the datasheet, the controller
- *	accept higher frequency for the GRAM transfer, but it requires
+ * CHECK_FREQ_REG() - Check the frequency for the SPI transfer
+ *	According to the datasheet, the controller
+ *	accepts higher frequency for the GRAM transfer, but it requires
  *	lower frequency when the registers are read/written.
  *	The macro sets the frequency in the spi_transfer structure if
  *	the frequency exceeds the maximum value.
@@ -145,6 +144,8 @@ struct ili922x {
  * ili922x_read_status - read status register from display
  * @spi: spi device
  * @rs:  output value
+ *
+ * Return: %0 on success or a negative error code on failure
  */
 static int ili922x_read_status(struct spi_device *spi, u16 *rs)
 {
@@ -188,6 +189,8 @@ static int ili922x_read_status(struct sp
  * @spi: spi device
  * @reg: offset of the register to be read
  * @rx:  output value
+ *
+ * Return: %0 on success or a negative error code on failure
  */
 static int ili922x_read(struct spi_device *spi, u8 reg, u16 *rx)
 {
@@ -242,6 +245,8 @@ static int ili922x_read(struct spi_devic
  * @spi: struct spi_device *
  * @reg: offset of the register to be written
  * @value: value to be written
+ *
+ * Return: %0 on success or a negative error code on failure
  */
 static int ili922x_write(struct spi_device *spi, u8 reg, u16 value)
 {
@@ -348,6 +353,8 @@ static void set_write_to_gram_reg(struct
  * The sequence to turn on the display is taken from
  * the datasheet and/or the example code provided by the
  * manufacturer.
+ *
+ * Return: %0 on success or a negative value on failure
  */
 static int ili922x_poweron(struct spi_device *spi)
 {
@@ -377,6 +384,8 @@ static int ili922x_poweron(struct spi_de
 /**
  * ili922x_poweroff - turn the display off
  * @spi: spi device
+ *
+ * Return: %0 on success or a negative value on failure
  */
 static int ili922x_poweroff(struct spi_device *spi)
 {
