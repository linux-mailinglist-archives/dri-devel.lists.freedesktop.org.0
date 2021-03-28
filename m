Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 244AB34BFED
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 01:56:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44CE26E17D;
	Sun, 28 Mar 2021 23:56:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03E6B6E17D
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 23:56:43 +0000 (UTC)
Received: by mail-qv1-xf36.google.com with SMTP id iu14so120676qvb.4
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 16:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rruIrfqaU4LV0f/3DETW92os/6jYETGIbvTMrRY/HO8=;
 b=bGnHyBFVOutt4P2ONnjyaSIeJvIRzETak6KwFJ7ir2Nn/GqZgVtFuQhT8cWFVCJCF4
 nOmS5/3lsk0F21Pui0C1nfch9n42xfmm27QVRq2RUbd469ITaO2YTyoT6yca1dt3kEIA
 WrrB+5zNMv5REpdJe2JR74UmZr5+PTYnt/XmXcfAg0fv6Fy7GCSeRicj7d/SVnq3Qu/D
 UKRgx0ggNDlvFtQyqwIWq00SNVHxRapkrohVs+rT8HcJE0cam15uS2VWEv/I+wPd8Sx3
 oxsNNTD4FAJ8DW0fVQi+ybJ+sHJ776F4pG4SBgFnsTZUI5HwctVd0uJCZQ7w/2oBe12l
 xa9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rruIrfqaU4LV0f/3DETW92os/6jYETGIbvTMrRY/HO8=;
 b=HNZ/oSoffSCJSdvBX2xBgTkT1q8tdYZBUeE8JTxNrPdEGao9f0NaxH809NUX1ZAnhg
 UvUnqwGRCRS9RJFBdEQukSi04cU3zNqcVWKIz/LJ6FDUg6twWS8AbQITsTlDRXtwhUV/
 cAoU/bHsRpNGQLHVQfbxuHPWheTv6FIJUKQfyDcKz4lO89KUTzdKM2FtDG8HK+hyIpHM
 vDfWM0q3kLhxEi7T7H+9Lo90UWULuvcsMGyinf9QVO05zfLqXSfy3Mp+Y870jM9cOiJ+
 IJGn762w+zsfQdNwf6YaurJLw8Y6JBamyxePLlJ4q054Nw8nOShgF6sCdVxHYpn+vLR1
 fmMA==
X-Gm-Message-State: AOAM5327GTtjEF70SXbz/1OznzefN8NS79PZ3RYBMoILgha4SA0bpS5T
 eXvUFYcEETeptKuImZVskqg=
X-Google-Smtp-Source: ABdhPJwGtK6xTmnuLSPnSFT/2CTh7pV1MaTzw54JyGs6QVwUBLmi4sfOAtAfjo+zm2N6Vm+LRKQfow==
X-Received: by 2002:ad4:5614:: with SMTP id ca20mr22679724qvb.37.1616975802324; 
 Sun, 28 Mar 2021 16:56:42 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.56.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:56:41 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 09/30] mv_xor.h: Fixed a typo
Date: Mon, 29 Mar 2021 05:23:05 +0530
Message-Id: <c7ff7a7dbd93aecfc5b97f55a3ccaf23fd8a7c6b.1616971780.git.unixbhaskar@gmail.com>
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

s/writen/written/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/mv_xor.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/mv_xor.h b/drivers/dma/mv_xor.h
index d86086b05b0e..c87cefd38a07 100644
--- a/drivers/dma/mv_xor.h
+++ b/drivers/dma/mv_xor.h
@@ -99,7 +99,7 @@ struct mv_xor_device {
  * @common: common dmaengine channel object members
  * @slots_allocated: records the actual size of the descriptor slot pool
  * @irq_tasklet: bottom half where mv_xor_slot_cleanup runs
- * @op_in_desc: new mode of driver, each op is writen to descriptor.
+ * @op_in_desc: new mode of driver, each op is written to descriptor.
  */
 struct mv_xor_chan {
 	int			pending;
--
2.26.3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
