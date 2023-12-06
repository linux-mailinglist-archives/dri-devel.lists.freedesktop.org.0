Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 550A08076D6
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 18:45:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 578F710E11F;
	Wed,  6 Dec 2023 17:45:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CC3D10E11F
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 17:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=0vhy2fDmTy3/G2Hs+lHPkVuPzYxaie1T8xyfpSAP62w=; b=dwzm/gLJuHGYRGXaoWvDbKogMT
 kpOcumJb6nHE7vwshKXbsBHAWSf31QvzfB8dzxI0I5xHkTuR1S9w7Hy81EyaObTCF6QHbBQXKuWno
 CrA1zUTbCMekMcbV8VsfqU/r1JE4rneYPjB6tN9tSKm09oq1PUYodJj8ZZzHcf/Ahrajs2Ka/lgq+
 5zSXFupRsOj6lx2bAZUcHTtaeNxPCnnmhjeOVzSEopqWc4NZHJuqeMFOoCUx1H7rD0BFNXHv2HsRp
 6MOrU23s3TrsjbpYRBH0L4bcAgZNMTUEM0Ha5/ByBZ/hq1AebAImMm2Kd9mgYsIBIgiiZYTFhTVLk
 E3smi+6g==;
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rAvxe-00AxPT-0w; Wed, 06 Dec 2023 17:45:26 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] backlight: ili922x: drop kernel-doc for local macros
Date: Wed,  6 Dec 2023 09:45:25 -0800
Message-ID: <20231206174525.14960-1-rdunlap@infradead.org>
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

Don't use kernel-doc notation for the local macros START_BYTE() and
CHECK_FREQ_REG(). This prevents these kernel-doc warnings:

ili922x.c:85: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 * START_BYTE(id, rs, rw)
ili922x.c:85: warning: missing initial short description on line:
 * START_BYTE(id, rs, rw)
ili922x.c:118: warning: expecting prototype for CHECK_FREQ_REG(spi_device s, spi_transfer x)(). Prototype was for CHECK_FREQ_REG() instead

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Lee Jones <lee@kernel.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org
---
v2: just drop the kernel-docness completely for these macros (Lee)

 drivers/video/backlight/ili922x.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -- a/drivers/video/backlight/ili922x.c b/drivers/video/backlight/ili922x.c
--- a/drivers/video/backlight/ili922x.c
+++ b/drivers/video/backlight/ili922x.c
@@ -81,7 +81,7 @@
 #define START_RW_WRITE		0
 #define START_RW_READ		1
 
-/**
+/*
  * START_BYTE(id, rs, rw)
  *
  * Set the start byte according to the required operation.
@@ -100,7 +100,7 @@
 #define START_BYTE(id, rs, rw)	\
 	(0x70 | (((id) & 0x01) << 2) | (((rs) & 0x01) << 1) | ((rw) & 0x01))
 
-/**
+/*
  * CHECK_FREQ_REG(spi_device s, spi_transfer x) - Check the frequency
  *	for the SPI transfer. According to the datasheet, the controller
  *	accept higher frequency for the GRAM transfer, but it requires
