Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D131680622E
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 23:56:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C1C10E550;
	Tue,  5 Dec 2023 22:56:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30F8810E550
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 22:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=MdnCEOu4uestWpLQY50JohpBreItAAs8W53VxcosDAU=; b=ymfUUOVOkplMqLDWizo3PRMhzT
 R9qmoWAu0gaQAm+eDR80jbVU2HAW4AM0Z+gTuKm+EZ+IwEseBOgPwJXR3wupm6KwmosWjuK8GEKBK
 fb/hEH68kxHJZseFJB3aDKXnVaJoXIJXnTe0rOBC5VfUD4mSs1URhm7y/XdykSvUDlGIuho7EhtSa
 TbMcL64jMz0RN+h7GlJUNXH/assVxEM/HnTCpE/8CXCDt2qkVVgeYKMe2fnwySd0bEdnTIbZDxLsh
 ai51ofOYvEytzc8BZoUC+bfN1fi+XTbtQ4w0iLZtMwVdrWrdvY1I0I4YtVggqaOSeBSwPc3DE6Dnc
 ijYg64tg==;
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rAeLG-008YxJ-38; Tue, 05 Dec 2023 22:56:39 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] backlight: ili922x: fix W=1 kernel-doc warnings
Date: Tue,  5 Dec 2023 14:56:38 -0800
Message-ID: <20231205225638.32563-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.43.0
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Lee Jones <lee@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Randy Dunlap <rdunlap@infradead.org>, linux-fbdev@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix kernel-doc warnings found when using "W=1".

ili922x.c:85: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
ili922x.c:85: warning: missing initial short description on line:
 * START_BYTE(id, rs, rw)
ili922x.c:91: warning: contents before sections
ili922x.c:118: warning: expecting prototype for CHECK_FREQ_REG(spi_device s, spi_transfer x)(). Prototype was for CHECK_FREQ_REG() instead

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Lee Jones <lee@kernel.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org
---
 drivers/video/backlight/ili922x.c |    9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff -- a/drivers/video/backlight/ili922x.c b/drivers/video/backlight/ili922x.c
--- a/drivers/video/backlight/ili922x.c
+++ b/drivers/video/backlight/ili922x.c
@@ -82,13 +82,12 @@
 #define START_RW_READ		1
 
 /**
- * START_BYTE(id, rs, rw)
- *
- * Set the start byte according to the required operation.
+ * START_BYTE() - Set the start byte according to the required operation.
  * The start byte is defined as:
  *   ----------------------------------
  *  | 0 | 1 | 1 | 1 | 0 | ID | RS | RW |
  *   ----------------------------------
+ *
  * @id: display's id as set by the manufacturer
  * @rs: operation type bit, one of:
  *	  - START_RS_INDEX	set the index register
@@ -101,14 +100,14 @@
 	(0x70 | (((id) & 0x01) << 2) | (((rs) & 0x01) << 1) | ((rw) & 0x01))
 
 /**
- * CHECK_FREQ_REG(spi_device s, spi_transfer x) - Check the frequency
+ * CHECK_FREQ_REG() - Check the frequency
  *	for the SPI transfer. According to the datasheet, the controller
  *	accept higher frequency for the GRAM transfer, but it requires
  *	lower frequency when the registers are read/written.
  *	The macro sets the frequency in the spi_transfer structure if
  *	the frequency exceeds the maximum value.
  * @s: pointer to an SPI device
- * @x: pointer to the read/write buffer pair
+ * @x: pointer to the &spi_transfer read/write buffer pair
  */
 #define CHECK_FREQ_REG(s, x)	\
 	do {			\
