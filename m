Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B786871CF6
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 12:08:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6386112A32;
	Tue,  5 Mar 2024 11:08:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="GT5MWwVy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9C71112A33
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 11:08:29 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-33d9c3f36c2so317214f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 03:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1709636908; x=1710241708;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qEaZoF9mx7Xkycbcd21LmA2/00TCeHKVbh1e2Dzr7Vc=;
 b=GT5MWwVyKXiRd7C1OSG7CI9XK1ybNxb+1oDpw4Z+N/mjCvCf1BZdfsWcHEv5pcP3qf
 DoxNnJHVEWtjIsBD0hIUn9jXA+dYWTE+xfWLpqQW5Kd4fXmH3fGx2ToNXvSFHazL6pCL
 bDSETfb515tTSIrSsDV1h/VSt5LjssTiazweB7U1B8TM7QoDP04yuRiAoZnAgJjYRekn
 BuFxs+Sg624Ll1UBIV7Oa02bE5Jn9845Mm6gzkrf1LWulssoCWZDPro3gpfxsxowl0G6
 Wnnq6/u/7nGqNSlj10Dea9OvX7XkT79sRvKP5jg/SH9hzlm3OSOP/5kl4ZtXEl+hZfpp
 ooLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709636908; x=1710241708;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qEaZoF9mx7Xkycbcd21LmA2/00TCeHKVbh1e2Dzr7Vc=;
 b=LBM7EqyNtVg4Mo0JhPTyUr+wlNv1sy7YzinGeKBvXPzTv6uR8oMnwtZaunsInym2F3
 AG5Q2PWi9zAZAhEzRFL6yW+6sKMvL0rVIeEpZyPqVrbM0tOKtIoSsFr34Es4Z0ayAE+k
 dd/6vgxgggHnUUDX0T17J3dD4C9mnjCVHLPqkVQmt0uh0WAudEIliobqYwLQj29xPfRH
 3n5fCzlWaMw4+RisrGfdW4aHDvUAf6twZ/J4OhSgcNVULMu7+3fL1Rq2vILUzTBdi23Z
 h5qOPR6RisuXPBxnnp3cX1i/FizHcz7hFc/mhnWTGafHUxFG5L4FxDy4JVNuYFJDc/1J
 uqDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3wVmyt84/k2TdWjmLV+Vf1xa9fjMYgjYFl9mnkpQkkodhiRbEM6zBRdrb6Q6O+ZldYNFzrI2LmkXNVfWIHO9dghl7kXyuuKwCyO7p64GN
X-Gm-Message-State: AOJu0YxKHJbBlpq3KrXnPt62l7NU98639mxf0bKBWGrDi1XfVCavdu5s
 Ib6FPDK9VxbAPexDnoqrcDGVQ09QDOc7rECHeiKBH2+snFjd7ndBNV2UgFq24zM=
X-Google-Smtp-Source: AGHT+IE9UuSurqoXqrMGlUzmaVAS5zp1obFuVFAEL0FLf8GIm/g3hMOXZyErpfk1zJpIMEuMGX/ehg==
X-Received: by 2002:a5d:4047:0:b0:33d:61fe:6ca3 with SMTP id
 w7-20020a5d4047000000b0033d61fe6ca3mr7985438wrp.26.1709636908019; 
 Tue, 05 Mar 2024 03:08:28 -0800 (PST)
Received: from [127.0.1.1] ([84.102.31.43]) by smtp.gmail.com with ESMTPSA id
 v7-20020a5d59c7000000b0033e475940fasm2190993wry.66.2024.03.05.03.08.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 03:08:27 -0800 (PST)
From: Julien Panis <jpanis@baylibre.com>
Date: Tue, 05 Mar 2024 12:08:18 +0100
Subject: [PATCH v3 1/3] net: ethernet: ti: Add accessors for struct
 k3_cppi_desc_pool members
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240223-am65-cpsw-xdp-basic-v3-1-5d944a9d84a0@baylibre.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709636903; l=1852;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=jlmDA8j5BPsGTQCQEi11/ZrPzSbTV7KDqXuvMXnrWBo=;
 b=dfeer2o0y3GGm8RrN/JvsU55HT41wNQJYnV7qThO2EEG4VL5/5uFU+kGT7yuR5zglIGMB/bAo
 RDemmHF2XC2B5I/tvt6x8yUrU26eWs0i6goZX8R4eJai/yp7iJrzvFc
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

