Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAD02DDFD1
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:33:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B07A389CDE;
	Fri, 18 Dec 2020 08:32:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C05A6E3AE
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 12:31:06 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id p18so8631203pgm.11
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 04:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZcXeGJJMM5OnozixyGJRr6W72s9oCpGnZVP+dO6FDqI=;
 b=hRhRpnDuKp4PB5JZZW2jLmbSfNCbvNH4LiF9ILPVPsdlBFbGmZwQCpt4FZXr1/f/g2
 tFBXcdaQZfgVXLrwXwGYMDPHnvBam42sJ2Do/EeWQ1ddSpkdLvWg8bDWbGJ8M9n837R6
 LXLB+CaLKdyUzxVGsk6+a4fRSZVCpVcNw4V7c+1X88ARHHBbQKdf+E4vRRmC4XqY3Pmw
 40PCdCkWomb0oa+kPpVdeeimdwFt+a9kb7Py/bmvHA/HT4Ftf6rJNjfo2wJNRPTTHzuh
 znMxJ46KsnTzYD1SRpHefrp8Av3u5Ia8hWeTTdLCTW6rF3lGjDjJ5HX+IOHrNFDMAmwm
 bNKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZcXeGJJMM5OnozixyGJRr6W72s9oCpGnZVP+dO6FDqI=;
 b=obyKAggbgEh2mMYHyR+qcUHqKg91lId+S457QfW3qqL4UJNQfuYCel7ZH6g0mIb8rL
 /GKCW8YSx9yrjD/Z16hDq71d6hsZTGXtoYAWSZ4seGWW0N9DFRYm/0N692E/t9A5G0i1
 y1UWh+hFryH8NIJAgNQWXgMgaihzmyiwlZBdL/eKSmucpFgXSASqfS7kQb2hWy9AKzCz
 T8iwfNQA9UULm9Y44V4uwoKBHU3kkUljhMXlHOLWAaNwpC8rIjwuEZbGQ706W0MPRhT+
 +jy/8e6Q6mpRELaru0uG6EM1/AKRfn6TjqkCEDH64xOpKqafHRT/ZAVHjs1Z3Glv/Q6H
 22oA==
X-Gm-Message-State: AOAM533JqveIqUI37s6b0Hj0wTXhMCofdCxb0duywVS0jD+l7M9Kk6P9
 oZ8qOcIHEeJDAp4FeEiJh28=
X-Google-Smtp-Source: ABdhPJwrN+TGqwitW6OzLtn7nzPccO8xU68OD4Xob+uqCOWc5V6ZJoPyLWwPttbytZl6+2HIg7U3hQ==
X-Received: by 2002:a65:6a53:: with SMTP id o19mr7051111pgu.212.1608208266108; 
 Thu, 17 Dec 2020 04:31:06 -0800 (PST)
Received: from localhost.localdomain ([45.77.13.216])
 by smtp.gmail.com with ESMTPSA id x5sm5044692pjr.38.2020.12.17.04.30.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 04:31:05 -0800 (PST)
From: siyanteng01@gmail.com
To: Sumit Semwal <sumit.semwal@linaro.org>
Subject: [PATCH] cma_heap: fix implicit function declaration
Date: Thu, 17 Dec 2020 20:30:53 +0800
Message-Id: <20201217123053.2166511-1-siyanteng01@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 18 Dec 2020 08:31:48 +0000
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
Cc: linux-kernel@vger.kernel.org, Liam Mark <lmark@codeaurora.org>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 siyanteng <siyanteng01@gmail.com>, Laura Abbott <labbott@redhat.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: siyanteng <siyanteng01@gmail.com>

When building cma_heap the following error shows up:

drivers/dma-buf/heaps/cma_heap.c:195:10: error: implicit declaration of function 'vmap'; did you mean 'kmap'? [-Werror=implicit-function-declaration]
195 |  vaddr = vmap(buffer->pages, buffer->pagecount, VM_MAP, PAGE_KERNEL);
    |          ^~~~
    |          kmap

Use this include: linux-next/include/linux/vmalloc.h

Signed-off-by: siyanteng <siyanteng01@gmail.com>
---
 drivers/dma-buf/heaps/cma_heap.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 5e7c3436310c..3c4e34301172 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -20,6 +20,7 @@
 #include <linux/module.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
+#include <linux/vmalloc.h>
 
 
 struct cma_heap {
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
