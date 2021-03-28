Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFAE34C01C
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 01:58:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AD2A6E3AC;
	Sun, 28 Mar 2021 23:58:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FB496E3AC
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 23:58:07 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id l13so8218153qtu.9
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 16:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NJwGboF3RRjxp++ZERmPQjReWWVKr/czZXPuA+ZJx80=;
 b=YL9DmbE2fe0BApSWAt2uHCdURo+Rz+Rr5GPOuD10WlMJxvjxgDIyyDM3ifIcvvFf0U
 gcHFBmE54d+3KH4GKg8iBAbwJWZlANd7lr6vJAYD4G9J3iSs9fFEc0DzrVMnX38/kG6P
 RJbrTE5VSk49lSyEs8UvPXBlWiDPiTcK4eOBOcIgR1St56TAKdCSryZn0q84c3m+KGM7
 s8XD83myVeBcsZjrO6SlOUShzdK8/g4TPaF96Oa/YASCcUSk06hFuZSxlBgiMcaJpQKm
 i06egdkTzyqoTyu9lUskiJSdlxdgPxtUPgPXwD0kgeJVE3IOcizvkW/yV7TLUyM+fCMH
 j1Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NJwGboF3RRjxp++ZERmPQjReWWVKr/czZXPuA+ZJx80=;
 b=dTGWOTO4moQ17jvDUD3ucm4MVybAVNuw5dQ3vEQ9mXz4m/U8kkEzy8IbzOTz2mvpnp
 2epwpLAJ3Nx/OpCttDO7PB8IYzp1xqhoEKlX8aQgUTqfZOnpE0kB5fhKhlndKCoEmBMl
 oKSpscws3jHr7ZuFFKEo9cRNEhTq5kNx51ZVhYEoBeKaIEbp0Zht6M+ifsuwZhgERiWB
 0dJ1S3paGLspd5/A0P/5fuhSXGCMFpt1AjSHaAL9IZO5T0gtZjjps0tgHSR7k6IBFV2z
 uZDRNRZWv2gB4beVDQ0WgfN5W94noCUvUvAgj+rpMD7/zbE9Djt4+fQQsPXxYnea6iqH
 0COw==
X-Gm-Message-State: AOAM533fZ7CDcUd4wl9wU6ASADk39lTgaqD29kxp1ydBjv7VtfvbfXGz
 EGHOcXyaC9P0b8cTZOikTjA=
X-Google-Smtp-Source: ABdhPJx9IaqtHu2JrNlJIS8s9C3nSt+b7/qaYIDs+xEjbuoo0gr+h5DM6WDJ9l2kCetRDAOn+2QZpA==
X-Received: by 2002:ac8:46cc:: with SMTP id h12mr21317176qto.105.1616975886810; 
 Sun, 28 Mar 2021 16:58:06 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.58.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:58:06 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 26/30] dw-axi-dmac-platform.c: Few typos fixed
Date: Mon, 29 Mar 2021 05:23:22 +0530
Message-Id: <01f2fed34eca736091a46dfee38381882e5dc5e9.1616971780.git.unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <cover.1616971780.git.unixbhaskar@gmail.com>
References: <cover.1616971780.git.unixbhaskar@gmail.com>
MIME-Version: 1.0
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
Cc: rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

s/configurarion/configuration/
s/inerrupts/interrupts/
s/chanels/channels/  ....two different places.
s/Synopsys/Synopsis/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index d9e4ac3edb4e..ef4da10361a7 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -35,7 +35,7 @@
 /*
  * The set of bus widths supported by the DMA controller. DW AXI DMAC supports
  * master data bus width up to 512 bits (for both AXI master interfaces), but
- * it depends on IP block configurarion.
+ * it depends on IP block configuration.
  */
 #define AXI_DMA_BUSWIDTHS		  \
 	(DMA_SLAVE_BUSWIDTH_1_BYTE	| \
@@ -1056,10 +1056,10 @@ static irqreturn_t dw_axi_dma_interrupt(int irq, void *dev_id)

 	u32 status, i;

-	/* Disable DMAC inerrupts. We'll enable them after processing chanels */
+	/* Disable DMAC interrupts. We'll enable them after processing channels */
 	axi_dma_irq_disable(chip);

-	/* Poll, clear and process every chanel interrupt status */
+	/* Poll, clear and process every channel interrupt status */
 	for (i = 0; i < dw->hdata->nr_channels; i++) {
 		chan = &dw->chan[i];
 		status = axi_chan_irq_read(chan);
@@ -1511,5 +1511,5 @@ static struct platform_driver dw_driver = {
 module_platform_driver(dw_driver);

 MODULE_LICENSE("GPL v2");
-MODULE_DESCRIPTION("Synopsys DesignWare AXI DMA Controller platform driver");
+MODULE_DESCRIPTION("Synopsis DesignWare AXI DMA Controller platform driver");
 MODULE_AUTHOR("Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>");
--
2.26.3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
