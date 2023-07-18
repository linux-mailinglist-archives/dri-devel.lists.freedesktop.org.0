Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C2C757A42
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 13:16:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 610E610E312;
	Tue, 18 Jul 2023 11:16:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 146D310E312
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 11:16:44 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-26586e824e7so2840359a91.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 04:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689679003; x=1692271003;
 h=content-disposition:mime-version:subject:to:date:from:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RDqCEtPP7u4lUuZ9Np/PNRIOxRGuU6kZQY2tiFjWesI=;
 b=R1b13mbfqdYlno1rEzfx5LoSkAJSZ4myTZ4145u7gLU7tIkMZ1H6QkP+AcW+MbaE6T
 c+Dkoeor41D1nkVFvRVfUjUXUWep5edmRb0sWAnhxGUyr0GUblOQPo+m+4SQxOSRxx2S
 rDVuQD0rjNVHptG3czYEL1GTpHsWpeAIF4QL9do43kt2ri2v5Af/qhIOF/+WFbf6rEF9
 UrI92NJo+RAWtgWxqedqpE76x9zyxAcC5bT81uVLVvDnZGjNcFRyOPKJwWvOzdHsOy5m
 sVIrhakF1Tfjg7YmUmKgcP8DU6K8Mc3g54JVP7RSe0HT5JbHvg/i/6BCNGt7TOebLKVS
 1mrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689679003; x=1692271003;
 h=content-disposition:mime-version:subject:to:date:from:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RDqCEtPP7u4lUuZ9Np/PNRIOxRGuU6kZQY2tiFjWesI=;
 b=DCc6mS5Ng44gpY7VwXmYNGiPhDkT3aI2UsWa8wn3FtH9SyUHKkX5KmB+z98/VQCq2f
 4z2HGiKzogSftNbuZl8uZLA7NYk+K9OHxm8VB2e7F7bZQvKacc4KgK5rSdkXxE3+37wO
 mfUFQDKCs+37XYLmK/dt2qPMikOTGZLOrZ7bwTN68fnvri7xX6T4wUzzw3NPbqbYBPDy
 NiiurRQmt8/pCX27SLO5bm5GXDJX3yBZnG0Uu5imUAm/d2XoTORDlzsKQibyZxB7dMTV
 69OL5fqdGCFZPfVrOsxmKuVjFem3G0xrM8LnDuuFosAskcYr1h+nWP/D9Oht1m7d62bs
 GS7A==
X-Gm-Message-State: ABy/qLYVmRNFub4FaYjdcOnDLnN+tFZdDEjp6carRqMln9D0WEvTLfB4
 3mGC8LnbLptDeK8Dy836Wm4=
X-Google-Smtp-Source: APBJJlEst8u9Az2C8TF7X1huLYbv/7A043tSS9ngGKSY788TupNY8qhUi2D7L/U93exBd4YXJmFbjw==
X-Received: by 2002:a17:90a:62c5:b0:262:d19c:4fee with SMTP id
 k5-20020a17090a62c500b00262d19c4feemr11645410pjs.19.1689679003309; 
 Tue, 18 Jul 2023 04:16:43 -0700 (PDT)
Received: from sie-luc. ([1.85.36.133]) by smtp.gmail.com with ESMTPSA id
 6-20020a17090a194600b00263d3448141sm1329482pjh.8.2023.07.18.04.16.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jul 2023 04:16:42 -0700 (PDT)
Message-ID: <64b6749a.170a0220.3acab.2af9@mx.google.com>
X-Google-Original-Message-ID: <20230718111634.GA8462@sie-luc.>
From: Luc Ma <onion0709@gmail.com>
X-Google-Original-From: Luc Ma <luc@sietium.com>
Date: Tue, 18 Jul 2023 19:16:34 +0800
To: Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 javierm@redhat.com, onion0709@gmail.com
Subject: [PATCH v2] dma-buf: Fix the typo in DMA-BUF statistics doc
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

From: Luc Ma <luc@sietium.com>

The kernel-doc for DMA-BUF statistics mentions /sys/kernel/dma-buf/buffers
but the correct path is /sys/kernel/dmabuf/buffers instead.

Signed-off-by: Luc Ma <luc@sietium.com>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/dma-buf/dma-buf-sysfs-stats.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.c b/drivers/dma-buf/dma-buf-sysfs-stats.c
index 6cfbbf0720bd..b5b62e40ccc1 100644
--- a/drivers/dma-buf/dma-buf-sysfs-stats.c
+++ b/drivers/dma-buf/dma-buf-sysfs-stats.c
@@ -33,7 +33,7 @@
  * into their address space. This necessitated the creation of the DMA-BUF sysfs
  * statistics interface to provide per-buffer information on production systems.
  *
- * The interface at ``/sys/kernel/dma-buf/buffers`` exposes information about
+ * The interface at ``/sys/kernel/dmabuf/buffers`` exposes information about
  * every DMA-BUF when ``CONFIG_DMABUF_SYSFS_STATS`` is enabled.
  *
  * The following stats are exposed by the interface:
-- 
2.25.1

