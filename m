Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1186234C008
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 01:57:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 482BB8991E;
	Sun, 28 Mar 2021 23:57:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6452789951
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 23:57:32 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id i9so10935431qka.2
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 16:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CRQ66svHtz0NbMeMT9Zx0iC/2wAaIP+Km/fepuW/VfI=;
 b=lhF2PkYeKxZ0OGzjM1bBzGIAbKjSfHQkFcs2C27Ecdb0THCTBERC5T8aj/+CORXigi
 n616eugbkVpcCcWOibNxul8RyH5dqWEqKKkgEPag7IAtO1wIHraKQFrl6zJF1poQ+l/b
 l4gr6oRHPIYD9JSm8bV8I4eaJ/HWeZreeqN1heEG18VeXYvPGT7mIxrkvRUKeCBCctG6
 kwu9TfPac45671YXZgPWyFX6uZIgmzX1lHqm9rWuWRszCfTaoym5DsDyvHsArK4pope4
 2V++RpddLlJAODW8ec9vU7dCOvdwVpIAwPI0KLCpB4FbC0QCvF/clKntX08Z9XocOVxl
 t/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CRQ66svHtz0NbMeMT9Zx0iC/2wAaIP+Km/fepuW/VfI=;
 b=DTbGd1qQqZ07jZe3cWiOKMO9aCgV7mgphMDTauwOUjgtM+mKcpJj9TUJQnVhHcSiwS
 mZnh3L0DC5kEgzkJSo9X+78eY02XcYSX/L/IQLJsvxfx1LbsPJEYqTJSvg3izy84yP+C
 B8zB4bMis3eG9t/V1yMFw9YG7aXob13dJTSoKL4501sxSCWbAfiYeorZcXRWeNZksfuD
 et84yy86Iua3+DHaPSSvko2WaY0J6vykYHpIVJ/G7jo2miPr2oOVu2edqGC+rL6rNoQ+
 U/ass/+2fGbz0GrylhWlRJ2KBbwZLI6jE7fIFI2r82KHotMiiXxywv2FUs0fmplyIqpL
 6bEQ==
X-Gm-Message-State: AOAM533RE/xcF/azMBNmI+ca47ejrRkgk7cHHQxVW9DbVBG5gCBSTuu4
 LEl5jiKe2IqDtzurJjOPY68=
X-Google-Smtp-Source: ABdhPJz562Hr6JC/eu+femI5ulDAe6zWcMiureMKHuCOy+N3i/aJwFXT/YJj4Ol1H2CmKTh/PKph0g==
X-Received: by 2002:a05:620a:31a:: with SMTP id
 s26mr23223111qkm.355.1616975851673; 
 Sun, 28 Mar 2021 16:57:31 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:57:31 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 19/30] xgene-dma.c: Few spello fixes
Date: Mon, 29 Mar 2021 05:23:15 +0530
Message-Id: <4703d96a617c2244e2753d579790edbbb49382ab.1616971780.git.unixbhaskar@gmail.com>
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

s/definations/definitions/   ....two different places.
s/Configue/Configure/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/xgene-dma.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/xgene-dma.c b/drivers/dma/xgene-dma.c
index 3589b4ef50b8..9b0010b6e033 100644
--- a/drivers/dma/xgene-dma.c
+++ b/drivers/dma/xgene-dma.c
@@ -23,7 +23,7 @@

 #include "dmaengine.h"

-/* X-Gene DMA ring csr registers and bit definations */
+/* X-Gene DMA ring csr registers and bit definitions */
 #define XGENE_DMA_RING_CONFIG			0x04
 #define XGENE_DMA_RING_ENABLE			BIT(31)
 #define XGENE_DMA_RING_ID			0x08
@@ -102,7 +102,7 @@
 #define XGENE_DMA_BLK_MEM_RDY_VAL		0xFFFFFFFF
 #define XGENE_DMA_RING_CMD_SM_OFFSET		0x8000

-/* X-Gene SoC EFUSE csr register and bit defination */
+/* X-Gene SoC EFUSE csr register and bit definition */
 #define XGENE_SOC_JTAG1_SHADOW			0x18
 #define XGENE_DMA_PQ_DISABLE_MASK		BIT(13)

@@ -1741,7 +1741,7 @@ static int xgene_dma_probe(struct platform_device *pdev)
 	/* Initialize DMA channels software state */
 	xgene_dma_init_channels(pdma);

-	/* Configue DMA rings */
+	/* Configure DMA rings */
 	ret = xgene_dma_init_rings(pdma);
 	if (ret)
 		goto err_clk_enable;
--
2.26.3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
