Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CF734C01A
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 01:58:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD8246E1ED;
	Sun, 28 Mar 2021 23:57:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 873B26E1ED
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 23:57:57 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id j7so8225948qtx.5
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 16:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rk0U560xdi7ATXezYweBgD2EUyZ4bnHBlHOPTcEoREY=;
 b=ZLnI2Hw3GmiFb+BW4FldFixdVOm0/gTAYYcPGeNweT29zSncqaCxQl2ULX/m3x6yjk
 FlPvPCq6g1oh13jD6EQyG1JSSdz9G8bm3HGZ2akxZG2GJMQ9BC7QedLKEm34PtSwYA9Q
 9GLpxWPlLC/j45fuB1CB2u0k+GONoOh9eOlRvew+eCtM4IXd3/dem3muwmJ2LGUvv9pZ
 rKataNLRCg25wm/swBsArGMvPBDO2BXQknOCELLoUmLYNgIAwbOCOSxAGx2PbdugPEc1
 E84l/Bt6cNoKU6NHkm/vCejz/HyOc3AwND0Z16aeHxg7CDZpOR9OV5YCqN3yJaJzc09z
 OoNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rk0U560xdi7ATXezYweBgD2EUyZ4bnHBlHOPTcEoREY=;
 b=isikyAb0rikjOIzpf2yD29t2H1mxdV2EpRPDuVF5675IgPCJqdqlMKmKokL/GRLsqR
 EhyrhY8lrySBTVKIbEyRY4YXiG4jKM7LUtrjiv48x209j9DwY6w7kdhs4/yU2Bkf6zuv
 HH3WtSKSxTJHh4W8j277cKK8TssA1JaFFbzZmuamRoSB+jMDWbI5t6Soxe7OEmjvlFN6
 kqgAoUslf6Ay2WSOqdhJU2ui7XN5ZTxEqZ/6O0/Bsz0cTq0Q+QXMg8YF45kP7oAoq0M5
 vhuCBKpSlzwGlg+lkcTOt6AchqzwjP5YHRFV9UPqA64O5JI8gdWvNtjPybNVZ8SFLplD
 fJjg==
X-Gm-Message-State: AOAM531OJltHE9cuQFh7rR4Ha94GWc+JpCNtZWm9F0XiRfrpjO+SFRLI
 Y4LkqdvOOi3oxRNA6hWamuc=
X-Google-Smtp-Source: ABdhPJzfb/lAvD1VavVqudcTSNWwFXh9v8R3VckD2GeZAMNUEqCjOYPLz+1Z1e0dwqaRcAS+cSxIlw==
X-Received: by 2002:ac8:7e95:: with SMTP id w21mr19593417qtj.244.1616975876781; 
 Sun, 28 Mar 2021 16:57:56 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.57.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:57:56 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 24/30] Kconfig: Change Synopsys to Synopsis
Date: Mon, 29 Mar 2021 05:23:20 +0530
Message-Id: <1262e9e62498f961e5172205e66a9ef7c6f0f69d.1616971780.git.unixbhaskar@gmail.com>
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

s/Synopsys/Synopsis/  .....two different places.

..and for some unknown reason it introduce a empty line deleted and added
back.

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index 0c2827fd8c19..30e8cc26f43b 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -170,15 +170,15 @@ config DMA_SUN6I
 	  Support for the DMA engine first found in Allwinner A31 SoCs.

 config DW_AXI_DMAC
-	tristate "Synopsys DesignWare AXI DMA support"
+	tristate "Synopsis DesignWare AXI DMA support"
 	depends on OF || COMPILE_TEST
 	depends on HAS_IOMEM
 	select DMA_ENGINE
 	select DMA_VIRTUAL_CHANNELS
 	help
-	  Enable support for Synopsys DesignWare AXI DMA controller.
+	  Enable support for Synopsis DesignWare AXI DMA controller.
 	  NOTE: This driver wasn't tested on 64 bit platform because
-	  of lack 64 bit platform with Synopsys DW AXI DMAC.
+	  of lack 64 bit platform with Synopsis DW AXI DMAC.

 config EP93XX_DMA
 	bool "Cirrus Logic EP93xx DMA support"
@@ -394,7 +394,7 @@ config MOXART_DMA
 	select DMA_VIRTUAL_CHANNELS
 	help
 	  Enable support for the MOXA ART SoC DMA controller.
-
+
 	  Say Y here if you enabled MMP ADMA, otherwise say N.

 config MPC512X_DMA
--
2.26.3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
