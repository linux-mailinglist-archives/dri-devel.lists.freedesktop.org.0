Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D3034C01E
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 01:58:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 069FC6E3D6;
	Sun, 28 Mar 2021 23:58:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C2A86E3D6
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 23:58:12 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id l6so26659qtq.2
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 16:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EUGFgtZenGoQf8Uh4RGUdvjnZZYLeMJMHb15/4oeJgc=;
 b=mj/G1xfMN+eBi/mLaJKBCfkPK76TC91NulrZ5Jz6MjHvD1+9uv4rw5JIHWY6jJMkPU
 juBqy15jPxnjEZz88LM7f7n7mKB7TmDWozu6QfjYOf5cdeVB6jvj8YF2JK5SEbaWCtcr
 SLVpipsP8ug8RvIfOCigIBCOOkbSMY0mM8tlHsQ75zbmLFit+2cyQzvlDBSCB3LGSGbV
 pShlkMne+FQekElXhc22p72UjnAWEnoe2D3MPu8Z7RA503hwCfuXky3XJCDO45tC2vxK
 Ir37Ajvmz19yu5bi6jM78kpp6GrDyAnXm5bDAKqUzMmt+jw56iKxC+d1WcuHS2QwjAoe
 bCAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EUGFgtZenGoQf8Uh4RGUdvjnZZYLeMJMHb15/4oeJgc=;
 b=CwUhY1vE7YjW1IMKhM3uYR9Qz/aSH6YZiACZy9YajcrH/1nv7kaK2P2KjEeePBe58r
 St41XRdb0n4tnmlXb25lfGx1XUi6gBPGZxAvrHqaxSo1lMpIUzqfNIWiCOyPpEyZnqaV
 u/6y9SiFam8aDshjYHbdJvonDpGK7FQs6SM02kGe92zpjLy0z4QCvUkpsVOt2j+Wnu68
 YTEgGRgijRk6QodUI0Ae6GcmjPh8ptarz+RX2mbiFaERxWHvGZ59jvAbqLxdXmf3mvD7
 UMSjcaeA5R5NQBiDRJj0a33ChLM1IVmawTtyGFfKGWt+ClhXQQ9wjfaxyszZKNFbX18g
 Ztrg==
X-Gm-Message-State: AOAM532kBoF3MBar6LMtCgtMI6k7NStTYnZyF+IJCeb71ZSyl9bFo0ru
 wuTKA9oKX43n0UyIl4fP4mg=
X-Google-Smtp-Source: ABdhPJw5YfqSr8OAZoUA56+SYw5JOagX/iPu+fij/qaA6VDbAiygjX2++C/zuL+4UodiHI2nu1SuPA==
X-Received: by 2002:ac8:4799:: with SMTP id k25mr1974600qtq.319.1616975891846; 
 Sun, 28 Mar 2021 16:58:11 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.58.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:58:11 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 27/30] dpaa2-qdma.c: Fix a typo
Date: Mon, 29 Mar 2021 05:23:23 +0530
Message-Id: <75bdf547b024ece2e35f6e83e51101109ae46803.1616971780.git.unixbhaskar@gmail.com>
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

s/contoller/controller/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/sh/shdmac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/sh/shdmac.c b/drivers/dma/sh/shdmac.c
index 5aafe548ca5f..7b51b15b45b1 100644
--- a/drivers/dma/sh/shdmac.c
+++ b/drivers/dma/sh/shdmac.c
@@ -319,7 +319,7 @@ static void sh_dmae_setup_xfer(struct shdma_chan *schan,
 }

 /*
- * Find a slave channel configuration from the contoller list by either a slave
+ * Find a slave channel configuration from the controller list by either a slave
  * ID in the non-DT case, or by a MID/RID value in the DT case
  */
 static const struct sh_dmae_slave_config *dmae_find_slave(
--
2.26.3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
