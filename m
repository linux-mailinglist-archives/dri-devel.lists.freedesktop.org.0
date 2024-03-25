Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A6F88A803
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 17:00:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 445ED10E93C;
	Mon, 25 Mar 2024 16:00:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="3BKsFqwG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 747D610E4BD
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 16:00:50 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4148c73255eso1466465e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 09:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1711382448; x=1711987248;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qEaZoF9mx7Xkycbcd21LmA2/00TCeHKVbh1e2Dzr7Vc=;
 b=3BKsFqwG+ggoZEysT722eiaBEJIgV0O13nkzmm60sUNetZs4HwH+rYd4HQ9Sp2MApV
 tTnVlwSVV3UVyDPV1xatzfyF3VwF+T095YrOZbIh9UkjeqCjr+R5RyXpkglxnm6HoJWG
 oEBHQZK1dNN5bDshmmeKPcIy2u+T76sBbuAesu8NNmnhnRzUhqptQ5iW3cKq76xx7l2j
 FS+VEZzwpq/wYG2vVBwDlnMWJlwIlVeU6Yk1c/bEvSG8Gg2SmvFE5CNEMkFrDNSmYEyy
 acH1BfoFYwbeCnnxS9AaNGFzTpUgEpb4b1tGqCkqj0evmYfXR9W3njjmVnYgeRUlrKtz
 115g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711382448; x=1711987248;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qEaZoF9mx7Xkycbcd21LmA2/00TCeHKVbh1e2Dzr7Vc=;
 b=jiI6j5tL4p2Lk0lIWLvcYSXMqgW63JEqtwPgjZVwPJLM8KzIVGyQwq0+6cU10fcbrF
 pTzUlM7msbSS/cef7AeFV2KFk0lzLAqZ0qeV1KnGUUyhxs74ddFCNUfob3cidaAjLMNr
 9JNKvtfx/G7RBAELOQmb3JDyH03xNAQ0aEllgRZ2z2bGtdViPpQR90/i6Kb1CosB9kn/
 Bt+touaDG1uyECW85BywvLocaLkMtfO//xVFrZmaxHL8WmaZTVyrz07MEt+BnipebILC
 PzS9VQTk2zT894mF6pyO17MWUqZIrwZ5hvgdE76OgnCnW7VuQhzpYz+FJgx/Iyzm3ovL
 T9ag==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+dLDI+WuXTFRVRsMhDxrlemw0j9Hnr1VSL24q6WnjJph1MmEWOzv3IqXiZauZaxhXXMPK1en9Ppc9xk1AZ5OcxdTdy5kSr8voeb33BOf3
X-Gm-Message-State: AOJu0Yx66FrmbQMgsP3+uED21PlIOl3HaVsN0Wu4wgyv/8Twqupb0vEz
 Hh9nAksbkX3MBXGxCidD0LrjEYtG0ez11UcHYEWQ8ZAgeCMImkST4jSYkoNAKKE=
X-Google-Smtp-Source: AGHT+IHCN+EUC5Ixkwt4KEbNvTXzChsqVSlHeysS1I9s3THmhKymtJhoWpKoPj2lxZQDIDpdjgl1zQ==
X-Received: by 2002:a05:6000:a85:b0:33e:cbec:b2bd with SMTP id
 dh5-20020a0560000a8500b0033ecbecb2bdmr4808890wrb.9.1711382448665; 
 Mon, 25 Mar 2024 09:00:48 -0700 (PDT)
Received: from [127.0.1.1] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31]) by smtp.gmail.com with ESMTPSA id
 r17-20020adff711000000b0033b6e26f0f9sm9839361wrp.42.2024.03.25.09.00.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 09:00:47 -0700 (PDT)
From: Julien Panis <jpanis@baylibre.com>
Date: Mon, 25 Mar 2024 17:00:35 +0100
Subject: [PATCH net-next v4 1/3] net: ethernet: ti: Add accessors for
 struct k3_cppi_desc_pool members
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240223-am65-cpsw-xdp-basic-v4-1-2e45e5dec048@baylibre.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711382445; l=1852;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=jlmDA8j5BPsGTQCQEi11/ZrPzSbTV7KDqXuvMXnrWBo=;
 b=aymDZ233B8w10bVhhQpTuMZOAhH2dz2fHG9HbLabwWA7o+g60okp+Zk4el2Yy3QIHto1OT8y5
 JlL8nNPV0CTDZEiTJL+HQuyBPyLbN4xLZFvaPfW3jH6TAEgAr48tp04
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

