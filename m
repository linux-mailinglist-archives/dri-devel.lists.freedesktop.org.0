Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB5034BFE1
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 01:56:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B11C56E16F;
	Sun, 28 Mar 2021 23:56:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09C356E16F
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 23:56:28 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id c4so10939344qkg.3
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 16:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b+g6kPIG/jwFitPzoitjd4fSzc6P/hya8rywnHeMN/8=;
 b=HBBLF/SJTiVQWcLhNqq7bzpHR2fKW9LP6DWRvUsmYI7rcgdhmE09hx9CIxGfTsumKX
 isRs8nn27xIKkAFpC/ZbyFrFtAkA1tz5NS7xJ3Ovmkz+afQ30TBK5a8we2BRZXGgjxxr
 z6kTysKHQ1ynwBd9QItRNqLsEpW7uXvoTnvwnv8XkMp+fdf3Uuptl6dTZMalYNMRHWxF
 NM0QNQoHDeEh0fx03RO8xhl/6Q0tu1MW6TIguY4L/6GIaX3v1qxLcUp3UUYUodE+6H6H
 XAXaSfBSUy0AypaInMTUVAZebzJYkGqKi/dXcHv+x3xT9jmB94ueRb/JpcSu+XrxdLCF
 ALaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b+g6kPIG/jwFitPzoitjd4fSzc6P/hya8rywnHeMN/8=;
 b=kfnzdiLlOjZmgr/honODEr9YTqKqXLlhQE622GLBvjlbTItPieXPhWXFQ7Ee/O8CRn
 D9iYyUeJ42CcVvjUU5dzrCYvVAIXvJOcgf4Cum/Z8+41rxoM8o1RZVtNSZQvwTWbaxkk
 5tHxxl/JvhnrSSJOCB1KB9nX/fprM+s4npeZrd/fSLBkPS9Lu/aNA8VtQNN2faTXCu2F
 jkriyXnyDDV5+Kn6SirWKpHZF3nYF9oV4eJiKfE6Hq9aDqbDE9uDNq/BL//Zj7MpmOiF
 1qHkwHUZrmD3lGdf3EiYNGp2WWtNXxatAj9ePBp/4SqKKhoSB3T6QnjF9T0e0Vv5A+xa
 wJCQ==
X-Gm-Message-State: AOAM533sLeyAb5fd6MjZQA6HcHAEIzmdDaLbbuidktgwGK4Vvn/9bqHu
 tsizq9N49U/sa9xMwEUw384=
X-Google-Smtp-Source: ABdhPJyldMxvnEBh7c5nmTQttLQPp8mr5BNjSHH3pinXqHmSCm2R9IbveYuxti7c4ebHxEhEJg5Pcg==
X-Received: by 2002:a05:620a:cf4:: with SMTP id
 c20mr22555044qkj.134.1616975787315; 
 Sun, 28 Mar 2021 16:56:27 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.56.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:56:26 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 06/30] idma64.c: Fix couple of typos
Date: Mon, 29 Mar 2021 05:23:02 +0530
Message-Id: <0e722d154cb5b29d8bad59481e74fc4853ee930e.1616971780.git.unixbhaskar@gmail.com>
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

s/transfered/transferred/  ...two different places

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/idma64.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/idma64.c b/drivers/dma/idma64.c
index f4c07ad3be15..3d0d48b12e28 100644
--- a/drivers/dma/idma64.c
+++ b/drivers/dma/idma64.c
@@ -282,7 +282,7 @@ static void idma64_desc_fill(struct idma64_chan *idma64c,
 		desc->length += hw->len;
 	} while (i);

-	/* Trigger an interrupt after the last block is transfered */
+	/* Trigger an interrupt after the last block is transferred */
 	lli->ctllo |= IDMA64C_CTLL_INT_EN;

 	/* Disable LLP transfer in the last block */
@@ -356,7 +356,7 @@ static size_t idma64_active_desc_size(struct idma64_chan *idma64c)
 	if (!i)
 		return bytes;

-	/* The current chunk is not fully transfered yet */
+	/* The current chunk is not fully transferred yet */
 	bytes += desc->hw[--i].len;

 	return bytes - IDMA64C_CTLH_BLOCK_TS(ctlhi);
--
2.26.3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
