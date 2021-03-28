Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F1934C009
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 01:57:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E10E38997A;
	Sun, 28 Mar 2021 23:57:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 533FF8997A
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 23:57:37 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id f12so8253149qtq.4
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 16:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qTMepEQ2KULfrsHgV8Kxlgt84PsBxxGqM80tVNIqbWY=;
 b=bTEbIGlULsXvf6mp9eD0MKL9UGtjeyV3vz6uIDnSq3FIpNNN4nSxkCxJXDeGfDDYyB
 zrGFOLTVdImkvTyvLeq0/4E+jnMEn98Q26GKTp+Nz0mhhF+ZDnkEgHrk7CFt7Ca0UvL4
 zn/PcJ5S81UeZvLDHEV66orBfcuymqrZb2/bTljWCMBn9pDs5sHfT9lWNzoSKvdiRlgf
 XdUsJFchXNreOvNlDTRTJnKriv/0ujteXmBg14gklE8iTN8dRgUSPOi0bMkwDOBHnpR4
 zgdlEoqgFMO6iS16vaq1e+iDX2yJvKTuHCAjQVE2Bd5zNUG+/3CwHCC8hFaVUgmb1NiM
 gWYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qTMepEQ2KULfrsHgV8Kxlgt84PsBxxGqM80tVNIqbWY=;
 b=VfWbndNgl1IOJxATiR3M2fH0bac92n9sxVGZ4/XAW2NqP2+szZqkd6tMZo+8+fRdAv
 AclXl1vPFOvXlM4FkiHYtf9EG0v7sH7Pd8ab5rvmr8j/PNQCF5X5yjSLtvmPUrtwUKuD
 Q+SSEJSjSYNShQf+NcSLWjPjpzF2Lnn5f3NffYQcYLHhRZyWoFIMFX/tgi/w+rId2BKD
 MgF+xzWB2SBd+Nek4rAcdLTfZkWj0K40zTzgHtgZskfVnyo5EF8rV7NDCwOhTjOnV7Rw
 xL1Lrb1+p9wdgeZabI3bNxBhZwxvjiqcv2DvdU/4x+i7QVofLnCRgWbkEUQsq0qF4zqz
 ww4g==
X-Gm-Message-State: AOAM532DJylCARRz8b7twTvxlPQxN1qsEbmBAT1DJzwpsEpubtf7OtaQ
 HVAExXq77GE5M0lFWBtKhc8=
X-Google-Smtp-Source: ABdhPJwRTC1BpC2ZmqFvyCckRvvuwnANkqHAZvJtuc4Mu8nM99Nfdg+GTNYLo2psV/k5ZUFbmcYhiA==
X-Received: by 2002:ac8:dcc:: with SMTP id t12mr13997202qti.219.1616975856552; 
 Sun, 28 Mar 2021 16:57:36 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:57:36 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 20/30] at_hdmac.c: Quite a few spello fixes
Date: Mon, 29 Mar 2021 05:23:16 +0530
Message-Id: <d4e6597ed691d7faf4b35ca75e392706bdb16d1d.1616971780.git.unixbhaskar@gmail.com>
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

s/tranfers/transfers/
s/maxium/maximum/
s/previouly/previously/
s/broked/broken/
s/embedds/embeds/ .... three different places.

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/at_hdmac.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
index 30ae36124b1d..02c09532a9e4 100644
--- a/drivers/dma/at_hdmac.c
+++ b/drivers/dma/at_hdmac.c
@@ -374,11 +374,11 @@ static int atc_get_bytes_left(struct dma_chan *chan, dma_cookie_t cookie)
 		 * a second time. If the two consecutive read values of the DSCR
 		 * are the same then we assume both refers to the very same
 		 * child descriptor as well as the CTRLA value read inbetween
-		 * does. For cyclic tranfers, the assumption is that a full loop
+		 * does. For cyclic transfers, the assumption is that a full loop
 		 * is "not so fast".
 		 * If the two DSCR values are different, we read again the CTRLA
 		 * then the DSCR till two consecutive read values from DSCR are
-		 * equal or till the maxium trials is reach.
+		 * equal or till the maximum trials is reach.
 		 * This algorithm is very unlikely not to find a stable value for
 		 * DSCR.
 		 */
@@ -403,7 +403,7 @@ static int atc_get_bytes_left(struct dma_chan *chan, dma_cookie_t cookie)

 			/*
 			 * DSCR has changed inside the DMA controller, so the
-			 * previouly read value of CTRLA may refer to an already
+			 * previously read value of CTRLA may refer to an already
 			 * processed descriptor hence could be outdated.
 			 * We need to update ctrla to match the current
 			 * descriptor.
@@ -564,7 +564,7 @@ static void atc_handle_error(struct at_dma_chan *atchan)
 	spin_lock_irqsave(&atchan->lock, flags);
 	/*
 	 * The descriptor currently at the head of the active list is
-	 * broked. Since we don't have any way to report errors, we'll
+	 * broken. Since we don't have any way to report errors, we'll
 	 * just have to scream loudly and try to carry on.
 	 */
 	bad_desc = atc_first_active(atchan);
@@ -870,7 +870,7 @@ atc_prep_dma_memcpy(struct dma_chan *chan, dma_addr_t dest, dma_addr_t src,
 		atc_desc_chain(&first, &prev, desc);
 	}

-	/* First descriptor of the chain embedds additional information */
+	/* First descriptor of the chain embeds additional information */
 	first->txd.cookie = -EBUSY;
 	first->total_len = len;

@@ -1199,7 +1199,7 @@ atc_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
 	/* set end-of-link to the last link descriptor of list*/
 	set_desc_eol(prev);

-	/* First descriptor of the chain embedds additional information */
+	/* First descriptor of the chain embeds additional information */
 	first->txd.cookie = -EBUSY;
 	first->total_len = total_len;

@@ -1358,7 +1358,7 @@ atc_prep_dma_cyclic(struct dma_chan *chan, dma_addr_t buf_addr, size_t buf_len,
 	/* lets make a cyclic list */
 	prev->lli.dscr = first->txd.phys;

-	/* First descriptor of the chain embedds additional information */
+	/* First descriptor of the chain embeds additional information */
 	first->txd.cookie = -EBUSY;
 	first->total_len = buf_len;

--
2.26.3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
