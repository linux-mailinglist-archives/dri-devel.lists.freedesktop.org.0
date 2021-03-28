Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2791C34BFF2
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 01:57:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27FB46E1A4;
	Sun, 28 Mar 2021 23:57:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6E5C6E1A4
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 23:57:02 +0000 (UTC)
Received: by mail-qv1-xf2b.google.com with SMTP id j17so5676978qvo.13
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 16:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FMNLSlxwy2hAf90gVAHPhiZXHLhbd5qd+n04so3vi0M=;
 b=S8oWEVWMQA7uyNstiZ8vX8xPHLZ0pxra5NLEFFZff7GHfczcuqdPPb1f9FK0XzIuvO
 UzPWul+6fG0QPP5gDQ9IaF5Yimdyc8s/NTyczspVuP9t6SHX6y9UJJ349vESDcVPS68s
 QG5EZ5U5urbmsi3oZ/Xw4TctbB7C20H3xQqhBrA3M1pIYkme4Az2wgoemWBDm4zIM2zF
 S8l8tp27O4LScLIVSPnMu2Tfen8wh0ESoi1br6sQSJgBhywsNStX9yRrFEgJENv3xygU
 JXHw47iftiDyBqQKWUlu3oja/xrWp3CtSbiiUCvlFQoi58veqOhE8AgD5AdpIpuoEvAz
 yjQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FMNLSlxwy2hAf90gVAHPhiZXHLhbd5qd+n04so3vi0M=;
 b=r1YPx+U8M6xAoloc2xDkx75zOEjaDrcRRHL1yiNJbuwsqEd8iTWruPnHO+sT64fdHt
 FhgIZ7ahjQYM7L62ytj0a7XXhQUwHvVK4MeJ67HKo8d2G+Z/Gu8Z0Luvq28HvtU/UTX/
 Oz2kaFZou/SPCWNahGyo6uMPE4zkHC3cOldhn/TXMXXtsJAcjwAmlvsgJvfF9jp04VyY
 OT6zzCwc+kGfeKdGRdm3X1q+TWYJnwEhQp3i9WfIx7zGCAJSYzyAhgX6Zm5vN02kappV
 ddMCZPwPg41sOyrgA/3nDHaIgNWfA1wZ2L5lmZ62mQj5liGmhtySdoSfwJP0+fthXw80
 hobg==
X-Gm-Message-State: AOAM533FIwd00prBk0iscoSzH4oBCveEoL2I/QzuK6pKMMlv2G+8F/Cg
 crjzVsSDAaFoFW9Spz3mYEkAN4K4A1+kVv71
X-Google-Smtp-Source: ABdhPJwu7RyqQ3LrL1DwSFaqoUhxFcpLYWZSK3o023jDzT66goaZiw5ZvrOEYhVFXl/O/Q9wP43hfA==
X-Received: by 2002:ad4:55ef:: with SMTP id bu15mr22954074qvb.46.1616975822090; 
 Sun, 28 Mar 2021 16:57:02 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.56.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:57:01 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 13/30] s3c24xx-dma.c: Fix a typo
Date: Mon, 29 Mar 2021 05:23:09 +0530
Message-Id: <a2ddb8aea8106bd5552f8516ad7a8a26b9282a8f.1616971780.git.unixbhaskar@gmail.com>
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

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/s3c24xx-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/s3c24xx-dma.c b/drivers/dma/s3c24xx-dma.c
index 8e14c72d03f0..c98ae73cdcc3 100644
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
--
2.26.3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
