Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC61986E3E6
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 16:03:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CF3410EC3F;
	Fri,  1 Mar 2024 15:03:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="DurBgqHS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA0A510ED5D
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Mar 2024 15:03:16 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2d094bc2244so29835551fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Mar 2024 07:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1709305394; x=1709910194;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=O1ewQPCjSRFFTnAzhBTqIbNVKy9NJW4piTjNHE9xDN0=;
 b=DurBgqHSPO7lAXzORWJ56Ljtpdz0LMO0fxx0unLX5rYmWrRxZ+EoLITpf0ysJ7Exai
 A1y6ddpybO+nJloU5e+7AiAI0xnRiBajsKnOqRHyAEsSztRURlfcA4mQRo+PEXbuyYGs
 OofIX2okBbfJHhGZ8Vs/lbUMBce8IlCAS4NU4PdN1vtcQLySbMk0qFwpgXpSeOpGpsDY
 5SP9mTHdEP/mccdk7S+zi37iKrF/IhMVz0GsV1hLCA/V2KNApDJ83sERDaMfgSJPBvvI
 wM9q+ppfFt3icnQqdkVEh0IkP3FlNqUZg3cLa50s9PXOaogjm0Ov7eL2pUzNmZrzdV8v
 aTrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709305394; x=1709910194;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O1ewQPCjSRFFTnAzhBTqIbNVKy9NJW4piTjNHE9xDN0=;
 b=sNXnVkWUjPklq5y8wqIrtxGdafHl6Je1/mrnHDiVx7FH37CUrxGetDuMs9VJG57eSb
 x646oEtFPbw0FfW35onm3yyB7Qrkgwf2tEX3irs+jC3iaf3yc1Dz2avqnBo9sDRrxriH
 2Ln7EImT9hYs0a1SMQggo4G5jqj9KgJLF+eBbihcPc7KFrgC8BkxiH1MhAHnkLyuIqLN
 Af3vY5MKS/0xYSlPGXF15BlMfIaXFD/Q5GyH4IF+o2MScKiFuKmXzmcg2jBUbdxMZUib
 H+NJAlz8Sd/BNYMQp0CFV19Aofh8tJ1BVziWC4K5g1UpGHRpRforhaej5Ntgzjx1PrWX
 EPBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgmfohl4eFHy7wPrABjzzr1nPWc9g9V1WRLbgEhNkHsGkfmu4n42Ywm0Hp0v5dyZ3lzx2LrJvKdpS+gZgQ0gWj+hQ5jUbJjSWrU1jYZaJB
X-Gm-Message-State: AOJu0Yz9sIBO1eObmwbrkFwlBMJT6O8REMXZfockd+KouI3zdjMD2r/0
 360EYZgDz7tHNREAVX0bUxjHFs/FOb1KOapiNpyO7/HxOj7y5sbo5Wgm81V8Xb0=
X-Google-Smtp-Source: AGHT+IGUKr5XgjU6TuOv0mpo8L8nD6eU1BjTFxCjpnBp8lzdPBlpysX8CKZNTtSVQJIMO1v3TPLxhA==
X-Received: by 2002:a2e:9415:0:b0:2d2:3017:c144 with SMTP id
 i21-20020a2e9415000000b002d23017c144mr1362086ljh.39.1709305394086; 
 Fri, 01 Mar 2024 07:03:14 -0800 (PST)
Received: from [127.0.1.1] ([84.102.31.43]) by smtp.gmail.com with ESMTPSA id
 j20-20020a05600c1c1400b00412bca49a5bsm5666875wms.42.2024.03.01.07.03.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 07:03:13 -0800 (PST)
From: Julien Panis <jpanis@baylibre.com>
Date: Fri, 01 Mar 2024 16:02:52 +0100
Subject: [PATCH v2 1/2] net: ethernet: ti: Add accessors for struct
 k3_cppi_desc_pool members
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240223-am65-cpsw-xdp-basic-v2-1-01c6caacabb6@baylibre.com>
References: <20240223-am65-cpsw-xdp-basic-v2-0-01c6caacabb6@baylibre.com>
In-Reply-To: <20240223-am65-cpsw-xdp-basic-v2-0-01c6caacabb6@baylibre.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709305390; l=1861;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=EbndbMWImRHT/Zd+Qtiz8QKdnhzhNDbY2t+5huMZp44=;
 b=82JY4JvNcwuNykwwf9bi9p4VvX7xmFPPC0nhH7YJhdGp27tsLGn8FMl/dr+mZfIpZnBW4Odhc
 3OxI/TPWAAQCVaAqG0egpgGwz9qrQATQExQM+gQBKFmaZlf6tEgTdIq
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
necessary, for instance, to compute a page pool page index.

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

