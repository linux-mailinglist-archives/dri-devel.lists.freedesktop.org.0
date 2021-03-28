Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA4C34BFDD
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 01:56:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC8266E117;
	Sun, 28 Mar 2021 23:56:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80BD06E117
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 23:56:08 +0000 (UTC)
Received: by mail-qv1-xf36.google.com with SMTP id c3so4546777qvz.7
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 16:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cGEIwK2mIWlt0praWPVjHqx3787sD2c2+ZgIrWeWC10=;
 b=MHcOVXxwuQq9uqXkVVuBX0gJCRJ7glGGeVEfFXw0gIUK0eSzsVxe1AZARAhuSRj3YZ
 fN0P0USAorbIlhKL+tBir5YICqCcUJgAHIdtl7kbbjsKMDY4jYibPNUn3NaaV7Q8EWoo
 SLCd3+axdfEe2JQgQ0IA5JDtmlwwY/78RnCy1OD6/3OYMG9Pi0P4Td5hpINwGDG0ZVHP
 /wwa+3iDJ6RBYE1AEyFziDbGBYl8YxN7l4N0Nj3tZs04HUgSpxd0XYTb+bpMd7rAFOv/
 Ka2nQ91BkVfuIiwh7j5oP5m22bSKTwFZz8/56aHeupoIJtY5Q6H7slSTKfgf7lJTmOyP
 yQHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cGEIwK2mIWlt0praWPVjHqx3787sD2c2+ZgIrWeWC10=;
 b=n6pEI7sNJ6/+U0cs46/flKKixvjqVD0Ic0Vp4tgIGcSNE2bNg5X18e/uj/Xeag9TuR
 e+dh6MB/SxlU85Ppgtb4nV9x344TLJWubAN1w9umDHr4uY5c/FmRfVlk9J1SZE06NeVu
 do4Rdmm2+ag+vihJxAsFEP6/U+mKat7okQ9z017wSJqFZbgTm/mpruyTiS1tVpOsvmYi
 6RO5EmQt3QwtJVxWcdaae0fkKZ/mqZDDRNRW3DHlfrqv3W19UfvaCWsAUwUjkiyzYEUW
 Ji/vygTgt58Scsgg6Osq2gNuZnTZlr1eNRJW45KFM0+rWAwN7vFs2zx/uxjcy7KSw4zh
 yBGw==
X-Gm-Message-State: AOAM533ltFyjjRq0MalXYdkCoEbnGUAYAeI7HVZcZ7evAdK3w8Co/btK
 5v9fnnHZQKWZZh76IAL62oM=
X-Google-Smtp-Source: ABdhPJzupTYmpyqK8HSRMpnyKZA7fy0qU0f4/K+gj2k9q8PjKZlDEA4s8A98+bzdSWZWkwnQeq1lbQ==
X-Received: by 2002:a0c:ea81:: with SMTP id d1mr23183110qvp.57.1616975767611; 
 Sun, 28 Mar 2021 16:56:07 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.56.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:56:07 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 02/30] altera-msgdma.c: Couple of typos fixed
Date: Mon, 29 Mar 2021 05:22:58 +0530
Message-Id: <c9dc34e16508c7444d3407d775eb6f921ff81f06.1616971780.git.unixbhaskar@gmail.com>
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

s/assosiated/associated/
s/oder/order/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/altera-msgdma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/altera-msgdma.c b/drivers/dma/altera-msgdma.c
index 9a841ce5f0c5..c3483bf2aaa7 100644
--- a/drivers/dma/altera-msgdma.c
+++ b/drivers/dma/altera-msgdma.c
@@ -152,7 +152,7 @@ struct msgdma_extended_desc {
 /**
  * struct msgdma_sw_desc - implements a sw descriptor
  * @async_tx: support for the async_tx api
- * @hw_desc: assosiated HW descriptor
+ * @hw_desc: associated HW descriptor
  * @node: node to move from the free list to the tx list
  * @tx_list: transmit list node
  */
@@ -510,7 +510,7 @@ static void msgdma_copy_one(struct msgdma_device *mdev,
 	 * of the DMA controller. The descriptor will get flushed to the
 	 * FIFO, once the last word (control word) is written. Since we
 	 * are not 100% sure that memcpy() writes all word in the "correct"
-	 * oder (address from low to high) on all architectures, we make
+	 * order (address from low to high) on all architectures, we make
 	 * sure this control word is written last by single coding it and
 	 * adding some write-barriers here.
 	 */
--
2.26.3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
