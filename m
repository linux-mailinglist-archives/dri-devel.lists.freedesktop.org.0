Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6351D97A2FD
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 15:33:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBF8E10E374;
	Mon, 16 Sep 2024 13:33:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GkM+mlHm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F330610E376
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 13:33:31 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3770320574aso3355346f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 06:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726493610; x=1727098410; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MmSpMtpE7+PdGOwOLX2Il68el4nS80XCM5+NcfYSgJc=;
 b=GkM+mlHmVWCCwzpkGO9Vfh24D6jdf4yIcKKTDoEnqWHrvVhCUmiTP6+HKjPNjLse1s
 f42+xfuDufSX5XlkXz1ovZAw/R/5/vJwuGlS+wWDZKq8aOYNIAH6PS1aLVbHyA5ulh1o
 OvOXE1pjWrTTLTkBik22AxBzYGwUZF4lLczRA8nS9RLWKvlzv9PDSY1nrfadZ98bcuYd
 MCJ+0z5Vzj3Z64nQEoCnmoJTZhTwWYv6QZ0sEuS/q7qM7nn9N+kKAept716NMmNZrkvo
 oBXe/GlRTMADfLNL+F2K8om4MD4EII7VMmMQ0+HfXVviPG5p/7eqY+0N/HN2glrPAziA
 qeHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726493610; x=1727098410;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MmSpMtpE7+PdGOwOLX2Il68el4nS80XCM5+NcfYSgJc=;
 b=cpAqFV6zcd6OFmg7EebvDc70lqUJSK4GPhi1Sv6/AZ1oP9XyRrdX9zGkx8kkvPEZTk
 2Bj3FGOSO36sUxuGsAOai6d1etDLpqqyEtuu20tkPhXuqX/Ij8mF1qEyg2GGUZL7Kx0W
 2EZmYPjxv0VsWh6fqbbQ7hHVS96/PfKDLYVQYOxKNFoQWfsH6TmmlQu47txBbgsRprXx
 DnZCYj9Ie5SIhTIgFtx/BU1Qqx8UYWLAA/kpbSl+H4lyMK5Z25v5KzRF81xUH5nPeDNb
 cAg4TlEBEq4Kg2oriwI0QAFwVG3M8UMSSHJbZv891zowMLldGdvQuwjSehrznoWcXv7K
 0zdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhAbJrhiaqcb9VPn0DPvubV+vHj+49wNnZRR+AjAZAnd49El/enjC4lGi9NkQ/jaMmKfp/uYzY6LI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy22i7HAwc8wL+m58O2yyXg1aKNRVrZ2hxp1zRa9QFEE0SxbCJi
 O+8lQo7V3EsmvlYNlbIpQkU5xp0N2SiQTq40YD5493ZAVXZ/1ghZ
X-Google-Smtp-Source: AGHT+IHR0wIl9Oj5JquBhyuv+6M1hgFteji/fbjd5SFUk9TqZ1PuyEtD5Yavk4+q4arRJWHycSMLdw==
X-Received: by 2002:a5d:6892:0:b0:374:c1d6:f57f with SMTP id
 ffacd0b85a97d-378c2cfea56mr8745501f8f.7.1726493609356; 
 Mon, 16 Sep 2024 06:33:29 -0700 (PDT)
Received: from localhost
 (p200300e41f386300f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f38:6300:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378e78002a4sm7340662f8f.78.2024.09.16.06.33.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2024 06:33:27 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, Christoph Hellwig <hch@lst.de>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH] gpu: host1x: Set up device DMA parameters
Date: Mon, 16 Sep 2024 15:33:20 +0200
Message-ID: <20240916133320.368620-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Thierry Reding <treding@nvidia.com>

In order to store device DMA parameters, the DMA framework depends on
the device's dma_parms field to point at a valid memory location. Add
backing storage for this in struct host1x_memory_context and point to
it.

Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/host1x/context.c | 1 +
 include/linux/host1x.h       | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/host1x/context.c b/drivers/gpu/host1x/context.c
index 955c971c528d..a6f6779662a3 100644
--- a/drivers/gpu/host1x/context.c
+++ b/drivers/gpu/host1x/context.c
@@ -58,6 +58,7 @@ int host1x_memory_context_list_init(struct host1x *host1x)
 		ctx->dev.parent = host1x->dev;
 		ctx->dev.release = host1x_memory_context_release;
 
+		ctx->dev.dma_parms = &ctx->dma_parms;
 		dma_set_max_seg_size(&ctx->dev, UINT_MAX);
 
 		err = device_add(&ctx->dev);
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index 9c8119ed13a4..c4dde3aafcac 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -466,6 +466,7 @@ struct host1x_memory_context {
 	refcount_t ref;
 	struct pid *owner;
 
+	struct device_dma_parameters dma_parms;
 	struct device dev;
 	u64 dma_mask;
 	u32 stream_id;
-- 
2.45.2

