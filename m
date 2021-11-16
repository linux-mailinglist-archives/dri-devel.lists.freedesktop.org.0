Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8B94527C7
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 03:34:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 951F86E1B7;
	Tue, 16 Nov 2021 02:34:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFFD96E1BB
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 02:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=hHCwnZsfgnQlvOFigVHk17lgCiiAoL4uov9tgSnKeD4=; b=qZrTWqx68GQuafrNVAG/iEghMb
 ACRW9xHziBefhuDm9fTQB72+tWcNcHf3W2Eqn7GNNBEDGXeumhf6Vrr2OpVo/bcNQ4aA7676yWHuX
 2c5cEPbaASpJFHWbZo5/ZhF/kL4ybOQrfDGW3Si2JpsXQJuITn85F+6RGkgwdRoRaU7bFRwgN75+S
 p04alv5WhC5amOGDIw0YEJecubTe+ANEutHB2jLkxRxRre5cYXQzYzwMAOFv7SbDZpstM2xiBxNl9
 rjYgUgura/xHyYI6cS6z8L/dHxj7WIsktdGe+rkUrV2sYLn3zjWNgpjIbZk69oEG5Hg7E7Z9AlNPZ
 E/c9cgKg==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmoIG-0004aH-NK; Tue, 16 Nov 2021 02:33:56 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] backlight: ili922x: fix kernel-doc warnings & notation
Date: Mon, 15 Nov 2021 18:33:55 -0800
Message-Id: <20211116023355.1775-1-rdunlap@infradead.org>
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
v2: add periods at end of sentences so that the generated documentation
    flows correctly. (thanks, Daniel)

 drivers/video/backlight/ili922x.c |   29 ++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

--- linux-next-20211115.orig/drivers/video/backlight/ili922x.c
+++ linux-next-20211115/drivers/video/backlight/ili922x.c
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
+ * START_BYTE() - Set the start byte according to the required operation.
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
+ * CHECK_FREQ_REG() - Check the frequency for the SPI transfer.
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
