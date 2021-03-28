Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC6F34C019
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 01:57:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7FDC6E1B3;
	Sun, 28 Mar 2021 23:57:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F07B6E1B3
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 23:57:52 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id z10so10909068qkz.13
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 16:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OMl5ABdwT5DW251I71t3DGinXKhKaq9NsZyTNddHa8Y=;
 b=Rfss4m+DyBLiE2rmvTbB3bLpSu6ljCMgZGJOXL83UY6K7+BOdjg+SSTq8kZaDOEWv6
 rx5iy/w5SOioRKCzTUe3BxyBWYWNrSBKtsFvhFu4XL0OlvsW9PoKO+DxXiWW6St0mTR9
 lTFd+lCy7V8ZkBLrnBlXt3hupR2eaF94TvrXIfIoOxKabz+84KeSvhAaYQ/pLT5rJS9T
 zXOMfY/jZWDHi6IcDT8yRNlR1FPQ+kTzxyWI7467K+gS18rtBl3iSz8m8HbJFMcf4hvI
 qKjsig+kI9u18vColYKr0q6VTUM4wM5tQPrC3qFE9KxeKgm5rGQt7CVWSbQ9fEJeDkEW
 Pyrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OMl5ABdwT5DW251I71t3DGinXKhKaq9NsZyTNddHa8Y=;
 b=jQmCyog68ydabB+8QMjwg4GJCGaaRZwSr7M0tE/OP7vWo3IbtoIYnyUIPrVHNf/zYa
 AnByLGm0sogOSimk1PG1gYSFFug0aCyqTpChNxx/PyigWZP26lvFRc2rJqvT8T2F4XcT
 sP2bGT8dkrkfwCjdbaUsCDZUZUcxsZIsZlEzcc5IeYGxKbvjNGBTJELpQr8LYt/OfMnO
 m9oluHczbLj3/r6fCUjLePUj/ccj8J/BYL42fw2tgbPtEt5m/gg/NnFd/d6l70L5+H4L
 dzftGD4NqKWZF3i2oqYLa86w7d6zjBl/07uKlhoE9NSxJswhKGLvuAphxOfMYBV1cJPR
 cNQQ==
X-Gm-Message-State: AOAM5312YTgAneKg21fV+s1XiPwpy9+KYARo9ufV5JafMx+PsUqBCGkh
 SdEsdPk+OOkgYSaFEyHZY+c=
X-Google-Smtp-Source: ABdhPJxStwmIthIUA++khUWtx+qx1BVfAS/jMvDgsTU1bqiz3K++ChYbHlJMBeZAq5/maT4/buJuaQ==
X-Received: by 2002:a37:a147:: with SMTP id k68mr23143111qke.66.1616975871664; 
 Sun, 28 Mar 2021 16:57:51 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:57:51 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 23/30] dma-jz4780.c: Fix a typo
Date: Mon, 29 Mar 2021 05:23:19 +0530
Message-Id: <ecd961a789c07f2c6a05330688e084547e78c191.1616971780.git.unixbhaskar@gmail.com>
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

s/proceeed/proceed/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/dma-jz4780.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/dma-jz4780.c b/drivers/dma/dma-jz4780.c
index ebee94dbd630..451bc754b609 100644
--- a/drivers/dma/dma-jz4780.c
+++ b/drivers/dma/dma-jz4780.c
@@ -379,7 +379,7 @@ static struct dma_async_tx_descriptor *jz4780_dma_prep_slave_sg(

 		if (i != (sg_len - 1) &&
 		    !(jzdma->soc_data->flags & JZ_SOC_DATA_BREAK_LINKS)) {
-			/* Automatically proceeed to the next descriptor. */
+			/* Automatically proceed to the next descriptor. */
 			desc->desc[i].dcm |= JZ_DMA_DCM_LINK;

 			/*
--
2.26.3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
