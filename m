Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4458634BFDE
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 01:56:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60E126E118;
	Sun, 28 Mar 2021 23:56:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DC726E118
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 23:56:13 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id y18so10893594qky.11
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 16:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QaFxE7xJjw3q1QRzUlhL9vl2FAXABYAZdUNglx88dWM=;
 b=jp01Oafr+FYiNYOySvz698WmMQzo+I8B2paqvCFTlCTqcAAL37CMJwgpqQlkW5GHW2
 Dyvbvs+rlqMjPWQuuNHQDuAQ6uVGfCqAuD3H7xHGEPAJOWcAGOy/DrtrhvXYWLU0436d
 lVRkCgJp9jS4fhNJ0qaUC4akHDDGxNg25koKauz70I2VYZQOmotGc6b2/KGof4mKY6LW
 1TzvIv956J7EIBeJBzXRcahb54ThW1Yu5eyDfY18Lpqxxr6dAulMcI1wQw2QFXiQ3c2q
 Ui+ZEYtPOnzUjWjCc71Rex7kRCtuOwcEjgmEOD0DPvlk4vA+pudWfMcYnjP5m3D1ev0S
 YKbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QaFxE7xJjw3q1QRzUlhL9vl2FAXABYAZdUNglx88dWM=;
 b=qifclXIU5w+V12dQE7Ok9V16si8r4DsVxcUIw3DEpxCbeuXZ5VjRFKuCS0euWZv+6Y
 w/JDFHI8aDFxkGTbwqQSxYPmyRK0osmv9EP0b8keuuFbkgbfCub1X0Uw4xLR2mPwEqhv
 l13vfHPOpz8qndgpnG5OgR4TkzOyknv/BMoHyGyMgoLcatlP7ROGsXBhCPc2BXMBgEpZ
 hNoL1AFnHcEcJezZk6w9T1XHmNLnPiNgvdxZkhwxSG+gl64GmB59GzIV2DY7sKydbyLK
 nuI2AeM0RS64lOmSSCiMYYfgw9qo7oip7bLCRu4TIdsDqF6G0DvN28gl8OVUTWLhcjfd
 hwKg==
X-Gm-Message-State: AOAM533//F2JHu4yTeZK/AXivmS5cLfjQSUo0ZEf+7Yx9N8dJRRT0ENb
 b7BXr3C0AVb+h91rAjqHq7E=
X-Google-Smtp-Source: ABdhPJx0o599PHMcyxzLn8eHnK8YWRJh3bbcuBhN5MPJAY682L8sA466e6YWGWWwK4DIft39eFQPyQ==
X-Received: by 2002:a37:e110:: with SMTP id c16mr23323591qkm.67.1616975772640; 
 Sun, 28 Mar 2021 16:56:12 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.56.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:56:12 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 03/30] amba-pl08x.c: Fixed couple of typos
Date: Mon, 29 Mar 2021 05:22:59 +0530
Message-Id: <b96052cd5c14956852fe7fc13ea47dac7b2b40e1.1616971780.git.unixbhaskar@gmail.com>
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


s/busses/buses/
s/accound/account/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/amba-pl08x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/amba-pl08x.c b/drivers/dma/amba-pl08x.c
index a24882ba3764..d15182634789 100644
--- a/drivers/dma/amba-pl08x.c
+++ b/drivers/dma/amba-pl08x.c
@@ -121,7 +121,7 @@ struct vendor_data {

 /**
  * struct pl08x_bus_data - information of source or destination
- * busses for a transfer
+ * buses for a transfer
  * @addr: current address
  * @maxwidth: the maximum width of a transfer on this bus
  * @buswidth: the width of this bus in bytes: 1, 2 or 4
@@ -1010,7 +1010,7 @@ static inline u32 pl08x_lli_control_bits(struct pl08x_driver_data *pl08x,
 	/*
 	 * Remove all src, dst and transfer size bits, then set the
 	 * width and size according to the parameters. The bit offsets
-	 * are different in the FTDMAC020 so we need to accound for this.
+	 * are different in the FTDMAC020 so we need to account for this.
 	 */
 	if (pl08x->vd->ftdmac020) {
 		retbits &= ~FTDMAC020_LLI_DST_WIDTH_MSK;
--
2.26.3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
