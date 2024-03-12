Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C78798794FE
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 14:23:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCE6210F13C;
	Tue, 12 Mar 2024 13:22:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="uhJ/njmM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB7EC10E702
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 13:22:55 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4133847e47bso4150215e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 06:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710249774; x=1710854574;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qEaZoF9mx7Xkycbcd21LmA2/00TCeHKVbh1e2Dzr7Vc=;
 b=uhJ/njmMU2xrx7JUufLNeb2x2wEWcbO2NOcUfECGhNuzlniJP1VfNRo+aV6jQXtaYJ
 CmpLnnwdOCLZmSmDtdxjYkKMY2BaGopAum+PFSnWRmV78H8+enbZlHP1C7gAPDUpIr6X
 bdDIakNpdbXBVMi6uoXNpbhW3Tbyv2TX3hUZiNhW+CLcTZeS4lMXBUn01w4xxLwRUw7a
 8zVZqXAgx28lEBxkjdaeVduPQaG2wKM0JdfJ9mbJ9rQva3O15DlXwuPbw2rBksH9/Z11
 /pST4NUu1z9lN0zwkgmD0iAIZGTxaNEVi2/fMRaRHbe97w/xcD3lxEByV3Z77kT9jQ0a
 Ew/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710249774; x=1710854574;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qEaZoF9mx7Xkycbcd21LmA2/00TCeHKVbh1e2Dzr7Vc=;
 b=PSCV6kafwjKfpJ2Uq6bG8/+hE07sfBK9itI7ELKDOVwVNiMl0F5O/QVDrk9gZdEsI2
 8ieTXrIxZb9g1RXCd2e9SCoBUw7UC48gvAQ+ISfiKy/BjKFAM3EbPuBKr9zkO1E1oh5S
 RQGRsinHc4VE6sY5Zkt0DOIbMqdqP90KcPY0TDXHx3XpjEuE8M7Xfo2jKBByRvqPaS6V
 /jmMQyP2k7upF6kWSe7HrzbFbhEsVij2LC8OzQ0VitIhwj1L5nSn6oADl43COuD334ku
 ALEDnS/smovOb7L7wq8mrXINXtxYMuuB6tLWKxg0eAKP5yWIw5xWWB+4QwuzsLubiC2g
 80Wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHo4UXNiLG/gwVZPE/8jwRxiAXQfM4MBBTE29WH9hVQMNFBs2v7lwFQAX10lrXzpLRnrpUGj13ru3h5HN3ckwcq+MSjK3+6uNqG9ZmNdiS
X-Gm-Message-State: AOJu0YwJ/ih0vwZy01weQKs31lSQY5hMj2lH/4utjplh+esNovqXiuD7
 YlEUJV6CGV0rr7isPrkiKHAEv8O3IhSD9BJTmGaQKg6m/GsDhgYmFJhUMiypsOk=
X-Google-Smtp-Source: AGHT+IHlytHdEXscr/W+dSAr2nTXoxgxrjyAq7hvZ/powmwJ49KYk2NF7VEmNWzayQm3bD8Elvc57g==
X-Received: by 2002:a05:600c:458c:b0:413:2c3e:c323 with SMTP id
 r12-20020a05600c458c00b004132c3ec323mr3370255wmo.38.1710249773976; 
 Tue, 12 Mar 2024 06:22:53 -0700 (PDT)
Received: from [127.0.1.1]
 (laubervilliers-657-1-248-155.w90-24.abo.wanadoo.fr. [90.24.137.155])
 by smtp.gmail.com with ESMTPSA id
 r13-20020adff10d000000b0033b278cf5fesm8980167wro.102.2024.03.12.06.22.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Mar 2024 06:22:53 -0700 (PDT)
From: Julien Panis <jpanis@baylibre.com>
Date: Tue, 12 Mar 2024 14:22:40 +0100
Subject: [PATCH v4 1/3] net: ethernet: ti: Add accessors for struct
 k3_cppi_desc_pool members
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240223-am65-cpsw-xdp-basic-v4-1-38361a63a48b@baylibre.com>
References: <20240223-am65-cpsw-xdp-basic-v4-0-38361a63a48b@baylibre.com>
In-Reply-To: <20240223-am65-cpsw-xdp-basic-v4-0-38361a63a48b@baylibre.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1710249771; l=1852;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=jlmDA8j5BPsGTQCQEi11/ZrPzSbTV7KDqXuvMXnrWBo=;
 b=Hv8qFAJaCv6kB2joBPWZNghBiio/tb9H7gUNxrjl4zJ1hbySQ4ZrUI17WPbsgLUJJGcO8W8rA
 8wJzf0mor2KBFT1SmQ6ACzZMR0wREU/bfp6sf0fRwAbqrnAk9um/rP2
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
index 05cc7aab1ec8..fe8203c05731 100644
--- a/drivers/net/ethernet/ti/k3-cppi-desc-pool.c
+++ b/drivers/net/ethernet/ti/k3-cppi-desc-pool.c
@@ -132,5 +132,17 @@ size_t k3_cppi_desc_pool_avail(struct k3_cppi_desc_pool *pool)
 }
 EXPORT_SYMBOL_GPL(k3_cppi_desc_pool_avail);
 
+size_t k3_cppi_desc_pool_desc_size(struct k3_cppi_desc_pool *pool)
+{
+	return pool->desc_size;
+}
+EXPORT_SYMBOL_GPL(k3_cppi_desc_pool_desc_size);
+
+void *k3_cppi_desc_pool_cpuaddr(struct k3_cppi_desc_pool *pool)
+{
+	return pool->cpumem;
+}
+EXPORT_SYMBOL_GPL(k3_cppi_desc_pool_cpuaddr);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("TI K3 CPPI5 descriptors pool API");
diff --git a/drivers/net/ethernet/ti/k3-cppi-desc-pool.h b/drivers/net/ethernet/ti/k3-cppi-desc-pool.h
index a7e3fa5e7b62..149d5579a5e2 100644
--- a/drivers/net/ethernet/ti/k3-cppi-desc-pool.h
+++ b/drivers/net/ethernet/ti/k3-cppi-desc-pool.h
@@ -26,5 +26,7 @@ k3_cppi_desc_pool_dma2virt(struct k3_cppi_desc_pool *pool, dma_addr_t dma);
 void *k3_cppi_desc_pool_alloc(struct k3_cppi_desc_pool *pool);
 void k3_cppi_desc_pool_free(struct k3_cppi_desc_pool *pool, void *addr);
 size_t k3_cppi_desc_pool_avail(struct k3_cppi_desc_pool *pool);
+size_t k3_cppi_desc_pool_desc_size(struct k3_cppi_desc_pool *pool);
+void *k3_cppi_desc_pool_cpuaddr(struct k3_cppi_desc_pool *pool);
 
 #endif /* K3_CPPI_DESC_POOL_H_ */

-- 
2.37.3

