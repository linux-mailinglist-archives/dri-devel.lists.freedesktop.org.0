Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA5588A806
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 17:01:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3983510E953;
	Mon, 25 Mar 2024 16:01:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="RFMmQaGJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5E4510E948
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 16:00:51 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-33edbc5932bso3241279f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 09:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1711382450; x=1711987250;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=canlvOloh4zEnLanokN/WjQ62JpW1VdMiHVT6vaC3r4=;
 b=RFMmQaGJvhqM+fguvfMQQXfHxzzaX2AmUoegwvQ0RGjyDEumdurnzNtX4d+zffSQ3g
 RF8Cx5LbiDbegaBjg5CBAhG9HfqTnxITb28M3BtRz1fAruQvlOObm+c8BD2e2CtSIifq
 FbrCJJgWVZdzvzB8Y+dmAJkT5QZllUa+2t7zXLAfMXv8thIP60LmHR9pEk2cAj1TkfkU
 UW1PRMgPzickk7nAJnAMw1nSZ2c9ciGOjO/QbSs6ikib0wXfaFZyLo52RXvbbfZklR5K
 8UkQkCidVdIoAL/uEMVhcOmJ+VSuKqQskKQx5YlxVx6foar6y6rV8ajJjbVEEM7fn4Re
 W5lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711382450; x=1711987250;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=canlvOloh4zEnLanokN/WjQ62JpW1VdMiHVT6vaC3r4=;
 b=wuXfhM4FlKViPmtY/po7ZN/KrgUM2ysybCMlcos8+r5BnXogbkrpU8G49bNGlzVDAH
 dr/PRgfpRoQAjf/b5gTEZednWoo2MRPc4cfiXSZShCeQoOMVJ6Qqzd9Kfh5NAMkKjYdy
 UdCCcLrAIDsdbi8mD2MwEMVV7w2I029fT9qGQqphsdqUSBQqjbGiRgDCf70+kIfpmz2c
 1mbpXlQ2k8pdDNj3FXHpo/mfOAKB+VgLVaxRgdk4I7zy/5Mx1r34CIEXV44scfwBwYgT
 GIa7lTGWJsTdr99/bB4K5f56m5BOuARg2QOcI8Hhhzk+cgnjxkN11Zq3A0JN55j7s2y1
 V8EQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9V10J9aRxAWWWTTPtl0hogu0SqHKTlf7BpW4A+RkdeFu4psH77jx5Cwadkds930RVm23GpS/knUviYlfpwstcKq7kz/spOkxNaYaXIYlY
X-Gm-Message-State: AOJu0YzMA0q12KyftTP7y5+QUR+4xVDpQOGClyoVaqEsyXk7/4zhkvQp
 DYLrMcnFhK/6kkhJJeevdJ6zeKjxslguxSeN23RPbN29xJf9QloWqBhYRAgW2JA=
X-Google-Smtp-Source: AGHT+IHSytMnpxNaEiziU/ORo0KmKW28ariRT1MML39MUcPWdgIVh1QjgdSOCBzmnu72Uz2Ka5H2rA==
X-Received: by 2002:a5d:4805:0:b0:33e:7650:24c8 with SMTP id
 l5-20020a5d4805000000b0033e765024c8mr4591997wrq.12.1711382450053; 
 Mon, 25 Mar 2024 09:00:50 -0700 (PDT)
Received: from [127.0.1.1] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31]) by smtp.gmail.com with ESMTPSA id
 r17-20020adff711000000b0033b6e26f0f9sm9839361wrp.42.2024.03.25.09.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 09:00:49 -0700 (PDT)
From: Julien Panis <jpanis@baylibre.com>
Date: Mon, 25 Mar 2024 17:00:36 +0100
Subject: [PATCH net-next v4 2/3] net: ethernet: ti: Add desc_infos member
 to struct k3_cppi_desc_pool
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240223-am65-cpsw-xdp-basic-v4-2-2e45e5dec048@baylibre.com>
References: <20240223-am65-cpsw-xdp-basic-v4-0-2e45e5dec048@baylibre.com>
In-Reply-To: <20240223-am65-cpsw-xdp-basic-v4-0-2e45e5dec048@baylibre.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Julien Panis <jpanis@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711382445; l=3220;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=Y46qZiPIxVqm/+2ngjD2p6sQy4AqjAerfnqGZzoaKmI=;
 b=qgazWBkM+DqOQxUttA89E8Lub9bkZLXTiY4gGfQc3DvbXI8gj4y8pwiS7olUpwYThyrJuXab2
 kv8gwXF15yTDDMhye3q/9gIuwf+Zc95Nt7V5oTSnSiqrGzXU1KyR1xv
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
 drivers/net/ethernet/ti/k3-cppi-desc-pool.c | 24 ++++++++++++++++++++++++
 drivers/net/ethernet/ti/k3-cppi-desc-pool.h |  2 ++
 2 files changed, 26 insertions(+)

diff --git a/drivers/net/ethernet/ti/k3-cppi-desc-pool.c b/drivers/net/ethernet/ti/k3-cppi-desc-pool.c
index fe8203c05731..d0c68d722ef2 100644
--- a/drivers/net/ethernet/ti/k3-cppi-desc-pool.c
+++ b/drivers/net/ethernet/ti/k3-cppi-desc-pool.c
@@ -22,6 +22,7 @@ struct k3_cppi_desc_pool {
 	size_t			mem_size;
 	size_t			num_desc;
 	struct gen_pool		*gen_pool;
+	void			**desc_infos;
 };
 
 void k3_cppi_desc_pool_destroy(struct k3_cppi_desc_pool *pool)
@@ -72,6 +73,15 @@ k3_cppi_desc_pool_create_name(struct device *dev, size_t size,
 		goto gen_pool_create_fail;
 	}
 
+	pool->desc_infos = devm_kcalloc(dev, pool->num_desc,
+					sizeof(*pool->desc_infos), GFP_KERNEL);
+	if (!pool->desc_infos) {
+		ret = -ENOMEM;
+		dev_err(pool->dev, "pool descriptor infos alloc failed %d\n", ret);
+		kfree_const(pool_name);
+		goto gen_pool_desc_infos_alloc_fail;
+	}
+
 	pool->gen_pool->name = pool_name;
 
 	pool->cpumem = dma_alloc_coherent(pool->dev, pool->mem_size,
@@ -94,6 +104,8 @@ k3_cppi_desc_pool_create_name(struct device *dev, size_t size,
 	dma_free_coherent(pool->dev, pool->mem_size, pool->cpumem,
 			  pool->dma_addr);
 dma_alloc_fail:
+	devm_kfree(pool->dev, pool->desc_infos);
+gen_pool_desc_infos_alloc_fail:
 	gen_pool_destroy(pool->gen_pool);	/* frees pool->name */
 gen_pool_create_fail:
 	devm_kfree(pool->dev, pool);
@@ -144,5 +156,17 @@ void *k3_cppi_desc_pool_cpuaddr(struct k3_cppi_desc_pool *pool)
 }
 EXPORT_SYMBOL_GPL(k3_cppi_desc_pool_cpuaddr);
 
+void k3_cppi_desc_pool_desc_info_set(struct k3_cppi_desc_pool *pool, int desc_idx, void *info)
+{
+	pool->desc_infos[desc_idx] = info;
+}
+EXPORT_SYMBOL_GPL(k3_cppi_desc_pool_desc_info_set);
+
+void *k3_cppi_desc_pool_desc_info(struct k3_cppi_desc_pool *pool, int desc_idx)
+{
+	return pool->desc_infos[desc_idx];
+}
+EXPORT_SYMBOL_GPL(k3_cppi_desc_pool_desc_info);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("TI K3 CPPI5 descriptors pool API");
diff --git a/drivers/net/ethernet/ti/k3-cppi-desc-pool.h b/drivers/net/ethernet/ti/k3-cppi-desc-pool.h
index 149d5579a5e2..0076596307e7 100644
--- a/drivers/net/ethernet/ti/k3-cppi-desc-pool.h
+++ b/drivers/net/ethernet/ti/k3-cppi-desc-pool.h
@@ -28,5 +28,7 @@ void k3_cppi_desc_pool_free(struct k3_cppi_desc_pool *pool, void *addr);
 size_t k3_cppi_desc_pool_avail(struct k3_cppi_desc_pool *pool);
 size_t k3_cppi_desc_pool_desc_size(struct k3_cppi_desc_pool *pool);
 void *k3_cppi_desc_pool_cpuaddr(struct k3_cppi_desc_pool *pool);
+void k3_cppi_desc_pool_desc_info_set(struct k3_cppi_desc_pool *pool, int desc_idx, void *info);
+void *k3_cppi_desc_pool_desc_info(struct k3_cppi_desc_pool *pool, int desc_idx);
 
 #endif /* K3_CPPI_DESC_POOL_H_ */

-- 
2.37.3

