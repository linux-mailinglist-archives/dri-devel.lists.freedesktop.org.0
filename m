Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8DF89BBE5
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 11:38:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94AB610F17B;
	Mon,  8 Apr 2024 09:38:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="PiNFgSlT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 702E610ED94
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 09:38:14 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-56e47843cc7so1221205a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Apr 2024 02:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712569093; x=1713173893;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4AGag0SLGP6ZTz9ElordkjjCIrAOBl+sGfiLsyWtvf4=;
 b=PiNFgSlTBezk7MetximFmeqDg6+wMDUpM0bgv2x4ty0qi7bAOPlcNC1uAqI/zcR+J1
 i155tDTp5kL4W/+HJfoPto8sF1g9dQj68HytzAbG5OU0BBsuVHaZdsFN3bx2bP9plip6
 byCWOhcrTKRsAKiU4PugNWLuh8qnG7fQzQasvgt7svpgFYA+y3NRqMgvngPeBUJ/tmn0
 Yt4NC3nKZwPPNKVb43ADPUlobcwPmQ+fQTfNP7K0HKtygq9RNJYFKrw2YfrZcbocRay/
 yIAyaPKtkxx8BbEfdm/Uu9Z5wajqxsuoOdWDcm7Q08mixDxjWEZ2tKG4lqTq84f3mwP0
 KKKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712569093; x=1713173893;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4AGag0SLGP6ZTz9ElordkjjCIrAOBl+sGfiLsyWtvf4=;
 b=UGhlJ5079id9HKMEAZtjgYYsOHmhCR67sp45AXeXsssPSu6ZPdgiNy9zhSbhcaZH/Y
 43tQoCHrOHkYhdCy4di6ykIXzElYJFmzw6hBjDDL6Eg+Pxjd4OoiUZFCaP3IrE4Ui4sW
 5l9XPUYoX2eWzFT+gF3WBaIgpNk/DGrt3ZRV+F1puhebPN7wTDV2F0mDS8Q58w66i9hG
 puHFKlIWMIFD5JF5EMd62+fudHWonxvLYmbzzp85LEx16c1D+0J90B5rtxbVZg5XYFM6
 DtyAUdqEV8iAxar0/o69croBpqQGDi7Z6OE2qg7NrS7uf/5T08zw9SwUSDwjQGFK2mZ/
 wpVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDawQkXMELCdPsuFSqH3pk3Zx4ouWf2uZzaJ8Udl2j6v6ITl5KHOjEBEuboPC4gwbEpogliPxsmLyLJnbdwQycawAz5fg0CnrinaHdyn4n
X-Gm-Message-State: AOJu0YzUvqNrNR5KuevqattUXa043cvdRAa3o+09aUFxzwc9U3YzZ/mR
 lkupwQP7mAorUsL2tZIohtTqhe0ps1hXyof2RI9aBdk8Mu8gAkBqRQxyaRPzL2E=
X-Google-Smtp-Source: AGHT+IEYUxmFx883FdaPSd6GReaIHMgqz54jpNmxo/069Pc1WV+2FfwQmDbrYRFO0OGtj7S/xf4JHw==
X-Received: by 2002:a17:906:53d6:b0:a4e:8f73:6d5f with SMTP id
 p22-20020a17090653d600b00a4e8f736d5fmr4562108ejo.66.1712569092719; 
 Mon, 08 Apr 2024 02:38:12 -0700 (PDT)
Received: from [127.0.1.1] ([84.102.31.74]) by smtp.gmail.com with ESMTPSA id
 ne6-20020a1709077b8600b00a4e5a6b57a2sm4175803ejc.163.2024.04.08.02.38.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Apr 2024 02:38:12 -0700 (PDT)
From: Julien Panis <jpanis@baylibre.com>
Date: Mon, 08 Apr 2024 11:38:02 +0200
Subject: [PATCH net-next v8 1/3] net: ethernet: ti: Add accessors for
 struct k3_cppi_desc_pool members
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240223-am65-cpsw-xdp-basic-v8-1-f3421b58da09@baylibre.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712569087; l=1876;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=fA9wRh9BhzewgFnx03QdynOb7Uu7To/l82seA5HFPKw=;
 b=4WAESX8DEdgb0LHBGuXuYqy64h3h9/4ecp+e+9P4Pv/WoeQSh43Dcrr0OIqVYtl+8ywfstiNK
 3HM2D23qidDBgm9m1M1r9ppXZpD07onXSmxFAwvZvl8YqJHO9eSzosu
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

This patch adds accessors for desc_size and cpumem members. They may be
used, for instance, to compute a descriptor index.

Signed-off-by: Julien Panis <jpanis@baylibre.com>
---
 drivers/net/ethernet/ti/k3-cppi-desc-pool.c | 12 ++++++++++++
 drivers/net/ethernet/ti/k3-cppi-desc-pool.h |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/drivers/net/ethernet/ti/k3-cppi-desc-pool.c b/drivers/net/ethernet/ti/k3-cppi-desc-pool.c
index 05cc7aab1ec8..414bcac9dcc6 100644
--- a/drivers/net/ethernet/ti/k3-cppi-desc-pool.c
+++ b/drivers/net/ethernet/ti/k3-cppi-desc-pool.c
@@ -132,5 +132,17 @@ size_t k3_cppi_desc_pool_avail(struct k3_cppi_desc_pool *pool)
 }
 EXPORT_SYMBOL_GPL(k3_cppi_desc_pool_avail);
 
+size_t k3_cppi_desc_pool_desc_size(const struct k3_cppi_desc_pool *pool)
+{
+	return pool->desc_size;
+}
+EXPORT_SYMBOL_GPL(k3_cppi_desc_pool_desc_size);
+
+void *k3_cppi_desc_pool_cpuaddr(const struct k3_cppi_desc_pool *pool)
+{
+	return pool->cpumem;
+}
+EXPORT_SYMBOL_GPL(k3_cppi_desc_pool_cpuaddr);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("TI K3 CPPI5 descriptors pool API");
diff --git a/drivers/net/ethernet/ti/k3-cppi-desc-pool.h b/drivers/net/ethernet/ti/k3-cppi-desc-pool.h
index a7e3fa5e7b62..3c6aed0bed71 100644
--- a/drivers/net/ethernet/ti/k3-cppi-desc-pool.h
+++ b/drivers/net/ethernet/ti/k3-cppi-desc-pool.h
@@ -26,5 +26,7 @@ k3_cppi_desc_pool_dma2virt(struct k3_cppi_desc_pool *pool, dma_addr_t dma);
 void *k3_cppi_desc_pool_alloc(struct k3_cppi_desc_pool *pool);
 void k3_cppi_desc_pool_free(struct k3_cppi_desc_pool *pool, void *addr);
 size_t k3_cppi_desc_pool_avail(struct k3_cppi_desc_pool *pool);
+size_t k3_cppi_desc_pool_desc_size(const struct k3_cppi_desc_pool *pool);
+void *k3_cppi_desc_pool_cpuaddr(const struct k3_cppi_desc_pool *pool);
 
 #endif /* K3_CPPI_DESC_POOL_H_ */

-- 
2.37.3

