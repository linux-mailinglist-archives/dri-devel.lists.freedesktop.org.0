Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 649DA34BFF7
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 01:57:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70E8D6E1A8;
	Sun, 28 Mar 2021 23:57:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAAD56E1A8
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 23:57:12 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id y2so8199174qtw.13
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 16:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VFtxWE0StKfcC+URsv7nAjsC2Kf78xuu9a0HtqKdSlU=;
 b=nofPQHYz+R+Oh7tBn2NrHqcJ60wz0I6awH3+nn+VeY57PjK9/aNKapSiLLecIClvPE
 Wv+VWFlug249FdqQUEnblJ5mnlCINYaNx63BE/qOihUhCU+JaQ/WqSPiCuKhfSjQbhGv
 sBRNZ9lVKQXJGBC11+kHxahv9pSjNr/fTi0d+YVlFs4PWEH7ZQGtYbkuhE6TF9M1XIi2
 OaPcpcSIEMOOc32j/1qRcNe0pfEquahJ0sNCoEtLMNpLSu5FueclTvKRvW/OcNHihNtC
 0IMi3H/cpoMpeAJG9jiZpJyTWlCGbUvhb9/0lczXT1gcHms5Qe+Z9kXEzBI1StWYjMxW
 2wag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VFtxWE0StKfcC+URsv7nAjsC2Kf78xuu9a0HtqKdSlU=;
 b=E0ekD4nAyOzXdrHM/PX+9DKUeufZ64wHDof6pBzR1UBkDwr1GPfLs5ZmiA+bVqG5qJ
 Ac5T6gJ/p1Y+UlCPOwZg7dPc+ykOHVl89zSmDaA9rX00HIbol0mZNw1NI+EQMQ6t5bZU
 zj9Z0a+IkQ+ryKRFIBK2xLVIowLncTr2uFdLNd/i8kAaMUxwwI90wPnxE0IZi5AL+ZE6
 ABfnrg8dLD/+lGFQf68wGUilpU4gA7fxlEg3GyyH3AFLN1TLIEA20srIUfZO8zZKOy6k
 5NLXv5dBh/ooUp6CbG13avAepfnHPmNNxD9mr99bLq+d2L3r3O0FI1XfYVkwAr0eCaW9
 MLTg==
X-Gm-Message-State: AOAM533QAFlqYkTQGKn5HtGb4nnu1EMvQ8+DtfVcvtIuYsfn6PhwXPbq
 27yHNKOYfFG/LHM+QGxSQMs=
X-Google-Smtp-Source: ABdhPJzdepGd4ibSSylbqz3lykO6e7Iu/C1yudQOjI9dZGJHJpjheIp8QepnwzKrjFLrJcsbOfjQlg==
X-Received: by 2002:ac8:7fcd:: with SMTP id b13mr20277139qtk.68.1616975832021; 
 Sun, 28 Mar 2021 16:57:12 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.57.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:57:11 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 15/30] s3c24xx-dma.c: Few typos fixed
Date: Mon, 29 Mar 2021 05:23:11 +0530
Message-Id: <062bbb694c995aad9ca17a80bbc63716f116fd9f.1616971780.git.unixbhaskar@gmail.com>
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

s/transfered/transferred/
s/desintation/destination/  ...two different places.

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/s3c24xx-dma.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/s3c24xx-dma.c b/drivers/dma/s3c24xx-dma.c
index 8e14c72d03f0..045f2f531876 100644
--- a/drivers/dma/s3c24xx-dma.c
+++ b/drivers/dma/s3c24xx-dma.c
@@ -156,7 +156,7 @@ struct s3c24xx_sg {
  * struct s3c24xx_txd - wrapper for struct dma_async_tx_descriptor
  * @vd: virtual DMA descriptor
  * @dsg_list: list of children sg's
- * @at: sg currently being transfered
+ * @at: sg currently being transferred
  * @width: transfer width
  * @disrcc: value for source control register
  * @didstc: value for destination control register
@@ -920,7 +920,7 @@ static struct dma_async_tx_descriptor *s3c24xx_dma_prep_dma_cyclic(
 	}

 	/*
-	 * Always assume our peripheral desintation is a fixed
+	 * Always assume our peripheral destination is a fixed
 	 * address in memory.
 	 */
 	hwcfg |= S3C24XX_DISRCC_INC_FIXED;
@@ -1009,7 +1009,7 @@ static struct dma_async_tx_descriptor *s3c24xx_dma_prep_slave_sg(
 	}

 	/*
-	 * Always assume our peripheral desintation is a fixed
+	 * Always assume our peripheral destination is a fixed
 	 * address in memory.
 	 */
 	hwcfg |= S3C24XX_DISRCC_INC_FIXED;
--
2.26.3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
