Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFEC1314A9
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 16:17:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B0E96E49A;
	Mon,  6 Jan 2020 15:17:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8010B6E49B;
 Mon,  6 Jan 2020 15:17:19 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id q9so15323903wmj.5;
 Mon, 06 Jan 2020 07:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pUtO+zfkq/xek1f3bH27+DPV8k2ximGVGaU/9KafJH0=;
 b=XTTYJKT4BhxUENbB1bJpDezEokEgz7EvtXnUvZCuliLResJdPZeDfRCQKevvDaUL/t
 v4XReeszIRlSuC2F9BfJkihW3wNtxKQBePKriCrtxJV26VIAXb8xn+VcHu2269wsq6CW
 ENjOFrG3aJ6beMBG6gPLlBDKKycEJt7PRovRIB744LdYkSlnXqbhtZx9CgAaqY5hPh01
 CXpC41kARMiZmqWAcw/gV9Cb1CYKKGMmUL4ISciRaxQx29IyYe3BlpDQO8UcixpRwLwM
 EiNNiB30YO0mWN0piyv+1BZnscBeIbzyOSzYQaJBFa22OCrPCdrLMcw1PTNUZG62G1uM
 LxvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pUtO+zfkq/xek1f3bH27+DPV8k2ximGVGaU/9KafJH0=;
 b=cnVK9MvqX3siGN6H6KCPnsHRnwm5Fzp3wF6aB22km67L+Wwwh5qY5WHdflFIdmRvpb
 RVPQgpQJ+pAL6om04CJCWp2q1Js48LyTdpiQV9Gyf8mMdmHaRVnryJGMgNEPwPtce2Kf
 wG9XZBfeTqvdSebwjKUFSt9iTXmIHD0AhP00GQ6vkAAs2wZ6qVE8NOk+kgmOQhZfQD+x
 uOJ/w5sK8uwHrCBchBIUD06yHzdzwbuuY2vVx+UCyfktXqlvZ+r6FtbL1PMK42doahKV
 P8s6fH7uQMedWEYhISAeOVxoLmgr4r//M6+M6IGkRwRWvIk1M1Rvdhg+7OOgQdSoV24q
 TKXg==
X-Gm-Message-State: APjAAAWSzFiwOiW2fKn+kq3rWSufy88Rbe8B7pu5tAWR8W9ZwYjv/MHG
 gj42S57SVerCdycoIqPS8Vs=
X-Google-Smtp-Source: APXvYqwsQT394RlJuINUB+uKLmcbP1C4/aQR0TEdQ+tH37E1WPzngyosxD5K4zHwRHh2xFuLqNWXJg==
X-Received: by 2002:a1c:3dc3:: with SMTP id k186mr33755601wma.95.1578323838278; 
 Mon, 06 Jan 2020 07:17:18 -0800 (PST)
Received: from localhost.localdomain ([62.178.82.229])
 by smtp.gmail.com with ESMTPSA id l3sm72122463wrt.29.2020.01.06.07.17.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2020 07:17:17 -0800 (PST)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] drm/etnaviv: add hwdb entry for gc400 found in STM32
Date: Mon,  6 Jan 2020 16:16:51 +0100
Message-Id: <20200106151655.311413-7-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200106151655.311413-1-christian.gmeiner@gmail.com>
References: <20200106151655.311413-1-christian.gmeiner@gmail.com>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The information was taken from STM32 glacore driver hw database.
The entry is named as gc7000nano_0x4652.

Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_hwdb.c | 31 ++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
index cf3bb26e2e43..167971a09be7 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
@@ -6,6 +6,37 @@
 #include "etnaviv_gpu.h"
 
 static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
+	{
+		.model = 0x400,
+		.revision = 0x4652,
+		.product_id = 0x70001,
+		.customer_id = 0x100,
+		.eco_id = 0,
+		.stream_count = 4,
+		.register_max = 64,
+		.thread_count = 128,
+		.shader_core_count = 1,
+		.vertex_cache_size = 8,
+		.vertex_output_buffer_size = 1024,
+		.pixel_pipes = 1,
+		.instruction_count = 256,
+		.num_constants = 320,
+		.buffer_size = 0,
+		.varyings_count = 8,
+		.features = 0xa0e9e004,
+		.minor_features0 = 0xe1299fff,
+		.minor_features1 = 0xbe13b219,
+		.minor_features2 = 0xce110010,
+		.minor_features3 = 0x8000001,
+		.minor_features4 = 0x20102,
+		.minor_features5 = 0x120000,
+		.minor_features6 = 0x0,
+		.minor_features7 = 0x0,
+		.minor_features8 = 0x0,
+		.minor_features9 = 0x0,
+		.minor_features10 = 0x0,
+		.minor_features11 = 0x0,
+	},
 	{
 		.model = 0x7000,
 		.revision = 0x6214,
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
