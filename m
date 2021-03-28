Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECFF34BFE3
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 01:56:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87B106E174;
	Sun, 28 Mar 2021 23:56:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10A6B6E174
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 23:56:33 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id g20so10955581qkk.1
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 16:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0BnZu67viS33aGYohPjcgklvkVxQfW/8GD9rnxEtwd4=;
 b=DZtvetYyyMD2lBKzbBM4H/FNDCw5hl88bdIconXcj2qDm/jFPH8aghuq5QsYihTAkF
 e50DD81/iTN58j6xxgKz550PmMPq8BQ9hEfPPph+WIdC73rdzg8dJ+UXCMCfg/eL6rpL
 bpYG8Qer1UHLBNEjXOk5LiOfjLy04zj5RiWzpfm0AGaIiSGGdOOUyINW+fPqgXEZLBWI
 ZJCp/duHr3bDu8WGMaUyF5991YwUfo18A+oY2EylsV72rLburV0Y8KLkYvuhvMNXoarO
 w5WASyKO9yq4Ox1RbNmZX7VpJeVNZW6LB+RXDNbwuj6DZyPA6KZYbK1dc6YXhqfBkLPO
 QxGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0BnZu67viS33aGYohPjcgklvkVxQfW/8GD9rnxEtwd4=;
 b=A8onv9R2Dg7hPCatdK7BA9rdDXwiPgEDwdUDZnuFW8Ip72pKy++DTJb/E9vZdoZL7P
 9Ab7z53r4sPXAOGYFtxf6Hht74pQtujhCzG2hffShtNsZVQxZg+Iwr/zka3hvN/4Kjht
 WXXgIRznfXHNLurOmzFA7RAvZ9m5GNMIw8wjWQ8Pq92/a3djHj50YOY6UZvaA7ipekyh
 1UU77dqurEA7t3rSGaZ/ASNnOXgIKvknN7+zu30FYkGmf/sOPeVX9Pulpcs29CPhC/dJ
 vpgAE+X46qbAfdnktjBLsTyn5HmwWQ1XkrdluVW4zW10fdJHA1bYcfKpPuMKAmpojCM0
 7MVA==
X-Gm-Message-State: AOAM533TFQuaFVcx2lS3yBsYu96pbC+ofdpShEutcU2ybtiIUC9c1AyH
 E1uttxdbfkYtxMHyrlwNdps=
X-Google-Smtp-Source: ABdhPJyLnsSA7aDZpYL8OgcC6cA3c2KI3g1ctb8AbY5iG8YBuQoLtMdy1CH0E4ijQxDfED6WKrLV5g==
X-Received: by 2002:a05:620a:31a:: with SMTP id
 s26mr23221107qkm.355.1616975792270; 
 Sun, 28 Mar 2021 16:56:32 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.56.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:56:31 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 07/30] iop-adma.c: Few typos fixed
Date: Mon, 29 Mar 2021 05:23:03 +0530
Message-Id: <a5e2587318ef5fc4e140caf86cfd89ff01027c72.1616971780.git.unixbhaskar@gmail.com>
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

s/asynchrounous/asynchronous/
s/depedency/dependency/
s/capabilites/capabilities/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/iop-adma.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/iop-adma.c b/drivers/dma/iop-adma.c
index 310b899d581f..81f32dc964e2 100644
--- a/drivers/dma/iop-adma.c
+++ b/drivers/dma/iop-adma.c
@@ -5,7 +5,7 @@
  */

 /*
- * This driver supports the asynchrounous DMA copy and RAID engines available
+ * This driver supports the asynchronous DMA copy and RAID engines available
  * on the Intel Xscale(R) family of I/O Processors (IOP 32x, 33x, 134x)
  */

@@ -243,7 +243,7 @@ static void iop_adma_tasklet(struct tasklet_struct *t)
 	struct iop_adma_chan *iop_chan = from_tasklet(iop_chan, t,
 						      irq_tasklet);

-	/* lockdep will flag depedency submissions as potentially
+	/* lockdep will flag dependency submissions as potentially
 	 * recursive locking, this is not the case as a dependency
 	 * submission will never recurse a channels submit routine.
 	 * There are checks in async_tx.c to prevent this.
@@ -1302,7 +1302,7 @@ static int iop_adma_probe(struct platform_device *pdev)

 	adev->id = plat_data->hw_id;

-	/* discover transaction capabilites from the platform data */
+	/* discover transaction capabilities from the platform data */
 	dma_dev->cap_mask = plat_data->cap_mask;

 	adev->pdev = pdev;
--
2.26.3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
