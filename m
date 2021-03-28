Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A8934C01B
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 01:58:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C6F6E24D;
	Sun, 28 Mar 2021 23:58:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CBB36E24D
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 23:58:02 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id l13so8218071qtu.9
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 16:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bpe0M5+HDAqDdeQIOejQbDfFbOvYGihGTywPqCQfPxk=;
 b=UBnTpPl9V62AUBrqC/YSqABPupQ76JLXTf9wdWJSwN8Y02M91Cv2rn4ZwjhokBjvOT
 caKPPonpNMbkYJsmubQ2Bumfsz0OvmkkTWS8FwgdpAJJ2UjLRJp7acfTyFudWVBAqVM4
 mAaT3aHaultxmZCgXXXV5OvJ6J1msraQIsZAdfJkw4uSiaZABZyAHr7r8flbrOwvpPZH
 zBFD5EMOq2xPgbxunhlKskRUqPhi8QLQoyZ1kqDj7sVSl05HXPEVHwZylycvJDJMix34
 BhEq84yLvrSkLfYTrEw/MPY6YGk4Ihk/VSSgfbjYkcNwFP0GEpF+EGDzHiMvb4HSukdQ
 PlRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bpe0M5+HDAqDdeQIOejQbDfFbOvYGihGTywPqCQfPxk=;
 b=PHCyz3TItr5JT93DmwGKOCK2Mw/ue5n4GePA8ZvyKiYvpq/BZifh8pdScSr3yo9YcB
 K20R4OVBKfKeBSKNNd2eZS4G4bPm+Nn06CYTYZGCHFo+HksoltwtsYO6cqlsuVkHvAHN
 0Xo0QS4L8PxtdBnb18u2I3ITqzm9PVb5abnBUyWIHdJYQShcqJAMG8Em4xbVIb+gOsi1
 fqaoHjzoQOHpN7/kqfeA4a2479YqwEkGnWU6edDtDSPBdEFUy4rTbr91IkcdrFFnetKq
 pyUZ13P9lQw7YHy4xipir2IXR6ZXuweN/c3Ti/Bf9ce1E9vMAx2CrT3TGH1nuD2i3eRj
 HcGQ==
X-Gm-Message-State: AOAM531E+xYjzipzJjx9GTIlSApuiX+fltLkcyMIXsHjZXGOEfmAe9YA
 FgNDaTWmKeE+yLY7TASNm+M=
X-Google-Smtp-Source: ABdhPJz4aA7ldRQgsCMEBAdvXkEvBGcKpJz3Kr32GBN9DAQyr64A5Qqw5tpT7IRp1HeHqf9g6ttT3w==
X-Received: by 2002:ac8:698f:: with SMTP id o15mr21281625qtq.39.1616975881895; 
 Sun, 28 Mar 2021 16:58:01 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.57.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:58:01 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 25/30] ste_dma40.c: Few spello fixes
Date: Mon, 29 Mar 2021 05:23:21 +0530
Message-Id: <ef2c19d475895f8a627335e37560a18d28c062e9.1616971780.git.unixbhaskar@gmail.com>
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

s/ealier/earlier/
s/orignal/original/
s/manouver/maneuver/
s/transfer/transfer/
s/succees/success/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/ste_dma40.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 265d7c07b348..39fa2fb74057 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -155,7 +155,7 @@ static __maybe_unused u32 d40_backup_regs[] = {

 /*
  * since 9540 and 8540 has the same HW revision
- * use v4a for 9540 or ealier
+ * use v4a for 9540 or earlier
  * use v4b for 8540 or later
  * HW revision:
  * DB8500ed has revision 0
@@ -382,7 +382,7 @@ struct d40_desc {
  *
  * @base: The virtual address of LCLA. 18 bit aligned.
  * @dma_addr: DMA address, if mapped
- * @base_unaligned: The orignal kmalloc pointer, if kmalloc is used.
+ * @base_unaligned: The original kmalloc pointer, if kmalloc is used.
  * This pointer is only there for clean-up on error.
  * @pages: The number of pages needed for all physical channels.
  * Only used later for clean-up on error
@@ -1630,7 +1630,7 @@ static void dma_tasklet(struct tasklet_struct *t)

 	return;
  check_pending_tx:
-	/* Rescue manouver if receiving double interrupts */
+	/* Rescue maneuver if receiving double interrupts */
 	if (d40c->pending_tx > 0)
 		d40c->pending_tx--;
 	spin_unlock_irqrestore(&d40c->lock, flags);
@@ -1970,7 +1970,7 @@ static int d40_config_memcpy(struct d40_chan *d40c)
 		   dma_has_cap(DMA_SLAVE, cap)) {
 		d40c->dma_cfg = dma40_memcpy_conf_phy;

-		/* Generate interrrupt at end of transfer or relink. */
+		/* Generate interrupt at end of transfer or relink. */
 		d40c->dst_def_cfg |= BIT(D40_SREG_CFG_TIM_POS);

 		/* Generate interrupt on error. */
@@ -3415,7 +3415,7 @@ static int __init d40_lcla_allocate(struct d40_base *base)
 		base->lcla_pool.base = (void *)page_list[i];
 	} else {
 		/*
-		 * After many attempts and no succees with finding the correct
+		 * After many attempts and no success with finding the correct
 		 * alignment, try with allocating a big buffer.
 		 */
 		dev_warn(base->dev,
--
2.26.3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
