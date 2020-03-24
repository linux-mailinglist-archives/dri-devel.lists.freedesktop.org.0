Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3C0190E2D
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 13:54:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3C236E27F;
	Tue, 24 Mar 2020 12:54:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA2F76E27F
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 12:54:45 +0000 (UTC)
Received: from ramsan ([84.195.182.253]) by andre.telenet-ops.be with bizsmtp
 id JCuj2200C5USYZQ01CujFj; Tue, 24 Mar 2020 13:54:43 +0100
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1jGj4t-0005G9-4B; Tue, 24 Mar 2020 13:54:43 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1jGj4t-0005jJ-2M; Tue, 24 Mar 2020 13:54:43 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH] dma-buf: Improve CONFIG_DMABUF_MOVE_NOTIFY help text
Date: Tue, 24 Mar 2020 13:54:42 +0100
Message-Id: <20200324125442.21983-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Improve the help text for the CONFIG_DMABUF_MOVE_NOTIFY symbol by:
  1. Removing duplicated single quotes,
  2. Adding a missing subject,
  3. Fixing a misspelling of "yet",
  4. Wrapping long lines.

Fixes: bb42df4662a44765 ("dma-buf: add dynamic DMA-buf handling v15")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/dma-buf/Kconfig | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
index ef73b678419c6d86..9626673f1d83ae64 100644
--- a/drivers/dma-buf/Kconfig
+++ b/drivers/dma-buf/Kconfig
@@ -43,11 +43,12 @@ config DMABUF_MOVE_NOTIFY
 	bool "Move notify between drivers (EXPERIMENTAL)"
 	default n
 	help
-	  Don''t pin buffers if the dynamic DMA-buf interface is available on both the
-	  exporter as well as the importer. This fixes a security problem where
-	  userspace is able to pin unrestricted amounts of memory through DMA-buf.
-	  But marked experimental because we don''t jet have a consistent execution
-	  context and memory management between drivers.
+	  Don't pin buffers if the dynamic DMA-buf interface is available on
+	  both the exporter as well as the importer. This fixes a security
+	  problem where userspace is able to pin unrestricted amounts of memory
+	  through DMA-buf.
+	  This is marked experimental because we don't yet have a consistent
+	  execution context and memory management between drivers.
 
 config DMABUF_SELFTESTS
 	tristate "Selftests for the dma-buf interfaces"
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
