Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EB734BFE0
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 01:56:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F2B6E12B;
	Sun, 28 Mar 2021 23:56:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E7B56E12B
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 23:56:23 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id c4so10939238qkg.3
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 16:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z1jriUq1sL9lb0mtxN9KbapTjAFOd4HdFdy/Egjy5og=;
 b=rGFcWETJr6kx1FhK2VwuyFhj5mEQ2a9w1BMQGwfNSg69VWO2NHz6DRFrgg4SGJ3Z+8
 +nckc0b33f7uTjbCD27I2Gl2Jdn2HT3qvcYJdS4WPW1YXJNFE46lhkK9BighwwVM7M6Z
 sbmrrRJH2t3VrRNWQZyiWfEew9FMNFhk6Zl5kKcli7J7b4abKENXJWSILGRJkqUTX2+t
 WHSb9X1FAt5JDH4q/BeU5ocKsg/w33VbP7p3+NQRcRhAMcotq7sULiWyjAlOYf/mHOqB
 H9GvMPiPug0qb8cAXChS8dbpZy4uTWPDejj82uflrDF2gz/fTxAhbelewAFroVWE3qew
 2RaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z1jriUq1sL9lb0mtxN9KbapTjAFOd4HdFdy/Egjy5og=;
 b=aHIcGXeelpd61WeXdJsraWd8X2rHcFHpCnPCOGBpUx2PUsdccRELU41mx5Y5C3BduW
 sgffidnsxKBBE2eY38AdaFxPN1MQz5BsRY5Mmre8sQBBHgQ28RYlmnor2D37n6E1Bilx
 P8PDs7UNDFAMOkD3gC8w9YvHsK5eFtdPZ5tF4nz99nOENKr10JI0KDnSPYr6IiWHX0jq
 ltjRwuwEdz2ohMUWTPhjxsvc4I1lBMA6dnU5wOtlKmLcfRrrzB0H1IpvE1IV/qeSJ+YO
 Pe0LDCKeHh1lP7tz1Tkr3dfOVZCZodl5unOuSnwXi90qhxH9A+qnDlny7ppPKc+6/bF2
 wCzQ==
X-Gm-Message-State: AOAM530Q43X92TYKfaT11QWRoKTA0UTDVSfZyj4/NTVyzP/Jv9KClA8r
 jNced6fsNrH8e126YJd1D7Y=
X-Google-Smtp-Source: ABdhPJyKy/81JUq/KZUC1NO8pklpNrg2DlDqj4i3GsKGyS2IOzo8E/4XiQGvp7DS8QS7skiReIXQZA==
X-Received: by 2002:a37:584:: with SMTP id 126mr22223976qkf.274.1616975782447; 
 Sun, 28 Mar 2021 16:56:22 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.56.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:56:21 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 05/30] bcm2835-dma.c: Fix a typo
Date: Mon, 29 Mar 2021 05:23:01 +0530
Message-Id: <77d89989f1cb7362f0a3a5a279d7846a93ae3968.1616971780.git.unixbhaskar@gmail.com>
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

s/missmatch/mismatch/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/bcm2835-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 630dfbb01a40..e6baf17b0434 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -369,7 +369,7 @@ static struct bcm2835_desc *bcm2835_dma_create_cb_chain(
 	/* the last frame requires extra flags */
 	d->cb_list[d->frames - 1].cb->info |= finalextrainfo;

-	/* detect a size missmatch */
+	/* detect a size mismatch */
 	if (buf_len && (d->size != buf_len))
 		goto error_cb;

--
2.26.3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
