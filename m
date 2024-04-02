Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90806895038
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 12:35:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EE4810FC29;
	Tue,  2 Apr 2024 10:35:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="FXwFwI5I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E73F410FC27
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 10:35:28 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-3436fec6a70so218700f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Apr 2024 03:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712054127; x=1712658927;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4AGag0SLGP6ZTz9ElordkjjCIrAOBl+sGfiLsyWtvf4=;
 b=FXwFwI5IgAoTf42TH6sQzXdO+wP6xoKQX9pDtjnnT8T7ZZKrbFdn11kkeTJCXSt++O
 DIhiYYU9RDgP5HVZotwfCj0+YqUCeGt6GUO//zE6uiwVXFCEQypMl4uP+ean3XIaUwa5
 Jr7H3l8VHxqFKK0knKegjrU4muvrmb3LrN3t8hr4fGLH8btApp+K8AfOD+V7cys5Fr64
 v0dvP7KUMzfBkY+RuDPxSuHBKekVkwZz8oub9vl/jaVfqMkJ+VRxKonHNX6tXp+9yQ19
 FJlPp/kIDY9spTR896WLUdcqFj8D0IOQSszM6OsBs/vx/uv+kXL4OJ5Ihb992W+lZnA9
 vsrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712054127; x=1712658927;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4AGag0SLGP6ZTz9ElordkjjCIrAOBl+sGfiLsyWtvf4=;
 b=H122xH1aTfxfABdqrci2WrrMtUbtQD0DGUDwwcXX5LUJ/G0JjS24o38ah/E6CDBzCX
 yCv/v674a0IPMGdg0cow6cCpuEfOMKVtM6ZhYWv7CKKZKZybABjevxilZzJo2/k1aSKt
 h8dhppdF2yrIz7NNrdHyuhrUEQNdhHUg5zuuiXGIhIHutb8xoygU90Vu8CO24g+wORGU
 WbCaUba2KrzKSTJByUxuDYuZcr+SdNMldbouPij94WPuEsSHCldE+uet1Z0uGAELjAky
 h/dO4Mj3SCI+8vbOe4OOGeDbYkLGrNh+l2pqquDyG3sy5630mCe6jhRtIIoSDa+JMoZf
 1adA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxsiMV+1nXGrZs9KELnVNbMuVIOzqnaZTUxxwJS7s+Q8lEAHsPK7RyiarjF11KP/6ab0B1WWv3OD3sJLIKeTutGj/+hlbPCL4Tn5TqMEpx
X-Gm-Message-State: AOJu0Yz8PU/Kb0wNlRVHHQRvnRQBNbv40bB1o15gy0CJu1xQggMLnPd6
 P3Df+Cf/2jKbOJkbvO4jNbYGFYYyaUoCH0yxRFfHltThWKsKrCwJsHjTUZbJ9Xk=
X-Google-Smtp-Source: AGHT+IEQauaBUmNUkNb7TaoMVMyvLQ0qDGx3fl3TpOL+J1TZ99oJpnwpFAty39JqZhEXAfZ3MSaptw==
X-Received: by 2002:adf:a21a:0:b0:343:64be:b543 with SMTP id
 p26-20020adfa21a000000b0034364beb543mr1083680wra.57.1712054126878; 
 Tue, 02 Apr 2024 03:35:26 -0700 (PDT)
Received: from [127.0.1.1] ([84.102.31.74]) by smtp.gmail.com with ESMTPSA id
 bu7-20020a056000078700b00343587cfa7dsm1825769wrb.77.2024.04.02.03.35.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Apr 2024 03:35:26 -0700 (PDT)
From: Julien Panis <jpanis@baylibre.com>
Date: Tue, 02 Apr 2024 12:33:43 +0200
Subject: [PATCH net-next v6 1/3] net: ethernet: ti: Add accessors for
 struct k3_cppi_desc_pool members
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240223-am65-cpsw-xdp-basic-v6-1-212eeff5bd5f@baylibre.com>
References: <20240223-am65-cpsw-xdp-basic-v6-0-212eeff5bd5f@baylibre.com>
In-Reply-To: <20240223-am65-cpsw-xdp-basic-v6-0-212eeff5bd5f@baylibre.com>
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
 "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Julien Panis <jpanis@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712054122; l=1876;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=fA9wRh9BhzewgFnx03QdynOb7Uu7To/l82seA5HFPKw=;
 b=GqnxSs6sWkav4QBgqTK6Qla5Q5wvipN8noKqaNjqxNHrJHznw3DVJ1MlICZa2wE+dcsAZICLj
 LvjocVo2lrjB3euoYStafAEYdJ6COit/uJ7/9NeQw02Vahi+SUioXzb
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

