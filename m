Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E2C89BBE3
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 11:38:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F97D10ED94;
	Mon,  8 Apr 2024 09:38:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="tSyN0zY7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA2610ED94
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 09:38:16 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-a51d90def9eso70418666b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Apr 2024 02:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712569095; x=1713173895;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wKnYVxHG6Ypqd9VKY8Y3OU7R3wT68BUjHb822YWnywA=;
 b=tSyN0zY7J7ircyyG0ijWmv9wdmWGw1kf1iwpU+KITMFp27UtjFQTyLuKAGyyZdVraP
 H57CnrF66W1d2xhArk1uS+LCNQmmWtGnq5/uqC857O8wK9/L5QodceHJQEhsO1PcCbqc
 3p+XA/ArWS5+mt9rOyaDiT343C1ziNvf/+rsNQBUau+hE27w3zCrbACvreLmu4eJkkiH
 KluSH5kXdbrlYxMYvl4y85bLm+ZmBzyjoOQB33Zk4Qdbz1CQIee3srxIwf1oKiO77X8m
 ezlDSDBZgjWHaN063NwDRMDwwlV/hUrHRP1M1LBF8eDFl3HNgqrTyQ1LnexLe4bBiR2H
 SZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712569095; x=1713173895;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wKnYVxHG6Ypqd9VKY8Y3OU7R3wT68BUjHb822YWnywA=;
 b=Hu5Uhe6LJcmaufys8R3q7zA6H+qVxvlS3Lbj6BoApXn4EYZ8IfIHTxXch2vTDnqu1l
 7lRDzR9uDAGjQugbEK3E49OAO80RexkrcfthQlgq/s51ErxlCHk2yxHOtWA0Z/1yYYVc
 MX9s4m/feYcYO8fv19N3tKH0qmomrpEH8kO8pjrsDZDNKKSowNp2E3DexHaWYDWJ59q9
 0wQADZ7dCS7pSpnjfEkS/kRtZqvdOXfCnq7Yn+imLYox98rjyobLn9OjnOhHuB9P06Oi
 xc4rGxd36WDOMCiBc3bEBuis4zhBZ6TRjAlPrmgJHQ58CNYKbA4wSXtFpUPjHJ1vFfzW
 hx8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCto6FO/nB11OcGWztDapO6f3lVDSRTbp7xYtl2cxLSZ7vmiQ9JOi5R42AJDGIGSYf+dRZUD7oqd71ZNTKLj+2zT6/9ZSIPYk61sQfEY/o
X-Gm-Message-State: AOJu0YwXHeL9sQOcWXqYO6it8+TehjHy7yrwPqNIyoaLT3wQjdCXrOcV
 NZHLN2FHA3Bgy9IrJE0ZbqTvgHtO/bJjm4AXB+elMBG9J3elT7Op2t8qjE2lQoc=
X-Google-Smtp-Source: AGHT+IHgl+gOBCC18ARiTO3fEThbY4OkUyNz4i7KX80xwmn8UN/J5ysnLiL+7vakmrwgfOE5pdl2/Q==
X-Received: by 2002:a17:906:c29a:b0:a51:b463:6b62 with SMTP id
 r26-20020a170906c29a00b00a51b4636b62mr4084293ejz.55.1712569095151; 
 Mon, 08 Apr 2024 02:38:15 -0700 (PDT)
Received: from [127.0.1.1] ([84.102.31.74]) by smtp.gmail.com with ESMTPSA id
 ne6-20020a1709077b8600b00a4e5a6b57a2sm4175803ejc.163.2024.04.08.02.38.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Apr 2024 02:38:14 -0700 (PDT)
From: Julien Panis <jpanis@baylibre.com>
Date: Mon, 08 Apr 2024 11:38:03 +0200
Subject: [PATCH net-next v8 2/3] net: ethernet: ti: Add desc_infos member
 to struct k3_cppi_desc_pool
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240223-am65-cpsw-xdp-basic-v8-2-f3421b58da09@baylibre.com>
References: <20240223-am65-cpsw-xdp-basic-v8-0-f3421b58da09@baylibre.com>
In-Reply-To: <20240223-am65-cpsw-xdp-basic-v8-0-f3421b58da09@baylibre.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Ratheesh Kannoth <rkannoth@marvell.com>, 
 Naveen Mamindlapalli <naveenm@marvell.com>
Cc: danishanwar@ti.com, yuehaibing@huawei.com, rogerq@kernel.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, Julien Panis <jpanis@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712569087; l=3592;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=egsyeRYCkGmNZpNd4TFDJy0XrmDqk+g4czEF0/FsO7g=;
 b=EZWf2Dw1rLqJZCiv70aLLxj8z1Gtfoeh3NwBjUbr82+Ic+2uVOIbqWQyYlOfAKdNRJ20yticv
 2WUxdg4OoUOC53dXGo6QsqD4OWoGu7P4b1nBE7uz2zXxD2EYb7qfdcg
X-Developer-Key: i=jpanis@baylibre.com; a=ed25519;
 pk=8eSM4/xkiHWz2M1Cw1U3m2/YfPbsUdEJPCWY3Mh9ekQ=
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch introduces a member and the related accessors which can be
used to store descriptor specific additional information. This member
can store, for instance, an ID to differentiate a skb TX buffer type
from a xdpf TX buffer type.

Signed-off-by: Julien Panis <jpanis@baylibre.com>
---
 drivers/net/ethernet/ti/k3-cppi-desc-pool.c | 29 +++++++++++++++++++++++++++++
 drivers/net/ethernet/ti/k3-cppi-desc-pool.h |  4 ++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/net/ethernet/ti/k3-cppi-desc-pool.c b/drivers/net/ethernet/ti/k3-cppi-desc-pool.c
index 414bcac9dcc6..e79d039fdaa5 100644
--- a/drivers/net/ethernet/ti/k3-cppi-desc-pool.c
+++ b/drivers/net/ethernet/ti/k3-cppi-desc-pool.c
@@ -22,6 +22,7 @@ struct k3_cppi_desc_pool {
 	size_t			mem_size;
 	size_t			num_desc;
 	struct gen_pool		*gen_pool;
+	void			**desc_infos;
 };
 
 void k3_cppi_desc_pool_destroy(struct k3_cppi_desc_pool *pool)
@@ -37,6 +38,8 @@ void k3_cppi_desc_pool_destroy(struct k3_cppi_desc_pool *pool)
 		dma_free_coherent(pool->dev, pool->mem_size, pool->cpumem,
 				  pool->dma_addr);
 
+	kfree(pool->desc_infos);
+
 	gen_pool_destroy(pool->gen_pool);	/* frees pool->name */
 }
 EXPORT_SYMBOL_GPL(k3_cppi_desc_pool_destroy);
@@ -72,6 +75,16 @@ k3_cppi_desc_pool_create_name(struct device *dev, size_t size,
 		goto gen_pool_create_fail;
 	}
 
+	pool->desc_infos = kcalloc(pool->num_desc,
+				   sizeof(*pool->desc_infos), GFP_KERNEL);
+	if (!pool->desc_infos) {
+		ret = -ENOMEM;
+		dev_err(pool->dev,
+			"pool descriptor infos alloc failed %d\n", ret);
+		kfree_const(pool_name);
+		goto gen_pool_desc_infos_alloc_fail;
+	}
+
 	pool->gen_pool->name = pool_name;
 
 	pool->cpumem = dma_alloc_coherent(pool->dev, pool->mem_size,
@@ -94,6 +107,8 @@ k3_cppi_desc_pool_create_name(struct device *dev, size_t size,
 	dma_free_coherent(pool->dev, pool->mem_size, pool->cpumem,
 			  pool->dma_addr);
 dma_alloc_fail:
+	kfree(pool->desc_infos);
+gen_pool_desc_infos_alloc_fail:
 	gen_pool_destroy(pool->gen_pool);	/* frees pool->name */
 gen_pool_create_fail:
 	devm_kfree(pool->dev, pool);
@@ -144,5 +159,19 @@ void *k3_cppi_desc_pool_cpuaddr(const struct k3_cppi_desc_pool *pool)
 }
 EXPORT_SYMBOL_GPL(k3_cppi_desc_pool_cpuaddr);
 
+void k3_cppi_desc_pool_desc_info_set(struct k3_cppi_desc_pool *pool,
+				     int desc_idx, void *info)
+{
+	pool->desc_infos[desc_idx] = info;
+}
+EXPORT_SYMBOL_GPL(k3_cppi_desc_pool_desc_info_set);
+
+void *k3_cppi_desc_pool_desc_info(const struct k3_cppi_desc_pool *pool,
+				  int desc_idx)
+{
+	return pool->desc_infos[desc_idx];
+}
+EXPORT_SYMBOL_GPL(k3_cppi_desc_pool_desc_info);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("TI K3 CPPI5 descriptors pool API");
diff --git a/drivers/net/ethernet/ti/k3-cppi-desc-pool.h b/drivers/net/ethernet/ti/k3-cppi-desc-pool.h
index 3c6aed0bed71..851d352b338b 100644
--- a/drivers/net/ethernet/ti/k3-cppi-desc-pool.h
+++ b/drivers/net/ethernet/ti/k3-cppi-desc-pool.h
@@ -28,5 +28,9 @@ void k3_cppi_desc_pool_free(struct k3_cppi_desc_pool *pool, void *addr);
 size_t k3_cppi_desc_pool_avail(struct k3_cppi_desc_pool *pool);
 size_t k3_cppi_desc_pool_desc_size(const struct k3_cppi_desc_pool *pool);
 void *k3_cppi_desc_pool_cpuaddr(const struct k3_cppi_desc_pool *pool);
+void k3_cppi_desc_pool_desc_info_set(struct k3_cppi_desc_pool *pool,
+				     int desc_idx, void *info);
+void *k3_cppi_desc_pool_desc_info(const struct k3_cppi_desc_pool *pool,
+				  int desc_idx);
 
 #endif /* K3_CPPI_DESC_POOL_H_ */

-- 
2.37.3

