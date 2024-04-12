Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 918E18A32A3
	for <lists+dri-devel@lfdr.de>; Fri, 12 Apr 2024 17:39:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6435210F714;
	Fri, 12 Apr 2024 15:38:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="qND7yH0D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C94D10F70A
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Apr 2024 15:38:53 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-34665dd7610so437399f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Apr 2024 08:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712936331; x=1713541131;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DlychnL65xg4rRD6rFMEjcsL9jG7kDN0jMkphCm2a5k=;
 b=qND7yH0DpAIiFkwiEzgBsmXHvT7eD2VB6fobyOLqcPdvF3kmVInfq8sXuY2wpyQgSU
 5WGrIQwPj4ICEKl9jNazpTYxUJ2F4AGueLkDOjlmswhLsEKKLrWfbwTdonwYvzGu+ynH
 zAM1kCLPmcxTkBavs2fyuon6R2tDzHebzN1vcjVd0h4ih5CCdp26kw9x1PetlCUlK4FZ
 Hl/1SJ06O1px4tUm2WP0l+ggJ2KwQcJG6bjVkrytNv3fYOMfs3yiZKm46UD6Xe18U+AL
 WSkS+iqjolxSffHaQ9rejkE5B0Ap5ol4fjh8XBIq+CnbQz/nEPRZAxFd6MgHSllMazMl
 p9MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712936331; x=1713541131;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DlychnL65xg4rRD6rFMEjcsL9jG7kDN0jMkphCm2a5k=;
 b=Yv8wbpWsUINdDv8GOaqJRNgcJ6+mB04B6+WYsAojPF0dh4JHMbhM98Le/B6N2a9Lf4
 EizkHkA4HLyWFKWR0Md49d+CSrdeuYfcEPOjYN4dLXmksV4IUpUJ0Fa5ZKPUd4/0nLw0
 nCGOUWCHFdIYaZUeCW1dDzI0066Ky8ygxgQ1OxN/6TeFIbVieOeGM4Dl3t07NCyTBja2
 CqpbaecMCUOy+M4yRFmTKv5TgwxjDmnmtrYRiSqkW4N07vX8TipcFlViPaM+kU+++sf5
 MObaqnZqSFXDT4XEXjtn0+SF5TrLsy8rIYAG+J03LrjTiFedFGm0Un60E3MfA5QG7MWq
 fKPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFhsUVLuE54zN8IElE6pO05kNL78OvH0tjZIgazUQmYkJG2v9z2B0DbHNKMX6crPRNjW+rSNsAk3Wn4rbXqgQLljXljKlsYem/p9cX05Eu
X-Gm-Message-State: AOJu0YxN5x8JzfDuVCgh0sBjiLo4PDWuIW+//HmlDmJUFtDVl3CVQxVc
 ghLqQzsynvIpHX4ncC4kJ4y3n/Ivuk4IoeJNK52xSlF+WDKuBKMg39/XyF4+0d0=
X-Google-Smtp-Source: AGHT+IFb2+KL5iLIOly5x0hIiJjAVufAzhuUpYpTYTPnK0Gg201imseBOxf7BnR6QWHdfgeK8CMFCA==
X-Received: by 2002:adf:fa8b:0:b0:343:b686:89a0 with SMTP id
 h11-20020adffa8b000000b00343b68689a0mr1969349wrr.13.1712936331591; 
 Fri, 12 Apr 2024 08:38:51 -0700 (PDT)
Received: from [127.0.1.1] ([84.102.31.74]) by smtp.gmail.com with ESMTPSA id
 k9-20020adff289000000b0033e45930f35sm4545791wro.6.2024.04.12.08.38.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Apr 2024 08:38:51 -0700 (PDT)
From: Julien Panis <jpanis@baylibre.com>
Date: Fri, 12 Apr 2024 17:38:33 +0200
Subject: [PATCH net-next v9 2/3] net: ethernet: ti: Add desc_infos member
 to struct k3_cppi_desc_pool
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240223-am65-cpsw-xdp-basic-v9-2-2c194217e325@baylibre.com>
References: <20240223-am65-cpsw-xdp-basic-v9-0-2c194217e325@baylibre.com>
In-Reply-To: <20240223-am65-cpsw-xdp-basic-v9-0-2c194217e325@baylibre.com>
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
 Naveen Mamindlapalli <naveenm@marvell.com>, 
 Jacob Keller <jacob.e.keller@intel.com>
Cc: danishanwar@ti.com, yuehaibing@huawei.com, rogerq@kernel.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, Julien Panis <jpanis@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712936324; l=4285;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=D70tecQdxEFhN2T90LYAjmlmzEPD00PhK6njTdKkNcg=;
 b=3nuWtDIz2tUECi5ze87zSnbefuWdEDPrkEy2/SGn48lAXiiZmrSq3rq+Se67PfmmmSqf5PT6q
 B8987UN2Q6pBRQXgQ2Dn7tnD6yeeM2qV3o19vKvsCGg7rr9+VjD3NgH
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
 drivers/net/ethernet/ti/k3-cppi-desc-pool.c | 34 ++++++++++++++++++++++++-----
 drivers/net/ethernet/ti/k3-cppi-desc-pool.h |  4 ++++
 2 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/ti/k3-cppi-desc-pool.c b/drivers/net/ethernet/ti/k3-cppi-desc-pool.c
index 414bcac9dcc6..739bae8e11ee 100644
--- a/drivers/net/ethernet/ti/k3-cppi-desc-pool.c
+++ b/drivers/net/ethernet/ti/k3-cppi-desc-pool.c
@@ -22,6 +22,7 @@ struct k3_cppi_desc_pool {
 	size_t			mem_size;
 	size_t			num_desc;
 	struct gen_pool		*gen_pool;
+	void			**desc_infos;
 };
 
 void k3_cppi_desc_pool_destroy(struct k3_cppi_desc_pool *pool)
@@ -37,7 +38,11 @@ void k3_cppi_desc_pool_destroy(struct k3_cppi_desc_pool *pool)
 		dma_free_coherent(pool->dev, pool->mem_size, pool->cpumem,
 				  pool->dma_addr);
 
+	kfree(pool->desc_infos);
+
 	gen_pool_destroy(pool->gen_pool);	/* frees pool->name */
+
+	kfree(pool);
 }
 EXPORT_SYMBOL_GPL(k3_cppi_desc_pool_destroy);
 
@@ -50,7 +55,7 @@ k3_cppi_desc_pool_create_name(struct device *dev, size_t size,
 	const char *pool_name = NULL;
 	int ret = -ENOMEM;
 
-	pool = devm_kzalloc(dev, sizeof(*pool), GFP_KERNEL);
+	pool = kzalloc(sizeof(*pool), GFP_KERNEL);
 	if (!pool)
 		return ERR_PTR(ret);
 
@@ -62,18 +67,21 @@ k3_cppi_desc_pool_create_name(struct device *dev, size_t size,
 	pool_name = kstrdup_const(name ? name : dev_name(pool->dev),
 				  GFP_KERNEL);
 	if (!pool_name)
-		return ERR_PTR(-ENOMEM);
+		goto gen_pool_create_fail;
 
 	pool->gen_pool = gen_pool_create(ilog2(pool->desc_size), -1);
 	if (!pool->gen_pool) {
-		ret = -ENOMEM;
-		dev_err(pool->dev, "pool create failed %d\n", ret);
 		kfree_const(pool_name);
 		goto gen_pool_create_fail;
 	}
 
 	pool->gen_pool->name = pool_name;
 
+	pool->desc_infos = kcalloc(pool->num_desc,
+				   sizeof(*pool->desc_infos), GFP_KERNEL);
+	if (!pool->desc_infos)
+		goto gen_pool_desc_infos_alloc_fail;
+
 	pool->cpumem = dma_alloc_coherent(pool->dev, pool->mem_size,
 					  &pool->dma_addr, GFP_KERNEL);
 
@@ -94,9 +102,11 @@ k3_cppi_desc_pool_create_name(struct device *dev, size_t size,
 	dma_free_coherent(pool->dev, pool->mem_size, pool->cpumem,
 			  pool->dma_addr);
 dma_alloc_fail:
+	kfree(pool->desc_infos);
+gen_pool_desc_infos_alloc_fail:
 	gen_pool_destroy(pool->gen_pool);	/* frees pool->name */
 gen_pool_create_fail:
-	devm_kfree(pool->dev, pool);
+	kfree(pool);
 	return ERR_PTR(ret);
 }
 EXPORT_SYMBOL_GPL(k3_cppi_desc_pool_create_name);
@@ -144,5 +154,19 @@ void *k3_cppi_desc_pool_cpuaddr(const struct k3_cppi_desc_pool *pool)
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

