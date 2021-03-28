Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F35E34C02E
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 01:58:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E8B06E3EC;
	Sun, 28 Mar 2021 23:58:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 794246E3EC
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 23:58:22 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id c3so10932260qkc.5
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 16:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OzLTjr1QMwsBd8ul22IMj5qh7q/mkchMq8nJkxCkqyY=;
 b=r9e3a2wKOgpXCJCo+aWL5/d9M1nteMw5u0JfcT5v+U1WeLlFsUdTJtF08TixWpxMKN
 YOD1u3JG8FP2VSPHIxLAz8eyeTW7mKistUjRXRPuJmpwD4BMio2K3MX1BHXh30tgr+HS
 WkzGAULz8HC3J2TiK1vBwO2PBVjrMfhok856SYM9QI5K2u/kKIUyC6gGKYdErlSpXQ4X
 n5ywUcSi2xtng/Z0W39xMqETvdlLlYlXLhEnBKsLgR7MX8S21rvncu5XNVqEvqtPGWsi
 BDbqqdTj0jxa+LbMW45UGa5pH81aWPydRGGHPaGxa/5YSoAfD3YkO5GRqeKV5jDkYTwr
 0RTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OzLTjr1QMwsBd8ul22IMj5qh7q/mkchMq8nJkxCkqyY=;
 b=TvZrV7eZ8ne/xd3o+xdqOZBFxUpOtUPBkxmlgg44P3EWnFDlX3sgzx3Mhncp6YIUVq
 VYeKFlpgHpAZCqiTAgMnCRaMNZPjyjb929srxVytCCDQ7hK+aleP/gLRsYTCvJbEffDV
 eiFZ6YMUmfmRDfvtBCA3HlmtuqI06iNn5LExg4ABcDfiVlECyBc8EjPTyHp14/kAIDVE
 2fD8FXu3/Fs0wmTOBPN13MR5DP5um3J3ijhnkAECuJlPdXjB02p637ut23JDVq5fqSc6
 +78GGmLh425nnOYsdhh5N58sGdhuD0IlMD8qZ9qp3LTl6mAf5IvXVcG6BxFB6ZPRyxam
 POog==
X-Gm-Message-State: AOAM5304cOTfh912NN7HHfltRpBsOQSKgSQJH0YMBIwPVURMMjhruGt2
 AcbSrfmPCImmfoiZIy6t9ok=
X-Google-Smtp-Source: ABdhPJzZMvKYIloLfO2fexs1vtEuZv6khlYZUkE/hvVvZgpuiguBiwDPE1c2rtdyr/QBSVJvO+1KkQ==
X-Received: by 2002:a37:6a47:: with SMTP id f68mr23321069qkc.12.1616975901742; 
 Sun, 28 Mar 2021 16:58:21 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.58.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:58:21 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 29/30] edma.c: Fix a typo
Date: Mon, 29 Mar 2021 05:23:25 +0530
Message-Id: <28685183e34f3ae6839eb73265f9055f554ad6f1.1616971780.git.unixbhaskar@gmail.com>
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

s/transfering/transferring/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/ti/edma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/ti/edma.c b/drivers/dma/ti/edma.c
index 35d81bd857f1..5ad771e34457 100644
--- a/drivers/dma/ti/edma.c
+++ b/drivers/dma/ti/edma.c
@@ -1815,7 +1815,7 @@ static void edma_issue_pending(struct dma_chan *chan)
  * This limit exists to avoid a possible infinite loop when waiting for proof
  * that a particular transfer is completed. This limit can be hit if there
  * are large bursts to/from slow devices or the CPU is never able to catch
- * the DMA hardware idle. On an AM335x transfering 48 bytes from the UART
+ * the DMA hardware idle. On an AM335x transferring 48 bytes from the UART
  * RX-FIFO, as many as 55 loops have been seen.
  */
 #define EDMA_MAX_TR_WAIT_LOOPS 1000
--
2.26.3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
