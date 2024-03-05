Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 178A5871CF7
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 12:08:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F4E6112A33;
	Tue,  5 Mar 2024 11:08:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="KVFp2lHB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A0EA112A33
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 11:08:31 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-33e2774bdc5so2635561f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 03:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1709636909; x=1710241709;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=canlvOloh4zEnLanokN/WjQ62JpW1VdMiHVT6vaC3r4=;
 b=KVFp2lHBKPITJlZDNz7/7On5nf+/WMahONon9T3GVdmN9/EiW/RmG2AI1geL587qAb
 VPZrbx/SWsl/RnqtOub8bmv1qt3SDAGPQu53RlE0nAlAk8ekC0ZWBCoSgMARh7qpWs/k
 WdEh4fwOo0oyGE+onv6sVwk90nXpTgvuRsVNNONTUbl3xCmyv6s+HgLZ7FtQ0iHNL0oB
 gd/FaNsaedfUWYLmmref/2NVXKZ/MpwOGVr1gNfQBIqhGQ0CoP4JND47Q6JEygPPMMGc
 F2ttE3+OmR6FaYwsQW9GUgkrqPvoeM/G0hsch2m18zswoGbtse1udAo6zaVMsZPdwfLk
 fbjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709636909; x=1710241709;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=canlvOloh4zEnLanokN/WjQ62JpW1VdMiHVT6vaC3r4=;
 b=tKOVotqmVEk9xlOmLfkQgzkvFaVHreA1DAiO6kqhh8yms4w2Zr0YDQ9KMxKMM8iaZP
 NEdjsOx62EHweTXu9mgqkUvYE3hpCfy994HBDrZ0ENnRVNy9tIRKX8OP1DkRGXDk7d+1
 f8FeF29ZQ/t3zvqGQ2BiZVy/dlbZm2bSVYcGOsKxLyOmXhL38SqB0iwpdlnc1PH2L97U
 dFU/g9sRFJ7oxULoNia/rQ2vaiHk5RH4AKY1vzLed4AaSDFeGUTFlFjoqyK5ot+2GELt
 SvuY1OzQgfDXrCGCJFa7gG0DzJETerkWmlUhxq71H65yrzFX6JgvZHEk1X5AM84Jj8Kg
 m82w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHvmHgiiBSfX/gWrRUO708ngsVnI6rDvCWoHkDvhP8eR0HEnyt4vEH8Dz8NJg63VvtqSra1vQ0LuL9Vlk8nyqK3pNeid+7GHGR8t1F1bBj
X-Gm-Message-State: AOJu0Yz+jkbAzJfnV/p6D+aHIH2fO2iHZtX0MFU5Np0HYZZdVU9E1nv4
 tv6Dw5su/xKMVtO5DVN9Lh/IUYpSJw5996iNH7SBtsoMGXEBOEDTv+8wMb+UpZE=
X-Google-Smtp-Source: AGHT+IG4PwmV/7gHNDxTSEU+h6KoMa85YHeJ7lcV8oM/YV1RHnHQxziz9Qc7eYQjwiG+ORSZYNEgFg==
X-Received: by 2002:a05:6000:90e:b0:33d:d15b:9789 with SMTP id
 cw14-20020a056000090e00b0033dd15b9789mr9030292wrb.65.1709636909620; 
 Tue, 05 Mar 2024 03:08:29 -0800 (PST)
Received: from [127.0.1.1] ([84.102.31.43]) by smtp.gmail.com with ESMTPSA id
 v7-20020a5d59c7000000b0033e475940fasm2190993wry.66.2024.03.05.03.08.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 03:08:29 -0800 (PST)
From: Julien Panis <jpanis@baylibre.com>
Date: Tue, 05 Mar 2024 12:08:19 +0100
Subject: [PATCH v3 2/3] net: ethernet: ti: Add desc_infos member to struct
 k3_cppi_desc_pool
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240223-am65-cpsw-xdp-basic-v3-2-5d944a9d84a0@baylibre.com>
References: <20240223-am65-cpsw-xdp-basic-v3-0-5d944a9d84a0@baylibre.com>
In-Reply-To: <20240223-am65-cpsw-xdp-basic-v3-0-5d944a9d84a0@baylibre.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709636903; l=3220;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=Y46qZiPIxVqm/+2ngjD2p6sQy4AqjAerfnqGZzoaKmI=;
 b=1yAwaCWRpRqqD4MFtQLKotubUsbSp2bN12toZ5YOy+ngtI0PYQvbpboRO+BB7Ck7zHb88wasq
 KqmnfqeQQLZCod3pIdhHWyV6JNiRkDVWUNC4LB0oaiSqSPlqUv8gTHW
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

