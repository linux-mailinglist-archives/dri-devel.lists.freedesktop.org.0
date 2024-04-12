Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB9B8A32A1
	for <lists+dri-devel@lfdr.de>; Fri, 12 Apr 2024 17:38:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44F4310F70B;
	Fri, 12 Apr 2024 15:38:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="IxoToURQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85EDA10F6FA
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Apr 2024 15:38:51 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2d8743ecebdso11221221fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Apr 2024 08:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712936329; x=1713541129;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DGT1V+qxwnkICdCuj9bPwelDxtJ9iZysRlNMNFDJDUk=;
 b=IxoToURQVeqavTV3CYbb8FtOlf0cxC18DSUN0oVhmEtSR9pOCdfuGTxkQRTIepZuAn
 EhnLKymaZyocFPEORocYo1FywHB9/F2HRCdt9wgSOdXWe2aVFl++hDLZB+PR6CU7nyf5
 uAG1P9pl3qeWcP/S1mQyP2UD9m/3V6nn8LZH9MrptdqLaMCrHewLnUUXEifPIvo4uhdZ
 92H4jWzlEfp7fpZWTDTTz7zEZx9+hK3MCoVvvVOkaTxqmLD9aFslax8WGcxziWjzZhQa
 K821HM+qP46cOR7S/QvMI50vSTg36KtV9Q1MC/Tsa6V1aP61KTOmByb3Tj0qPni8vH2+
 WLEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712936329; x=1713541129;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DGT1V+qxwnkICdCuj9bPwelDxtJ9iZysRlNMNFDJDUk=;
 b=LiARsTjjTfLoe+3/I8y94Wm7XOZVoIx+P386MgRhUMWTzs8WFOQUQ2pmaEAgnVTktc
 aCOy+EvNrBMrTG90/6bxgiH75qWvqjBleXkhk9DzKy6YdJCzZX4ajX6ajR59a7QGPRWa
 J8e8umURxgcK9dTifpUwjIzFhb2vEQQackOfUBP1EIw5AVysZyeURkdgzyHfu585N+7/
 BKWg6a/ShXaWrkmpA8mhE9HD/PRngr3tC0Ev85hQ2flCrxkNW+vGwaXL48eGFppbL+d0
 Sxe0oBpixxhR8sbPpWcCuV/cM80EO2wQ6Vhaq2Z9cqOV9bwt9a2aTzY2NDyMZsJFx2hW
 moHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgf2+9fiLm5dRjQFKX7kV4nuvPklQKxGeZ9qAZxaXAE69n9sHniKvzTGobffInkdZ1BZ0RqF9XI35c+KGyUSvgvfPjMMfKdxLyVDqVKYeF
X-Gm-Message-State: AOJu0YwPVuUpS52t1Bg7yCETP/wEZjJiZfWRnZEMOxK3zLLnZ29YdxE0
 9YXSShZNJRFbuZfMSzHCHvi0MR/41+3IRICaU0hUaNoN4VL4YaS7ecO9Do0NXh8=
X-Google-Smtp-Source: AGHT+IGAMzeVB+BmYUvEhD4kf0B+7Qmv5vfxlEfD9Jg/Pw0lyjnJOWxBZjXkA5kvb0EJ3MQfsAF3xg==
X-Received: by 2002:a05:651c:1047:b0:2d8:452b:f7af with SMTP id
 x7-20020a05651c104700b002d8452bf7afmr1996952ljm.48.1712936329214; 
 Fri, 12 Apr 2024 08:38:49 -0700 (PDT)
Received: from [127.0.1.1] ([84.102.31.74]) by smtp.gmail.com with ESMTPSA id
 k9-20020adff289000000b0033e45930f35sm4545791wro.6.2024.04.12.08.38.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Apr 2024 08:38:48 -0700 (PDT)
From: Julien Panis <jpanis@baylibre.com>
Date: Fri, 12 Apr 2024 17:38:32 +0200
Subject: [PATCH net-next v9 1/3] net: ethernet: ti: Add accessors for
 struct k3_cppi_desc_pool members
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240223-am65-cpsw-xdp-basic-v9-1-2c194217e325@baylibre.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712936324; l=1930;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=Re/6+1U2LAuPEHOo1bgE74Qxp1Wr7Exdy/CAp9M2vxY=;
 b=heOTqq4Ok3/KbJ5iU1uNpkdh/P0ApR24igyDMUJh4JLdHG37jAAriKffrnGT4K0Na+Iz2M2De
 iHOHU113/XTCxUMSY9lrWh3rNRKoNVFzJE2uFFeAj8XbmjmCnE/xKnC
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

Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
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

