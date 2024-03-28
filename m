Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 382E488FB55
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 10:26:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA98611239D;
	Thu, 28 Mar 2024 09:26:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="wYqyKqib";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D3C5112395
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 09:26:52 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4150cd01febso5102145e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 02:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1711618010; x=1712222810;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qEaZoF9mx7Xkycbcd21LmA2/00TCeHKVbh1e2Dzr7Vc=;
 b=wYqyKqib4FivuXxAUME5RESXXxFcL7lPujm9gRgH/jSu3shvNJLIkQ2bpoxb0Ujse2
 9HJAYrsIiRTdcmwW+frLm32BEtoy8ryJXdTOb3mqPckFXNWTjcDlz7tE86XnQ6X44pwx
 /BLrdQqnKMSuOu4mMz8RAoPger8gkwkYc5gYHhHdD3M7j3irn0Jk0HOjWEAq7UcSrukf
 zM9+2mwtnjYBBtZ2kLGNJWS5ygvX90osIUfQflGYpkQwCHIPqiAyqpRXREfk8dcOE6GR
 dLBywaV1q9Q2+t2owa20xhMhgI/ztYap3A1xpcMDGQTTDxYAx1s9e6UTKk7I9MPEt/gQ
 Ot9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711618010; x=1712222810;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qEaZoF9mx7Xkycbcd21LmA2/00TCeHKVbh1e2Dzr7Vc=;
 b=PQ0skyrEKPeHYmoMUP0WCrz3yAZKGvY7Fv8dYzeaz70/5lQkOKnRkl1LsWrljmRNIU
 /R8lwz7SPC/Chl4O+xlM2pUioc1n3Pto38afTC5GHfCrjA77DiV6ezu8h5SQ6FCgzwjm
 +tJ8YT3n2i28IT5FF3CkAM8utNqgmD69El5ynrNAxojLWQIKucWgJAA094s2Ep1vPHr/
 kLaF7p0sCm6bj85tGb/7RhISAvrwZt6epOqh08fz7ohjwmitbEtJhK+BHTYhsEhEBuBk
 ydv+wBskcNQ5rqZJdLECT/LVORHGrm4pls8jxrJhUCzkCwg/w3P9EX4LxtSQg6SUNwdR
 l9rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUQSIKjA1NtNbFlrWfKmS30FR4zCfbGVJq+/wkxW+AjCkv8vF6k8eTAusvz86ZPyq5B+QVEpN58+Tot0JTlVYNV9T2lnG6U8+COXhkl9xH
X-Gm-Message-State: AOJu0YylqlZfSSiOxBq3pileulk3x9OKAwhT+L47ksgoY5Y75S6ER40X
 FFc+VY6MabFwHz+JyxgpWWKHHdVHPvvnXm78X4aRSWvZqGO9IqBCwopo/SLfxFQ=
X-Google-Smtp-Source: AGHT+IECjUgDa2k5UJylRjoSYSZ/eL8Rc0qvDSUr6znA15Wk0chOgtuTksxOram+qKPcSmAtYopzIw==
X-Received: by 2002:a05:600c:1c22:b0:415:456c:a17f with SMTP id
 j34-20020a05600c1c2200b00415456ca17fmr740302wms.25.1711618010528; 
 Thu, 28 Mar 2024 02:26:50 -0700 (PDT)
Received: from [127.0.1.1] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31]) by smtp.gmail.com with ESMTPSA id
 bd17-20020a05600c1f1100b0041493615585sm1673414wmb.39.2024.03.28.02.26.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Mar 2024 02:26:49 -0700 (PDT)
From: Julien Panis <jpanis@baylibre.com>
Date: Thu, 28 Mar 2024 10:26:40 +0100
Subject: [PATCH net-next v5 1/3] net: ethernet: ti: Add accessors for
 struct k3_cppi_desc_pool members
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240223-am65-cpsw-xdp-basic-v5-1-bc1739170bc6@baylibre.com>
References: <20240223-am65-cpsw-xdp-basic-v5-0-bc1739170bc6@baylibre.com>
In-Reply-To: <20240223-am65-cpsw-xdp-basic-v5-0-bc1739170bc6@baylibre.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Ratheesh Kannoth <rkannoth@marvell.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Julien Panis <jpanis@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711618007; l=1852;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=jlmDA8j5BPsGTQCQEi11/ZrPzSbTV7KDqXuvMXnrWBo=;
 b=4EO5M/QaSlfy71TX2T3KVkjA4QfRBdI4jxi2392RsNefCveULSjjFyy1hcKDNfud58SeMzlmm
 4oAew9FdeG+ATsP7Gv8bowf1UYRB0QwYtNNMn1BRDMYC17kQteIfwZ0
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

