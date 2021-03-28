Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D35B34BFF3
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 01:57:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F0A96E1A7;
	Sun, 28 Mar 2021 23:57:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFABB6E1A7
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 23:57:07 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id z10so10908064qkz.13
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 16:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7ZQIptdaKO+NG6KGHA5S2pjM0OS7naQnCt9zgnNYCE0=;
 b=Gm9tUcw1/+mThRDpyyzzMTwMHDKH9vZpafertqfrSZ5YO9KbE3sAww3oZ8XGMiAhRt
 kgtAGKj9dtXo99Szxu7K4JpbuKgBBIZREfyljwoHuiTIM5ZAd/CKQ0umxuj//O71kbxD
 Eorzfcnc99sIfIq6B+POBj5vgl6pz1tdC7ugns0aQrf9x/NJct0viJIWVNhC6Y2Bw3k5
 +zV83HR64ZTrH1sIkOEbsmWYi035hsyGGF+Rxz5h3YrJ34Fc/SSZo4abf7eLvn47HyCZ
 1VehmmjVpqRm3naf7dKNpOzu4sq3YMJBnKtBt196sX4MubPgCqv7idERRFBCAhH7OBQ+
 GtVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7ZQIptdaKO+NG6KGHA5S2pjM0OS7naQnCt9zgnNYCE0=;
 b=qwLyh7e5/uunXAGjj/hU1e8rpwPbYX6pNORyYtqZjt5GmAqA7zoOKyBHAEfX5Pem2+
 asq5SKylq9sfD2ZUn1UjMbpsCFMVcEfn+1MI58V/af4QeWcE99ler4ujjxOYfssK7Li7
 Qrb5pEbw6Ewz7v5GlyMn9PQuHqOhqKS5zQ/bLDdsroAY9q8A3MV4xSB9DrtaUkCPnopn
 f7Ho5A+v69ffnDL2G0duK4+BMFIO3wQZ+hCbSFNOR5go9IqgGmGUkytek86d3Kxo2CCW
 K+x9/0UdhiSwXdyWVmm7e+v06bqplv7HAAWLw6WKW6nvOzZYE9eekhc4gnGyqyI8qFiF
 YiIg==
X-Gm-Message-State: AOAM53193oCdKpfcMnpP3JGUEoaz7Gm8AiXsiUC6QzKnuCWnB4cu2siv
 61/kdMLUVHxEoo9tjuwjUno=
X-Google-Smtp-Source: ABdhPJwgPDn63+t8WI0ESglt0cdz3qRSIBNoBZJfy0KnIfKji8LoJbUHTl3eZXAtTJ+tyoAIdpJzMw==
X-Received: by 2002:a05:620a:cf4:: with SMTP id
 c20mr22556318qkj.134.1616975827140; 
 Sun, 28 Mar 2021 16:57:07 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.57.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:57:06 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 14/30] Revert "s3c24xx-dma.c: Fix a typo"
Date: Mon, 29 Mar 2021 05:23:10 +0530
Message-Id: <1d989f71fbebd15de633c187d88cb3be3a0f2723.1616971780.git.unixbhaskar@gmail.com>
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

s/transferred/transfered/

This reverts commit a2ddb8aea8106bd5552f8516ad7a8a26b9282a8f.
---
 drivers/dma/s3c24xx-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/s3c24xx-dma.c b/drivers/dma/s3c24xx-dma.c
index c98ae73cdcc3..8e14c72d03f0 100644
--- a/drivers/dma/s3c24xx-dma.c
+++ b/drivers/dma/s3c24xx-dma.c
@@ -156,7 +156,7 @@ struct s3c24xx_sg {
  * struct s3c24xx_txd - wrapper for struct dma_async_tx_descriptor
  * @vd: virtual DMA descriptor
  * @dsg_list: list of children sg's
- * @at: sg currently being transferred
+ * @at: sg currently being transfered
  * @width: transfer width
  * @disrcc: value for source control register
  * @didstc: value for destination control register
--
2.26.3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
