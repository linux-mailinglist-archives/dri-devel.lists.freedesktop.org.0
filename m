Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B4789B83B
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 09:20:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF3341121AC;
	Mon,  8 Apr 2024 07:20:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="fDE7Sflj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B0E210F974
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 07:20:20 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-56bdf81706aso5447860a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Apr 2024 00:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712560819; x=1713165619;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4AGag0SLGP6ZTz9ElordkjjCIrAOBl+sGfiLsyWtvf4=;
 b=fDE7SfljRCpcM93NEBjpi9pcgUh5UFE3dqI8+LClFp41jPfYVr2TLWiB9YOmRkpNmE
 cGk/YS4+EnvdOKuiS/N6wdyFslRkYDnOpJx1R+FGQ9aC9UU0HS/UeeMiAQ8b0DUZB2r9
 X74z+kybX7wpsWNhcV2LBFvlhDr8tqlVn66h3L/Vafc+ghevKG7egDuVAzTo5x75t2CZ
 VpKWLip2fvoGr9D/bY7BrCF5Gpq5t6tm3nL3IvZZGMJq7S+su7C0J9jy8Kltx4fHBs2t
 XuPvNP8r/MSNVmKb4MlS1OtkZZIh2oiWkFcjfIfs5Zz1lJtyAlQNFuS8UkYoYG2j6xVQ
 jUoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712560819; x=1713165619;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4AGag0SLGP6ZTz9ElordkjjCIrAOBl+sGfiLsyWtvf4=;
 b=JRHqHAM076w4Z/o9jD3unVXQ1FitxpCStifa+1m4hoOSUn49iT/ol3bKVDT3pckXy0
 oHgMIB3nn7b0dofjumVPBAw8/8YeFBatg6sJo3adw9uOfXLHoLaM/oTzP/NaKcZx0pYP
 An2sKgc8+9qoqzArkcvuvL155X2oq/7HDe4axVfK0f5ZOdc/9Ef8FPwD/HLa98BWkwdO
 G5r0OlIfP4+oQbU6E/HmlwEmUwIAuNOZWfGEKj8a0xuV0d8qmdKTCuduTp+iMz5T60FN
 cfxxKsIsRu1cyoafjGcU0FxIO5wVJShsoavJqFP8s/xLGbriSdVMmX5LrF/EwP2E3H8G
 opCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdvIKrpJ0LzbC2cMgCiCeYBx7qX028vv0PNKKCjWTh1rqaqJ6eeLAQ9ZF30WJ2jucnzAzLGnrLi/jJQAFR3ZqvXqBn8z6F/U//6itoatRa
X-Gm-Message-State: AOJu0YwhEgoNtzsYVwNFkgB5ZJ5eKBijmKwlpuJd3RbXalJ4IeuNWWk0
 qWJgNF+9POVIUuaYW6ffpt8JlRDqiv9GZtfJEYe1L7TwcJgD1zRrvr9uE7Dr8ZE=
X-Google-Smtp-Source: AGHT+IF0kh6f4LCoO8XaUxxoMZyMhA9PrnS9MID4gtkTb8ja52z7juPl2lmmQOBdb0ujdAdjIVDLIw==
X-Received: by 2002:a50:d518:0:b0:56a:2b6b:42cd with SMTP id
 u24-20020a50d518000000b0056a2b6b42cdmr5269399edi.3.1712560818422; 
 Mon, 08 Apr 2024 00:20:18 -0700 (PDT)
Received: from [127.0.1.1] ([84.102.31.74]) by smtp.gmail.com with ESMTPSA id
 p15-20020a05640243cf00b0056c2d0052c0sm3738769edc.60.2024.04.08.00.20.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Apr 2024 00:20:18 -0700 (PDT)
From: Julien Panis <jpanis@baylibre.com>
Date: Mon, 08 Apr 2024 09:20:05 +0200
Subject: [PATCH net-next v7 1/3] net: ethernet: ti: Add accessors for
 struct k3_cppi_desc_pool members
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240223-am65-cpsw-xdp-basic-v7-1-c3857c82dadb@baylibre.com>
References: <20240223-am65-cpsw-xdp-basic-v7-0-c3857c82dadb@baylibre.com>
In-Reply-To: <20240223-am65-cpsw-xdp-basic-v7-0-c3857c82dadb@baylibre.com>
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
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Julien Panis <jpanis@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712560813; l=1876;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=fA9wRh9BhzewgFnx03QdynOb7Uu7To/l82seA5HFPKw=;
 b=xyDc7MTGUEAiiYPE4m1bVVBppYmQmR1WgbLv1snsJflqVNJtqVunkK5hV0iToiU7ahHYzrO48
 fSjkcOPhdOmAXTO4/jw+T3v5wAPHTIgTAkDGZngmQWsiLLk+7iUkS4y
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

