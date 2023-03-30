Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C26B6CFEFE
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 10:49:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61AF610ED42;
	Thu, 30 Mar 2023 08:49:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.101])
 by gabe.freedesktop.org (Postfix) with ESMTP id CA8CF10ED3C
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 08:49:23 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.41:44746.1405145320
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.41])
 by 189.cn (HERMES) with SMTP id 6F7861002D0;
 Thu, 30 Mar 2023 16:49:16 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-7b48884fd-ljp89 with ESMTP id
 fc918797fb554a98a1ac45f56fe6f755 for maarten.lankhorst@linux.intel.com; 
 Thu, 30 Mar 2023 16:49:21 CST
X-Transaction-ID: fc918797fb554a98a1ac45f56fe6f755
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
From: Sui Jingfeng <15330273260@189.cn>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, suijingfeng <suijingfeng@loongson.cn>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian Koenig <christian.koenig@amd.com>
Subject: [PATCH 1/3] dma-buf/dma-buf.c: add a blank line between the two
 adjoining functions
Date: Thu, 30 Mar 2023 16:49:09 +0800
Message-Id: <20230330084911.1565071-1-15330273260@189.cn>
X-Mailer: git-send-email 2.25.1
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
Cc: linaro-mm-sig@lists.linaro.org, loongson-kernel@lists.loongnix.cn,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nathan@kernel.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

 Trivial cleanup, no functional change.

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/dma-buf/dma-buf.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index aa4ea8530cb3..485b022a31fa 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -777,10 +777,10 @@ static void mangle_sg_table(struct sg_table *sg_table)
 	for_each_sgtable_sg(sg_table, sg, i)
 		sg->page_link ^= ~0xffUL;
 #endif
-
 }
-static struct sg_table * __map_dma_buf(struct dma_buf_attachment *attach,
-				       enum dma_data_direction direction)
+
+static struct sg_table *__map_dma_buf(struct dma_buf_attachment *attach,
+				      enum dma_data_direction direction)
 {
 	struct sg_table *sg_table;
 	signed long ret;
-- 
2.25.1

