Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FE5571ADB
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 15:12:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 688C49463A;
	Tue, 12 Jul 2022 13:12:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCDF19463A
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 13:12:04 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id k30so10045781edk.8
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 06:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4p3+nMdxXOcLWjmxhjndQqNO8ytplsp5R1Ujj58aRFY=;
 b=HWcxqHWsB9k6MSItWPcW5gG2GL9eiqoCYaloDZUuEEu38jQYrDxMM+zOwFxZwxgLwI
 bx6eD6zc8ssqmQst9WD+c7byDZapuN5BM14OCPX7U7P5rQAw4SkPoGldJpqeeDO3l0Xq
 WFvfyEkD/MDACqypgRlUFxOCsgRgT8J/sjPWg1WzR01HV2W75scn737Lo5mp1RbWFoDu
 PkM23k/5kOD324slz2kbY1MrvcE8O08OHk7/KnhJF2hS1WlT5BQL570mlnynvHy3hh9v
 5n9P4Afn6jqy8n+mOoJGrzXqnOgIWaP7TXSpDYcILnTdTPgpnPMPoljciaas9sZAYBLa
 ydQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4p3+nMdxXOcLWjmxhjndQqNO8ytplsp5R1Ujj58aRFY=;
 b=IvVZwFkRwiD2NmKZZ84X5+UpZpD63uFTVzv1nZRnQlggg9Hp2cfZqvEFief3hXpQJ4
 KsdDdCapVj8dqzmS45jf5ZyX2dwN6hDuy3221EHz54NijZE53ta/LgIo0pJocsb+ET+Z
 VqPYH/cF3HesAixVQYt+h6IqMcW0KkJFneGWXhcnfXfX4QSXFsx8CXTpD/6xa1kDG7ub
 Yp004pN//WSEE4JrMbSSDFqdmegSMjJYUjzVxSJ3H3ucW7FyOBWoiKsFzZFt0AjgkaBa
 Pepkjw7DDZ/ccBKM86Zf1eqUQOjnInvPPQI9b0S85BatWVsNnfILrVHknTjZXgVfuwVf
 whjg==
X-Gm-Message-State: AJIora+8x+Q0z7Us4DASHEl42EvvCfx+PE13chj4aR6J93gFukNhc1K7
 43zGaosQM1Tvg2fPne7whro=
X-Google-Smtp-Source: AGRyM1v/o2kQHITVKSrypm+vpUMGwGeHYFKGaQRtIkHnbzNuqBL4jsc6AE227tObZSiqLbCliR8hxg==
X-Received: by 2002:a05:6402:4488:b0:43a:7b6e:4b04 with SMTP id
 er8-20020a056402448800b0043a7b6e4b04mr31783384edb.202.1657631523487; 
 Tue, 12 Jul 2022 06:12:03 -0700 (PDT)
Received: from able.fritz.box (p57b0bd9f.dip0.t-ipconnect.de. [87.176.189.159])
 by smtp.gmail.com with ESMTPSA id
 26-20020a170906311a00b0070e238ff66fsm3775274ejx.96.2022.07.12.06.12.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 06:12:03 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: sumit.semwal@linaro.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 daniel@ffwll.ch, bas@basnieuwenhuizen.nl
Subject: [PATCH] dma-buf/dma_resv_usage: update explicit sync documentation
Date: Tue, 12 Jul 2022 15:12:01 +0200
Message-Id: <20220712131201.131475-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make it clear that DMA_RESV_USAGE_BOOKMARK can be used for explicit synced
user space submissions as well and document the rules around adding the
same fence with different usages.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 include/linux/dma-resv.h | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index c8ccbc94d5d2..264e27e56dff 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -62,6 +62,11 @@ struct dma_resv_list;
  * For example when asking for WRITE fences then the KERNEL fences are returned
  * as well. Similar when asked for READ fences then both WRITE and KERNEL
  * fences are returned as well.
+ *
+ * Already used fences can be promoted in the sense that a fence with
+ * DMA_RESV_USAGE_BOOKMARK could become DMA_RESV_USAGE_READ by adding it again
+ * with this usage. But fences can never be degraded in the sense that a fence
+ * with DMA_RESV_USAGE_WRITE could become DMA_RESV_USAGE_READ.
  */
 enum dma_resv_usage {
 	/**
@@ -98,10 +103,15 @@ enum dma_resv_usage {
 	 * @DMA_RESV_USAGE_BOOKKEEP: No implicit sync.
 	 *
 	 * This should be used by submissions which don't want to participate in
-	 * implicit synchronization.
+	 * any implicit synchronization.
+	 *
+	 * The most common case are preemption fences, page table updates, TLB
+	 * flushes as well as explicit synced user submissions.
 	 *
-	 * The most common case are preemption fences as well as page table
-	 * updates and their TLB flushes.
+	 * Explicit synced user user submissions can be promoted to
+	 * DMA_RESV_USAGE_READ or DMA_RESV_USAGE_WRITE as needed using
+	 * dma_buf_import_sync_file() when implicit synchronization should
+	 * become necessary after initial adding of the fence.
 	 */
 	DMA_RESV_USAGE_BOOKKEEP
 };
-- 
2.25.1

