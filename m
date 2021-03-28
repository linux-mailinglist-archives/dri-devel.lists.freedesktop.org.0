Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A2734BFF1
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 01:57:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9F3B6E196;
	Sun, 28 Mar 2021 23:56:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE91C6E196
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 23:56:57 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id 1so7585251qtb.0
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 16:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V731M1ZjoMObeUPxmfQu760ZEmOVyQS5nvVKDsMpRYg=;
 b=lnZVGx88/Q4RgjL+3hIrxaeLUCknaQO529y1KHYklW+L+nkdj8gpcbnqm8dMc1/+l7
 f6zSHAW3lnPCPRE6I8Y7+qD6NhajFTxCnWDjvRqS+5YTVtxG9RfzFR2gppG6pd2KUONg
 x2Ypd6MdyYMDQxXuVr9h1defti29sytWbU8Ue/Li0RmO+WBaY8GzifXSi3Uzw8ctplXy
 6TXDeusuFr4d4znZtig85zoIyEx6i/oXnzfPQNVFdJWRikFvX9A33V/ZVXPGGkcr9CJy
 RJnXtSxeb6weKiUSJ+4jqKEIqqXxCR3aOs9fIwYirSfoCpnld2ZyldI5xWdSpa4LevUr
 PhOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V731M1ZjoMObeUPxmfQu760ZEmOVyQS5nvVKDsMpRYg=;
 b=JVr4po3wferHqEUL3qf2lVGlyZ2XDAGf38zIj6KDVkHzu2fXiSltxs+RQ+T26JpZf5
 s5Ojjp8KHYSxFwoEd7UCelAGnTJHRC0cM39oftCrfLD+fe1frd/4lhFXqcY9O2kqHZIs
 vr3iIplHS/+/S49Dm0CcUWMLsrjvKl/GfoolQjS/npnwtGRAel2K/SZtNogAH6r4gQjw
 aJZXdkRlwhmOponK4Bp/M4ZI3CDLnh8ZoHtf0jL2OtEYOg3/GYd4I8M+rgsTgWfl0UoI
 6WhgDCZQrVGXgVlELy4iGcBklr9foZ0xspWwPO71DuErojMBEvPc3Ier/8Slj6bZBw8I
 38WA==
X-Gm-Message-State: AOAM531qbE4PBGqosJa7dNPm8IyomzLXrGJ/eNmgh70L0Mhj52TVSpQ9
 dQ07mxOZ3tlb8Itubyek5L4=
X-Google-Smtp-Source: ABdhPJwfkmcNQYJxn4S9wN8jOvwQsIXVBRg1ipQrCtKoJ4PNJU1NU5IafcNZI5PpJzjZHpA0d8+z4w==
X-Received: by 2002:ac8:1098:: with SMTP id a24mr20071293qtj.291.1616975817116; 
 Sun, 28 Mar 2021 16:56:57 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.56.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:56:56 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 12/30] of-dma.c: Fixed a typo
Date: Mon, 29 Mar 2021 05:23:08 +0530
Message-Id: <0c3e1bd83c63203a0aad27006fbd369090a69dce.1616971780.git.unixbhaskar@gmail.com>
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

s/propety/properly/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/of-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/of-dma.c b/drivers/dma/of-dma.c
index ec00b20ae8e4..e028acff7fe8 100644
--- a/drivers/dma/of-dma.c
+++ b/drivers/dma/of-dma.c
@@ -337,7 +337,7 @@ EXPORT_SYMBOL_GPL(of_dma_simple_xlate);
  *
  * This function can be used as the of xlate callback for DMA driver which wants
  * to match the channel based on the channel id. When using this xlate function
- * the #dma-cells propety of the DMA controller dt node needs to be set to 1.
+ * the #dma-cells properly of the DMA controller dt node needs to be set to 1.
  * The data parameter of of_dma_controller_register must be a pointer to the
  * dma_device struct the function should match upon.
  *
--
2.26.3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
