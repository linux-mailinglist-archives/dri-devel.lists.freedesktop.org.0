Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 547EA34C02F
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 01:58:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E2376E3F2;
	Sun, 28 Mar 2021 23:58:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78ED16E3F2
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 23:58:27 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id x9so8204922qto.8
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 16:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pZY3iifrv8ClFucjg75wWqbWgmlD1U3QmF4uzbWxtyk=;
 b=PIw7C1Bk/eGWQKsGvWCr0S8TPn8QvRWOhl6hvWK4VjoMFupeY5/g8s7kzwhMScA5Yu
 3e7Rj/bjvS2b85U9+k88WGtsKgUTPvzzvdFJYC0k/RqLPZFS/3GhHjMqD5kK+e7jKM/6
 53Fvs6gxrbJFiC1u/dgFp8bxTyuVzLD/Tpou7SHHqSFadmyNPt3U4CU58tt95gASNQQ7
 xYX4ULcW05MCOpvlLfFnzFEUNX3Yp7+RhdNBet8s+BvsIMTWUkgy4Nq5pTpS8LNP/fAV
 /fA+htsmtHzgRatr0oZ5k5rLTOnxU0BoqA8YYmMtTbokFKvFZL0GLX13Zdgx+VbiqJTc
 ioTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pZY3iifrv8ClFucjg75wWqbWgmlD1U3QmF4uzbWxtyk=;
 b=VBDACE8sB2dKXOdxpf7qpXuNH/Y3MLMUPPq7ETqMKysf/z25IIgl/ELG+gUun8lkZi
 fXrAF2dxyr75BVHFwGm03JTP1Wbwxy7Vmp+6TSuqHxGcpH1aIzib/+8s8x5mse9ZWxHX
 SQPQincnQayt8oFGRu4pJxQP7iwVegVgVGGqAJRqZz5KG3jN7eEmIe3i5Wh81/I2ABx8
 f1eqRXLWxYfnKdnXovbAtN88ZwUC4BSYGOeZx1aquvBFMfKJi0Y+DfJvmuZ0c9E3P9F7
 rFC0UWjsiTFV+8/aZ6MR/Z7dx6CLO8Zs5nYY/D4fuSIG1W5C4I7dthoIelAAknIE4kQt
 JSvw==
X-Gm-Message-State: AOAM533Bw0taBOs33JHWH7bo1CSh0Mi7YtbJBiL6WbtRHVGfzGWYkq/U
 4ZnWEMelHa7OEcCstdTkkv4=
X-Google-Smtp-Source: ABdhPJzrXaJ3NFEfLw/ORFLnH6cpcNnBby0kvFM8FYj18PlBci3BiuYNuENXsp4hnCZmTj7qcXXSOw==
X-Received: by 2002:ac8:dcc:: with SMTP id t12mr13998503qti.219.1616975906780; 
 Sun, 28 Mar 2021 16:58:26 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.58.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:58:26 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 30/30] xilinx_dma.c: Fix a typo
Date: Mon, 29 Mar 2021 05:23:26 +0530
Message-Id: <4613951fd51572e8c152d07c402d30a13f19a917.1616971780.git.unixbhaskar@gmail.com>
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

s/interace/interface/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/xilinx/xilinx_dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index 3aded7861fef..63d2f447ad79 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -483,7 +483,7 @@ struct xilinx_dma_config {
  * @ext_addr: Indicates 64 bit addressing is supported by dma device
  * @pdev: Platform device structure pointer
  * @dma_config: DMA config structure
- * @axi_clk: DMA Axi4-lite interace clock
+ * @axi_clk: DMA Axi4-lite interface clock
  * @tx_clk: DMA mm2s clock
  * @txs_clk: DMA mm2s stream clock
  * @rx_clk: DMA s2mm clock
--
2.26.3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
